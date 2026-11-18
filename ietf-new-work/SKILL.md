---
name: ietf-new-work
description: Process advice for bringing new work to the IETF. Use when someone asks whether the IETF is the right place for an idea, whether to write an Internet-Draft, which working group or other venue to take it to, how to get meeting time, whether to go to DISPATCH, request a BOF, seek AD sponsorship or ask a WG to adopt a draft, or how to build support first. Not for drafting list mail (use ietf-contributing), reviewing a draft (use ietf-reviewing), or writing the draft itself.
compatibility: Works best with the ietf-llm MCP server for group charters, mailing lists, drafts and meeting dates; without it, fetch the Datatracker pages named in each step.
license: CC-BY-4.0
---

# Bringing new work to the IETF

You advise; the human decides, and does the work. The output is a recommended path, not a plan you carry out. Hand any text that goes into the record under their name to `ietf-contributing`.

The default recommendation is a short message to a mailing list describing the problem. A draft, meeting time and a call for adoption each come later, each gated on what the list says.

Process pages and group charters change. Fetch what a step points at before asserting what it says:

- <https://www.ietf.org/process/new-work/>
- <https://www.ietf.org/process/wgs/>
- <https://www.ietf.org/process/bofs/>
- RFC 7957 (DISPATCH-style groups) and RFC 5434 (BOFs)
- The target group's own contribution guide. [`httpwg.org/CONTRIBUTING.html`](https://httpwg.org/CONTRIBUTING.html) is an example; look in the group's repository and wiki for others.

## 1. Get the facts from the human

Ask only for what you cannot find yourself:

- The problem, in a sentence or two, stated without the solution. Without one, stop here.
- Who would implement and deploy a solution, and whether any of them have said so.
- What exists today: RFCs, drafts, non-IETF specifications.
- Whether a draft or protocol design already exists, and who wrote it, including any AI involvement.
- Any target meeting.

## 2. Check that the IETF is the right place

Each answer is a check on the idea; any "no" changes the recommendation:

- Would more than one party use it?
- Do others want an interoperable solution, and will they compromise to get one?
- Is it an Internet protocol or operational practice? Transmission hardware belongs with IEEE and ITU. Application-layer work is not out of scope for being specialised; where another SDO such as the W3C already owns the subject, say so and let the human weigh it.
- Is the problem articulated independently of the solution?
- Is it engineering rather than research?

Then:

- Suitable, not yet ready: continue.
- Ready, but used by a single party or otherwise not suited to standardisation: the Independent Submissions Stream (<https://www.rfc-editor.org/authors/rfc-independent-submissions/>).
- Research: the IRTF.

## 3. Look for existing work

Find the groups, then search each one's record; a charter match says where the work lives, not what exists.

1. Run `find_efforts` on the topic and `search_groups` on the problem, with more than one phrasing.
2. Add the long-running groups that own the protocols the idea touches or would extend, whether or not a charter search ranks them. A header field means `httpbis` and `httpapi`; a TLS extension means `tls`; transport means `quic`. Their charters rarely mention the topic, but their lists and drafts decide how it fits.
3. Add the DISPATCH group for the area (`dispatch`, or the area's equivalent).
4. Add BoFs and proposed groups, which `find_efforts` flags as pre-WG, and the non-WG mailing lists that turn up in results or in `list_corpora`. New work often has no chartered home yet, and its drafts surface there first.
5. Gather every group from steps 1 to 4 that is not yet cached (`start_gather`), and refresh any flagged stale.
6. Search all of them with `search_corpora` for drafts, list threads and issues, and run `list_drafts` on the closest groups. Vary the terms: the problem as the human states it, the problem as a charter would, and any solution names that turn up.
7. Search the Datatracker for individual drafts outside any of those groups.

Without the MCP server, use the Datatracker WG list and draft search, and each group's mail archive. Look for:

- An existing feature or RFC that already solves it. Report this first.
- Drafts covering the same ground. Recommend joining over competing, unless the human can say what the existing draft cannot do.
- A WG whose charter covers it (`get_group_info`), or a BoF or proposed charter heading that way.
- A previous dispatch, BOF or rejection. DISPATCH does not hear the same draft twice without substantial revision and compelling new reasons.

## 4. Send the problem to a list

Recommend this whenever the problem has not yet been agreed on a list, which covers most first approaches. Do not recommend a solution, a draft or meeting time at this stage.

Tell the human the message:

- Describes the use case and the requirements: who is affected, how it is deployed, what a solution must do and may not do.
- Says what they already tried and where it falls short.
- Asks two questions: what existing solutions fit, and where new work would best be discussed.
- Proposes no protocol, and attaches no draft.

Pick the list:

- The list of the WG whose charter covers the problem.
- Otherwise the DISPATCH list for the area (step 6), which exists for discussion before any draft does.

Tell the human why:

- A draft invites review of its design decisions. Protocol design has many failure points unrelated to the problem being solved, and the group's attention goes to those instead of the problem.
- The group often knows an existing solution, or a better home, and can say so in one reply.
- The problem is the part the human knows best. The solution is where the group's expertise matters.

If the human arrives with a design or a draft, say the list should hear the problem first. Do not refine it, extend it, or produce a new one. Offer the problem message, and write that with `ietf-contributing`.

Then tell the human to wait for replies. They can take days or weeks; the human should not chase them.

## 5. Decide whether a draft is warranted

Only after the list has answered. Recommend a draft when all of these hold:

- Respondents agree that a new solution is needed, or a chair or AD has asked for a draft.
- Respondents have said what shape a solution should take, and the draft follows it. If they have not, the human asks them before designing anything.
- The human can explain and defend each design decision in their own words. A draft they cannot defend wastes the group's time at the first reply.
- If AI helped, the human has stated how, per `ietf-contributing`, and has not asked it to design the protocol from a problem statement.

Where the list has already agreed the problem, the first two conditions are met and a draft can follow directly.

The alternatives, for everyone else:

- Comment on someone else's draft: file an issue or send list mail.
- A short explanation: a list post. Move to a draft when it outgrows a long message.

Before the human submits any draft, tell them:

- Submission grants the IETF rights to work on the idea, and the grant cannot be revoked.
- A patent can be held, but must be disclosed.
- The Note Well applies. See <https://www.ietf.org/process/ipr/>.

Writing the draft is out of scope here. <https://authors.ietf.org> covers format and tooling; `ietf-http` covers drafts that use or extend HTTP.

## 6. Earn group attention

Agenda time, a HotRFC slot, a DISPATCH presentation, a BOF and a call for adoption each spend the group's attention. Recommend none until the list shows interest, which means:

- People other than the human have engaged with the substance on the list.
- Named people say they would review, implement or deploy.
- The work has been discussed on the list; the HTTP WG will not consider it for the agenda otherwise.

Do not advise the human to ask for adoption. The chairs issue the call, generally after extensive review and discussion.

Then recommend the first venue that matches. The routes are not exclusive, so name a fallback.

- **An existing WG's charter covers the work.** Take it to that WG. See "Existing WG".
- **An existing WG is close but its charter does not cover the work.** Raise it on the WG list with the chairs; the WG may agree to re-charter.
- **No obvious WG, or unsure.** Use DISPATCH or the area's equivalent. See "DISPATCH".
- **A new WG is needed, with a clear community and a clear path to deliverables.** Request a BOF. See "BOF".
- **Small and self-contained.** AD sponsorship; DISPATCH can recommend it, and an AD may or may not take it on.

Short of any of these, when a community is forming and has nowhere to talk:

- A non-WG mailing list, requested from the IETF.
- A side meeting at an IETF meeting. RFC 6771 gives advice.
- A HotRFC slot: four minutes at the opening of an IETF meeting, requested on the meeting announcement list in the weeks before.

### Existing WG

Read the charter, the Datatracker page, the list archive and the group's own contribution guide first. The sequence on most lists:

1. Describe the use case on the list. Check for an existing feature.
2. Post a draft where the use case justifies one.
3. The chairs issue a call for adoption. Participants say whether they support adoption and whether they would implement.
4. On a consensus to adopt, the chairs appoint editors. The proposer may not be one; the chairs discuss the choice with them first.

Meetings:

- Adopted drafts take priority; new proposals get what time remains.
- The draft must be posted before the cutoff for the meeting. Fetch the dates with `meeting_schedule`.
- Decisions made in the room are confirmed on the list.

A chair's decision the human disputes goes to the responsible AD once the WG cannot resolve it.

### DISPATCH

DISPATCH sorts new work; it does not take it on. Fetch the current charter with `get_group_info`.

- `dispatch` covers ART, SEC and the non-transport parts of WIT. It does not hear new work within an existing transport WG's scope.
- `gendispatch` covers GEN, including process changes, and no technical standardisation.
- Other areas run their own; the DISPATCH chairs list them on the DISPATCH wiki.
- Its list takes proposals before a draft exists. Presentation time goes first to proposals with active drafts and list discussion; the chairs set requirements and may refuse a request.

The outcomes the charter lists, none binding:

- Direct the work to an existing WG.
- Advise a BOF.
- Advise a new WG charter.
- Recommend AD sponsorship.
- Create a mailing list.
- Defer or reject. The reasons given: the expertise is not in the IETF, the subject belongs to another SDO, too few people will do the work, or nobody wants an interoperable solution.

### BOF

A BOF is not required to form a WG; an AD can charter a well-organised proposal without one. Request one when a charter with milestones is close to writable and a critical mass of people will do the work. RFC 5434 asks for, before the request:

- Confirmation that no existing WG fits.
- Early conversations with the ADs of the relevant area, together and with disclosure of who else is being asked. No AD shopping.
- Drafts describing the problem.
- Public list discussion, opened with a call for participation, aimed at agreeing the problem statement.
- Input from operators and deployers.
- A proposed charter, and the BOF questions, floated in advance.

Timing: RFC 5434 says to start three to four months before the meeting. The formal request goes through the Datatracker, by the BOF deadline in its important dates; contact an AD, or `iesg@ietf.org`, first. A topic generally gets two BOFs, and the second must show every earlier issue resolved.

## 7. Tell the human what they are signing up for

Before they submit a draft or ask for group time, state each and have them say whether they accept it:

- Change control passes to the IETF on adoption. The specification may be published with changes they disagree with.
- Adoption is a starting point. Nothing is fixed, and a convincing argument can win changes.
- It is the wrong route for approval without revision.
- Taking an idea from draft to RFC takes listening, compromise, collaboration and clear writing, over a long time.

If they do not accept them, say the IETF is the wrong venue and suggest the Independent Submissions Stream or another SDO.

## 8. Report

Give the human:

1. The recommended path: one venue, one next action. Usually that action is the problem message in step 4.
2. The alternatives you considered and why each lost.
3. What you read and what you could not: a charter fetched against a charter recalled.
4. The dated constraints, fetched from the Datatracker: draft cutoff, BOF deadline.
5. The decisions that remain theirs.

Any list post, DISPATCH request or call for adoption that follows goes through `ietf-contributing`.
