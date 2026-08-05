# Review forms

The conventional shape of each kind of IETF review, derived from real reviews in the
datatracker rather than from memory. **These are forms, not content** — they tell you
what a reader of that review type expects to see and in what order. What goes in the
slots is Layer 1's job.

| File | Team | Derived from |
| --- | --- | --- |
| [`genart.md`](genart.md) | General Area Review Team | 47 reviews |
| [`tsvart.md`](tsvart.md) | Transport Area Review Team | 24 reviews |
| [`artart.md`](artart.md) | Applications and Real-Time Area Review Team | 17 reviews |
| [`intdir.md`](intdir.md) | Internet Area Directorate | 8 reviews |
| [`httpdir.md`](httpdir.md) | HTTP Directorate | 6 reviews |

Not covered: **secdir**. The corpus held only three, all from one reviewer in 2009, and
none carried the standard preamble — too thin to derive a form from. secdir does have
one; get it from a recent example rather than from here.

## Two things that hold across all of them

**The datatracker header block.** Every review filed through the datatracker opens with
it, and the tool generates most of it:

```
**Reviewer:** <name>
**Team:** <team>
**Document:** <draft-name-NN>
**Result:** <see below>
**Completed:** <YYYY-MM-DD>
**URL:** https://datatracker.ietf.org/doc/review-<...>/
```

Where the request carried a note from the AD or chair, it appears after the header,
italicised — *"Requested with the note: …"*. Read it. It usually says what they actually
want looked at, and it is the closest thing to a statement of the question you are
answering.

**The Result vocabulary is shared**, and it is a six-rung ladder, not a pass/fail:

| Result | When |
| --- | --- |
| `Ready` | Nothing to fix. Say why it is fine, briefly, and stop. |
| `Ready with Nits` | Clean on the substance; small clarity, terminology or reference items. |
| `Ready with Issues` | Things the authors should fix, none of which blocks publication. |
| `Almost Ready` | A real list, but the document is close and the shape is right. |
| `On the Right Track` | The approach works; the document does not yet do it. |
| `Not Ready` | Do not publish as-is. |

Observed frequencies differ by team — genart and tsvart skew heavily toward `Ready` and
`Ready with Nits`; the httpdir sample skews to `Not Ready`, though six is a small
sample. Do not read that as a house style to imitate. Pick the rung the document earns.

## When reviewing as a named participant

**Do not use these forms.** Layer 2 is about reproducing one person's shape, and real
reviewers vary within the conventional form and sometimes ignore it — different section
headings, boilerplate dropped on early reviews, findings ordered their own way. Derive
the shape from that person's own reviews. These files describe the default when you are
not modelling anyone.
