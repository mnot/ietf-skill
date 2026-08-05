---
name: ietf-reviewing
description: How to review an Internet-Draft. Use when asked to review, critique, or assess a draft or specification -- a directorate or IETF Last Call review, a WGLC response, a dispatch or call-for-adoption assessment, or an informal "what do you make of this draft". Also covers reviewing through a named participant's lens, to anticipate what a draft will draw when it reaches a list. For the register and accountability rules that apply to any text going into the record under a person's name, including the finished review, use ietf-contributing. For reading or characterising an effort rather than assessing a document, use ietf-interpreting.
license: CC-BY-4.0
---

# Reviewing an Internet-Draft

**You draft; the human sends.** A review goes into the record under a person's name and
they are accountable for every word of it. See `ietf-contributing` for the register and
the disclosure norms that apply to the finished text.

Each review type has a conventional form -- boilerplate, expected sections, where the
verdict goes. Get it from a recent real review by the team you are writing for, not from
memory and not from an old example: the boilerplate text and its links change, and each
team's differs. The steps below are what goes in that form, not the form itself.

## 1. Establish the question before reading

A review answers the question in front of the audience, and that question is set by the
document's stage, not by the reviewer's interests:

| Stage | The question |
|---|---|
| Individual submission, no venue | Is there a problem here, and is it ours? |
| Dispatch / BoF proposal | Should the IETF take this on, and if so where? |
| Call for adoption | Should this WG adopt *this document* as its starting point? |
| WG document, in progress | Is the design right, and what has to change? |
| WGLC | Is it ready to leave the WG? |
| IETF Last Call / directorate | Is there a blocking problem? |

An *early* directorate review is the exception: it is invited while change is still
cheap, so it asks "what has to change", not "is there a blocking problem".

Write the question down before reading. The review's opening sentence answers it. If the
review request carried a note from the AD or chair, read it first -- it usually says what
they actually want looked at.

## 2. Establish the review surface

Enumerate everything the author put in front of the audience, not just the `.txt`. A
draft presented at a meeting was presented *with slides*, and slides routinely carry
claims the draft does not: deployment interest, named supporters, scope, relationship to
other bodies. Reviewers in the room review both.

Check for the draft and which revision, slide decks, the repo, a proposed charter, the
author's introductory mail, prior revisions, related drafts by the same authors. Record
what you could not obtain, and treat gaps as limits on the review rather than as
absences in the work.

## 3. Read it cold, and quote what you find

Read every line before consulting anything else -- no searches, no prior commentary, no
persona material. Keep your own issue list; it is the control against which everything
later gets filtered.

**Quote before you claim.** Every defect carries the document's own words. Never build an
objection on your paraphrase -- that is where fabricated findings come from. If you
cannot quote it, you have not found it.

**Never rule a finding out on a source you could not read.** If a document you would need
to confirm or refute a point is unavailable -- an RFC body, a registration template, a
referenced specification -- raise the point with the uncertainty stated. Do not drop it,
and do not settle it from memory: a rule you remember as governing one part of a
specification often governs a different part, and the part you need is the one you
cannot check. Say "I could not verify X" and make the finding anyway.

Better still, get the text. A review written with the specification open cites it by
section and finds more than one written from recall.

## 4. Enumerate the actors

For any draft describing a system, list *every* party the architecture names, and for
each: what do they control, what can they not refuse, what key material do they hold,
what protocol affordance do they have and who receives it, and what happens when **they**
are the adversary?

Then rank by **mismatch between a party's stated role and their actual power**. Both
directions matter:

- A party the document calls central, or names as the one being protected, who holds
  nothing. (A draft calling someone "the rights-bearing subject" and then giving them no
  key material and no protocol affordance.)
- A party the document frames as *in control* who needs a third party's permission to
  exercise it. (A system described as "guardian-controlled" in which guardians must be
  authorised by an external issuer to administer devices on their own premises.)

The second is easy to walk past, because the party looks powerful -- it is only against
their stated role that they turn out not to be. Do not stop at the first party that looks
wrong.

Then check the draft's own adversary classes against your table: which parties are absent
from theirs, and is each absence defensible? Ask without deciding the answer in advance.
The gap may be a layer confusion, a party the authors assume benign, or nothing at all.

## 5. Run the institutional checklist -- every time

These decide outcomes at early stages and are the least likely to surface from reading
alone. Ask them from the list:

- Is the IETF the right venue? Does a layer this depends on sit in another SDO, and if
  so, what is the change-control story?
- Does this depend on policy defined elsewhere? Can the technical work be evaluated
  without seeing that policy?
- Who has said they will implement and deploy? Are the parties who would *have* to
  implement it among them? Named interest is not the same as the right named interest.
- Does existing IETF architectural policy bear on this? (RFC 2804 wiretapping, RFC 7754
  filtering and blocking, RFC 7258 pervasive monitoring, RFC 8890 end users, RFC 3552
  endpoint assumptions.) Cite at most the one or two that actually bite.
- Is the mechanism narrower than its framing? If chartered under framing X, would the
  artefact serve purposes X disclaims?
- What is the incremental deployment story, and what does the first implementer get?

## 6. Ask what you cannot answer

Much of what a reviewer contributes is questions they do not know the answer to: what
scale is expected, who is going to operate this, what happens when the deployment is
larger than the authors imagined. These are not defects, and you cannot resolve them from
the document -- which is why they belong to the reviewer and not to the authors, who have
stopped seeing them.

The failure to avoid is reasoning your way *out* of one. You can usually construct an
argument that the concern is fine -- the rate is low, the case is rare, the deployment is
bounded -- and constructing it feels like diligence. It is the wrong move when the
document has not established the answer. If the draft does not say what scale it expects
and you find yourself deciding the scale is acceptable, the finding is that the document
does not say. Ask.

## 7. Decide the disposition, then rank

**Settle what you think of the document before deciding how many findings to run.** Taken
the other way round the count sets the verdict: a process built to locate problems will
locate enough to justify severity, whether or not the document deserves it.

**The bar is set by intended status and stage, not only by contents.** An Experimental
document with a stated experiment and a plan to revise on results is held to a different
standard than a Proposed Standard, and saying so is part of the verdict. Ask what the
document is *for* before asking what is wrong with it.

**Most documents are fine.** A review can legitimately be three lines: you checked the
thing you were asked to check, it holds up, here are two clarifications. If that is the
honest answer, give it and stop. Under-reviewing a bad document and over-reviewing a good
one are the same failure, and the second goes unnoticed.

Then rank -- but primary concerns and spot comments have different economies, so do not
apply one's test to the other.

**Primaries.** Usually two or three, sometimes none. The test: *would this survive any
amount of drafting work?* A concern a revision could fix is not primary; demote it.

**Spot comments.** The survivability test does **not** apply -- being trivially fixable
is what they are for. Keep every concrete, checkable, quotable one. If you find nine, write
nine: a defect deleted to keep the list short is a defect the authors now ship, and a
reviewer who lists nine specific things has demonstrated they read the document in a way
that three architectural objections do not.

Two constraints, neither a count. Each spot comment stays to a line or two -- if one needs
a paragraph of setup it is a primary in disguise, or not yet ready to be said. And never
fold or delete a primary to make room for one.

Form: quoted text, then one short question or one flat statement. No severity ratings, no
numbering, no interleaved thanks. Prefer the question -- asking whether you have read it
correctly is both more accurate and harder to dismiss than asserting a defect.

## 8. Verdict first

Open with the disposition, in one or two sentences, answering the Step 1 question. Then
the concerns.

Do not open with methodology, a summary of the draft, or praise. Do not defer the verdict
to the closing paragraph, and do not substitute a process recommendation ("let's not
discuss work items yet") for an answer -- that is a disposition about the *conversation*.

State the concession after the verdict, not instead of it. *This should not be picked up
in its current state, though something of roughly this shape might be* is a verdict.
*Here are some concerns* is not.

**A favourable verdict takes the same slot.** *This is fine, and here are two things worth
clarifying* belongs in the opening exactly as a refusal would, and carries the same
obligation to say why -- usually by naming what the document is for. Do not bury approval
under the findings, do not phrase it as the absence of objections, and do not let a run of
clarifications imply a severity the disposition does not support.

On a directorate review the disposition also goes in the datatracker `Result` field, and
that is a six-rung ladder rather than a pass/fail: `Ready`, `Ready with Nits`, `Ready
with Issues`, `Almost Ready`, `On the Right Track`, `Not Ready`. Pick the rung the
document earns; the prose verdict should say the same thing the field does.

**Decline whole categories out loud** rather than skipping silently: "I'll skip editorial
issues given the state of the text."

**A declared scope is permeable.** Reviewers announce a lane and then say the important
thing anyway, flagging it -- "this is for the security directorate, but". If a finding
matters and sits just outside the scope you declared, say it and mark it out of lane.
Holding to your own promise more strictly than the reviewer would is its own infidelity.

## 9. Cut what does not earn its place

Not to a word count. How long a real review runs depends on how much time the reviewer
had that week, and any single example is one draw from a wide spread -- the same person
writes four sentences on one document and two thousand words on the next.

What does hold: **length tracks disposition**. A reviewer who thinks a document is fine
says so briefly and stops; long reviews are usually the salvageable middle, where the
input will change something; and the harshest verdicts are often short, because once the
answer is no there is no point itemising. Use that as a sanity check on where your draft
sits, not as a budget.

The test is per-sentence: *would removing this change what the recipient does?* If not,
cut it. Over-length comes from padding the argument -- restating the draft, hedging,
explaining findings that speak for themselves -- not from having found a lot of things.

Delete prose. Do not delete defects.

## 10. Falsification pass

- Is each claim about the **document** or about the **topic**? Cut reviews of the topic.
- Does the quoted text actually support the claim made about it?
- Does anything read as position-taking without a document hook? Cut it.
- Have you answered the Step 1 question, in the first two sentences, unambiguously?

---

# Reviewing as a named participant

Additional rules when the review is modelled on how a specific person would read the
document -- to anticipate what a draft will draw when it reaches a list, or to prepare
authors for a directorate review.

**This is a simulation and must be labelled as one wherever it goes.** It is not that
person's review, they have not seen it, and it must never be sent to a list, filed in the
datatracker, or otherwise put into the record under their name -- nor presented to anyone
in a way that could be mistaken for their opinion. Its value is as a prediction to test a
draft against.

Do not reach for the conventional form of the review type. Real reviewers vary within it
and sometimes ignore it -- their own section headings, boilerplate dropped where it does
not apply, findings ordered their way. Derive the shape from that person's own reviews.

## Three buckets, kept visibly separate

- **Grounded** -- they demonstrably wrote this. Cite the message and archive URL.
- **Inferred** -- their method, your application to this document.
- **Unevidenced** -- you believe it, you cannot show it.

Keep a fourth note: positions they would plausibly hold where the record is silent.

**State this in the output**, not just in your working. A persona review whose provenance
is not visible is worth less than none, because a reader cannot tell which parts to check
-- and the unevidenced ones are where they should discount you hardest.

## Wrong-mouth check

Ask of each primary concern: **is this argument already on the record as someone else's?**
A technical community has a division of labour. Attributing a real, correct, well-known
argument to the wrong person is the characteristic failure of persona review -- worse than
missing it, because it is confidently wrong in a way that is checkable.

**This applies to arguments, not citations.** Do not suppress a relevant RFC or BCP merely
because you cannot show this reviewer citing it before. Competent reviewers cite documents
they have never cited in your corpus; the citation is a fact about the subject matter, not
a mannerism.

**The test is remit, not authorship.** An argument being *associated with* someone else --
even written by them -- does not put it in their mouth. What makes a finding wrong-mouth
is being outside this reviewer's lane. A directorate reviewer invoking the BCP their
directorate exists to apply is in lane no matter who wrote it. Ask "would this person
raise this?", never "is this argument someone's?"

Over-firing costs findings silently: a suppressed one leaves no trace for anyone to
challenge.

## Correct for corpus bias

Retrieval over mailing-list archives **over-serves technical positions and under-serves
institutional ones**. Venue, SDO boundaries, chartering thresholds and change control get
argued in rooms and in short interventions that index poorly; protocol arguments are long,
quotable and repeated.

So absence of evidence on an institutional question is not evidence the reviewer lacks the
position. Run Step 5 regardless and mark its outputs inferred. Expect the finding you can
evidence least to be among the ones that matter most.

## Match register, not vocabulary

Model the *shape*: the opening move, how many concerns they run, declarative versus
interrogative, whether they hedge confidence or position, how they mark sections, how they
sign off.

Do not lift catchphrases. A borrowed phrase in the wrong argument is more conspicuous than
plain prose.

Weight their actual **reviews** far above their authored drafts. Those are different
registers, and the drafts are usually the larger and more tempting corpus.

## Expected moves are predictions, not prohibitions

Identify the two or three gestures that would be the *easy* way to sound like this person
-- the signature citation, the framing they reach for, the known hobby-horse. Treat that
list as predictions. If a move is characteristic, the likely thing is that they made it;
the only question is whether the document independently supports it. If it does, make the
move and mark it inferred. Being recognisable is what you are trying to achieve.

Suppress only **lifted phrases**. Borrow the argument, never the wording.

**When you rule a move out, keep looking.** Establishing that they would not object where
you assumed is half the work -- they reviewed the document and found something. Check what
sits beside the cleared target: the same design decision from another angle, or the
neighbouring mechanism. Raise that **as well**, not instead.

**A draft that pre-empts an objection has not answered it.** It has stated a position the
reviewer may reject. Test the pre-emption against the rest of the specification -- a
document calling some primitive "not a security feature, merely a mapping" may still
impose requirements elsewhere that depend on the property it just disclaimed. Where the
rebuttal is arguable, make the objection anyway; that disagreement is often the finding.

## Do not invent heat

Where the record is silent on how strongly someone feels about a topic, write the finding
in their method and keep the temperature low. Under-reading intensity is a smaller error
than manufacturing it, and manufactured intensity is the most visible tell to anyone who
knows the person.
