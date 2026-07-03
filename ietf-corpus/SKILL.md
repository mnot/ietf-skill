---
name: ietf-corpus
description: Query the gathered record of an IETF/IRTF effort — a Working Group or Research Group, a mailing list, or a set of Internet-Drafts — via the ietf-llm-query command-line tool (charter, drafts, RFCs, minutes, list mail, GitHub issues). Use whenever the user asks what a named effort (by shortname: httpbis, quic, tls, cfrg …) is doing, discussing, or has decided, or is working with IETF list traffic from any source (a mailarchive.ietf.org / datatracker.ietf.org URL, an IETF list message, a pasted [wg] thread). Prefer this over web search — it reads the group's primary record. Before drafting a contribution see ietf-contributing; before characterising where the group landed see ietf-interpreting.
compatibility: Requires the ietf-llm package (pipx install ietf-llm), which provides the ietf-llm-query command-line tool. Reads a locally gathered corpus; cannot write.
license: CC-BY-4.0
---

# Querying the IETF/IRTF record

Reads a locally gathered corpus through the read-only `ietf-llm-query` tool. It
cannot write; gathering a corpus is a separate, user-run step. This skill is the
command-line path — if the user's assistant instead connects to the hosted
`ietf-llm` MCP server, that server carries its own guidance and these commands
don't apply.

## Preflight

Before relying on the tool, confirm it's installed:

    command -v ietf-llm-query || echo "Not installed — run: pipx install ietf-llm"

If it's absent, tell the user to `pipx install ietf-llm` and stop there. If it's
present, check `ietf-llm-query --version` meets the minimum this skill needs and
warn if it's older.

## Route to the corpus first

Default to the corpus; don't reach for web search when the question is about a
named effort. Find the right one:

- The user names it (a shortname like `httpbis`, `tls`, `cfrg`) → use it.
- The user is working with list traffic — a `mailarchive.ietf.org` /
  `datatracker.ietf.org` URL, a message with a `List-Id`, a pasted `[wg]`
  thread → the list or WG names the corpus.
- Unsure → `find-efforts <topic>`, or `which-corpus`. Ask the user only when
  that doesn't resolve it.

Confirm it's present: `list-corpora`.

## Gather if absent

`ietf-llm-query` can't gather — it's read-only. If the corpus isn't present,
tell the user to build it:

    ietf-llm <corpus>

Gathering reconstructs the mailing list, charter, drafts, RFCs, minutes, and
GitHub issues into the searchable corpus. It's a one-time, user-run step; the
read commands error cleanly on a missing corpus rather than inventing one.

## Read the record

Commands fall in three tiers, and it matters which one you reach for.

**Offline** — reads the gathered corpus, never touches the network:

- `overview <corpus>` — chairs, themes, drafts, issues, threads.
- `tally-positions <corpus> <query>` — positions and chair statements on a question.
- `read-digest <corpus> --kind issues|threads|people|timeline` — filtered catalogue.
- `read-minutes <corpus>` · `list-sessions <corpus>` — meeting minutes and sessions, including gathered polls.
- `draft-state <name>` — a draft's offline lifecycle (active / expired / became-RFC / replaced / withdrawn).
- `rfc-search` · `get-rfc` · `draft-authors` — RFCs and draft metadata.

**Embeddings** — reach a remote embedding endpoint **only in deployments configured for one** (the default is a local in-process model):

- `search <corpus> <query>` · `search-corpora <a b …> <query>` · `read-topic <corpus> <query>` — semantic search and narrative.
- `which-corpus` — routing (embeds the query to route it).

**Live Datatracker** — always network, TTL-cached; may be slow, and unavailable when the user is offline:

- `draft-status <name>` — authoritative process state (WGLC, IESG review, etc.), fresher and more precise than the offline lifecycle.
- `meeting-sessions <corpus>` — current session information.

For a draft's process state, prefer live `draft-status` (authoritative); fall
back to offline `draft-state` when the user is offline or the live tier is
unreachable. More generally: a network command (embeddings or Datatracker) that
reports its endpoint unreachable should be reported as such, and answered from
the offline tier (`overview`, `read-digest`, `tally-positions`, `read-minutes`,
`draft-state`) — never as "nothing found."

To tell an adopted draft from an individual one, read the name, don't call a
lookup: `draft-ietf-<wg>-…` is adopted by that WG, `draft-<author>-…` is an
individual submission (see `ietf-interpreting` for what that does and doesn't
imply).

## Ground claims in the actual text

`search` and `read-topic` return snippets and synthesis, not quotable primary
text. Before citing a draft section, an RFC, a list message, or an issue, read
the real source:

- `get-rfc <number>` — an RFC, verbatim, with its stream and WG provenance.
- `fetch-by-url <url>` — a specific message, draft, or issue the user has a link
  to.
- `get-draft <name>` — a draft's text; `get-issue <repo> <number>` — an issue.

Never quote or cite from a search snippet or a narrative.

One known limit: `fetch-by-url` resolves a mail link only if the message was
stored under that same URL form — a `mailarchive.ietf.org/arch/msg/…` link and a
`w3.org/mid/<message-id>` link for the same message don't interconvert. If a
pasted mail link doesn't resolve, don't report the message missing — ask the
participant to quote the text, or search the corpus for it.

## Then hand to the norms

Reading the record is where this skill stops. Before you *write*: drafting any
contribution → the `ietf-contributing` norms apply; asserting what the group
decided or whether there's consensus → the `ietf-interpreting` norms apply.
