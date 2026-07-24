# Security Policy

## Supported versions

Spectral Frequency has not yet published its final 1.0 release. Security and destructive-data reports currently apply to the active 1.0 stabilization branch.

| Version | Supported |
|---|---:|
| 1.0 development | Yes |
| Historical Beta builds | No |

## Reporting a vulnerability

Please do not open a public issue for a vulnerability that could:

- Destroy or corrupt world data
- Permanently erase player progression
- Execute commands with unintended administrator impact
- Expose private server or player information
- Enable destructive behavior through crafted NBT, functions, or installation steps

Prefer GitHub's private vulnerability-reporting feature when available. Otherwise, contact the repository owner privately through the Nexus Labs Discord and clearly identify the report as a Spectral Frequency security or data-loss issue.

Include:

- Minecraft version
- Datapack branch or release
- Clean or upgraded world
- Reproduction steps
- Expected and actual behavior
- Relevant commands, logs, and files
- Whether the issue requires operator permissions
- Whether player or world data was damaged

Do not send an irreplaceable world as the only reproduction fixture. Use a copy and remove unrelated private data.

## Response priorities

The project treats these as urgent:

1. Unintended permanent-data deletion
2. Unsafe uninstall or migration behavior
3. Operator-level command abuse
4. Multiplayer state affecting uninvolved players
5. Repeatable server instability or runaway scheduling

Normal gameplay bugs, balance concerns, and non-destructive softlocks should use the public issue tracker.
