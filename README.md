# IETF Agent Skill

An [Agent Skill](https://agentskills.io/) that teaches an AI assistant the norms
of participating in [IETF](https://www.ietf.org/) and IRTF work. It is written to
the open `SKILL.md` format, so it works in any tool that has adopted it — Claude
Code, OpenAI Codex, Gemini CLI, GitHub Copilot / VS Code, Cursor, and others —
not just one vendor.

The audience is IETF participants, not developers. You do not need to write or
run any code to use it.

## Instructions only — no executable code

This skill is **plain Markdown** — written guidance, and nothing else. There are
no scripts, no install hooks, no commands that run on your machine. Installing it
just copies text files into a folder your assistant reads from; the assistant
pulls the guidance in only when it is relevant to what you are doing.

You can — and should — open the files and read them before installing. It is all
prose. Nothing in this repository executes.

## What's here

The skill is `ietf`. It is organised by capability, so it can grow without
disturbing what already works:

```
ietf/
├── SKILL.md                     # entry point: what the skill is, and its capabilities
└── references/
    └── contributing.md          # capability: drafting contributions to the record
```

- **contributing** — norms for drafting text that will go into the record under a
  participant's name (mailing-list mail, thread replies, GitHub issues/comments,
  reviews). Covers accountability, disclosing AI involvement, the terse technical
  register, grounding claims, staying on charter, and not manufacturing consensus
  signal.

Your assistant loads a capability file on its own when the task calls for it;
you don't open them by hand. Further capabilities will be added as separate files
under `references/`.

## Install

You need [`git`](https://git-scm.com/). Clone the repository once:

```sh
git clone https://github.com/mnot/ietf-skill.git
cd ietf-skill
```

Then copy the `ietf` directory into your tool's skills folder. Pick your tool:

| Tool | Command |
| --- | --- |
| **Claude Code** | `mkdir -p ~/.claude/skills && cp -R ietf ~/.claude/skills/` |
| **OpenAI Codex** | `mkdir -p ~/.agents/skills && cp -R ietf ~/.agents/skills/` |
| **Gemini CLI** | `mkdir -p ~/.gemini/skills && cp -R ietf ~/.gemini/skills/` |
| **GitHub Copilot / VS Code** | `mkdir -p ~/.copilot/skills && cp -R ietf ~/.copilot/skills/` |
| **Cursor** | `mkdir -p ~/.cursor/skills && cp -R ietf ~/.cursor/skills/` |

`~/.agents/skills/` is a vendor-neutral location that several tools (Codex,
Copilot/VS Code) also read from, so a single copy there can cover more than one.

### Per-project instead of global

Every tool above also supports project-scoped skills: put the `ietf` directory
under the project's folder instead of your home directory — `.claude/skills/`,
`.agents/skills/`, `.gemini/skills/`, `.github/skills/`, or `.cursor/skills/`
respectively. Use this when you want the guidance active only inside a specific
repository.

### Updating

```sh
cd ietf-skill
git pull
```

Then re-run the copy command for your tool to overwrite the installed copy.

## How it activates

You don't invoke this manually. Your assistant reads the skill's short
description at startup and loads the full guidance on its own when your task
matches — for the `contributing` capability, that's whenever you ask it to help
draft a mailing-list message, a GitHub comment, a review, or any other
contribution that will go out under your name.

## Status

This guidance describes IETF community norms as understood by its author. It is
not a normative IETF document and carries no official standing.
