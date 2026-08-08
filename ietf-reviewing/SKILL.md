---
name: ietf-reviewing
description: How to review an Internet-Draft. Use when asked to review, critique, or assess a draft or specification -- a directorate or IETF Last Call review, a WGLC response, a dispatch or call-for-adoption assessment, or an informal "what do you make of this draft".
license: CC-BY-4.0
---

# Reviewing an Internet-Draft

**You draft; the human sends.** A review goes into the record under a person's name and
they are accountable for every word of it. See `ietf-contributing`.

So the default output of these steps is **findings**, not a finished review: the concerns,
what each rests on, and what would resolve it. The reviewer decides what to raise and what
it adds up to. Writing the review itself is a separate step, below the rule at the end, and
it comes after those decisions rather than before them.

## 1. Establish the review question and form

A review answers the question in front of the audience:

| Stage | The question |
|---|---|
| Individual submission, no venue | Is there a problem here, and is it ours? |
| Dispatch / BoF proposal | Should the IETF take this on, and if so where? |
| Call for adoption | Should this WG adopt *this document* as its starting point? |
| WG document, in progress | Is the design right, and what has to change? |
| WGLC | Does this document have a coherent and complete design that addresses the stated need? |
| IETF Last Call / directorate | Is there a blocking problem? |

The table is about the document's stage. The review type is a separate axis: an early directorate review asks "what has to change" whatever the stage, and the stage decides how much weight the answer carries.

**These steps produce findings, not review text** -- see Step 10, and the separate section at the
end for turning findings into a review once the reviewer has chosen what to raise.

Most review types have a conventional form, which matters at that step rather than this one. Get it
from a recent similar review -- if reviewing for a directorate, use one by the team you are writing
for. The steps below are what goes in that form, not the form itself.

For directorate reviews, see the wiki page of the review directorate for review guidelines, requirements, resources, and possibly a form. Directorates are listed at <https://datatracker.ietf.org/review/> and their wiki pages are (usually) listed in their datatracker 'about' page.

Directorate reviews are usually made at the IETF Last Call stage. An *early* directorate review is different: they are requested for in-progress WG documents, and focus on whether any blocking problems are anticipated.

Write the question down before reading. Your provisional view, in Step 9, is the answer to it. If the
review request carried a note from the AD or chair, read it first -- it usually says what they
actually want looked at.

## 2. Read the draft cold

Read the entire draft without consulting anything else. Keep your own list of concerns; it is the
control against which everything later gets filtered.

**Quote before you claim.** Every concern should contain its basis in the document's own words.
Never build an objection on your paraphrase -- that is where fabricated findings come from. For an
absence, quote what stands in its place and show the search you ran.

**Never rule a concern out on a source you could not read.** If a document you would need to
confirm or refute a point is unavailable -- an RFC body, a registration template, a referenced
specification -- raise the point with the uncertainty stated. Say "I could not verify X" and make
the concern anyway. Better still, get the text and cite by section.

## 3. Verify the draft's fit to the venue

If this is a proposal to or an adopted draft of an active Working Group, that group's charter is a primary artefact and the draft should be evaluated within it. If the draft is out of defined scope of the charter, point out why and stop here. 

The only exception here is a proposal to a DISPATCH group, which exists to figure out where the proposal should go.

## 4. Enumerate the actors

For any draft describing a system, list *every* party the architecture names, and for each: what do
they control, what can they not refuse, what state they have, what protocol affordances are
available to them, and what happens when **they** are the adversary?

Then rank by **mismatch between a party's stated role and their actual power**.

Then check the draft's own adversary classes against your table: which parties are absent
from theirs, and is each absence defensible? Ask without deciding the answer in advance.
The gap may be a layer confusion, a party the authors assume benign, or nothing at all.

## 5. Architectural review

Does existing IETF architectural guidance or policy bear on any aspect of the draft? Each lens
below carries a trigger -- a property of the document you can check against your Step 2 read. Work
down the list and open the text of every lens whose trigger fires.

| Lens | Document | Applies when | Text |
| --- | --- | --- | --- |
| Endpoint assumptions | RFC 3552 | Always -- the draft has, or should have, Security Considerations | `reference/rfc3552.txt` |
| Privacy considerations | RFC 6973 | The draft handles data about identifiable people, or emits per-user events someone else can observe | `reference/rfc6973.txt` |
| Pervasive monitoring | RFC 7258 | The design creates or widens a vantage point from which many users' activity can be seen | `reference/rfc7258.txt` |
| Partitioning for privacy | RFC 9614 | One party learns more than it needs to do its job | `reference/rfc9614.txt` |
| End users | RFC 8890 | The parties who bear the consequences are not the parties the protocol serves | `reference/rfc8890.txt` |
| Filtering and blocking | RFC 7754 | Something in the design decides whether a communication proceeds | `reference/rfc7754.txt` |
| Wiretapping | RFC 2804 | The design lets a party other than the endpoints obtain content or metadata, or makes an endpoint report on its user | `reference/rfc2804.txt` |
| Protocol extensions | RFC 6709 | The draft defines a version, a reserved field, an extension point, a registry, or a rule for unknown elements | `reference/rfc6709.txt` |
| Extension viability | RFC 9170 | As above, and nothing in the document exercises the extension point it defines | `reference/rfc9170.txt` |
| Application features in the DNS | RFC 6950 | The draft puts data into, or takes it out of, the DNS | `reference/rfc6950.txt` |
| Building protocols with HTTP | RFC 9205 | The draft uses HTTP | ../ietf-http/reference/rfc9205.txt |
| URI design and ownership | RFC 8820 | The draft specifies URL structure -- a fixed hostname label, a path prefix, or query syntax | ../ietf-http/reference/rfc8820.txt |

The full text of each is bundled with this skill, in `reference/` -- except RFC 9205 and RFC 8820,
which `ietf-http` carries along with the other HTTP specifications. RFC 9205 defers the whole
URL-structure question to RFC 8820, so a draft that trips the last row usually needs both.

**Open the text; do not judge a lens from its title.** Finding that one does not apply is a result
worth having and takes minutes. Where you are unsure whether a trigger fires, open it.

The last five lenses are structural: their triggers are facts you can find by searching the draft,
so when the search plainly comes back empty -- no HTTP, no DNS, no extension point -- skip the lens
and say you did. Anything short of plainly empty, open it: a trigger that half fires is not a
trigger that failed. The other seven are about harms, and whether one applies is a judgement you
cannot make from a title -- open all of them.

**Never cite a lens you did not read.** A citation from memory looks as authoritative as a checked
one, and nothing in the finished review shows the difference -- which is what makes it worth
guarding against. This is Step 2's *quote before you claim*, applied to the reference texts.

They are long, so navigate rather than read end to end. Each has a table of contents near the top,
and a section heading starts a line with its number, so grepping for `^3\.1\.` finds where to read
from -- match the number only, since the spacing after it varies between renderings. All but
RFC 8890, RFC 9170 and RFC 9614 are the older paginated renderings, so expect form feeds and running
headers mid-section.

## 6. Institutional questions

These are the least likely to surface from reading alone, and are determinative for adoption and
early-stage decisions. Ask each of:

- Is the IETF the right venue for this work? In particular, is the necessary locus of expertise
  here?
- Does something this depends on live in another SDO, and if so, what is the status?
- Does this depend on policy defined elsewhere? Can the technical work be evaluated without seeing
  that policy?
- Is the mechanism narrower than its framing? If chartered under framing X, would the artefact
  serve purposes X disclaims?
- What is the incremental deployment story, and what does the first implementer get?

## 7. Ask what you cannot answer

A reviewer's contribution includes the questions they do not know the answer to: what scale is
expected, who is going to operate this, what happens when the deployment is larger than the authors
imagined.

Do not talk yourself out of asking them. You can usually build a case that the concern is fine --
the rate is low, the case is rare, the deployment is bounded -- and building it feels like
diligence. It isn't, when the document has not established the answer itself. If the draft never
says what scale it expects, and you find yourself working out that the scale is probably
acceptable, stop: the finding is that the draft never says. Ask.

## 8. Probe the draft context

Your list of concerns from the cold read is now closed. Form a provisional view of the document too
-- not the final disposition, but enough that you will notice if reading someone else's review
changes it.

Enumerate everything related to the draft -- if it was presented at a meeting there are likely
slides and a transcript. Gather e-mail list traffic about the draft, check for a repo, and obtain
the author's introductory mail, prior revisions, related drafts by the same authors, and any
competing drafts. Record what you could not obtain: a gap is a limit on your review, not an absence
in the work.

If you are working from a gathered corpus rather than live sources, check when it was gathered
against the document's current state, and re-gather if the document has moved.

This should be done in an isolated context (e.g., subagent) if possible, so that your context is
not polluted by other materials. Have the isolated context answer your specific questions about the concerns you already hold, rather than return a summary of everything it found -- a digest pollutes your context as effectively as reading the material yourself. This matters most for list traffic and prior reviews; the charter, the slides and the author's own mail are primary sources and are meant to be read. Read those yourself: a diff of prior revisions, or a slide the draft does not reflect, will hand you a concern you did not know to ask for.

Then, for each concern identified:

- If it has already been raised elsewhere, note that.
- If the author has answered it, evaluate the answer rather than restating the concern.
- If the author has modified their position *and* expressed an intent to update the draft,
  update the concern to reflect the disposition of that intent.

New concerns may come from the charter, the slides, the transcript, prior revisions, a competing
draft, or the authors' own statements -- their claims about applicability and their clarifications
especially, since those often say something the draft does not.

A prior review of this draft is not a source of new concerns. It is the one thing you gather here
that is the same artefact you are producing, so it anchors hardest, and on the disposition most of
all. Use it to learn whether a concern of yours is already on the record and what the authors said
back. A concern you did not find yourself does not become yours by reading it: if another
reviewer's point is right and unaddressed, support it by attribution — "I agree with X's point
about Y" — rather than restating it as your own. If a prior review moves your disposition, say what
moved it.

Then, if this is an adoption or DISPATCH review, consider who has said they will implement and
deploy. Are the parties who would *have* to implement it among them? Characterise the level of
support, and if it is not sufficient, add that concern.

## 9. Rank the concerns, and form a provisional view

**Settle what you think of the document before deciding how many concerns to surface.** A process
built to locate problems will locate enough to justify severity, whether or not the document
deserves it.

**The bar is set by intended status and stage, not only by contents.** An Experimental
document with a stated experiment and a plan to revise on results is held to a different
standard than a Proposed Standard, and saying so is part of the verdict. Ask what the
document is *for* before asking what is wrong with it.

**A document can be fine.** A review can legitimately be three lines: "you checked the thing you
were asked to check, it holds up, here are two requests for clarification". If that is the honest
answer, give it and stop. Under-reviewing a bad document and over-reviewing a good one are the same
failure, and the second goes unnoticed.

Then rank each concern into **Issues**, **Comments** or **Nits** -- the three headings most IETF
reviews use. They have different economies, so do not apply one's test to another.

**Issues.** The test: *would this remain regardless of editorial work?* The test is about the
question, not the sentence. An ambiguity that leaves two implementers building different things is
an issue even though a sentence fixes it, because the authors have to decide something first. A
concern where the decision is already made and only the wording is missing is not.

Rank on the test alone; there is no target number. The findings are a superset the reviewer picks
from.

Concerns with the same root cause are one issue. If two would be fixed by the same decision, merge
them.

Severity and the survivability test are independent. Survivability decides the category -- does the
author have to decide something? Severity says how much rides on the decision.

**Comments.** The survivability test does **not** apply -- being trivially fixable is what they are
for. Keep every concrete, checkable, quotable one.

Keep each comment to a line or two: if one needs a paragraph of setup, it is an issue in disguise or
you are not ready to say it yet. And never fold or delete an issue to make room for a comment.

**Nits.** Typos, stale references, wrong section numbers -- anything an editor fixes without asking
anyone a question.

Form: quoted text, then one short question or one flat statement. No numbering, no interleaved
thanks. Prefer the question -- asking whether you have read it correctly is both more accurate and
harder to dismiss than asserting a defect.

## 10. Assemble the findings

This is the output. It is not a review: it is what a reviewer needs in order to decide what to
raise, and to defend it once raised.

Lists, not tables -- this gets read in a text editor as often as anywhere that renders markdown.
Headings in this order; levels shift with context. Drop the qualifiers when the review is written,
and then only for what the reviewer chose.

```
## Provisional view
## Candidate Issues

_one-line index, then a subsection each_

### I1. <short title>
  
## Potential Comments
## Observed Nits
## Prior concerns
## Checked, not raised
## Could not obtain
```

**Provisional view** -- what you would call it and why, answering the Step 1 question. Mark it as
yours. On a directorate review, name the datatracker `Result` you would pick.

**Candidate Issues** opens with a one-line index to triage from:

- **I1** (§3.1) Mandates a fixed hostname label in the URI authority -- quoted text + BCP 190 §2.2.
- **I2** (§5) No trust model: what a client may conclude is never stated -- quoted absence + RFC 3552 §5.

Then a subsection per issue, as labelled fields rather than paragraphs:

- **Concern:** one sentence.
- **Textual basis:** the quotes it rests on, with section numbers -- no commentary.
- **Argument:** the case, including any RFC section you rely on and what it says there. Engage the
  strongest thing the authors would say back -- a pre-emption already in the draft is not an answer.
  Keep it to what a reader needs in order to check the claim.
- **Severity:** how significant the issue is / how strong its impact is; scale of one to five ⭐️
- **Confidence:** how confident you are in the issue; scale of one to five ⭐️
- **Grounding:** the stated reason behind the confidence score: established by the quoted text
  alone; an inference you are confident in; or stated with declared uncertainty because you could
  not read a source. Say which, and name the source in the last case.
- **Can be resolved if:** what would fix it, and what would change your mind.

**Potential Comments**, one bullet each: the section, the quoted text, then one question or one flat
statement. If one needs more than that, it is an issue in disguise.

**Observed Nits**, one line each.

**Prior concerns**, one bullet each: what was raised, by whom, and what this revision did with it --
addressed, partly, unaddressed, or answered on the list without a text change.

**Checked, not raised**, one bullet each: what, and why not -- a lens that did not apply, a lens
that supports the design, a concern the draft's own text refuses, an objection that is about the
topic. Only what a reader might expect to see raised; not a log of everything you thought about.

**Could not obtain** -- what, and what it means the analysis cannot say.

The economy test: *would removing this change what the reviewer decides to raise, or how they would
defend it?*

---

# Writing the review

**Optional, and second.** Do this only when the reviewer asks for the finished text, only after
they have chosen what to raise, and only on what they chose. Everything below is about
composition; nothing in it should reach back and change a finding.

Read `ietf-contributing` first. It governs register, disclosure, and what the sender has to be able
to defend.

Get the conventional form from a recent real review of the type you are writing -- for a
directorate, one by that team; for a Last Call comment, one from the last-call list. The headings
below are the directorate convention and will not always fit.

The review is a selection from the findings, not a rendering of them: it usually carries fewer
issues than the findings hold. Cut on relevance to the audience and the stage, not to a number.
Plain headings -- `Issues`, `Comments`, `Nits` -- carrying only what was chosen.

## Open with the verdict

Open with the disposition, in one or two sentences, answering the Step 1 question. Then
the concerns.

Do not open with methodology or a summary of the draft. A line of genuine thanks before the verdict
is often conventional in directorate reviews; what to avoid is praise standing in for a verdict, or
warmth calibrated to soften one.

State the concession after the verdict, not instead of it. *This should not be picked up in its
current state, though something of roughly this shape might be* is a verdict. *Here are some
concerns* is not.

**A favourable verdict is valid.** *This is fine, and here are two things worth clarifying* carries
the same obligation to say why -- usually by naming what the document is for. Do not bury approval
under the findings, do not phrase it as the absence of objections, and do not let a run of
clarifications imply a severity the disposition does not support.

On a directorate review the disposition also goes in the datatracker `Result` field, and that is
one of: `Ready`, `Ready with Nits`, `Ready with Issues`, `Almost Ready`, `On the Right Track`, `Not
Ready`. Pick the result the document earns; the prose verdict should say the same thing the field
does.

**Do not copy all finding contents** -- keep what's relevant to the review type being created. In particular *severity* and *confidence* are intended for the reviewer, not the review.

**Decline whole categories out loud** rather than skipping silently: "I'll skip editorial issues
given the state of the text."

**A declared scope is permeable.** Reviewers announce a lane and then say the important thing
anyway, flagging it -- "this is for the security directorate, but". If a finding matters and sits
just outside the scope you declared, say it and mark it out of lane. 

## Cut what does not earn its place

A reviewer who thinks a document is fine says so briefly and stops; long reviews are usually the
salvageable middle, where the input will change something; and the harshest verdicts are often
short, because there's no point in enumerating small nits when fundamental issues loom. Use that as
a sanity check on where your draft review sits, not as a budget.

The test is per-sentence: *would removing this change what the recipient does?* If not, cut it.
Over-length comes from padding the argument -- restating the draft, hedging, explaining findings
that speak for themselves -- not from having found a lot of things.

Delete prose. Do not delete defects. A finding the reviewer chose to raise stays in, even if the
prose around it goes.

## Final pass

Double check the review for each of these:

- Is each claim about the **document** or about the **topic**? Cut comments on the topic.
- Does the quoted text actually support the claim made about it?
- Does anything read as position-taking without reference to what the document says? Cut it.
- Have you answered the Step 1 question, in the first two sentences, unambiguously?


