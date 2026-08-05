# artart — Applications and Real-Time Area Review Team

**No standard boilerplate.** Sampled reviews open directly with the review, under the
datatracker header. The structure below the header is the reviewer's own.

## Form

```
<One or two sentences saying what the document does, in your own words — not the
abstract's, and not a summary of it.>

<The verdict, with its reason.>

# Issues

<Named or unnamed. Quote the draft, then the objection or question.>

# Nits

<Short items.>
```

## Notes

**Section headings vary and nobody minds.** Sampled reviews use `# Issues` / `# Nits`,
`Major issues:` / `Minor issues:` / `Nits:`, `# Quibbles` / `# Niggles`, and
`# High Level Stuff` / `# Mid-sized stuff` / `# Small stuff`. Two tiers is the constant
— substantive things, then small ones — and the labels are not.

**The remit is broad**, which is the difficulty: applications and real-time covers media
types, URI structure, i18n, data formats, HTTP usage, SIP, and more. Reviews commonly
say which parts of that they actually looked at and which they did not.

**Where the request carried a note**, artart reviews lean on it more than other teams' —
the note usually names the specific thing the AD wanted checked (an ABNF, a
registration, an encoding), and the review is expected to answer that first.

**If the document's HTTP usage is the issue**, `httpdir` is the better-fitting team and
BCP 56 / RFC 9205 is the reference; say so rather than reviewing HTTP design under an
artart hat.
