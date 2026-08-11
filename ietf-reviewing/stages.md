# Reviews of a particular kind

Read the section that applies, at Step 1 of `SKILL.md`. None of this changes the method; it changes
what Step 1 has to establish before the method starts.

## Directorate reviews

Directorate reviews are usually made at the IETF Last Call stage. An *early* directorate review is
different: they are requested for in-progress WG documents, and focus on whether any blocking
problems are anticipated.

**Look the request up rather than waiting to be handed it.** It carries the team, the review type,
the deadline, whether anyone has claimed it, and usually a note from the AD or chair.

```
https://datatracker.ietf.org/api/v1/review/reviewrequest/?doc__name=draft-...&format=json
```

Use `doc__name`. The obvious `?doc=` returns `{"error": "Invalid resource lookup data provided
(mismatched type)."}`, which reads like an empty result and will convince you there is no request.

What the reviewer asked for still governs: the lookup informs, it does not repick the question.
Where the request contradicts the brief -- an *early* review filed against a document they described
as being at Last Call -- say so and ask.

Check the team's wiki page for guidelines and requirements: where there are any, they say what that
team wants looked at. Directorates are listed at <https://datatracker.ietf.org/review/>, and the
datatracker "about" page for a team links its wiki. Any review form there is for the writing step,
if a review gets written at all.

## Revisions of a published document (bis)

Establish what the document obsoletes or updates. Diff against each of those, not only against the
previous revision.

Check the standing-document graph. A BCP or STD usually holds several RFCs; obsoleting some leaves
the rest in place, still referencing what was replaced.

Treat a missing changes section as a finding.

Compare requirement strength keyword by keyword. A MUST restated as a declarative sentence is a
weakening no prose diff shows.

Ask where every deleted requirement went. Where the document says it now lives elsewhere -- a
registry, another RFC -- fetch that and confirm it is there.

## Revisions answering a closed review round

Where the current revision was written to answer a round that has closed -- a WGLC, a directorate
review, an IESG ballot -- do two things before anything else.

Diff it against the revision the round read. New text has been reviewed by nobody, and a document
answering reviews is where new text arrives.

Check what was agreed and did not land. A closed issue or an approved pull request that never merged
is invisible from the document.

**The other direction is more common: the repo is ahead of the datatracker.** Everything merged,
nothing published. Diff the published revision against `main` and read the commits since.

**A review is of one document.** Where the two have diverged materially and the request does not say
which, stop and ask. Do not review both, and do not pick for them -- a review of the wrong revision
is wasted, and which one they want is not inferable from the draft.

Once the target is settled, note a *substantive* change with no issue, pull request or thread behind
it as context, not as a process complaint: the WG may not know it moved. It belongs in the covering
message, never in a filed issue -- there it reads as a complaint about the editors however it is
worded.

## Post-IESG approval

**Past IESG approval, sort findings by route rather than by severity.** "Is there a blocking
problem?" is calibrated to a decision already taken: answer no and the review says nothing, answer
yes and you are asking for a recall, which is a cost borne by people other than you. The three
routes are AUTH48 or an RFC Editor note; pulling the document back; and an erratum or the next
revision. Say which one each finding is for.
