---
name: ietf-reviewing
description: How to review an Internet-Draft. Use when asked to review, critique, or assess a draft or specification -- a directorate or IETF Last Call review, a WGLC response, a dispatch or call-for-adoption assessment, or an informal "what do you make of this draft".
license: CC-BY-4.0
---

# Reviewing an Internet-Draft

**You draft; the human sends.** A review goes into the record under a person's name and
they are accountable for every word of it. See `ietf-contributing`.

Most review types have a conventional form. Get it from a recent real review by the team you are
writing for. The steps below are what goes in that form, not the form itself.

For directorate reviews, see the wiki page of the review directorate for details (and possibly a format). Directorates are listed at <https://datatracker.ietf.org/review/> and their wiki pages are (usually) listed in their datatracker 'about' page.

## 1. Establish the question before reading

A review answers the question in front of the audience:

| Stage | The question |
|---|---|
| Individual submission, no venue | Is there a problem here, and is it ours? |
| Dispatch / BoF proposal | Should the IETF take this on, and if so where? |
| Call for adoption | Should this WG adopt *this document* as its starting point? |
| WG document, in progress | Is the design right, and what has to change? |
| WGLC | Does this document a coherent and complete design that addresses the stated need? |
| IETF Last Call / directorate | Is there a blocking problem? |

Directorate reviews are usually made at the IETF Last Call stage. An *early* directorate review is different: they are requested for in-progress WG documents, and focus on whether any blocking problems are anticipated.

Write the question down before reading. The review's opening sentence should answer it. If the
review request carried a note from the AD or chair, read it first -- it usually says what they
actually want looked at.

## 2. Read it cold

Read the entire draft without consulting anything else. Keep your own list of concerns; it is the
control against which everything later gets filtered.

**Quote before you claim.** Every concern should contain its basis in the document's own words.
Never build an objection on your paraphrase -- that is where fabricated findings come from.

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

## 4. Architectural review

Does existing IETF architectural guidance or policy bear on any aspect of the draft? In particular look at the draft through each of the following lenses, creating primary concerns where applicable:

- RFC 2804 wiretapping
- RFC 7754 filtering and blocking
- RFC 7258 pervasive monitoring
- RFC 8890 end users
- RFC 3552 endpoint assumptions
- RFC 6973 Privacy Considerations
- RFC 6950 Application Features in the DNS
- RFC 9205 Building Protocols with HTTP (see also the ietf-http skill)

## 5. Institutional questions

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

## 6. Ask what you cannot answer

A reviewer's contribution includes the questions they do not know the answer to: what scale is
expected, who is going to operate this, what happens when the deployment is larger than the authors
imagined.

Do not talk yourself out of asking them. You can usually build a case that the concern is fine --
the rate is low, the case is rare, the deployment is bounded -- and building it feels like
diligence. It isn't, when the document has not established the answer itself. If the draft never
says what scale it expects, and you find yourself working out that the scale is probably
acceptable, stop: the finding is that the draft never says. Ask.

## 7. Probe the draft context

This step should be done in an isolated context (e.g., subagent) if possible, so that your context is not polluted by other materials.

Enumerate everything related to the draft - e.g., if it was presented at a meeting, there are
likely slides and a relevant transcript. Gather e-mail list traffic related to the draft, check for
a repo, and obtain the author's introductory mail, prior revisions and prior reviews, related
drafts by the same authors, and any competing drafts.

Then, for each concern already identified:

- If the concern has already been raised elsewhere, note that.
- If the author has modified their position *and* express an intent to update the draft, update the concern, noting the disposition of the author's intentions.

If new concerns can be derived from the broader context (not just copied from other reviews), add them. In particular the authors' statements about applicability, their clarifications and similar statements should be evaluated.

Then, if this is an adoption or DISPATCH review, consider who has said they will implement and deploy. Are the parties who would *have* to implement it among them? Characterise the level of support for the draft. If there is not sufficient support, add that concern.

## 7. Decide the disposition of concerns, then rank

**Settle what you think of the document before deciding how many concerns to surface.** A process
built to locate problems will locate enough to justify severity, whether or not the document
deserves it.

**The bar is set by intended status and stage, not only by contents.** An Experimental
document with a stated experiment and a plan to revise on results is held to a different
standard than a Proposed Standard, and saying so is part of the verdict. Ask what the
document is *for* before asking what is wrong with it.

**A document can be fine.** A review can legitimately be three lines: you checked the thing you
were asked to check, it holds up, here are two clarifications. If that is the honest answer, give
it and stop. Under-reviewing a bad document and over-reviewing a good one are the same failure, and
the second goes unnoticed.

Then rank -- but primary concerns and spot comments have different economies:

**Primaries.** Usually two or three, sometimes none. The test: *would this remain regardless of editorial work?* A concern fixed by a textual revision is not primary; demote it.

**Spot comments.** The survivability test does **not** apply -- being trivially fixable
is what they are for. Keep every concrete, checkable, quotable one.

Keep each spot comment to a line or two: if one needs a paragraph of setup, it is a primary in
disguise or you are not ready to say it yet. And never fold or delete a primary to make room for a
spot comment.

Form: quoted text, then one short question or one flat statement. No severity ratings, no
numbering, no interleaved thanks. Prefer the question -- asking whether you have read it
correctly is both more accurate and harder to dismiss than asserting a defect.

## 8. Draft the review

Open with the disposition, in one or two sentences, answering the Step 1 question. Then
the concerns.

Do not open with methodology, a summary of the draft, or praise. Do not substitute a process
recommendation ("let's not discuss work items yet") for an answer -- that is a disposition about
the *conversation*.

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

**Decline whole categories out loud** rather than skipping silently: "I'll skip editorial issues
given the state of the text."

**A declared scope is permeable.** Reviewers announce a lane and then say the important thing
anyway, flagging it -- "this is for the security directorate, but". If a finding matters and sits
just outside the scope you declared, say it and mark it out of lane. 

## 9. Cut what does not earn its place

A reviewer who thinks a document is fine says so briefly and stops; long reviews are usually the
salvageable middle, where the input will change something; and the harshest verdicts are often
short, because once the answer is no there is no point itemising. Use that as a sanity check on
where your draft review sits, not as a budget.

The test is per-sentence: *would removing this change what the recipient does?* If not, cut it.
Over-length comes from padding the argument -- restating the draft, hedging, explaining findings
that speak for themselves -- not from having found a lot of things.

Delete prose. Do not delete defects.

## 10. Final pass

Double check the review for these issues:

- Is each claim about the **document** or about the **topic**? Cut comments on the topic.
- Does the quoted text actually support the claim made about it?
- Does anything read as position-taking without reference to what the document says? Cut it.
- Have you answered the Step 1 question, in the first two sentences, unambiguously?


