# IETF Agent Skills

Norms for participating in [IETF](https://www.ietf.org/) and IRTF work, packaged
as [Agent Skills](https://agentskills.io/).

| Skill | What it does |
| --- | --- |
| [`ietf-contributing`](ietf-contributing/SKILL.md) | Drafting text that goes into the record under your name — list mail, replies, GitHub issues/comments, reviews. |
| [`ietf-interpreting`](ietf-interpreting/SKILL.md) | Understanding how the IETF works; e.g., consensus, positions, draft/RFC status. |
| [`ietf-reviewing`](ietf-reviewing/SKILL.md) | Reviewing an Internet-Draft — which question the review answers, what to look for, and why the output is findings rather than a finished review. |
| [`ietf-http`](ietf-http/SKILL.md) | Best practices for writing IETF specifications that use or extend HTTP. |

All are currently only Markdown and plain text, no executables. Two of them also
bundle the text of the RFCs they point at, under a `reference/` directory, so the
assistant can consult them directly instead of recalling them: `ietf-http` carries
the specifications it summarises (BCP 56 / RFC 9205, RFC 9110, RFC 9111, BCP 190 /
RFC 8820), and `ietf-reviewing` carries the guidance its review step applies
(BCP 14 / RFC 2119 and RFC 8174, RFC 2804, RFC 3552, RFC 6709, RFC 6950, RFC 6973,
RFC 7258, RFC 7754, RFC 8890, RFC 9170, RFC 9614). Two of `ietf-reviewing`'s
lenses — BCP 190 / RFC 8820 and BCP 56 / RFC 9205 — have a rubric but no bundled
text, since `ietf-http` already carries both.

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

It sweeps the per-tool dirs (`~/.claude`, `~/.agents`, `~/.gemini`, `~/.cursor`, `~/.copilot`) and installs only where the tool is present.

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
cp -R ietf-contributing ietf-interpreting ietf-reviewing ietf-http ~/.claude/skills/
```

`~/.agents/skills/` is a vendor-neutral location that several tools (Codex, Copilot/VS Code) also read from.

### Claude Desktop

The **Code** tab shares `~/.claude/skills`, so the steps above cover it. For **Chat**/**Cowork** (and claude.ai), upload each skill under **Customize → Skills → + → Upload a skill**. `ietf-contributing` and `ietf-interpreting` are single files, so upload `ietf-contributing/SKILL.md` and `ietf-interpreting/SKILL.md` directly (no zip needed). `ietf-reviewing` and `ietf-http` each carry a `reference/` directory, so zip the whole directory first (`zip -r ietf-reviewing.zip ietf-reviewing`) and upload that.

**Note**: Chat in Claude Desktop does _not_ have subagents; the ietf-review still will run very slowly there.

### Updating

```sh
cd ietf-skill
git pull
```

Then re-run the copy command for your tool to overwrite the installed copies — or, on macOS / Linux, `make update` does both.

## How they activate

You don't invoke these manually. Your assistant reads each skill's short description at startup and loads the full guidance on its own when your task matches — `ietf-contributing` when you ask it to help draft a message, comment, or review that goes out under your name; `ietf-interpreting` when you ask what a group decided or whether there's consensus; `ietf-reviewing` when you ask it to review or assess a draft.

## License

Released under [CC BY 4.0](LICENSE) — share or adapt freely, with attribution.

The RFC texts under `ietf-http/reference/` and `ietf-reviewing/reference/` are
excluded from that; they are Copyright (c) the IETF Trust or the Internet
Society and the persons identified as their authors, and are reproduced in full
under the [IETF Trust's legal
provisions](https://trustee.ietf.org/license-info). They are the published
`.txt` renderings from the RFC Editor, unchanged apart from stripping a
byte-order mark, leading blank lines, and trailing whitespace.

This describes IETF community norms as understood by its author. It is not a
normative IETF document and carries no official standing.
