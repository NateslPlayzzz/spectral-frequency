#!/usr/bin/env python3
"""Structural validation for the Spectral Frequency datapack repository."""

from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
EXPECTED_FORMAT = [107, 1]

errors: list[str] = []
warnings: list[str] = []


def fail(message: str) -> None:
    errors.append(message)


def warn(message: str) -> None:
    warnings.append(message)


def read_json(path: Path) -> object | None:
    try:
        with path.open("r", encoding="utf-8") as handle:
            return json.load(handle)
    except (OSError, UnicodeDecodeError, json.JSONDecodeError) as exc:
        fail(f"Invalid JSON: {path.relative_to(ROOT)} ({exc})")
        return None


required_paths = [
    Path("pack.mcmeta"),
    Path("spyglass.json"),
    Path("data/minecraft/tags/function/load.json"),
    Path("data/minecraft/tags/function/tick.json"),
    Path("data/sf/function/core/load.mcfunction"),
    Path("data/sf/function/core/tick.mcfunction"),
]

for relative in required_paths:
    if not (ROOT / relative).is_file():
        fail(f"Missing required file: {relative}")

# Parse every JSON-bearing datapack file.
json_files = sorted(
    path
    for path in ROOT.rglob("*")
    if path.is_file() and path.suffix in {".json", ".mcmeta"}
)

parsed: dict[Path, object] = {}
for path in json_files:
    result = read_json(path)
    if result is not None:
        parsed[path] = result

# Validate pack format exactly against the locked Java 26.2 target.
pack_path = ROOT / "pack.mcmeta"
pack_data = parsed.get(pack_path)
if isinstance(pack_data, dict):
    pack = pack_data.get("pack")
    if not isinstance(pack, dict):
        fail("pack.mcmeta is missing its pack object")
    else:
        if pack.get("min_format") != EXPECTED_FORMAT:
            fail(f"pack.mcmeta min_format must be {EXPECTED_FORMAT}")
        if pack.get("max_format") != EXPECTED_FORMAT:
            fail(f"pack.mcmeta max_format must be {EXPECTED_FORMAT}")
        if not isinstance(pack.get("description"), str):
            fail("pack.mcmeta description must be a string")

# Validate the two Minecraft function entry points.
entry_points = {
    Path("data/minecraft/tags/function/load.json"): "sf:core/load",
    Path("data/minecraft/tags/function/tick.json"): "sf:core/tick",
}

for relative, expected in entry_points.items():
    data = parsed.get(ROOT / relative)
    if not isinstance(data, dict):
        continue
    values = data.get("values")
    if not isinstance(values, list) or expected not in values:
        fail(f"{relative} must include {expected}")

# Prevent accidental reintroduction of obsolete or nested source packages.
for forbidden in (
    "SpectralFIN.zip",
    "spectral.zip",
    "spectral1.0wip.zip",
):
    matches = list(ROOT.rglob(forbidden))
    for match in matches:
        fail(f"Forbidden packaged artifact committed: {match.relative_to(ROOT)}")

if (ROOT / "data/spectral").exists():
    fail("Obsolete data/spectral namespace is present; runtime code must use data/sf")

if (ROOT / "spectral/pack.mcmeta").exists():
    fail("Nested spectral/ datapack wrapper detected; pack.mcmeta must stay at repository root")

# Basic source hygiene.
function_files = sorted((ROOT / "data/sf/function").rglob("*.mcfunction"))
if not function_files:
    fail("No sf function files were found")

for path in function_files:
    try:
        text = path.read_text(encoding="utf-8")
    except (OSError, UnicodeDecodeError) as exc:
        fail(f"Unreadable function: {path.relative_to(ROOT)} ({exc})")
        continue
    if "\r" in text:
        warn(f"CRLF line endings detected: {path.relative_to(ROOT)}")
    if "data/spectral" in text or "spectral:" in text:
        warn(f"Possible legacy namespace reference: {path.relative_to(ROOT)}")

print(f"Validated {len(json_files)} JSON/metadata files")
print(f"Validated {len(function_files)} mcfunction files")

for message in warnings:
    print(f"::warning::{message}")

if errors:
    for message in errors:
        print(f"::error::{message}")
    print(f"Validation failed with {len(errors)} error(s).")
    sys.exit(1)

print("Spectral Frequency datapack structure is valid.")
