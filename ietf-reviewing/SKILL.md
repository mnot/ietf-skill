---
name: ietf-reviewing
description: How to review an Internet-Draft. Use when asked to review, critique, or assess a draft or specification -- a directorate or IETF Last Call review, a WGLC response, a dispatch or call-for-adoption assessment, or an informal "what do you make of this draft". Covers working out which question the review is actually answering (it changes with the document's stage), what to look for, when to say a document is fine and stop, and how to land a verdict rather than trailing off into concerns. Also covers reviewing through a named participant's lens, to anticipate what a draft will draw when it reaches a list. For the register and accountability rules that apply to any text going into the record under a person's name -- including the finished review -- use ietf-contributing. For reading or characterising an effort rather than assessing a document, use ietf-interpreting.
license: CC-BY-4.0
---

# Reviewing an Internet-Draft

Producing a review of an Internet-Draft. Layer 1 applies to any review. Layer 2 applies
additionally when the review is written through a named reviewer's lens.

**You draft; the human sends.** A review goes into the record under a person's name and
they are accountable for every word of it. See `ietf-contributing` for the register and
the disclosure norms that apply to the finished text.

Each rule here traces to a measured failure or a measured success in blind
reproduction: generate a review of a draft that a named participant has already
reviewed, without seeing the original, then score it against the real one. Three
reviewers, three documents, three genres, nineteen runs. Several rules that looked
obviously right were measured to be actively harmful, and were removed.

---

# Layer 1 — Review discipline

## 1. Establish the question before reading

A review answers the question actually in front of the audience. That question is
set by the document's stage, not by the reviewer's interests:

| Stage | The question |
|---|---|
| Individual submission, no venue | Is there a problem here, and is it ours? |
| Dispatch / BoF proposal | Should the IETF take this on, and if so where? |
| Call for adoption | Should this WG adopt *this document* as its starting point? |
| WG document, in progress | Is the design right, and what has to change? |
| WGLC | Is it ready to leave the WG? |
| IETF Last Call / directorate | Is there a blocking problem? |

Write the question down before reading. The review's opening sentence answers it.

## 2. Establish the review surface

Enumerate everything the author put in front of the audience — not just the `.txt`.
A draft presented at a meeting was presented *with slides*, and the slides routinely
carry claims the draft does not: deployment interest, named supporters, scope,
relationship to other bodies. Reviewers in the room review both.

Check for: the draft (and which revision), slide decks, the GitHub repo, a proposed
charter, the author's introductory mail, prior revisions, related drafts by the same
authors. Then record explicitly what you could not obtain, and treat gaps as limits
on the review rather than as absences in the work.

## 3. Cold read, whole document, first

Read every line before consulting anything else — no searches, no prior commentary,
no persona material. Produce your own issue list and keep it; it is the control
against which everything later gets filtered.

**Quote before you claim.** Every defect must carry the document's own words. Never
build an objection on your paraphrase of the draft — that is where fabricated
findings come from. If you cannot quote it, you have not found it.

## 4. Enumerate the actors

For any draft describing a system, list *every* party the architecture names, then
fill this in for each:

- What do they control?
- What can they not refuse?
- What key material do they hold?
- What protocol affordance do they have, and who receives it?
- What happens when **they** are the adversary?

Do this exhaustively before forming a view, then rank by **mismatch between a party's
stated role and their actual power** — not by how little they hold.

Both directions of mismatch matter, and the second is easier to miss:

- A party the document calls central, or names as the one being protected, who turns
  out to hold nothing. (A draft calling someone "the rights-bearing subject" and then
  giving them no key material and no protocol affordance.)
- A party the document frames as *in control* who turns out to need a third party's
  permission to exercise it. (A system described as "guardian-controlled" in which
  guardians must be authorised by an external issuer to administer devices on their
  own premises.)

The second kind is where the sharpest objections have actually been found, and a rule
that ranks by "holds no key material" points away from it. Do not stop at the first
party that looks wrong.

Then check the draft's own stated adversary classes against your table: which parties
in your table are absent from theirs, and is each absence defensible? Ask the question
without deciding the answer in advance — the gap may be a layer confusion, a party the
authors assume benign, or nothing at all. Name what you find, not what you expected.

## 5. Run the institutional checklist — every time, regardless of evidence

These questions decide outcomes at early stages, and they are the ones least likely
to be surfaced by searching a corpus. Ask them from the checklist, not from retrieval.

- Is the IETF the right venue? Does a layer this depends on sit in another SDO, and
  if so, what is the change-control story?
- Does this depend on policy defined elsewhere? Can the technical work even be
  evaluated without seeing that policy?
- Who has said they will implement and deploy? Are the parties who would *have* to
  implement it among them? Named interest is not the same as the right named interest.
- Does existing IETF architectural policy bear on this? (RFC 2804 wiretapping,
  RFC 7754 filtering and blocking, RFC 7258 pervasive monitoring, RFC 8890 end users,
  RFC 3552 endpoint assumptions.) Cite at most the one or two that actually bite.
- Is the mechanism narrower than its framing? If chartered under framing X, would the
  artefact serve purposes X disclaims?
- What is the incremental deployment story, and what is the incentive for the first
  implementer?

## 6. Decide the disposition first, then rank and cut

**Settle what you think of the document before you decide how many findings to run.**
Taken the other way round, the finding count sets the verdict: a process built to
locate problems will locate enough of them to justify severity, whether or not the
document deserves it. A review with ten findings has said something different from one
with two, whatever each finding says on its own.

**The bar is set by the document's intended status and stage, not only by its
contents.** An Experimental document with a clearly stated experiment and a plan to
revise on results is being held to a different standard than a Proposed Standard, and
saying so is part of the verdict rather than background colour. Ask what this document
is *for* before asking what is wrong with it.

**Most documents are fine.** A review can legitimately be three lines: the reviewer
checked the thing they were asked to check, it holds up, here are two clarifications.
If that is the honest answer, give it and stop — do not go looking for a third concern
to justify the effort. Under-reviewing a bad document and over-reviewing a good one are
the same failure, and the second is the one that goes unnoticed.

**Primary concerns and spot comments have different economies. Do not apply one's
test to the other.**

**Primaries.** Usually two or three, sometimes none. The test: *would this survive any
amount of drafting work?* A concern a revision could fix is not primary — demote it to
a spot comment. Be ruthless about what counts as primary; this is where over-length
comes from.

**Spot comments.** The survivability test does **not** apply to these — do not delete
one merely because a revision would fix it; that is what spot comments are *for*.
Keep the concrete, checkable, quotable ones, however trivially fixable. A one-line
absurdity lands harder than a paragraph of architecture.

**There is no cap.** Keep every spot comment that earns its place — a defect deleted to
hold a count is a defect the authors now ship. If you find nine quotable one-liners,
write nine. Reviewers do not work to a quota, and an arbitrary limit competes with
merit rather than enforcing it.

Two real constraints replace the count. Each must stay to a line or two: if one needs
a paragraph of setup it is a primary in disguise, or it is not ready to be said. And
**never fold, compress, or delete a primary to make room for one** — if something has
to give, it is the spot comments, but only because they are individually cheaper, not
because there is a limit.

Form: quoted text, then one short question or one flat statement. No severity ratings,
no numbering, no interleaved thanks. Prefer the question form — asking whether you
have read it correctly is both more accurate and harder to dismiss than asserting a
defect.

**Ask the things you cannot answer.** A large part of what reviewers contribute is
questions they do not know the answer to: what scale is expected, who is going to
operate this, what happens when the deployment is larger than the authors imagined.
These are not defects and you cannot resolve them from the document — which is exactly
why they belong to the reviewer and not to the authors, who have stopped seeing them.

The failure to avoid is reasoning your way *out* of one. You will often be able to
construct an argument that the concern is fine — the rate is low, the case is rare, the
deployment is bounded — and constructing it feels like diligence. It is the wrong move
when the document itself has not established the answer. If the draft does not say what
scale it expects and you find yourself deciding the scale is acceptable, the finding is
that the document does not say. Ask.

Decline whole categories out loud rather than skipping silently ("I'll skip editorial
issues given the state of the text").

**A declared scope is permeable.** Reviewers announce a lane and then say the important
thing anyway, flagging it as they go — "and because I can't help myself", "this is for
the security directorate, but". If a finding matters and sits just outside the scope you
declared, say it and mark it as out of lane. Do not drop it to keep your own promise
tidy. Declaring a scope is a courtesy to the reader, not a gag, and holding to it more
strictly than the reviewer would is its own infidelity.

**Never cut a finding on the strength of a source you could not read.** If a document
you would need in order to confirm or refute a point is unavailable — an RFC body, a
registration template, a referenced specification — that is a reason to raise the point
with the uncertainty stated, not a reason to drop it and not a reason to rule it out
from memory. Recalled summaries of a specification are reliably wrong in the specific
place that matters: a rule you remember as applying to one part of a document often
applies to a different part, and the part you need is the one you cannot check. Say
"I could not verify X" and make the finding anyway.

Get the text if you can — this is the single largest measured constraint on review
quality, larger than any rule here. A review written with the referenced specification
open cites it by section and finds materially more than one written from recall; a
review written without it can rule a correct finding *out*, on a remembered rule that
turns out to govern a different part of the document than the part in question.

## 7. Verdict first

Open with the disposition, in one or two sentences, answering the Step 1 question.
Then the concerns.

Do not open with methodology, with a summary of the draft, or with praise. Do not
defer the verdict to the closing paragraph, and do not substitute a process
recommendation ("let's not discuss work items yet") for an answer — that is a
disposition about the *conversation*, not about the *document*.

State the concession after the verdict, not instead of it: *this should not be picked
up in its current state, though something of roughly this shape might be different* is
a verdict. *Here are some concerns* is not.

**A favourable verdict is a verdict and takes the same slot.** *This is fine, and here
are two things worth clarifying* belongs in the opening exactly as a refusal would, and
carries the same obligation to say why — usually by naming what the document is for.
Do not bury approval under the findings, do not phrase it as the absence of objections,
and do not let a run of clarifications imply a severity the disposition does not
support. If the honest verdict is that the document is ready, the rest of the review
has to read like it.

## 8. Cut what does not earn its place

Not to a word count. **How long a real review runs depends on how much time the
reviewer had that week**, and any single example of theirs is one draw from a wide
spread — the same person writes four sentences on one document and two thousand words
on the next. Matching the length of one review you have read is fitting to noise, and
a target set that way will delete real findings to hit it.

What does hold, and is worth modelling: **length tracks disposition**. A reviewer who
thinks a document is fine says so briefly and stops; the long reviews are usually the
salvageable middle, where they think the input will change something; and the harshest
verdicts are often short, because once the answer is no there is no point itemising.
If you can derive that ladder from the reviewer's own record, use it as a sanity check
on where your draft sits — not as a budget.

The test is per-sentence, not per-review: *would removing this change what the
recipient does?* If not, cut it. Over-length is real and it is the most common failure,
but it comes from padding the argument — restating the draft, hedging, explaining
findings that speak for themselves — not from having found a lot of things.

Delete prose. Do not delete defects.

## 9. Falsification pass

- Is each claim about the **document**, or about the **topic**? Cut reviews of the topic.
- Does the quoted text actually support the claim made about it?
- Does anything read as position-taking without a document hook? Cut it.
- Have you answered the Step 1 question, in the first two sentences, unambiguously?

---

# Layer 2 — Reviewing through a named reviewer's lens

Additional rules when the review is modelled on how a specific person would read the
document — to anticipate what a draft will draw when it reaches a list, or to prepare
authors for a directorate review.

**This is a simulation and must be labelled as one wherever it goes.** It is not that
person's review, they have not seen it, and it must never be sent to a list, filed in
the datatracker, or otherwise put into the record under their name — nor presented to
anyone in a way that could be mistaken for their opinion. The output's value is as a
prediction to test your own draft against; treat it as nothing more.

## A. Three buckets, kept visibly separate

- **Grounded** — they demonstrably wrote this. Cite the message and archive URL.
- **Inferred** — their method, your application to this document.
- **Unevidenced** — you believe it, you cannot show it.

Never let bucket 3 inherit bucket 1's confidence. Maintain a fourth note: *positions
they would plausibly hold but for which the record is silent.*

## B. Wrong-mouth check

Before finalising, ask of each primary concern: **is this argument already on the
record as someone else's?** A technical community has a division of labour, and
experienced reviewers stay in their lane. Attributing a real, correct, well-known
argument to the wrong person is the characteristic failure of persona review — worse
than missing it, because it is confidently wrong in a way that is checkable.

**This check applies to arguments, not to citations.** Do not suppress a relevant RFC,
BCP, or prior specification merely because you cannot show this reviewer citing it
before. Competent reviewers cite documents they have never cited in your corpus — the
citation is a fact about the subject matter, not a personal mannerism. Cite it, keep
it to one clause, and mark it inferred in the evidence table.

**The test is remit, not authorship.** An argument being *associated with* someone
else — even written by them, even in a document they authored — does not put it in
their mouth. What makes a finding wrong-mouth is being outside this reviewer's lane, so
that only an odd reading of the record has them raising it. A directorate reviewer
invoking the BCP their directorate exists to apply is squarely in lane no matter who
wrote that BCP; suppressing it because the author is a well-known figure in the same
community is the check misfiring. Ask "would this person raise this?", never "is this
argument someone's?"

Over-firing costs real findings, and it costs them silently — a suppressed finding
leaves no trace in the output for anyone to challenge.

## C. Correct for corpus bias

Retrieval over mailing-list archives systematically **over-serves technical positions
and under-serves institutional ones**. Venue, SDO boundaries, chartering thresholds,
change control, and "is this our lane" get argued in rooms and in short interventions
that index poorly, while protocol arguments are long, quotable, and repeated.

Therefore: absence of evidence on an institutional question is *not* evidence the
reviewer lacks the position. Run Layer 1 Step 5 regardless, and mark its outputs as
inferred rather than dropping them for want of a citation. Expect the finding you can
evidence least to be among the ones that matter most.

## D. Match register, not vocabulary

Model the *shape*: the opening move, how many concerns they run, declarative versus
interrogative, whether they hedge confidence or position, how they mark sections, how
they sign off, and how their length varies with document maturity.

Do not lift catchphrases. A borrowed phrase in the wrong argument is more conspicuous
than plain prose.

Note the difference between how someone writes a **draft** and how they write a
**review** — they are different registers, and the drafts are usually the larger and
more tempting corpus. Weight actual reviews far more heavily.

## E. Expected moves are predictions, not prohibitions

Before writing, identify the two or three gestures that would be the *easy* way to
sound like this person — the signature citation, the framing they reach for, the known
hobby-horse.

Treat that list as predictions, not temptations. If a move is characteristic of this
reviewer, the likely thing is that they made it. The only question is whether the
document independently supports it — if it does, make the move and mark it inferred.
Being recognisable is what you are trying to achieve.

Suppress only **lifted phrases**: a distinctive turn of speech carried over verbatim.
Borrow the argument, never the wording.

**When you rule a move out, keep looking.** Establishing that they would not object
where you assumed is half the work — they reviewed the document and found something.
Check what sits beside the cleared target: the same design decision from another
angle, or the neighbouring mechanism. Raise that **as well**, not instead.

**A draft that pre-empts an objection has not answered it.** It has stated a position
the reviewer may reject. Test the pre-emption against the rest of the specification —
a document calling some primitive "not a security feature, merely a mapping" may still
impose requirements elsewhere that depend on the property it just disclaimed. Where
the rebuttal is arguable, make the objection anyway; that disagreement is often the
finding.

## F. Do not invent heat

Where the record is silent on how strongly someone feels about a topic, write the
finding in their method and keep the temperature low. Under-reading intensity is a
smaller error than manufacturing it, and manufactured intensity is the most visible
tell to anyone who knows the person.

## G. Say what you could not establish

Close with what the model rests on: which positions you can cite, which are the
person's method applied by you, and which you believe but cannot show. Keep a fourth
note for positions they would plausibly hold where the record is silent — those are
the places a reader should discount you hardest.

A persona review whose provenance is not visible is worth less than no review, because
a reader cannot tell which parts to check.
