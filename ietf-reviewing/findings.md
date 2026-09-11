# Assembling the findings

This is Step 11 of `SKILL.md`, and the skill's output: what a reviewer needs in order to decide
what to raise, and to defend it once raised. It is not the review -- that is `delivering.md`, and
it is optional.

Each issue is a record you already have; fresh thinking here means Step 9 is unfinished.

Findings go to the reviewer, not into the record, but follow `register.md` regardless. The
Register's question about where content belongs is the one the fields below already ask, and its
economy test is the one at the end of this file, with the reviewer as the recipient. Two rules
invert, because a finding is analysis rather than a contribution:

- **First person belongs here.** A provisional view is yours and marked as yours; confidence and
  grounding are your judgement rather than the document's.
- **Hard-wrap, and prefer lists to tables.** This gets read in a text editor as often as anywhere
  that renders markdown, and nothing here is quoted back in a reply. Use a table only where the
  content is a matrix.

Re-print every record fact -- revisions, dates, reviewer and balloter
names, results, ballot positions, issue and pull request numbers -- from the tool as you write it.

Headings in the order below. Drop the qualifiers when the review is written, and then only for what
the reviewer chose.

```
## Provisional view
## Candidate Issues

_one-line index, then a subsection each_

### I1. <the concern, in one sentence>

## Potential Comments
## Observed Nits
## Could not obtain
## Your call
```

More is available on user request and is not written unless asked -- see *On request*, below.

## Provisional view

Answer the Step 1 question. 

Name the datatracker `Result` you would pick whatever the review type; on a directorate assignment,
flag it as the one you would have picked. That vocabulary says "publish, but not this revision"
more precisely than a sentence does; the values differ per team, so see `delivering.md` before
naming one.

In IESG Evaluation, give the `Result` and then say whether you think it warrants a DISCUSS -- that
is the instrument at that stage, and it is what the reviewer is deciding. Past approval the IESG
has already picked one, so give the `Result` only if it helps, and lead with the routes instead.

## Candidate Issues

Create a subsection per issue with labelled, newline-separated fields rather than paragraphs. The
heading is the concern -- one sentence naming one defect, stated as a claim about the document. Do
not restate it in a field. Output the fields below and no others. A field that opens *only where*
is conditional; the rest are always present.

- **The case:** the argument, with each quote set off where it is used rather than gathered into a
  block of its own. See *Writing the case* below.

- **Can be resolved if:** what would fix it -- checked against what you wrote under *what breaks if
  it is not fixed*, and against the actor table, the lenses, and the research Step 8 already
  gathered for this claim. State as an imperative if you verify that it will resolve the concern;
  hedge where you have not, or where the fix is itself a structural judgement. Where the authors'
  intent is unclear, ask instead, on its own line: *Are these omissions intentional?*

- **Caused by:** only where a prior change created or sharpened this one -- which change, answering
  what, and which revision. Name it here rather than restating it under *Prior concerns*.

- **Related:** only where another issue bears on this one without having caused it -- two findings
  on one mechanism that are not one decision. Name the ID and the adjacency.

- **Disposition:** only where this has been raised before -- what was raised, by whom, what the
  closing reason was if there is one, and whether it engaged the point. A concern the authors have
  declined is raised differently from one they have never seen, and this is what carries that when
  *Prior concerns* is not written.

- **Grounding:** where Step 10 ran, what it tried against each claim and what it did not shift. Then, only where confidence is short of full, the reason it is short and what would change
  your mind: an inference rather than the quoted text, or a source you could not read, named.

Across the fields, hedge the claims more than comes naturally, and hedge the asks unless you have
run the fix past what Step 8 already gathered for this claim -- the actor table, the lenses, the
research -- not past residual doubt in the claim, which belongs in *Grounding*. Left alone, writing
overcorrects the other way: confident about the defect, and just as confident about a fix that was
never checked against what the rest of the review already knew.

### Writing the case

Short paragraphs, one point each: what the document says, what that produces. Where the argument
turns on how this document and another fit together, include what that document says. Do
not propose the fix. Keep it to what a reader needs in order to check the claim, and write it so
they can agree or disagree rather than reassemble it.

Answer the authors' best objection only where it changes the ask, and in a clause rather than a
paragraph. A pre-emption already in the draft is not an answer.

Quote only what the argument uses, and do not restate a quote in prose beside it. Every fact it
rests on needs its quote here -- if you cannot quote it, you cannot claim it. Then check each
sentence against the quote beside it for scope, following `quoting.md`.

Where a weaker form is still true, write the weaker one. Cut a consequence you cannot show from
the text; do not hedge it into the case.

That covers facts about anything, not just the draft: what a registry holds, what another RFC
says, who wrote what and when. Fetch and read the source; recall is not a basis. Where such a fact
carries the finding -- a registration, its date, its assignee -- ask whether the text is staying
rather than building the case on it.

Keep your reasoning about whether to raise it out of the case -- issue versus nit, whether it is
worth the words. Keep your judgement of the significance out. Keep what the record already did with
it out as well; that is *Disposition*. Recite a decision's history only where the ask depends on it.

## Potential Comments

One bullet each, newline-separated: the section, the quoted text, then one question or one flat
statement. If one needs more than that, it is an issue in disguise.

## Observed Nits

One line each, newline-separated, and only ones quoted from the document verbatim and checked.

## Could not obtain

What, and what it means the analysis cannot say. A run without the gathered record says so here
*and* beside the provisional view: the reader weighs every "never raised" differently.

## Your call

The questions only the reviewer can settle. Not a summary: each one is a question with a consequence
attached.

- A finding resting on an inference rather than on quoted text, and what turns on it.
- A finding where they have standing you do not -- they closed the issue, edited the RFC, chaired
  the thread. Say so; do not quietly raise their own point back at them.
- A finding that turns on the reviewer's *own* work, or that they would raise from a chair's or AD's
  seat -- Step 1 established both. A finding that the draft misuses their specification is the one
  they will doubt least; a point pressed by a chair is read as more than one reviewer's view.
- A finding whose framing commits them to a position they may not want to hold.
- Anything you could not verify, and what it would change.

Keep it to a few lines. If nothing is theirs to settle, say that rather than manufacturing a list
-- a ritual section trains them to skip it, and this is the one section that is asking them for
something.

Apply the economy test: would removing this change what the reviewer decides to raise, or how they
would defend it? It does not govern Comments and Nits -- Step 9 says keep every concrete,
checkable, quotable one, and that stands.

## On request

Things the run keeps but does not write up. Do not draft any of them before being asked.

Offer them in one line at the end of the findings, naming the three. No preamble, no description of
what each would contain.

**What changed and when** -- where the revision history bears on the findings, and as long as it
needs to be. Text that was removed, when, and whether anything replaced it; requirements that
changed strength; whatever the changelog does not record. This is what the *Caused by* fields point
at. Where a change is itself the defect, that is a Candidate Issue like any other -- this section is
the context, not a place to keep a finding.

**Checked, not raised** -- One bullet each: what, and why not. Everything a lens produced that reached neither an Issue nor a Comment goes here -- that set is what goes missing quietly, and Step 9's reconcile is what finds it. Then a lens that did not apply, a concern the draft's own text refuses, an objection that is about the topic, a finding Step 10 refuted. A refuted finding carries the refutation, so the reviewer can reverse it. Beyond the lens output, only what a reader might expect to see raised; not a log of everything you thought about. Apply the economy test at the end of *Your call* (but a lens that came back supporting the design is exempt).

**Prior concerns**, one bullet each: what was raised, by whom, and what this revision did with it --
addressed, partly, unaddressed, or answered on the list without a text change.

**The actor table** -- as Step 3 returned it, with what Step 6 read out of it. Hand over the
staged file; do not re-render it. Stage it now if Step 3 did not.
