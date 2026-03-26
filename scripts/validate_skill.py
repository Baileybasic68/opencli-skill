#!/usr/bin/env python3
"""Portable validator for this skill repository."""

from __future__ import annotations

from pathlib import Path
import sys

try:
    import yaml
except ImportError as exc:  # pragma: no cover
    print(f"Missing dependency: {exc}. Install with `python3 -m pip install pyyaml`.")
    sys.exit(1)


ROOT = Path(__file__).resolve().parent.parent
SKILL = ROOT / "SKILL.md"
OPENAI_YAML = ROOT / "agents" / "openai.yaml"


def fail(message: str) -> None:
    print(f"ERROR: {message}")
    sys.exit(1)


def load_frontmatter(text: str) -> dict:
    if not text.startswith("---\n"):
        fail("SKILL.md is missing YAML frontmatter.")
    parts = text.split("---\n", 2)
    if len(parts) < 3:
        fail("SKILL.md frontmatter is malformed.")
    return yaml.safe_load(parts[1]) or {}


def main() -> None:
    if not SKILL.exists():
        fail("SKILL.md not found.")
    if not OPENAI_YAML.exists():
        fail("agents/openai.yaml not found.")

    frontmatter = load_frontmatter(SKILL.read_text())
    allowed_keys = {"name", "description"}
    extra = set(frontmatter) - allowed_keys
    if extra:
        fail(f"Unexpected frontmatter keys: {sorted(extra)}")

    if not frontmatter.get("name"):
        fail("Frontmatter `name` is required.")
    if not frontmatter.get("description"):
        fail("Frontmatter `description` is required.")

    if not str(frontmatter["name"]).replace("-", "").isalnum():
        fail("Frontmatter `name` must use letters, digits, and hyphens only.")

    openai = yaml.safe_load(OPENAI_YAML.read_text()) or {}
    interface = openai.get("interface", {})
    for key in ("display_name", "short_description", "default_prompt"):
        if not interface.get(key):
            fail(f"`agents/openai.yaml` is missing interface.{key}")

    print("Skill is valid!")


if __name__ == "__main__":
    main()
