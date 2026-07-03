# IETF Agent Skills

Norms for participating in [IETF](https://www.ietf.org/) and IRTF work, packaged
as [Agent Skills](https://agentskills.io/).

| Skill | What it does |
| --- | --- |
| [`ietf-contributing`](ietf-contributing/SKILL.md) | Drafting text that goes into the record under your name — list mail, replies, GitHub issues/comments, reviews. |
| [`ietf-interpreting`](ietf-interpreting/SKILL.md) | Understanding how the IETF works; e.g., consensus, positions, draft/RFC status. |

Both are only Markdown, no executables.

## Querying the record

These skills are about *how to participate*. To actually read the public record of an effort — mailing list, drafts, RFCs, GitHub issues, minutes — install the [ietf-llm](https://pypi.org/project/ietf-llm/) MCP server.

The MCP server also serves these norms (as tools), but installing both does no harm.

## Install

You need [`git`](https://git-scm.com/). Clone the repository once:

```sh
git clone https://github.com/mnot/ietf-skill.git
cd ietf-skill
```

Then install from the clone — with `make` (simplest; macOS / Linux) or a manual copy (any OS).

### Using `make` (macOS / Linux)

A Makefile installs into every assistant config dir you already have and keeps them in sync. It only ever copies the Markdown skill directories — it installs no software and runs nothing else:

```sh
make            # list detected config dirs and what's installed
make install    # copy the skills into every detected dir
make update     # git pull, then refresh whatever's already installed
make uninstall  # remove them again
```

It sweeps the per-tool dirs (`~/.claude`, `~/.gemini`, `~/.cursor`, `~/.copilot`) and installs only where the tool is present. `~/.agents/` is left out of the sweep on purpose — several tools also read it, so auto-installing there could register a skill twice; copy it there by hand if you want.

### Manual copy (any OS)

On Windows, or to place skills yourself, copy them into your tool's skills folder:

| Tool | Skills folder |
| --- | --- |
| **Claude Code** | `~/.claude/skills/` |
| **OpenAI Codex** | `~/.agents/skills/` |
| **Gemini CLI** | `~/.gemini/skills/` |
| **GitHub Copilot / VS Code** | `~/.copilot/skills/` |
| **Cursor** | `~/.cursor/skills/` |

```sh
mkdir -p ~/.claude/skills
cp -R ietf-contributing ietf-interpreting ~/.claude/skills/
```

`~/.agents/skills/` is a vendor-neutral location that several tools (Codex, Copilot/VS Code) also read from.

### Updating

```sh
cd ietf-skill
git pull
```

Then re-run the copy command for your tool to overwrite the installed copies — or, on macOS / Linux, `make update` does both.

## How they activate

You don't invoke these manually. Your assistant reads each skill's short description at startup and loads the full guidance on its own when your task matches — `ietf-contributing` when you ask it to help draft a message, comment, or review that goes out under your name; `ietf-interpreting` when you ask what a group decided or whether there's consensus.

## License

Released under [CC BY 4.0](LICENSE) — share or adapt freely, with attribution.

This describes IETF community norms as understood by its author. It is not a
normative IETF document and carries no official standing.
