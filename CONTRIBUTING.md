# Contributing

Thanks for helping make this Quarto theme easier to reuse. This repository is
public, so all contributions must be self-contained and safe to publish.

## Project Boundaries

This repository is for Quarto theme and extension work inspired by the public
Háskóli Íslands design standard at <https://honnun.hi.is/>.

Good contributions include:

- Quarto extension metadata.
- SCSS/CSS theme files.
- Website, book, and RevealJS examples.
- Public-safe documentation.
- Small synthetic fixtures used only to demonstrate styling.

Do not contribute:

- Academic-profile data-processing logic.
- Personal academic records, CV source data, evidence files, or generated
  personal site output.
- Private repository names, URLs, workflows, or deployment details.
- Real student, personnel, research, or assessment records.
- Third-party brand assets unless redistribution is clearly allowed.

## Workflow

1. Create a branch from `main`.
2. Keep changes focused and reviewable.
3. Open a pull request into `main`.
4. Use squash merge for completed pull requests.
5. Delete merged feature branches.
6. Tag releases when publishing usable theme versions.

Use clear branch names such as:

- `docs/readme-installation`
- `theme/revealjs-title-slide`
- `examples/book-demo`

## Rendering Expectations

When a change affects an example or output format, render the relevant Quarto
example before requesting review.

Suggested checks, once examples exist:

```bash
quarto render examples/website
quarto render examples/book
quarto render examples/slides
```

For style-only changes, include screenshots or rendered output in the pull
request when that makes the review easier.

## Example Content

Examples must be synthetic or public-safe. Prefer:

- Fictional people, courses, projects, departments, events, and datasets.
- Small made-up tables or charts.
- Minimal placeholder text in Icelandic and English.
- Public design-standard references with attribution.

Avoid examples that look like copied internal pages, private academic profiles,
student records, grant files, or personnel documents.

## Releases

Use semantic version tags once the extension is installable:

- Patch releases for documentation fixes and small theme corrections.
- Minor releases for new components, formats, or examples.
- Major releases for breaking extension or theme changes.

Release notes should summarize supported Quarto formats, visible styling
changes, migration notes, and any design-standard attribution updates.
