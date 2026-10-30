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
            "pack.mcmeta": {"pack": {"description": "Spectral Frequency 1.0\nMinecraft Java 26.3", "min_format": [121, 0], "max_format": [121, 0]}},
            "spyglass.json": {"env": {"gameVersion": "26.3"}},
            "data/minecraft/tags/function/load.json": {"values": ["sf:core/load"]},
            "data/minecraft/tags/function/tick.json": {"values": ["sf:core/tick"]},
        }
        for relative, data in json_files.items():
            path = root / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(json.dumps(data), encoding="utf-8")

        function_files = {
            "data/sf/function/core/load.mcfunction": "execute unless data storage sf:system schema run function sf:core/install/fresh\nfunction sf:core/runtime/load\n",
            "data/sf/function/core/runtime/load.mcfunction": "scoreboard players add #x sf.data 1\n",
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


    def write_json(self, root: Path, relative: str, data: object) -> None:
        path = root / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(data), encoding="utf-8")

    def test_26_3_loot_table_shape_passes(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        self.write_json(root, "data/sf/loot_table/tool/x.json", {"pools": [{"rolls": 1, "entries": [{"type": "minecraft:item", "name": "minecraft:stick", "modifier": [{"type": "minecraft:set_count", "count": 1}]}]}]})
        report = validator.validate(root)
        self.assertEqual([], report.errors)

    def test_legacy_loot_function_key_fails(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        self.write_json(root, "data/sf/loot_table/tool/x.json", {"pools": [{"rolls": 1, "entries": [{"type": "minecraft:item", "name": "minecraft:stick", "functions": [{"function": "minecraft:set_count", "count": 1}]}]}]})
        report = validator.validate(root)
        self.assertTrue(any("'function' was renamed to 'type'" in error for error in report.errors))
        self.assertTrue(any("'functions' was renamed to 'modifier'" in error for error in report.errors))

    def test_component_payload_is_not_inspected_for_legacy_keys(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        payload = {"minecraft:custom_data": {"function": "x", "functions": [1], "conditions": []}}
        self.write_json(root, "data/sf/loot_table/tool/x.json", {"pools": [{"rolls": 1, "entries": [{"type": "minecraft:item", "name": "minecraft:stick", "modifier": [{"type": "minecraft:set_components", "components": payload}]}]}]})
        report = validator.validate(root)
        self.assertEqual([], report.errors)
        self.assertEqual([], report.warnings)

    def test_legacy_predicate_condition_key_fails(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        self.write_json(root, "data/sf/predicate/x.json", {"condition": "minecraft:random_chance", "chance": 0.5})
        report = validator.validate(root)
        self.assertTrue(any("'condition' was renamed to 'type'" in error for error in report.errors))

    def test_predicate_bare_list_root_fails(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        self.write_json(root, "data/sf/predicate/x.json", [{"type": "minecraft:random_chance", "chance": 0.5}])
        report = validator.validate(root)
        self.assertTrue(any("bare-list" in error for error in report.errors))

    def test_26_3_predicate_shape_passes(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        self.write_json(root, "data/sf/predicate/x.json", {"type": "minecraft:all_of", "terms": [{"type": "minecraft:random_chance", "chance": 0.5}]})
        report = validator.validate(root)
        self.assertEqual([], report.errors)

    def test_visible_root_advancement_requires_background(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        self.write_json(root, "data/sf/advancement/root.json", {"display": {"icon": {"id": "minecraft:stick"}, "title": "T", "description": "D"}, "criteria": {"a": {"trigger": "minecraft:tick"}}})
        report = validator.validate(root)
        self.assertTrue(any("must declare display.background" in error for error in report.errors))

    def test_child_advancement_must_not_declare_background(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        self.write_json(root, "data/sf/advancement/root.json", {"display": {"icon": {"id": "minecraft:stick"}, "title": "T", "description": "D", "background": "minecraft:block/stone"}, "criteria": {"a": {"trigger": "minecraft:tick"}}})
        self.write_json(root, "data/sf/advancement/child.json", {"parent": "sf:root", "display": {"icon": {"id": "minecraft:stick"}, "title": "T", "description": "D", "background": "minecraft:block/stone"}, "criteria": {"a": {"trigger": "minecraft:impossible"}}})
        report = validator.validate(root)
        self.assertTrue(any("Only a root advancement may declare" in error for error in report.errors))

    def test_removed_26_3_tokens_fail(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        (root / "data/sf/function/core/tick.mcfunction").write_text('give @s stick[minecraft:swing_animation={type:"stab"}]\n', encoding="utf-8")
        report = validator.validate(root)
        self.assertTrue(any("swing_animation" in error for error in report.errors))

    def test_old_26_2_format_is_rejected(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        self.write_json(root, "pack.mcmeta", {"pack": {"description": "Spectral Frequency 1.0\nMinecraft Java 26.3", "min_format": [107, 1], "max_format": [107, 1]}})
        report = validator.validate(root)
        self.assertTrue(any("min_format must be [121, 0]" in error for error in report.errors))


    def test_trigger_entity_shorthand_fails(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        self.write_json(root, "data/sf/advancement/x.json", {"criteria": {"i": {"trigger": "minecraft:player_interacted_with_entity", "conditions": {"entity": {"minecraft:entity_type": "minecraft:interaction"}}}}})
        report = validator.validate(root)
        self.assertTrue(any("entity-predicate shorthand" in error for error in report.errors))

    def test_trigger_entity_predicate_passes(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        self.write_json(root, "data/sf/advancement/x.json", {"criteria": {"i": {"trigger": "minecraft:player_interacted_with_entity", "conditions": {"entity": {"type": "minecraft:entity_properties", "entity": "this", "predicate": {"minecraft:entity_type": "minecraft:interaction"}}}}}})
        report = validator.validate(root)
        self.assertEqual([], report.errors)

    def test_untyped_uniform_count_fails(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        self.write_json(root, "data/sf/loot_table/reward/x.json", {"pools": [{"rolls": 1, "entries": [{"type": "minecraft:item", "name": "minecraft:stick", "modifier": [{"type": "minecraft:set_count", "count": {"min": 1, "max": 3}}]}]}]})
        report = validator.validate(root)
        self.assertTrue(any("untyped min/max number provider" in error for error in report.errors))

    def test_typed_uniform_count_passes(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        self.write_json(root, "data/sf/loot_table/reward/x.json", {"pools": [{"rolls": 1, "entries": [{"type": "minecraft:item", "name": "minecraft:stick", "modifier": [{"type": "minecraft:set_count", "count": {"type": "minecraft:uniform", "min": 1, "max": 3}}]}]}]})
        report = validator.validate(root)
        self.assertEqual([], report.errors)

    def test_overwritten_load_dispatcher_fails(self) -> None:
        temporary, root = self.make_repo()
        self.addCleanup(temporary.cleanup)
        (root / "data/sf/function/core/load.mcfunction").write_text("# core/runtime/load.mcfunction\nexecute unless data storage sf:system {enabled:true} run return 0\n", encoding="utf-8")
        report = validator.validate(root)
        self.assertTrue(any("lifecycle dispatcher" in error for error in report.errors))

if __name__ == "__main__":
    unittest.main()
