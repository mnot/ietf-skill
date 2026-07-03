# IETF Agent Skill

An [Agent Skill](https://agentskills.io/) that teaches an AI assistant the norms
of participating in [IETF](https://www.ietf.org/) and IRTF work. It is written to
the open `SKILL.md` format, so it works in any tool that has adopted it — Claude
Code, OpenAI Codex, Gemini CLI, GitHub Copilot / VS Code, Cursor, and others —
not just one vendor.

The skill is plain Markdown: guidance the assistant reads, with no scripts or
other executable parts. Installing it copies text files into a folder your
assistant reads from, and the assistant loads a given capability only when your
task calls for it.

## Capabilities

The skill is `ietf`, organised by capability so it can grow without disturbing
what already works:

```
ietf/
├── SKILL.md                     # entry point: what the skill is, and its capabilities
└── references/
    ├── contributing.md          # drafting contributions to the record
    └── interpreting.md          # reading the record and reporting where a group stands
```

- **contributing** — norms for drafting text that will go into the record under a
  participant's name (mailing-list mail, thread replies, GitHub issues/comments,
  reviews). Accountability, disclosing AI involvement, the terse technical
  register, grounding claims, staying on charter, not manufacturing consensus
  signal.
- **interpreting** — norms for reading the record and characterising where a
  group stands: consensus is chair-declared, decisions are confirmed on-list,
  positions belong to individuals, and what draft names and RFC streams do and
  don't imply.

Your assistant loads the matching capability file on its own when the task calls
for it. Further capabilities can be added as separate files under `references/`.

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
description at startup and loads the relevant capability on its own when your
task matches — the `contributing` guidance when you ask it to help draft a
message, comment, or review that will go out under your name; the `interpreting`
guidance when you ask what a group decided or whether there is consensus.

## License

Released under [CC BY 4.0](LICENSE) — share or adapt freely, with attribution.

This describes IETF community norms as understood by its author. It is not a
normative IETF document and carries no official standing.
