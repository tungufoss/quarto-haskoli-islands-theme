# quarto-haskoli-islands-theme

Reusable Quarto theme and extension assets for Háskóli Íslands / University
of Iceland style across Quarto websites, books, and RevealJS slides.

This repository is intended to be public, self-contained, and safe to reuse.
It contains theme-facing documentation and, as the project grows, should contain
only Quarto extension code, styling, examples, and release metadata.

## Status

Early project setup. The repository currently documents the intended scope and
public contribution rules before the first packaged Quarto extension release.
Expect the extension layout, example projects, and rendered examples to evolve.

## Design Source

The visual direction is based on the public Háskóli Íslands design standard,
HÖNNUNARSTAÐALL HÍ: <https://honnun.hi.is/>.

This project should cite and respect that source. Unless this repository is
explicitly made official by Háskóli Íslands, describe it as reusable Quarto
theme assets based on the public design standard. Do not imply official
endorsement, ownership, or approval.

## Scope

- Quarto extension metadata and theme files.
- Styling for Quarto websites.
- Styling for Quarto books.
- Styling for Quarto RevealJS presentations.
- Synthetic, public-safe examples in Icelandic and English.
- Documentation for installation, rendering, contribution, and release workflow.

## Planned Formats

- `website`: navigation, typography, colours, callouts, listings, and page
  layouts suitable for Quarto websites.
- `book`: chapter structure, title pages, cross-references, callouts, and
  printable/export-friendly defaults.
- `revealjs`: slide typography, section dividers, title slides, colour
  treatments, and common presentation components.

## Non-Goals

This repository must not include:

- Academic-profile data-processing logic.
- Personal academic records, evidence files, CV source data, or private exports.
- Generated personal website output.
- Private repository references or instructions that depend on private systems.
- Examples containing real personal, student, personnel, or research records.

## Public-Safe Examples

Examples should use placeholder names, fictional course descriptions, synthetic
tables, simple demo charts, or public-safe institutional text. When an example
needs source material, prefer small synthetic fixtures or clearly cited public
content.

## Installation

No released Quarto extension package is published yet. Once the extension files
are added, installation will follow the standard Quarto extension workflow, for
example:

```bash
quarto add tungufoss/quarto-haskoli-islands-theme
```

Until then, clone the repository to review the documentation and proposed
project boundaries.

## License

Code and documentation in this repository are released under the MIT License.
See [LICENSE](LICENSE).

Third-party brand assets, marks, typefaces, design-standard source material,
and Háskóli Íslands identity materials may have their own terms. Attribute the
public design standard at <https://honnun.hi.is/> and avoid redistributing
third-party assets unless their license allows it.
