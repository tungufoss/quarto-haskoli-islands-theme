# quarto-haskoli-islands-theme

Reusable Quarto theme and extension assets for Háskóli Íslands / University
of Iceland style across Quarto websites, books, and RevealJS slides.

This repository is intended to be public, self-contained, and safe to reuse.
It contains theme-facing documentation and, as the project grows, should contain
only Quarto extension code, styling, examples, and release metadata.

## Status

Initial Quarto extension skeleton. The repository includes a reusable format
extension, shared SCSS tokens, HTML and RevealJS entry points, and public-safe
examples for websites, books, and slides.

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

## Extension Layout

```text
_extensions/haskoli-islands/
  _extension.yml
  html.scss
  revealjs.scss
  theme/
    _tokens.scss
    _rules.scss
```

The shared token and rule files provide the first reusable styling layer. The
HTML entry point is used by standalone documents, websites, and books. The
RevealJS entry point provides slide-specific defaults while reusing the same
tokens.

## Supported Entry Points

- `haskoli-islands-html`: initial HTML theme for standalone documents, Quarto
  websites, and Quarto books.
- `haskoli-islands-revealjs`: initial RevealJS slide theme.

Book-specific title-page and chapter-opening refinements are planned; the
current book example renders through the shared HTML theme.

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

Install the extension into an existing Quarto project with:

```bash
quarto add tungufoss/quarto-haskoli-islands-theme
```

Then use one of the contributed formats:

```yaml
format:
  haskoli-islands-html: default
```

or:

```yaml
format:
  haskoli-islands-revealjs: default
```

## Start a New Presentation

```bash
quarto use template tungufoss/quarto-haskoli-islands-theme
```

This installs the extension and copies `template.qmd`, a starter slide deck.
The slides use the look of the `quarto-hi` / CDIO 2026 decks: turquoise title
and focus slides, grey content slides with a watermark, and a blue footer bar
with the logo. The canvas is 1280×720.

```yaml
pagetitle: "Presentation Title"
title-theme: "Department / Course"
subtitle-highlight: "Your Presentation Title"
subtitle-position: below          # optional: title above the theme line
presenters:
  - name: "Your Name"
    hi-username: "username"       # gives username@hi.is and the staff page link
    orcid: "0000-0000-0000-0000"
    github: "yourusername"
event-meta: "Event Name"
event-date: today
watermark: img/hi/hi_logo.svg     # your own copy; embedded in the page
favicon: img/hi/favicon.svg
format:
  haskoli-islands-revealjs:
    logo: img/hi/hi_named_logo-en.svg
    footer: "Event Name · Your Name · username@hi.is"
```

HÍ logos and photos are not bundled (see Design Source). Point `watermark`,
`favicon` and `logo` at your own copies.

### Slide Features

| Feature | Usage |
|---|---|
| Title slide | `{{< hi-title >}}` as the first slide, built from the YAML above |
| Contact card | `{{< contact-card >}}` lists every presenter, with one shared institution line (`affiliation`, default Háskóli Íslands / University of Iceland, plus `office`, e.g. "VR-II"). Usually on a `## Questions? {.focus-slide}` slide in a `.two-col` layout with a `.contact-photo` image |
| Break with countdown | `{{< pause 300 >}}` (seconds; rings a bell at zero) |
| Mentimeter | Set `menti_url`, `menti_code`, `menti_qr` in YAML, then `## {.focus-slide .menti-login intro="Scan to join"}` for the join slide and `## {data-menti="true"}` for an embedded question |
| Icon cards | `::: {.fa-card cols=2}` with lines `- icon | **Title** | text` |
| Layouts and text | `.two-col`, `.img-split`, `.steps`, `.statement`, `.lead`, `.kicker`, `.slide-subtitle`, `.lean-in` and more; see `_extensions/haskoli-islands/revealjs.scss` |
| Teal slide | `{.focus-slide}` on any slide heading |
| Icelandic | `lang: is` gives "Pása" and Icelandic dates for `event-date: today` |

### Network Dependencies

The Jost font (Google Fonts) and Font Awesome icons (cdnjs) are loaded from
the web when a page is viewed. Offline, pages fall back to system sans-serif
fonts and the icons on title, contact and card slides are missing. For
offline use, download Jost (SIL Open Font License) and Font Awesome Free and
replace the links under `include-in-header` in `_extension.yml` with local
files.

## Updating Existing Projects

```bash
quarto update extension tungufoss/quarto-haskoli-islands-theme
```

Commit the updated `_extensions/` folder. Pages, books and slides all read the
same palette and font from `theme/_tokens.scss`, so one update keeps every
output in sync.

## Examples

The examples contain only synthetic, public-safe Icelandic and English content.
Render them from the repository root:

```bash
quarto render template.qmd
quarto render examples/website
quarto render examples/book
quarto render examples/slides/slides.qmd
```

Nested examples include a local copy of the extension so each example project can
render directly during development.

## License

Code and documentation in this repository are released under the MIT License.
See [LICENSE](LICENSE).

Third-party brand assets, marks, typefaces, design-standard source material,
and Háskóli Íslands identity materials may have their own terms. Attribute the
public design standard at <https://honnun.hi.is/> and avoid redistributing
third-party assets unless their license allows it.
