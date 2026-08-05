# tsvart — Transport Area Review Team

Two fixed paragraphs of boilerplate, then straight into the review. No in-body metadata
block and no mandated section headings — the structure below the boilerplate is the
reviewer's own.

## Form

```
This document has been reviewed as part of the transport area review team's
ongoing effort to review key IETF documents. These comments were written
primarily for the transport area directors, but are copied to the document's
authors and WG to allow them to address any issues raised and also to the IETF
discussion list for information.

When done at the time of IETF Last Call, the authors should consider this
review as part of the last-call comments they receive. Please always CC
tsv-art@ietf.org if you reply to or forward this review.

<Thanks, plus a one-clause characterisation of the document.>

<The transport verdict, stated plainly — commonly hinged on the phrase "From a
transport perspective, ...". If the document raises nothing in the transport
area, say that in as many words, and say why.>

<Substantive concerns, if any. Commonly dash-headed topic lines with prose
beneath:>

- <Topic>

  <Quote the draft, then the comment or question.>

Nits:

- <Short items.>
```

## Notes

**Both boilerplate paragraphs go in on a Last Call review.** The second one — "When done
at the time of IETF Last Call…" — is dropped on early reviews, where it does not apply.

**Reviews commonly declare the transport lane and then leave it**, flagging the
departure: "From a transport perspective, and also looking partly at the security and
privacy aspects, …". That is normal and expected; see the skill's rule on permeable
scope.

**A clean review is short and says why it is clean.** Sampled `Ready` reviews run two to
eight sentences and name the reason the document raises nothing — that the transport is
someone else's existing mechanism, that the rate is negligible, that the extension does
not change the properties of the transports it runs over. An absence of objections
stated as an absence is weaker than the same verdict with its reason attached.

**Follow-up telechat reviews collapse.** Where the Last Call comments were addressed, one
or two sentences saying so is the whole review.

**RFC 8085 (BCP 145) is the yardstick** for anything sending UDP, and reviews commonly
check the document against it rather than against general principle.
