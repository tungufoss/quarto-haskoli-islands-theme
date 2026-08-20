# Agent Instructions

This repository is a public Quarto theme and extension repository for Haskoli Islands / University of Iceland presentation styles. It should provide reusable, public-safe theme assets for Quarto websites, books, and slides.

The repository must be safe for public reuse. Do not add private personal data, private evidence files, academic reporting records, or data-processing pipeline logic.

## Scope

Keep this repository focused on presentation and Quarto integration:

- Quarto extension metadata.
- SCSS/CSS theme files for website, book, and RevealJS slide formats.
- Layout partials, title blocks, callout styling, and reusable visual components.
- Public-safe examples for Icelandic and English documents.
- Documentation showing how to install and use the theme.

Do not put these concerns here:

- Academic-profile parsing, validation, CV selection, evidence tracking, or reporting logic.
- Personal academic records belonging to one specific site or person.
- Private source PDFs, certificates, invitations, correspondence, or reporting records.
- Generated personal websites, generated personal CV PDFs, or private reports.

## Public Examples

- Examples must use synthetic, placeholder, or clearly public-safe content.
- Do not copy private CV entries, private publication overrides, private project records, or private reporting data into examples.
- Avoid examples that imply endorsement by an institution unless that use is explicitly appropriate.
- If logos, fonts, or brand assets are included, document their source and usage expectations.

## Architecture

- Keep website, book, and slide styling related but modular.
- Prefer Quarto extension conventions over ad hoc setup steps.
- Keep theme variables documented and reusable.
- Keep language-specific defaults explicit; support Icelandic and English without hard-coding one user's site structure.
- Avoid coupling theme components to a specific data pipeline. Theme components may style generic generated markup, but they should not require a particular private repository.

## Development Workflow

- Work on branches; do not push feature work directly to `main`.
- Use pull requests and squash merge.
- Delete branches after merge.
- Keep changes small and reviewable.
- Test relevant examples before merging, especially when changing SCSS, Quarto extension metadata, or format defaults.
- Update documentation when changing install instructions, extension names, or user-facing options.
- Tag releases for usable theme versions.

## Release Expectations

Before tagging a release:

- At least one minimal example should render for every format claimed by the release.
- Installation/use instructions should match the released extension layout.
- Version/release notes should identify breaking changes.
- No private or person-specific data should be present in the repository.