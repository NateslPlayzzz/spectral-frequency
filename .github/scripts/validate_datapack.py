#!/usr/bin/env python3
"""Release validation for the Spectral Frequency datapack repository."""

from __future__ import annotations

import argparse
import json
import os
import re
import sys
import subprocess
from pathlib import Path
from typing import Any, Iterable

EXPECTED_FORMAT = [107, 1]
EXPECTED_GAME_VERSION = "26.2"
_SCRIPT = Path(__file__).resolve()
ROOT_DEFAULT = _SCRIPT.parents[2] if len(_SCRIPT.parents) > 2 else Path.cwd()

REQUIRED = (
    "pack.mcmeta",
    "spyglass.json",
    "data/minecraft/tags/function/load.json",
    "data/minecraft/tags/function/tick.json",
    "data/sf/function/core/load.mcfunction",
    "data/sf/function/core/tick.mcfunction",
    "data/sf/function/core/install/fresh.mcfunction",
    "data/sf/function/core/purge/remove_objectives.mcfunction",
)
OBSOLETE = (
    "data/sf/function/core/bootstrap.mcfunction",
    "data/sf/function/memory/place_anchor.mcfunction",
    "data/sf/function/memory/recover.mcfunction",
    "spectral/pack.mcmeta",
)
ARCHIVES = {".zip", ".7z", ".rar", ".tar", ".gz", ".tgz", ".bz2", ".xz", ".jar"}
TEMP_SUFFIXES = {".bak", ".old", ".orig", ".rej", ".tmp", ".temp", ".swp", ".swo", ".pyc"}
BAD_FILES = {".DS_Store", "Thumbs.db", "desktop.ini"}
BAD_DIRS = {"__MACOSX", "__pycache__"}
STALE = (
    (re.compile(r"Spectral Frequency\s+2\.0", re.I), "stale 2.0 release name"),
    (re.compile(r"\bSF\s+2\.0\b", re.I), "stale SF 2.0 label"),
    (re.compile(r"\bBeta\s+13(?:\.0)?\b", re.I), "stale Beta 13 label"),
    (re.compile(r"\bspectral:", re.I), "obsolete spectral: namespace"),
    (re.compile(r"\b(?:trigger\s+sf\.(?:case_start|case_end|anchor)|scoreboard\s+players\s+enable\s+\S+\s+sf\.(?:case_start|case_end|anchor)|scoreboard\s+objectives\s+add\s+sf\.(?:case_start|case_end|anchor)\b)"), "removed player-authority trigger"),
)
BLOCK_MUTATION = re.compile(r"(?:^|\brun\s+)(setblock|fill|clone|fillbiome|place)\b")
RID = r"[a-z0-9_.-]+:[a-z0-9_./$()\-]+"
VALID_SF_RID = re.compile(r"^#?sf:[a-z0-9_./-]+$")

FUNCTION_REFS = (re.compile(rf"\bfunction\s+(#?{RID})"), re.compile(rf"\bschedule\s+clear\s+(#?{RID})"))
PREDICATE_REF = re.compile(rf"\b(?:if|unless)\s+predicate\s+({RID})")
LOOT_REF = re.compile(rf"\bloot\s+({RID})")
DIALOG_REF = re.compile(rf"\bdialog\s+show\s+\S+\s+({RID})")
ADVANCEMENT_REF = re.compile(rf"\badvancement\s+(?:grant|revoke)\s+\S+\s+(?:only|from|through|until)\s+({RID})")
RECIPE_REF = re.compile(rf"\brecipe\s+(?:give|take)\s+\S+\s+({RID})")
ITEM_MODIFIER_REF = re.compile(rf"\bitem\s+modify\s+\S+(?:\s+\S+)?\s+({RID})")

OBJ_ADD = re.compile(r"\bscoreboard\s+objectives\s+add\s+(sf\.[A-Za-z0-9_.+-]+)\b")
OBJ_REMOVE = re.compile(r"\bscoreboard\s+objectives\s+remove\s+(sf\.[A-Za-z0-9_.+-]+)\b")
OBJ_PLAYER = re.compile(r"\bscoreboard\s+players\s+(?:set|add|remove|get|reset|enable|random)\s+\S+\s+(sf\.[A-Za-z0-9_.+-]+)\b")
OBJ_OPERATION = re.compile(r"\bscoreboard\s+players\s+operation\s+\S+\s+(sf\.[A-Za-z0-9_.+-]+)\s+[^\s]+\s+\S+\s+(sf\.[A-Za-z0-9_.+-]+)\b")
OBJ_CONDITION = re.compile(r"\b(?:if|unless)\s+score\s+\S+\s+(sf\.[A-Za-z0-9_.+-]+)\b")
OBJ_COMPARE = re.compile(r"\b(?:if|unless)\s+score\s+\S+\s+(sf\.[A-Za-z0-9_.+-]+)\s+(?:=|<|>|<=|>=)\s+\S+\s+(sf\.[A-Za-z0-9_.+-]+)\b")
OBJ_STORE = re.compile(r"\bstore\s+(?:result|success)\s+score\s+\S+\s+(sf\.[A-Za-z0-9_.+-]+)\b")
OBJ_MODIFY = re.compile(r"\bscoreboard\s+objectives\s+modify\s+(sf\.[A-Za-z0-9_.+-]+)\b")
OBJ_JSON = re.compile(r'"objective"\s*:\s*"(sf\.[A-Za-z0-9_.+-]+)"')
SCORES = re.compile(r"scores=\{([^}]*)\}")
SCORE_KEY = re.compile(r"(?:^|,)\s*(sf\.[A-Za-z0-9_.+-]+)\s*=")

BAR_ID = r"sf:[a-z0-9_./$()\-]+"
BAR_ADD = re.compile(rf"\bbossbar\s+add\s+({BAR_ID})")
BAR_REMOVE = re.compile(rf"\bbossbar\s+remove\s+({BAR_ID})")
BAR_USE = re.compile(rf"\bbossbar\s+(?:get|set)\s+({BAR_ID})")
BAR_STORE = re.compile(rf"\bstore\s+(?:result|success)\s+bossbar\s+({BAR_ID})")


class DuplicateKeyError(ValueError):
    pass


class Report:
    def __init__(self, root: Path) -> None:
        self.root = root
        self.errors: list[str] = []
        self.warnings: list[str] = []
        self.json_count = 0
        self.function_count = 0
        self.reference_count = 0
        self.objective_count = 0

    def fail(self, message: str) -> None:
        self.errors.append(message)

    def warn(self, message: str) -> None:
        self.warnings.append(message)


def no_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise DuplicateKeyError(f"duplicate key {key!r}")
        result[key] = value
    return result


def read_text(path: Path, report: Report) -> str | None:
    try:
        raw = path.read_bytes()
    except OSError as exc:
        report.fail(f"Unreadable file: {path.relative_to(report.root)} ({exc})")
        return None
    if raw.startswith(b"\xef\xbb\xbf"):
        report.fail(f"UTF-8 BOM is not allowed: {path.relative_to(report.root)}")
        raw = raw[3:]
    try:
        return raw.decode("utf-8")
    except UnicodeDecodeError as exc:
        report.fail(f"File is not valid UTF-8: {path.relative_to(report.root)} ({exc})")
        return None


def read_json(path: Path, report: Report) -> object | None:
    text = read_text(path, report)
    if text is None:
        return None
    try:
        return json.loads(text, object_pairs_hook=no_duplicate_keys)
    except (json.JSONDecodeError, DuplicateKeyError) as exc:
        report.fail(f"Invalid JSON: {path.relative_to(report.root)} ({exc})")
        return None


def files(root: Path) -> Iterable[Path]:
    for path in sorted(root.rglob("*")):
        if ".git" not in path.parts and path.is_file():
            yield path


def committed_files(root: Path) -> list[Path]:
    """Return Git-tracked files, or all files when the root is not a Git worktree."""
    try:
        result = subprocess.run(
            ["git", "-C", str(root), "ls-files", "-z"],
            check=False,
            capture_output=True,
            text=False,
        )
    except OSError:
        return list(files(root))
    if result.returncode != 0:
        return list(files(root))
    return [
        root / entry.decode("utf-8", errors="strict")
        for entry in result.stdout.split(b"\0")
        if entry
    ]


def mask_quoted(command: str) -> str:
    """Mask quoted string contents so visible JSON text is not parsed as command syntax."""
    chars = list(command)
    in_string = False
    escaped = False
    for index, char in enumerate(chars):
        if in_string:
            if escaped:
                escaped = False
                chars[index] = " "
            elif char == "\\":
                escaped = True
                chars[index] = " "
            elif char == '"':
                in_string = False
            else:
                chars[index] = " "
        elif char == '"':
            in_string = True
    return "".join(chars)


def walk(value: object, key: str | None = None) -> Iterable[tuple[str | None, object]]:
    yield key, value
    if isinstance(value, dict):
        for child_key, child in value.items():
            yield from walk(child, child_key)
    elif isinstance(value, list):
        for child in value:
            yield from walk(child, key)


def objective_refs(command: str) -> set[str]:
    command = command.strip().lstrip("/").lstrip("$")
    refs: set[str] = set()
    for pattern in (OBJ_PLAYER, OBJ_CONDITION, OBJ_STORE, OBJ_MODIFY, OBJ_JSON):
        refs.update(match.group(1) for match in pattern.finditer(command))
    for pattern in (OBJ_OPERATION, OBJ_COMPARE):
        for match in pattern.finditer(command):
            refs.update((match.group(1), match.group(2)))
    for block in SCORES.finditer(command):
        refs.update(match.group(1) for match in SCORE_KEY.finditer(block.group(1)))
    return refs


def command_refs(command: str, source: Path, line: int | None) -> list[tuple[str, str, Path, int | None]]:
    command = mask_quoted(command.strip().lstrip("/").lstrip("$"))
    found: list[tuple[str, str, Path, int | None]] = []
    for pattern in FUNCTION_REFS:
        found.extend(("function", match.group(1), source, line) for match in pattern.finditer(command))
    patterns = (
        ("predicate", PREDICATE_REF),
        ("loot_table", LOOT_REF),
        ("dialog", DIALOG_REF),
        ("advancement", ADVANCEMENT_REF),
        ("recipe", RECIPE_REF),
        ("item_modifier", ITEM_MODIFIER_REF),
    )
    for kind, pattern in patterns:
        found.extend((kind, match.group(1), source, line) for match in pattern.finditer(command))
    return found


def target_path(root: Path, kind: str, resource_id: str) -> Path | None:
    tagged = resource_id.startswith("#")
    clean = resource_id[1:] if tagged else resource_id
    namespace, path = clean.split(":", 1)
    if namespace != "sf":
        return None
    if kind == "function":
        return root / "data/sf" / ("tags/function" if tagged else "function") / f"{path}.{'json' if tagged else 'mcfunction'}"
    directory = {
        "predicate": "predicate",
        "loot_table": "loot_table",
        "dialog": "dialog",
        "advancement": "advancement",
        "recipe": "recipe",
        "item_modifier": "item_modifier",
    }.get(kind)
    return root / "data/sf" / directory / f"{path}.json" if directory else None


def validate_layout(root: Path, report: Report) -> None:
    for relative in REQUIRED:
        if not (root / relative).is_file():
            report.fail(f"Missing required file: {relative}")
    for relative in OBSOLETE:
        if (root / relative).exists():
            report.fail(f"Obsolete or nested runtime path is present: {relative}")
    for path in root.rglob("pack.mcmeta"):
        if ".git" not in path.parts and path != root / "pack.mcmeta":
            report.fail(f"Nested pack.mcmeta detected: {path.relative_to(root)}")
    if (root / "data/spectral").exists():
        report.fail("Obsolete data/spectral namespace is present")
    if (root / "data/sf/functions").exists():
        report.fail("Obsolete data/sf/functions directory is present; Java 26.2 uses data/sf/function")

    tracked = committed_files(root)
    tracked_dirs = {parent for path in tracked for parent in path.parents if parent != root and root in parent.parents}
    for directory in sorted(tracked_dirs):
        if directory.name in BAD_DIRS:
            report.fail(f"Forbidden generated directory committed: {directory.relative_to(root)}")
    for path in sorted(tracked):
        if not path.is_file():
            continue
        relative = path.relative_to(root)
        if path.name in BAD_FILES:
            report.fail(f"Forbidden operating-system metadata committed: {relative}")
        if path.suffix.lower() in ARCHIVES:
            report.fail(f"Packaged archive must not be committed inside the repository: {relative}")
        if path.suffix.lower() in TEMP_SUFFIXES or path.name.endswith("~"):
            report.fail(f"Temporary or backup file committed: {relative}")

    data_root = root / "data"
    if data_root.is_dir():
        for path in data_root.rglob("*"):
            relative = path.relative_to(root)
            if any(char.isupper() for char in str(relative)):
                report.fail(f"Uppercase character in data-pack resource path: {relative}")
            if any(" " in part for part in relative.parts):
                report.fail(f"Space in data-pack resource path: {relative}")


def validate_metadata(root: Path, parsed: dict[Path, object], report: Report) -> None:
    pack = parsed.get(root / "pack.mcmeta")
    if isinstance(pack, dict) and isinstance(pack.get("pack"), dict):
        metadata = pack["pack"]
        if metadata.get("min_format") != EXPECTED_FORMAT:
            report.fail(f"pack.mcmeta min_format must be {EXPECTED_FORMAT}")
        if metadata.get("max_format") != EXPECTED_FORMAT:
            report.fail(f"pack.mcmeta max_format must be {EXPECTED_FORMAT}")
        description = metadata.get("description")
        if not isinstance(description, str):
            report.fail("pack.mcmeta description must be a string")
        elif "Spectral Frequency 1.0" not in description or "26.2" not in description:
            report.fail("pack.mcmeta description must identify Spectral Frequency 1.0 and Minecraft Java 26.2")
    elif (root / "pack.mcmeta").is_file():
        report.fail("pack.mcmeta is missing its pack object")

    spyglass = parsed.get(root / "spyglass.json")
    if isinstance(spyglass, dict):
        env = spyglass.get("env")
        if not isinstance(env, dict) or env.get("gameVersion") != EXPECTED_GAME_VERSION:
            report.fail("spyglass.json env.gameVersion must be '26.2'")

    entry_points = {
        "data/minecraft/tags/function/load.json": "sf:core/load",
        "data/minecraft/tags/function/tick.json": "sf:core/tick",
    }
    for relative, expected in entry_points.items():
        data = parsed.get(root / relative)
        values: list[str] = []
        if isinstance(data, dict) and isinstance(data.get("values"), list):
            for value in data["values"]:
                if isinstance(value, str):
                    values.append(value)
                elif isinstance(value, dict) and isinstance(value.get("id"), str):
                    values.append(value["id"])
        if expected not in values:
            report.fail(f"{relative} must include {expected}")


def validate_json_shapes(root: Path, parsed: dict[Path, object], report: Report) -> None:
    for path, data in parsed.items():
        parts = path.relative_to(root).parts
        if "advancement" in parts and not isinstance(data, dict):
            report.fail(f"Advancement root must be an object: {path.relative_to(root)}")
        elif "loot_table" in parts and not isinstance(data, dict):
            report.fail(f"Loot-table root must be an object: {path.relative_to(root)}")
        elif "dialog" in parts and not isinstance(data, dict):
            report.fail(f"Dialog root must be an object: {path.relative_to(root)}")
        elif "predicate" in parts and not isinstance(data, (dict, list)):
            report.fail(f"Predicate root must be an object or list: {path.relative_to(root)}")
        elif "tags" in parts and "function" in parts:
            if not isinstance(data, dict) or not isinstance(data.get("values"), list):
                report.fail(f"Function tag must contain a values list: {path.relative_to(root)}")


def validate_storage_contract(root: Path, report: Report) -> None:
    path = root / "data/sf/function/core/install/fresh.mcfunction"
    text = read_text(path, report) if path.is_file() else None
    if text is None:
        return
    lines = {line.strip().lstrip("$") for line in text.splitlines()}
    required = (
        'data modify storage sf:system version set value "1.0"',
        'data modify storage sf:system schema set value 102',
        'data modify storage sf:system enabled set value true',
        'data modify storage sf:player_data entries set value []',
        'data modify storage sf:case state set value "inactive"',
        'data modify storage sf:forgotten state set value "idle"',
    )
    for command in required:
        if command not in lines:
            report.fail(f"Fresh-install storage contract is missing: {command}")


def json_references(root: Path, parsed: dict[Path, object]) -> tuple[list[tuple[str, str, Path, int | None]], set[str]]:
    references: list[tuple[str, str, Path, int | None]] = []
    objectives: set[str] = set()
    for path, data in parsed.items():
        parts = path.relative_to(root).parts
        if "tags" in parts and "function" in parts and isinstance(data, dict):
            for value in data.get("values", []):
                resource_id = value if isinstance(value, str) else value.get("id") if isinstance(value, dict) else None
                if isinstance(resource_id, str) and (resource_id.startswith("sf:") or resource_id.startswith("#sf:")):
                    references.append(("function", resource_id, path, None))
        if "advancement" in parts and isinstance(data, dict):
            parent = data.get("parent")
            if isinstance(parent, str) and parent.startswith("sf:"):
                references.append(("advancement", parent, path, None))
        for key, value in walk(data):
            if not isinstance(value, str):
                continue
            objectives.update(objective_refs(value))
            if value.startswith("/") or "function sf:" in value or "schedule clear sf:" in value:
                references.extend(command_refs(value, path, None))
            kind = {"function": "function", "predicate": "predicate", "loot_table": "loot_table", "item_modifier": "item_modifier"}.get(key or "")
            if kind and value.startswith("sf:"):
                references.append((kind, value, path, None))
    return references, objectives


def validate_functions(root: Path, parsed: dict[Path, object], report: Report) -> None:
    function_root = root / "data/sf/function"
    function_files = sorted(function_root.rglob("*.mcfunction")) if function_root.is_dir() else []
    report.function_count = len(function_files)
    if not function_files:
        report.fail("No sf function files were found")

    references: list[tuple[str, str, Path, int | None]] = []
    definitions: set[str] = set()
    used_objectives: set[str] = set()
    removed_objectives: set[str] = set()
    bars_added: set[str] = set()
    bars_used: set[str] = set()
    bars_removed: set[str] = set()

    active_files = set(function_files)
    active_files.update((root / "data").rglob("*.json") if (root / "data").is_dir() else [])
    active_files.update(path for path in (root / "pack.mcmeta", root / "spyglass.json") if path.is_file())

    for path in sorted(active_files):
        text = read_text(path, report)
        if text is None:
            continue
        for pattern, label in STALE:
            if pattern.search(text):
                report.fail(f"{label} found in active runtime file: {path.relative_to(root)}")
        if path.suffix != ".mcfunction":
            continue
        for number, raw in enumerate(text.splitlines(), 1):
            line = raw.strip()
            if not line or line.startswith("#"):
                continue
            if line.startswith("/"):
                report.fail(f"Leading slash is invalid in a function file: {path.relative_to(root)}:{number}")
            if "\t" in raw:
                report.warn(f"Tab character in function source: {path.relative_to(root)}:{number}")
            if line[0] in "{[}]\"" or line.startswith(("},", "],")):
                report.fail(f"Possible split JSON command: {path.relative_to(root)}:{number}")
            mutation = BLOCK_MUTATION.search(line.lstrip("$"))
            if mutation:
                report.fail(f"Destructive block-mutation command '{mutation.group(1)}' is not allowed: {path.relative_to(root)}:{number}")
            references.extend(command_refs(line, path, number))
            definitions.update(OBJ_ADD.findall(line))
            used_objectives.update(objective_refs(line))
            removed_objectives.update(OBJ_REMOVE.findall(line))
            bars_added.update(bar for bar in BAR_ADD.findall(line) if "$(" not in bar)
            bars_used.update(bar for bar in BAR_USE.findall(line) if "$(" not in bar)
            bars_used.update(bar for bar in BAR_STORE.findall(line) if "$(" not in bar)
            bars_removed.update(bar for bar in BAR_REMOVE.findall(line) if "$(" not in bar)

    json_refs, json_objectives = json_references(root, parsed)
    references.extend(json_refs)
    used_objectives.update(json_objectives)

    seen: set[tuple[str, str, Path, int | None]] = set()
    for kind, resource_id, source, line in references:
        key = (kind, resource_id, source, line)
        if key in seen:
            continue
        seen.add(key)
        clean = resource_id[1:] if resource_id.startswith("#") else resource_id
        if not clean.startswith("sf:"):
            continue
        location = f"{source.relative_to(root)}:{line}" if line else str(source.relative_to(root))
        if "$(" in clean:
            continue
        if not VALID_SF_RID.match(resource_id):
            report.fail(f"Invalid sf resource location at {location}: {resource_id}")
            continue
        target = target_path(root, kind, resource_id)
        if target is not None:
            report.reference_count += 1
            if not target.is_file():
                report.fail(f"Missing {kind} reference {resource_id} at {location}; expected {target.relative_to(root)}")

    fresh_path = root / "data/sf/function/core/install/fresh.mcfunction"
    fresh_text = read_text(fresh_path, report) if fresh_path.is_file() else ""
    fresh_list = OBJ_ADD.findall(fresh_text or "")
    fresh = set(fresh_list)
    report.objective_count = len(fresh)
    for objective in sorted({name for name in fresh_list if fresh_list.count(name) > 1}):
        report.fail(f"Objective is created more than once by fresh installation: {objective}")
    for objective in sorted(used_objectives - fresh):
        report.fail(f"Objective is referenced but not created by fresh installation: {objective}")
    for objective in sorted(definitions - fresh):
        report.warn(f"Objective is created outside fresh installation only: {objective}")
    for objective in sorted(fresh - removed_objectives):
        report.fail(f"Fresh-install objective is not removed by destructive purge: {objective}")
    for objective in sorted(removed_objectives - definitions):
        report.warn(f"Purge removes an objective never created in repository source: {objective}")
    for bar in sorted(bars_used - bars_added):
        report.fail(f"Bossbar is referenced but never created: {bar}")
    for bar in sorted(bars_added - bars_removed):
        report.fail(f"Created bossbar is not removed by destructive purge: {bar}")


def validate(root: Path) -> Report:
    root = root.resolve()
    report = Report(root)
    validate_layout(root, report)
    parsed: dict[Path, object] = {}
    json_files = [path for path in files(root) if path.suffix.lower() in {".json", ".mcmeta"}]
    report.json_count = len(json_files)
    for path in json_files:
        value = read_json(path, report)
        if value is not None:
            parsed[path] = value
    validate_metadata(root, parsed, report)
    validate_json_shapes(root, parsed, report)
    validate_storage_contract(root, report)
    validate_functions(root, parsed, report)
    return report


def summary(report: Report, warnings_as_errors: bool) -> str:
    failed = bool(report.errors or (warnings_as_errors and report.warnings))
    lines = [
        "# Spectral Frequency datapack validation", "", f"**Result:** {'FAIL' if failed else 'PASS'}", "",
        f"- JSON/metadata files: {report.json_count}", f"- Function files: {report.function_count}",
        f"- Static sf references checked: {report.reference_count}", f"- Fresh-install objectives: {report.objective_count}",
        f"- Errors: {len(report.errors)}", f"- Warnings: {len(report.warnings)}",
    ]
    if report.errors:
        lines += ["", "## Errors", *[f"- {item}" for item in report.errors]]
    if report.warnings:
        lines += ["", "## Warnings", *[f"- {item}" for item in report.warnings]]
    return "\n".join(lines) + "\n"


def emit(report: Report, warnings_as_errors: bool) -> int:
    print(f"Validated {report.json_count} JSON/metadata files")
    print(f"Validated {report.function_count} mcfunction files")
    print(f"Resolved {report.reference_count} static sf resource references")
    print(f"Validated {report.objective_count} fresh-install objectives")
    for item in report.warnings:
        print(f"::warning::{item}")
    for item in report.errors:
        print(f"::error::{item}")
    if path := os.environ.get("GITHUB_STEP_SUMMARY"):
        try:
            with Path(path).open("a", encoding="utf-8") as handle:
                handle.write(summary(report, warnings_as_errors))
        except OSError as exc:
            print(f"::warning::Could not write GitHub step summary ({exc})")
    failed = bool(report.errors or (warnings_as_errors and report.warnings))
    if failed:
        print(f"Validation failed: {len(report.errors)} error(s), {len(report.warnings)} warning(s).")
        return 1
    print("Spectral Frequency datapack release validation passed.")
    return 0


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=ROOT_DEFAULT)
    parser.add_argument("--warnings-as-errors", action="store_true")
    args = parser.parse_args(sys.argv[1:] if argv is None else argv)
    return emit(validate(args.root), args.warnings_as_errors)


if __name__ == "__main__":
    raise SystemExit(main())
