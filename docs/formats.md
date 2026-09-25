# Supported Formats

This repository provides an initial reusable Quarto extension skeleton for
Háskóli Íslands / University of Iceland themed outputs.

The visual direction is based on the public Háskóli Íslands design standard,
HÖNNUNARSTAÐALL HÍ: <https://honnun.hi.is/>. This project does not imply
official endorsement, ownership, or approval by Háskóli Íslands.

## Initial Entry Points

- `haskoli-islands-html`: shared HTML theme for standalone documents, websites,
  and books.
- `haskoli-islands-revealjs`: RevealJS slide theme using the same shared tokens,
  with a generated title slide, `{{< hi-contact >}}` closing slide,
  `{{< pause >}}` break countdown and Mentimeter slides.

## Planned Refinements

- Book-specific title-page and chapter-opening treatments.
- Website navigation and listing components beyond Quarto defaults.
- Slide component helpers for section dividers and agendas.
- Optional brand asset integration if redistribution terms are confirmed.

## Verification

Render the examples from the repository root:

```bash
quarto render template.qmd
quarto render examples/website
quarto render examples/book
quarto render examples/slides/slides.qmd
```
