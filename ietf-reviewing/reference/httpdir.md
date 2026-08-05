# httpdir — HTTP Directorate

**No standard boilerplate.** Sampled reviews open directly with the review. Small sample
(6), so treat the notes below as observed tendency rather than settled convention.

## Form

```
<One or two sentences saying what the document does, in your own words.>

<The verdict, with its reason — and, where the review is scoped, what you did and
did not look at.>

# Issues

<Named sub-headings for each, e.g. "## Nothing says what makes a response
authoritative". Quote the draft, then the objection, then — commonly — a
concrete way out.>

# Nits

<Short items.>
```

## Notes

**BCP 56 / RFC 9205 is the charter document**, and reviews cite it by section rather
than by name. If the `ietf-http` skill is installed its `reference/` directory carries
the full text of 9205, 9110, 9111 and BCP 190 / RFC 8820; a citation with a section
number is worth several without.

**The recurring findings** across the sample are the same handful, because they are what
BCP 56 is about: undefined status-code semantics; no caching or freshness story; a
generic or absent media type (`application/octet-stream`, or "clients should accept
anything"); unspecified redirect handling; nothing said about certificate validation or
cookies; and squatting on the server's URL namespace where a well-known URI or a
supplied URL would do.

**Well-known URIs are a live disagreement.** The directorate's general position is that
they are justified when a client starts from a *domain name* and needs to reach a
resource, and not justified when a full URL could simply have been configured. Check
which case the document is before objecting — the objection is wrong about half the
time.

**An early review is advisory** and is invited while change is still cheap, so the
question is "what has to change", not "is there a blocking problem". Say which you are
answering; sampled early reviews do.

**Reviews propose alternatives**, not just objections — a sketch of a different design,
with its drawback named, rather than a bare complaint.
