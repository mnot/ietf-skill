# Checking a quote against the text

Read this at Step 8 of `SKILL.md`, when checking what a finding rests on, and again at Step 11
while writing the case.

A wrapped quote will not match a raw grep -- the text is there, the newline is not in your quote.
Flatten first:

```
tr -s ' \n\f' ' ' < FILE | grep -o -F 'the quoted passage'
```

Use it as written rather than improvising something that also strips page headers and footers: an
improvised version is easy to get subtly wrong, and it fails quietly.

Four failures are the recipe's, not the quote's:

- **Double spacing.** `-s` squeezes runs, so the two spaces after a full stop collapse to one. A
  quote copied verbatim from a double-spaced source then fails -- squeeze the quote the same way.
- **A hyphenated compound wrapped at the hyphen.** `non-empty` flattens to `non- empty`. Where the
  term under review is itself hyphenated -- a field name, usually -- every wrapped quote of it
  fails. Expect that before doubting the return.
- **A quote spanning a page boundary.** Most of the bundled reference texts carry page furniture, as
  does every paginated draft. Quote within a paragraph.
- **A line prefix** -- an ASCII table's cell delimiters, the `|` of an indented note block -- which
  survives the flatten inline. Locate that content by line range instead.

Re-check by hand before doubting a return: a failed match here reads as a fabricated quote, and
usually is not.

It locates a string; it does not compare documents. For a diff, strip page furniture line-wise and
leave the line breaks alone.

Where a case quotes more than one document -- the draft and an RFC it extends, say -- check each
quote against the right file, not just against some file on disk. Both are present, so a match
proves the string exists somewhere and not that you attributed it correctly.

## Checking the section number

The recipe proves the passage is present. It does not prove it is where you say it is.

Checking that needs a different move, because the same wrapping defeats the obvious one: `grep -n`
on the full quote runs against the raw file and returns nothing, which looks exactly like a wrong
section number. Bound the section by its heading (`grep -n '^4\.1\.'`), then locate the quote inside
that range by four to six words taken from the middle of a line.

A quote that is verbatim and mis-attributed is one a reader cannot follow up, and a lens return is
exactly where that arrives.

## Checking what the quote covers

Verbatim and correctly attributed still does not license the claim. A quote carrying a condition
or a list of enumerated cases supports a claim about those cases and no others, and a finding that
widens it passes every check above.

Where the quote turns on *if*, *unless*, *prior to*, *where*, or an enumeration, read the sentence
and the one either side of it, and write down what the quote excludes before building on it. Carry
the excluded cases into the finding's basis.

Requirements as much as disclaimers: *a server that has received X MUST Y* is not *servers MUST Y*.
