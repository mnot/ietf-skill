# IETF Agent Skills

Norms for participating in [IETF](https://www.ietf.org/) and IRTF work, packaged
as [Agent Skills](https://agentskills.io/) — portable across the tools that
adopted the format (Claude Code, OpenAI Codex, Gemini CLI, GitHub Copilot /
VS Code, Cursor, and others), not tied to one vendor.

| Skill | What it does |
| --- | --- |
| [`ietf-contributing`](ietf-contributing/SKILL.md) | Norms for drafting text that goes into the record under your name — list mail, replies, GitHub issues/comments, reviews. |
| [`ietf-interpreting`](ietf-interpreting/SKILL.md) | Norms for reading the record and reporting where a group stands — consensus, positions, draft/RFC status. |

Both are plain Markdown: guidance the assistant reads, with no scripts or other
executable parts. They need no other tooling, and work in any environment —
local or hosted, in a terminal or a chat client.

## Querying the record

These skills are about *how to participate*, not about reading the corpus. To
actually query the gathered record of an effort — mailing list, drafts, RFCs,
GitHub issues, minutes — use the **`ietf-llm` MCP server**, in whichever
deployment fits:

- **Hosted (HTTP)** — connect your assistant to the shared hosted endpoint.
  Nothing to install; corpora are maintained server-side.
- **Local (stdio)** — `pipx install ietf-llm`, gather a corpus, and run the MCP
  locally over stdio for your own, offline, or private corpora.

An assistant drives the record far better through the MCP's warm, structured
tools than by shelling out to a command-line tool, so corpus access lives
entirely on the MCP — there is deliberately no query *skill* in this repo.

The MCP also serves these same norms (via its norm tools) and the routing to go
with them, so **on the MCP path you don't strictly need these skills installed**
— install them for assistants that aren't on the MCP, or when you just want the
drafting and reading guidance on its own. Use one MCP deployment, not both:
hosted and local point at different corpora, and an assistant can't cite one
coherent record across two.

## Install

You need [`git`](https://git-scm.com/). Clone the repository once:

```sh
git clone https://github.com/mnot/ietf-skill.git
cd ietf-skill
```

Then install from the clone — with `make` (simplest; macOS / Linux) or a manual
copy (any OS).

### Using `make` (macOS / Linux)

A Makefile installs into every assistant config dir you already have and keeps
them in sync. It only ever copies the Markdown skill directories — it installs
no software and runs nothing else:

```sh
make            # list detected config dirs and what's installed
make install    # copy the skills into every detected dir
make update     # git pull, then refresh whatever's already installed
make uninstall  # remove them again
```

It sweeps the per-tool dirs (`~/.claude`, `~/.gemini`, `~/.cursor`,
`~/.copilot`) and installs only where the tool is present. `~/.agents/` is left
out of the sweep on purpose — several tools also read it, so auto-installing
there could register a skill twice; copy it there by hand if you want.

### Manual copy (any OS)

On Windows, or to place skills yourself, copy them into your tool's skills
folder:

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

`~/.agents/skills/` is a vendor-neutral location that several tools (Codex,
Copilot/VS Code) also read from. Every tool above also supports project-scoped
skills — the same folder names without the `~/`, under a project directory
(`.claude/skills/`, `.agents/skills/`, `.gemini/skills/`, `.github/skills/`,
`.cursor/skills/`) — for guidance active only inside one repository.

### Updating

```sh
cd ietf-skill
git pull
```

Then re-run the copy command for your tool to overwrite the installed copies —
or, on macOS / Linux, `make update` does both.

## How it activates

You don't invoke these manually. Your assistant reads each skill's short
description at startup and loads the full guidance on its own when your task
matches — `ietf-contributing` when you ask it to help draft a message, comment,
or review that goes out under your name; `ietf-interpreting` when you ask what a
group decided or whether there's consensus.

## License

Released under [CC BY 4.0](LICENSE) — share or adapt freely, with attribution.

This describes IETF community norms as understood by its author. It is not a
normative IETF document and carries no official standing.
