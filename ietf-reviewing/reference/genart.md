# genart — General Area Review Team

The most templated of the review forms. 44 of 47 sampled reviews repeat the in-body
header; 43 carry a `Summary:`; 25 use the full `Major / Minor / Nits` split.

Unusually, genart repeats the document metadata **inside** the review body, below the
boilerplate, even though the datatracker header already carries it. That is the
convention; keep it.

## Form

```
I am the assigned Gen-ART reviewer for this draft. For background on Gen-ART,
please see the FAQ at <https://trac.ietf.org/trac/gen/wiki/GenArtfaq>.

Please resolve these comments along with any other Last Call comments you may
receive.

Document: draft-example-thing-04
Reviewer: <name>
Review Date: YYYY-MM-DD
IETF LC End Date: YYYY-MM-DD
IESG Telechat date: <if known, else omit>

Summary: <one to three sentences: what state the document is in, and what — if
anything — you think has to happen before publication. This carries the verdict.>

Major issues:

<Things that should block publication. "None." if there are none.>

Minor issues:

<Things the authors should fix that do not block. "None." if there are none.>

Nits/editorial comments:

<Typos, wording, references, clarity.>
```

## Notes

**`Summary:` is where the verdict lives**, not the `Result:` field alone. It is prose,
and it is the sentence the AD reads. Write it to answer the question, e.g. "This
document is in pretty good shape. I have a concern over how X might be implemented that
I believe needs to be addressed prior to publication as Proposed Standard."

**Say "None." rather than dropping a heading.** An absent `Major issues:` reads as an
oversight; "Major issues: None." is a statement.

**On a telechat review of a document you reviewed at Last Call**, the convention is to
say what changed rather than to re-review — whether the previous comments were
addressed, and whether anything new appeared.

**The Gen-ART FAQ URL has moved over the years.** Sampled reviews carry several
variants; use the current one rather than copying an old review's link.
