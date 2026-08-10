# Normative language — BCP 14 (RFC 2119, RFC 8174)

**Text:** `rfc2119.txt`, `rfc8174.txt`

## Scope

Whether the document's conformance requirements can be conformed to — who is bound, and whether that
party can tell.

The text supplies the keywords' meaning rather than a position to test the design against, so
findings here are about the draft's own sentences.

**Not covered:** whether they are the right requirements, or whether the design is sound. Those are
the other lenses.

## Firing

**Always.** A standards-track document with no BCP 14 keywords at all is itself the finding.

Needs the actor table: tests 1 and 2 both ask which party, and the table is the party list.

## The sweep

List every sentence containing an uppercase MUST, MUST NOT, REQUIRED, SHALL, SHALL NOT, SHOULD,
SHOULD NOT, RECOMMENDED, NOT RECOMMENDED, MAY or OPTIONAL. Record section and sentence. Run every
test below against each.

Then sweep the other way for test 7, which the keyword list cannot reach.

## The tests

1. **Target.** Who is bound? Context counts — a section scoped to one party carries down its
   sentences, and that is ordinary drafting. The finding is where the inference does not land: no
   candidate, two candidates, or one the sentence then contradicts.

   *Parameters MUST NOT be ignored* is the shape to catch. Read against the cache it fails test 2;
   read against the origin the verb is wrong, since origins declare which parameters may be ignored
   rather than ignoring them. Two candidates and neither works — that is the finding, not the
   passive voice on its own.

   Exempt: syntax constraints on a value — *the value MUST be a dictionary*. Raise one only where
   the document leaves sender-side validity and receiver-side rejection genuinely undecided, and
   argue that rather than asserting it.

2. **Decidable by the target.** Can the bound party evaluate its own conformance from information it
   holds? A cache told not to ignore a parameter *if doing so would bypass server processing* cannot
   — it knows nothing of the server's processing. Check the terms the requirement turns on: one the
   document never defines makes the requirement undecidable even where the party is named.

   Not the same as observable on the wire. Requirements over internal behaviour are legitimate; a
   requirement its own subject cannot evaluate is not.

3. **SHOULD without exceptions.** RFC 2119 §3 puts the burden on understanding the implications
   before departing, so the document has to say what would justify it. Without that the requirement
   is a MUST or a MAY in disguise. §4 is the same for SHOULD NOT.

4. **MUST without consequence.** RFC 2119 §6 confines these keywords to what interoperation requires
   or what limits harm. What breaks when it is violated? Implicit is fine, unanswerable is not.

5. **MAY without the peer's obligation.** RFC 2119 §5 binds implementations on both sides of an
   option to interoperate across it. Where a MAY changes what a peer sees, is the peer's obligation
   stated?

6. **Keyword in a non-normative context.** A requirement in an example, a note, an appendix, or a
   Security or Privacy Considerations rationale paragraph. Usually means it belongs in the body.

7. **Declarative doing normative work.** Behavioural statements carrying a requirement with no
   keyword. Look hardest at the sentence the specification exists for — it is often the one written
   as description. RFC 8174 makes lowercase *must* and *should* non-normative, so a lowercase keyword
   in a requirement sentence is a defect.

8. **Contradiction and unreachability.** Two requirements that cannot both be satisfied; one whose
   antecedent cannot occur; a MUST some MAY elsewhere overrides.

9. **A party the protocol cannot bind.** Requirements on operators, content authors, deployments.
   Not wrong in itself — raise it where the document's guarantees rest on it.

10. **Boilerplate.** RFC 8174 boilerplate present, and matching the keywords used. Nit-level.

## Suppression

This fires on every draft and will always return something. Report only where the defect changes
what an implementer builds, or forces a decision the authors have not taken.

## Return

The sweep table — section, sentence, target, verdict — then the findings, each naming the test it
failed and quoting the text.
