---
name: ietf-reviewing
description: How to review an Internet-Draft. Use when asked to review, critique, or assess a draft or specification -- a directorate or IETF Last Call review, a WGLC response, a dispatch or call-for-adoption assessment, or an informal "what do you make of this draft". Produces findings for a human reviewer to consider -- each concern, what it rests on, and what would resolve it -- rather than finished review text; writing the review is a separate, optional step.
compatibility: Requires the ietf-llm MCP server for the gathered IETF record and live Datatracker state. Uses rfcdiff for revision diffs, and the ietf-http skill for two of the architectural lens texts; both degrade gracefully, see the skill body.
license: CC-BY-4.0
---

# Reviewing an Internet-Draft

**You draft; the human sends.** A review goes into the record under a person's name and
they are accountable for every word of it. See `ietf-contributing`.

So the default output of these steps is **findings**, not a finished review: the concerns,
what each rests on, and what would resolve it. The reviewer decides what to raise and what
it adds up to. Writing the review itself is a separate step, below the rule at the end, and
it comes after those decisions rather than before them.

## Without the tooling

- **No `ietf-llm`.** Work from the Datatracker and the list archives. Record the gap in
  *Could not obtain*.
- **No `rfcdiff`.** A single script, no install:
  <https://raw.githubusercontent.com/ietf-tools/rfcdiff/main/rfcdiff>
  Failing that, strip page headers, footers and form feeds before a raw `diff`.

## 1. Establish the review question

A review answers the question in front of the audience:

| Stage | The question |
|---|---|
| Individual draft / Dispatch / BoF proposal | Should the IETF take this on, and if so where? |
| Call for adoption | Should this WG adopt *this document* as its starting point? |
| WG document, in progress | Is the design right, and what has to change? |
| WGLC | Does this document have a coherent and complete design that addresses the stated need? |
| IETF Last Call / directorate | Is there a blocking problem? |
| Approved, RFC Editor queue | Must anything be fixed before publication, and can AUTH48 fix it? |

The table is about the document's stage. The review type is a separate axis: an early directorate
review asks "what has to change" whatever the stage, and the stage decides how much weight the
answer carries.

**These steps produce findings, not review text** -- see Step 10, and the separate section at the
end for turning findings into a review once the reviewer has chosen what to raise. The conventional
form of a review belongs to that step, not this one.

Write the question down before reading. Your provisional view, in Step 9, is the answer to it. If
the review request carried a note from the AD or chair, read it first -- it usually says what they
actually want looked at.

**Establish the live revision and stage before you read anything.** If you are working from a
gathered corpus, compare it against the live state now. If the corpus is behind or missing, start
the gather now. Verify the text you are about to read cold against the authoritative source.

Read what the gather reports when it finishes. A gather can complete with a source missing -- a
throttled repo discovery, a skipped fetch -- and still report success. Re-gather what is missing
before you dispatch anything; a review run without the issue tracker looks exactly like a review run
against a group that does not use one.

Stage-specific instructions/context below.

### Directorate reviews

Directorate reviews are usually made at the IETF Last Call stage. An *early* directorate review is
different: they are requested for in-progress WG documents, and focus on whether any blocking
problems are anticipated.

Most directorates specify guidelines, requirements, and sometimes a review form on their wiki page.
Directorates are listed at <https://datatracker.ietf.org/review/>, and the wiki is usually linked
from the datatracker "about" page. Take the guidelines and requirements here -- they say what that
team wants looked at. The form is for the writing step, if a review gets written at all.

### Revisions of a published document (bis)

Establish what the document obsoletes or updates. Diff against each of those, not only against the
previous revision.

Check the standing-document graph. A BCP or STD usually holds several RFCs; obsoleting some leaves
the rest in place, still referencing what was replaced.

Treat a missing changes section as a finding.

Compare requirement strength keyword by keyword. A MUST restated as a declarative sentence is a
weakening no prose diff shows.

Ask where every deleted requirement went. Where the document says it now lives elsewhere -- a
registry, another RFC -- fetch that and confirm it is there.

### Revisions answering a closed review round

Where the current revision was written to answer a round that has closed -- a WGLC, a directorate
review, an IESG ballot -- do two things before anything else.

Diff it against the revision the round read. New text has been reviewed by nobody, and a document
answering reviews is where new text arrives.

Check what was agreed and did not land. A closed issue or an approved pull request that never merged
is invisible from the document.

### Post-IESG approval

**Past IESG approval, sort findings by route rather than by severity.** "Is there a blocking
problem?" is calibrated to a decision already taken: answer no and the review says nothing, answer
yes and you are asking for a recall, which is a cost borne by people other than you. The three
routes are AUTH48 or an RFC Editor note; pulling the document back; and an erratum or the next
revision. Say which one each finding is for.

## 2. Read the draft cold

Read the entire draft without consulting anything else. Keep each concern found as a record with
four fields, filled when you create it:

- **ID** — C1, C2, … Keep the id if the concern becomes an issue; the mapping is how you show your
  work.
- **Claim** — one sentence about the document.
- **Basis** — the quotes it rests on, with section numbers. For an absence, what stands in its place
  and where you expected the missing thing to be; the search that confirms it belongs to Step 8,
  since the cold read is not consulting anything yet.
- **From** — where it came from: the cold read, the charter, a named lens, a question of your own.

Fill nothing else yet. Severity is calibrated against the whole set, and a resolution written before
you understand the problem is one you will defend out of sunk cost.

This list is the control against which everything later gets filtered, and **From** is what makes
that check possible.

**Quote before you claim.** Never build an objection on your paraphrase -- that is where fabricated
findings come from. A concern whose **Basis** you cannot locate is not yet a concern. Locating it is
what has to be true at creation; transcribing it verbatim can wait for the Step 8 verification
sweep, and stopping mid-read to do it there and then just slows the cold read.

**Never rule a concern out on a source you could not read.** If a document you would need to
confirm or refute a point is unavailable -- an RFC body, a registration template, a referenced
specification -- raise the point with the uncertainty stated. Say "I could not verify X" and make
the concern anyway. Better still, get the text and cite by section.

## 3. Verify the draft's fit to the venue

_Fire this and the Step 4 dispatches together. Abandon them if this step ends the review._

If this is a proposal to or an adopted draft of an active Working Group, that group's charter is a
primary artefact and the draft should be evaluated within it. If the draft is out of defined scope
of the charter, point out why and stop here.

The charter check does not apply to a DISPATCH group, which exists to figure out where the proposal
should go.

### The institutional questions

Ask each of these questions based upon the cold read and the charter, adding concerns as
appropriate.

- Does something this depends on live in another SDO, and if so, what is its status? Who holds
  change control over the semantics?
- Does this depend on policy defined elsewhere? Can the technical work be evaluated without seeing
  that policy?
- Is the mechanism narrower than its framing? If chartered under framing X, would the artefact
  serve purposes X disclaims?
- What is the incremental deployment story, and what does the first implementer get?

On an adoption or DISPATCH review, consider: is the IETF the right venue for this work, and is the
necessary locus of expertise here? Add concerns as appropriate.

## 4. Dispatch tasks

_Do not dispatch A until any gather kicked off in Step 1 has completed. B reads only the draft and
the rubrics -- send it regardless._

Dispatch the items below to subagents -- they are our slowest tasks and independent. While they
run, perform Steps 5-7.

A and B's actor pass go out immediately; both need only the cold read. B's lenses cannot: reading
the twelve rubrics, pre-filtering and resolving their paths is their prerequisite, and that prologue
is what you do while the first two run. The prologue and the actor pass take about the same time, so
do not wait on the table -- dispatch the lenses when the prologue is done. Get them away before you
start Step 5.

Everything meets at Step 8.

### A. Research other views

Use isolated contexts (e.g., subagents), so other people's material doesn't contaminate your
context. Split the work:

- the mailing list, focusing on directorate reviews, draft discussion, author replies, and chair/AD
  statements
- ballots (none before IESG processing), issues, the repo
- meeting minutes and transcripts

Tell each what the others have. Without it they will reach for the same artefacts — the ballot file
reads like list traffic, and a Last Call thread reads like a review.

Give each a sentence on what the draft is **and what stage it is at**, then your concerns as
numbered questions. The stage tells a context which artefacts to look for. Provide them with the
following guidance:

- Only provide answers, not a survey. A digest of content pollutes your context.
- Disposition first (prior reviews, chair and AD statements, author replies, the changelog) since
  that settles whether a concern is live.
- Argument threads are expensive: go into one only when a concern turns on what was said there.
- Quote any statement about who controls, decides, benefits from, or is bound by the mechanism,
  whoever made it. These are seldom in the document.
- Stop when a source is stale, empty or absent, and to say so. An empty source is an answer.

On an adoption or DISPATCH review, add a question: who has said they will implement and deploy?
Whether the parties who would *have* to implement it are among them, and whether that adds up to
sufficient support, is yours to judge -- a shortfall is allowed as a new concern.

### B. Architectural review

What is this system, who are the parties, and does the design match positions the IETF has already
written down? Two passes, and the actors come first: it is the general one, and it is what the
second is checked against.

#### The actors

Dispatch this with A. For any draft describing a system, list *every* party the architecture names
or implies, and for each:

- What do they control?
- What can they not refuse?
- What state do they have?
- What protocol affordances are available to them?
- How are their interests potentially aligned with or against other actors?
- What happens when **they** are the adversary?

Then check the draft's own adversary classes against the table: which parties are absent from
theirs, and is each absence defensible? Ask without deciding the answer in advance. The gap may be
a layer confusion, a party the authors assume benign, or nothing at all.

It returns the table and the absences. On a short draft ask for the absences and one line per party
-- the full questionnaire on a one-field extension runs to thousands of words you will not use. The
ranking is yours -- see Step 6 -- because a mismatch between a party's stated role and their actual
power is the judgement you have to defend, and it is better made with the lens results in view.

Stage the table to a file when it lands. The lenses take it by path, as they take the draft text.

#### The lenses

Does existing IETF architectural guidance or policy bear on any aspect of the draft? There is one
lens per document in `reference/`, each a short rubric beside the text it covers:

`rfc2804.md` wiretapping · `rfc3552.md` endpoint assumptions · `rfc6709.md` protocol extensions ·
`rfc6950.md` application features in the DNS · `rfc6973.md` privacy · `rfc7258.md` pervasive
monitoring · `rfc7754.md` filtering and blocking · `rfc8820.md` URI design and ownership ·
`rfc8890.md` end users · `rfc9170.md` extension viability · `rfc9205.md` building protocols with
HTTP · `rfc9614.md` partitioning for privacy

Read all twelve rubrics yourself first -- about 1,000 lines, in one batched pass rather than a call
per file. Each one's "Does it fire?" section is written to be decidable against the draft text.
Where a rubric leaves you unsure, dispatch: the cost of a wasted lens is small, the cost of a
missed one is not. The one exception: if your reason for being unsure is *another lens probably
carries this better*, rule it out and record which lens. Where a rubric's own "rarely fires"
language pulls against that, the rubric wins.

Hand each lens the path to the actor table alongside the draft text, if it has landed by then. Only
`rfc8890.md` needs it -- its fire test depends on the table outright -- so hold that one back and
dispatch the rest without waiting. If the table lands while you are still reading the rubrics, which
is the usual case, send `rfc8890.md` with the others.

Write the surviving list down before dispatching anything, and dispatch exactly that list. A lens
held back for the actor table is on the list, not off it.

Send them all at once, and **give each the draft text in the dispatch** rather than making it fetch
its own. Staging it once to a file and passing the path counts, provided you verified that copy
against the authoritative source first. Either way, name the authoritative source alongside it so
the lens can verify anything it means to quote, and spot-check the returns yourself.

Where the cache is behind the live revision, the live text is the authoritative one -- fetch it and
hand the lenses that, whatever the corpus tool returns.

Paths in a rubric are relative to the rubric, not to anyone's working directory -- two of them point
into the `ietf-http` skill alongside this one. Resolve them where you read the rubric and pass the
result down; a dispatched context has no idea where its rubric came from. If that skill is not
installed and the lens fires, fetch the RFC text yourself and pass it down; if you cannot, the lens
goes in *Could not obtain*, not in *Checked, not raised*.

Each reads its rubric and returns:

- whether it fires on a proper reading, and why -- a lens may still come back saying it does not,
  and that is a result, not a wasted dispatch;
- the sections it read;
- **the passages it relies on, quoted verbatim with section numbers**;
- what it produces -- a concern, support for one you already hold, a result that the lens does not
  apply, or a result that the lens *supports* the design.

## 5. Review related material

Write down what you currently expect the answer to the Step 1 question to be. This is not the
verdict — that is Step 9, and it has a specification. It is here only so you notice when something
moves it, and can say what moved it.

Then, probe the charter, the slides, prior revisions, related and competing drafts, the author's
introductory mail, and the referenced specifications a concern of yours actually turns on — just
those sections, not the entire reference list. A draft's normative references run to thousands of
pages and this is on the critical path.

In particular read the draft's diffs, with `rfcdiff` rather than a raw `diff` (see *Without the
tooling* if you do not have it): a section deleted two
revisions ago, or a slide the draft does not reflect, hands you a concern you did not know to ask
for. Diff the current revision against
the one before it as a matter of course, and go further back only when a concern turns on *when*
something changed. Every extra revision is another read on the critical path. When you do go back,
grep the revisions (flattened, per Step 8 -- it locates a string, it does not diff) for the one
string rather than diffing them pairwise: locating a clause across eight revisions is seconds, and
eight diffs is minutes.

If you have reviewed this draft before, your own prior findings are an input — but after the cold
read, not before it. Anything on that list which did not reappear either gets re-derived or gets
dropped with a reason. A concern does not survive on the strength of having been raised once.

Record what you could not obtain. A gap is a limit on your review, not an absence in the work.

## 6. Rank the actors

When the actor table returns, rank it by **mismatch between a party's stated role and their actual
power**. That judgement is yours rather than the dispatched context's, and it sharpens once the
lenses are back.

A mismatch you cannot explain, or an absence the draft does not defend, is a new concern. Add it.

## 7. Ask what you cannot answer

A reviewer's contribution includes the questions they do not know the answer to: what scale is
expected, who is going to operate this, what happens when the deployment is larger than the authors
imagined.

Do not talk yourself out of asking them. You can usually build a case that the concern is fine --
the rate is low, the case is rare, the deployment is bounded -- and building it feels like
diligence. It isn't, when the document has not established the answer itself. If the draft never
says what scale it expects, and you find yourself working out that the scale is probably
acceptable, stop: the finding is that the draft never says. Ask.

Each question you are left with is a new concern. Add it as the question rather than as a claim.

## 8. Assess disposition

For each concern found, assess its disposition based upon the answers you receive:

- Already raised elsewhere: note that.
- Answered by the author: evaluate their answer.
- Position changed *and* an intent to update the draft expressed: update the concern to the
  disposition of that intent.

What the research returns is disposition, not findings: what the record did to concerns you already
have. A point you did not find yourself does not become yours by reading it. Check each returned
point against your Step 2 list before adopting it. This governs the record, not your own
instruments. A returned point with no matching record is a new concern or someone else's. Give it a
record with from naming the lens, or attribute it.

If another reviewer's point is right and unaddressed, support it by attribution -- "I agree with
X's point about Y" -- rather than restating it as your own; if it moves your disposition, say what
moved it.

The authors' own statements are the exception -- applicability claims and clarifications especially,
since those often say something the draft does not. Those are about the document, not the record,
and a concern they hand you is yours.

### Processing lens returns

A lens you dispatched is working on your behalf: what it returns is yours — including a concern you
did not have before — and you carry it under your own name.

**Never cite a lens you did not read.** Anything you want to cite that no lens returned, open
yourself. A passage returned by the lens that read it is citable. A passage *described* by a lens
that did not read it is not -- lenses cross-refer each other, and second-hand is second-hand. A
rubric is a citable source about itself: recording that a lens does not fire because its rubric
names this as a non-case needs no reading of the RFC. The RFC's own words do.

Spot-check the quotes your findings rest on against the files before anything goes out. This
applies to the draft text you hand the lenses: copy it and you are the extraction bug, so check
what comes back against the authoritative fetch.

A wrapped quote will not match a raw grep -- the text is there, the newline is not in your quote.
Flatten first:

```
tr -s ' \n\f' ' ' < FILE | grep -o -F 'the quoted passage'
```

Use that as written rather than improvising something that also strips page headers and footers:
the elaborate version is easy to get subtly wrong and the damage is silent. Seven of the twelve
reference texts carry page furniture, and so does every paginated draft -- so a quote spanning a
page boundary will not match even flattened. Quote within a paragraph and it never arises.

This is a tool for locating a string, not for comparing documents. Flattening collapses a file to
one line, which makes it undiffable; for a diff, strip page furniture line-wise and leave the line
breaks alone.

Three failures are the recipe's, not the quote's. A hyphenated compound that wrapped at the hyphen
will not match: `non-empty` flattens to `non- empty`. Nor will a quote spanning a page boundary. Nor
will anything inside an ASCII-art table, where flattening runs the cell delimiters and the following
row together -- locate table content by line range instead. Re-check by hand before doubting a
return: a failed match here reads as a fabricated quote, and usually is not.

This checks that the passage is present, not that it is where you say it is, and the same wrapping
defeats the obvious attribution check -- `grep -n` on the full quote runs against the raw file and
returns nothing, which reads identically to "wrong section". Bound the section by its heading
(`grep -n '^4\.1\.'`), then locate the quote inside that range by four to six words taken from the
middle of a line. A quote that is verbatim and mis-attributed is one a reader cannot follow up, and
a lens
return is exactly where that arrives.

Record the lenses you ruled out without dispatching, with what you checked, and the ones that came
back not applying or supporting the design. Carry both to the findings so the next reviewer does
not rediscover them.

## 9. Rank the concerns, and form a provisional view

**Settle what you think of the document before deciding how many concerns to surface.** The number
of concerns you find measures how hard you looked, not how bad the document is; a thorough review of
a good document produces a long list, and a long list is not a verdict.

**The bar is set by intended status and stage, not only by contents.** An Experimental
document with a stated experiment and a plan to revise on results is held to a different
standard than a Proposed Standard, and saying so is part of the verdict. Ask what the
document is *for* before asking what is wrong with it.

**A document can be fine.** A review can legitimately be three lines: "you checked the thing you
were asked to check, it holds up, here are two requests for clarification". If that is the honest
answer, give it and stop. Under-reviewing a bad document and over-reviewing a good one are both
failures.

Then rank each concern into **Issues**, **Comments** or **Nits** -- the three headings most IETF
reviews use. They have different economies, so do not apply one's test to another.

**Issues.** The test: *would this remain regardless of editorial work?* The test is about the
question, not the sentence. An ambiguity that leaves two implementers building different things is
an issue even though a sentence fixes it, because the authors have to decide something first. A
concern where the decision is already made and only the wording is missing is not.

Rank on the test alone; there is no target number of issues. The findings are a superset that the
reviewer picks from.

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

**Finish this step before you write a line of Step 10.**

- **Merge.** Find the concerns that are one decision before writing either up. Where one decision
  fixes only part of two concerns, merge the shared part and leave the residue as its own issue,
  cross-linked by *Related*.
- **Chain.** Where several issues trace to one revision change, work that out now and decide which
  carry a *Caused by*.
- **Calibrate.** Rate the whole set in one pass; severity and confidence are comparative.

The pass will not catch everything. Writing an argument out sometimes shows that a lens assumed
something the draft never says: filling a gap without noticing it is evidence the gap is real.
Expect one or two at Step 10, and count them as findings rather than rework.

## 10. Assemble the findings

This is the output. It is not a review: it is what a reviewer needs in order to decide what to
raise, and to defend it once raised.

Each issue is a record you already have, merged, chained and calibrated at Step 9. Assembling is
rendering; fresh thinking here means Step 9 is unfinished.

Lists, not tables -- this gets read in a text editor as often as anywhere that renders markdown.
Use a table only where the content is genuinely a matrix.
Headings in this order; levels shift with context. Drop the qualifiers when the review is written,
and then only for what the reviewer chose.

```
## Provisional view
## Candidate Issues

_one-line index, then a subsection each_

### I1. <the concern, in one sentence>

## Potential Comments
## Observed Nits
## What changed and when

_only where the draft has a revision history that matters_

## Prior concerns
## Checked, not raised
## Could not obtain
```

**Provisional view** -- what you would call it and why, answering the Step 1 question. Mark it as
yours. Name the datatracker `Result` you would pick whatever the review type; off a directorate
assignment, flag it as the one you would have picked. The six-value vocabulary says "publish, but
not this revision" more precisely than a sentence does. Past IESG approval it is the wrong
instrument -- the IESG has already picked one -- so give it if it helps and lead with the routes
instead.

**Candidate Issues** opens with a one-line index to triage from. Each line: the sections, then the
claim and what follows from it. Nothing else -- what an issue rests on is *Textual basis*, a few
lines down, and a compressed copy of it here reads as noise while saying less than the field does.

Without the consequence the line is an observation, and the reader has to open the subsection to
find out whether they care -- which is what the index exists to save them.

Close each line with the ratings -- 🔥 severity, ⭐️ confidence. Those are the two things that decide
what a reviewer reads first, and unlike a section list they are the value rather than a paraphrase
of one. Different glyphs so the pair reads without a legend.

- **I1** (§3.1, §6) Mandates a fixed hostname label, so an operator cannot name their own host.
  🔥4/⭐️5
- **I2** (§5) What a client may conclude from a failure is never stated, so two implementations
  diverge. 🔥3/⭐️4
- **I3** (§4.2) The retry bound went in -06 and nothing replaced it, so the limit is now unstated.
  🔥2/⭐️5

Then a subsection per issue, as labelled fields rather than paragraphs:

The heading is the concern -- one sentence, stated as a claim about the document. Do not restate it
as a field; the index line above is the compressed version and a third statement of it is padding.
These fields and no others: an issue that has grown one of its own is telling you something belongs
in another section. The three marked *only where* are conditional; the rest are always present.

- **Textual basis:** the quotes it rests on, with section numbers -- no commentary.
- **Argument:** how the quoted text produces the concern, and the strongest answer the authors would
  give -- a pre-emption already in the draft is not an answer. If the argument needs a fact, that
  fact needs a quote in *Textual basis*; the argument is not a second evidence base. Do not propose
  the fix here. Keep it to what a reader needs in order to check the claim.
- **Can be resolved if:** what would fix it.
- **Caused by:** only where a prior concern's fix is what created or sharpened this one -- which
  concern, whose fix, and which revision. Name it here rather than restating it under *Prior
  concerns*.
- **Related:** only where another issue bears on this one without having caused it -- two findings
  on one mechanism that are not one decision, so the merge rule keeps them apart. Name the id and
  the adjacency. If the reviewer raises only one, this is what tells them the other's framing
  changes.
- **Severity:** how significant the issue is / how strong its impact is; scale of one to five 🔥.
  Five is *the document cannot be published like this*; three is *this has to be fixed before it
  goes out*; one is *worth saying, and the document survives without it*.
- **Confidence:** how confident you are in the issue; scale of one to five ⭐️. Five is *quoted text,
  and the reading is not open to dispute*; three is *the text supports this and another reading is
  available*; one is *I think this is true and cannot show it from the document*.
- **Grounding:** only where confidence is short of full -- the reason it is short, and what would
  change your mind. An inference rather than the quoted text; or a source you could not read, named.

Leave the ratings bare. Justifying one inline is *Grounding*'s job arriving early.

**Potential Comments**, one bullet each: the section, the quoted text, then one question or one flat
statement. If one needs more than that, it is an issue in disguise.

**Observed Nits**, one line each.

**What changed and when** -- where the revision history bears on the findings, and as long as it
needs to be. Text that was removed, when, and whether anything replaced it; requirements that
changed strength; whatever the changelog does not record. This is what the *Caused by* fields point
at, and stating a chain once here is what stops the same fact being restated inside three separate
issues. Where a change is itself the defect, that is a Candidate Issue like any other -- this
section is the context, not a place to keep a finding.

**Prior concerns**, one bullet each: what was raised, by whom, and what this revision did with it --
addressed, partly, unaddressed, or answered on the list without a text change.

**Checked, not raised**, one bullet each: what, and why not -- a lens that did not apply, a lens
that supports the design, a concern the draft's own text refuses, an objection that is about the
topic. Only what a reader might expect to see raised; not a log of everything you thought about.

**Could not obtain** -- what, and what it means the analysis cannot say.

Apply the economy test: *would removing this change what the reviewer decides to raise, or how they
would defend it?*

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

**Do not copy all finding contents** -- keep what's relevant to the review type being created. In
particular *severity* and *confidence* are intended for the reviewer, not the review.

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


