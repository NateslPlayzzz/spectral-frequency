#!/usr/bin/env python3
"""Self-tests for the Spectral Frequency release validator."""

from __future__ import annotations

import importlib.util
import json
import sys
import tempfile
import unittest
from pathlib import Path

VALIDATOR_PATH = Path(__file__).with_name("validate_datapack.py")
SPEC = importlib.util.spec_from_file_location("validate_datapack", VALIDATOR_PATH)
assert SPEC is not None and SPEC.loader is not None
validator = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = validator
SPEC.loader.exec_module(validator)


class ValidatorTests(unittest.TestCase):
    def make_repo(self) -> tuple[tempfile.TemporaryDirectory[str], Path]:
        temporary = tempfile.TemporaryDirectory()
        root = Path(temporary.name)

        json_files = {
            "pack.mcmeta": {"pack": {"description": "Spectral Frequency 1.0\nMinecraft Java 26.2", "min_format": [107, 1], "max_format": [107, 1]}},
            "spyglass.json": {"env": {"gameVersion": "26.2"}},
            "data/minecraft/tags/function/load.json": {"values": ["sf:core/load"]},
            "data/minecraft/tags/function/tick.json": {"values": ["sf:core/tick"]},
        }
        for relative, data in json_files.items():
            path = root / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(json.dumps(data), encoding="utf-8")

        function_files = {
            "data/sf/function/core/load.mcfunction": "function sf:core/install/fresh\n",
            "data/sf/function/core/tick.mcfunction": "scoreboard players add #x sf.data 1\n",
            "data/sf/function/core/install/fresh.mcfunction": "scoreboard objectives add sf.data dummy\nbossbar add sf:mem0 {\"text\":\"MEMORY\"}\ndata modify storage sf:system version set value \"1.0\"\ndata modify storage sf:system schema set value 102\ndata modify storage sf:system enabled set value true\ndata modify storage sf:player_data entries set value []\ndata modify storage sf:case state set value \"inactive\"\ndata modify storage sf:forgotten state set value \"idle\"\n",
            "data/sf/function/core/purge/remove_objectives.mcfunction": "scoreboard objectives remove sf.data\nfunction sf:core/purge/remove_bossbars\n",
            "data/sf/function/core/purge/remove_bossbars.mcfunction": "bossbar remove sf:mem0\n",
        }
        for relative, text in function_files.items():
            path = root / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding="utf-8")

        return temporary, root

    def test_valid_minimal_repository(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        report = validator.validate(root)
        self.assertEqual([], report.errors)

    def test_missing_function_reference_fails(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        (root / "data/sf/function/core/tick.mcfunction").write_text("function sf:missing/path\n", encoding="utf-8")
        report = validator.validate(root)
        self.assertTrue(any("Missing function reference" in error for error in report.errors))

    def test_missing_objective_definition_fails(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        (root / "data/sf/function/core/tick.mcfunction").write_text("scoreboard players add #x sf.missing 1\n", encoding="utf-8")
        report = validator.validate(root)
        self.assertTrue(any("sf.missing" in error for error in report.errors))

    def test_destructive_block_command_fails(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        (root / "data/sf/function/core/tick.mcfunction").write_text("execute at @s run setblock ~ ~ ~ air\n", encoding="utf-8")
        report = validator.validate(root)
        self.assertTrue(any("Destructive block-mutation" in error for error in report.errors))

    def test_archive_cruft_fails(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        (root / "embedded.zip").write_bytes(b"not a real zip")
        report = validator.validate(root)
        self.assertTrue(any("Packaged archive" in error for error in report.errors))


    def test_dynamic_macro_references_are_not_treated_as_missing(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        (root / "data/sf/function/core/tick.mcfunction").write_text(
            "function sf:tool/give_$(output)\nloot give @s loot sf:reward/lore/doc_$(id)\n",
            encoding="utf-8",
        )
        report = validator.validate(root)
        self.assertFalse(any("give_" in error or "doc_" in error for error in report.errors))

    def test_visible_function_hint_is_not_a_runtime_reference(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        (root / "data/sf/function/core/tick.mcfunction").write_text(
            'tellraw @s [{"text":"Use /function sf:dev/repair/finale."}]\n',
            encoding="utf-8",
        )
        report = validator.validate(root)
        self.assertFalse(any("finale." in error for error in report.errors))

    def test_dynamic_bossbar_reference_is_not_truncated(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        (root / "data/sf/function/core/tick.mcfunction").write_text(
            "$bossbar set sf:mem$(barslot) visible true\n",
            encoding="utf-8",
        )
        report = validator.validate(root)
        self.assertFalse(any("Bossbar is referenced" in error for error in report.errors))

    def test_anchor_entity_tag_is_not_removed_trigger(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        (root / "data/sf/function/core/tick.mcfunction").write_text(
            "kill @e[tag=sf.anchor]\n",
            encoding="utf-8",
        )
        report = validator.validate(root)
        self.assertFalse(any("removed player-authority trigger" in error for error in report.errors))

    def test_crlf_source_is_accepted(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        (root / "data/sf/function/core/tick.mcfunction").write_bytes(
            b"scoreboard players add #x sf.data 1\r\n"
        )
        report = validator.validate(root)
        self.assertFalse(any("CRLF" in warning for warning in report.warnings))


if __name__ == "__main__":
    unittest.main()
