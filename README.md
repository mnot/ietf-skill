# IETF Agent Skills

Norms and tooling for participating in [IETF](https://www.ietf.org/) and IRTF
work, packaged as [Agent Skills](https://agentskills.io/).

Three skills, split by what they need:

| Skill | What it does | Needs |
| --- | --- | --- |
| [`ietf-contributing`](ietf-contributing/SKILL.md) | Norms for drafting text that goes into the record under your name — list mail, replies, GitHub issues/comments, reviews | nothing — plain guidance |
| [`ietf-interpreting`](ietf-interpreting/SKILL.md) | Norms for reading the record and reporting where a group stands — consensus, positions, draft/RFC status | nothing — plain guidance |
| [`ietf-corpus`](ietf-corpus/SKILL.md) | Query the gathered record of an effort — routing, search, grounding citations in primary text | the `ietf-llm` tool (see below) |

The two norm skills are plain Markdown: guidance the assistant reads, with no
scripts or other executable parts. They're useful on their own, with no other
tooling installed. `ietf-corpus` drives a command-line tool and depends on it.

## Two ways in — by execution environment

Which path you want isn't about *which product* you use — it's whether the
assistant runs commands on a **persistent local machine** or in an **ephemeral
remote sandbox**. `ietf-corpus` drives a local command-line tool, so it only
works in the first case.

- **Local execution** — Claude Code (the CLI, and Claude Desktop's **Code** tab
  in Local mode, which shares `~/.claude`), Codex CLI, Gemini CLI, Cursor,
  Copilot in VS Code. Install the skills, `pipx install ietf-llm`, and the
  assistant queries a corpus you gather once and keep.
- **Remote / ephemeral execution** — Claude Desktop's **Chat** and **Cowork**
  tabs, claude.ai, cloud coding agents. Each session is a throwaway sandbox with
  no persistent install and no saved corpus, so the CLI path can't work — it
  would re-install and re-gather every time. Use the hosted **`ietf-llm` MCP**
  instead: the corpus lives server-side, and the norms and routing come from the
  MCP itself, so you install nothing.

The split runs straight through one product — Claude Desktop's Code tab (Local)
is the local case, its Chat tab the remote case.

Two rules follow: **don't install `ietf-corpus` on a remote/hosted assistant**
(use the MCP there — see Install), and **don't run both query paths at once** —
`ietf-corpus` over a local gather *and* the MCP point at two different corpora
with no coordination, so the assistant can't cite one coherent record. The norm
skills query nothing, so they're fine anywhere: install them here, or take them
from the MCP.

## Install

You need [`git`](https://git-scm.com/). Clone the repository once:

```sh
git clone https://github.com/mnot/ietf-skill.git
cd ietf-skill
```

> **On a remote/hosted assistant — Claude Desktop's Chat or Cowork tab,
> claude.ai, a cloud coding agent — do not install `ietf-corpus`.** It drives a
> local command-line tool and can't work in an ephemeral cloud session (it would
> re-install and re-gather every time); use the hosted `ietf-llm` MCP for corpus
> access there instead. Install just the norm skills (`make install-norms`), or
> take everything from the MCP. `ietf-corpus` is for local-execution clients —
> including Claude Desktop's **Code** tab in Local mode, which shares
> `~/.claude/skills` with the CLI.

Then install from the clone — with `make` (simplest; macOS / Linux) or a manual
copy (any OS).

### Using `make` (macOS / Linux)

A Makefile installs into every assistant config dir you already have and keeps
them in sync. It only ever copies the Markdown skill directories — it installs
no software and runs nothing else (`pipx install ietf-llm` stays a manual step):

```sh
make                  # list detected config dirs and what's installed
make install-norms    # copy the two norm skills into every detected dir
make install-corpus   # also copy ietf-corpus (then: pipx install ietf-llm)
make update           # git pull, then refresh whatever's already installed
make uninstall        # remove them again
```

It sweeps the per-tool dirs (`~/.claude`, `~/.gemini`, `~/.cursor`,
`~/.copilot`) and installs only where the tool is present. `~/.agents/` is left
out of the sweep on purpose — several tools also read it, so auto-installing
there could register a skill twice; copy it there by hand if you want.

### Manual copy (any OS)

On Windows, or to place skills yourself, copy the ones you want into your tool's
skills folder:

| Tool | Skills folder |
| --- | --- |
| **Claude Code** | `~/.claude/skills/` |
| **OpenAI Codex** | `~/.agents/skills/` |
| **Gemini CLI** | `~/.gemini/skills/` |
| **GitHub Copilot / VS Code** | `~/.copilot/skills/` |
| **Cursor** | `~/.cursor/skills/` |

For example, for Claude Code — all three skills:

```sh
mkdir -p ~/.claude/skills
cp -R ietf-contributing ietf-interpreting ietf-corpus ~/.claude/skills/
```

Or just the norms (no tooling required):

```sh
cp -R ietf-contributing ietf-interpreting ~/.claude/skills/
```

`~/.agents/skills/` is a vendor-neutral location that several tools (Codex,
Copilot/VS Code) also read from. Every tool above also supports project-scoped
skills — the same folder names without the `~/`, under a project directory
(`.claude/skills/`, `.agents/skills/`, `.gemini/skills/`, `.github/skills/`,
`.cursor/skills/`) — for guidance active only inside one repository.

### `ietf-corpus` also needs the tool

```sh
pipx install ietf-llm
```

This provides `ietf-llm-query` (read a gathered corpus) and `ietf-llm` (gather
one). The skill checks for `ietf-llm-query` before using it and tells the user
to install it if it's missing.

> **Status:** `ietf-corpus` is provisional — it's written against the
> `ietf-llm-query` command surface, which isn't released yet. Command names,
> flags, and the minimum version pin may change until that lands. The two norm
> skills are stable.

### Updating

```sh
cd ietf-skill
git pull
```

Then re-run the copy command for your tool to overwrite the installed copies —
or, on macOS / Linux, `make update` does both (pull, then refresh whatever's
already installed in each detected dir).

## How it activates

You don't invoke these manually. Your assistant reads each skill's short
description at startup and loads the full guidance on its own when your task
matches — `ietf-contributing` when you ask it to help draft a message, comment,
or review that goes out under your name; `ietf-interpreting` when you ask what a
group decided or whether there's consensus; `ietf-corpus` when you ask what a
named effort is doing or discussing.

## License

Released under [CC BY 4.0](LICENSE) — share or adapt freely, with attribution.

This describes IETF community norms as understood by its author. It is not a
normative IETF document and carries no official standing.
