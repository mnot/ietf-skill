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

## Two ways in — pick one

There are two independent ways an assistant can reach the IETF record, and you
want one, not both:

- **These skills + the `ietf-llm-query` tool.** Install the skills (below),
  `pipx install ietf-llm`, and the assistant queries a corpus you gather
  locally.
- **The hosted `ietf-llm` MCP server.** If your assistant connects to it, the
  server delivers routing guidance, the norms, and the query tools itself — so
  you don't need *any* of these skills installed on that path.

Running both query paths — `ietf-corpus` over a local gather *and* the hosted
MCP — points the assistant at two different corpora with no coordination, so it
can't cite a single coherent record. (The norm skills query nothing, so having
them installed alongside the MCP is just redundant, not a conflict.) Pick the
path that fits your setup.

(If all you want is the drafting or reading guidance, install just the two norm
skills — they need neither the tool nor the MCP.)

## Install

You need [`git`](https://git-scm.com/). Clone the repository once:

```sh
git clone https://github.com/mnot/ietf-skill.git
cd ietf-skill
```

Then copy the skills you want into your tool's skills folder. Pick your tool:

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

### Or use `make` (macOS / Linux)

From a clone, a Makefile installs into every assistant config dir you already
have and keeps them in sync. It only ever copies the Markdown skill directories
— it installs no software and runs nothing else (`pipx install ietf-llm` stays
a manual step):

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
there could register a skill twice; copy it there by hand if you want. On
Windows, use the manual copy above.

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
