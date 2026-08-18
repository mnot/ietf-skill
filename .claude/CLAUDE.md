
# Throughout

Be imperative -- don't explain why, stay succinct.

Every sentence is an instruction, or it goes. What keeps creeping back in: a maxim in place of a
step (*Probe rather than assume*, where the step is *call `list_corpora`*); rationale for an
instruction given elsewhere; a bold lead that restates its own paragraph, or defines its subject by
itself; and commentary on the document's own structure. A lead can restate its heading as easily
as its paragraph.

Say a thing once, in the step that uses it. A front-matter section ending "stated in full there"
belongs to that step. A forward reference to a rule stated where it applies is a second copy. The
frontmatter `description` is trigger text -- what the skill does and when it fires, never what it
outputs.

Give a prohibition its replacement. *Do not run the steps strictly in order* reads as licence to
reorder.

Don't generalise from the case that prompted the rule. It will fire on every good finding that
shares the bad one's shape, so scope it to what you can defend and check what else it catches.

Name things rather than counting them -- *the four marked "only where"* goes stale the next time a
field changes.

Verify a claim about how the skill works against the skill, as with a section pointer against the
RFC. *Nothing in the method depends on concurrency* was false, and one grep disproved it.

Order sections in the order they run, and check what each needs from the ones before it. Step 8
processed lens returns after the gate those returns feed, so a lens concern skipped it -- and that
was invisible until both halves had names.

Say who acts before saying what to do. A dispatch brief that opens with its questions reads as your
own next move, and gets performed instead of sent.

An enumeration is a list. Four special cases, thirteen rubrics and a dispatch schedule with a
condition per item were all sentences to parse.

Cutting can take a distinction with it. Re-read the neighbours: "the revision history" only became
ambiguous with the draft's own changes section once the clause that distinguished them looked like
rationale.

# Lens rubrics (`ietf-reviewing/reference/*.md`)

Structure: `Scope`, `Firing` (subsections as needed), then lens-specific sections.

`Scope` and `Firing` are the pre-filter's read, across every rubric at once. Everything below
is the dispatched lens's, for one rubric. Put nothing in the first two that only matters after the
lens fires, and nothing below them that the pre-filter needs.

`Scope` carries what the lens covers, what it defers to another lens, and what any sibling skill
does and does not carry.

Post-firing sections run questions before navigation: `What this lens asks`, then `Where to look`.

No quotable RFC text in a rubric -- it gets cited without the source being opened. Describe, point
to the section, let the lens fetch the words.

Verify every section pointer against the RFC text before writing it. Several have been wrong.
