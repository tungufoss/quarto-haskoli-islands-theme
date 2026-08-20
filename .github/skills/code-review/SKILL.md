---
name: code-review
description: Review pull requests for this public Quarto Háskóli Íslands theme repository, with attention to Quarto extension structure, SCSS boundaries, examples, render checks, design-standard attribution, public-safe assets, release discipline, and repository scope.
---

# Code Review Skill

Use this skill when reviewing pull requests for this public Quarto theme and
extension repository.

## Review Priorities

Prioritize actionable findings that would affect correctness, maintainability,
public safety, or release quality. Prefer specific comments tied to changed
files and lines. Do not block on style preferences unless they create real
maintenance, accessibility, licensing, or rendering risk.

## Repository Scope

This repository is for reusable Quarto theme and extension assets inspired by
the public Háskóli Íslands / University of Iceland design standard.

Flag changes that introduce or depend on:

- Academic-profile data-processing logic.
- Personal academic records, CV data, evidence files, private exports, or
  generated personal website output.
- Private repository names, internal URLs, local paths, credentials, tokens, or
  MCP secrets.
- Real student, personnel, assessment, research, grant, or reporting records.
- Build or deployment logic that assumes private systems.

Keep examples synthetic or clearly based on public, cited source material.

## Quarto Extension Structure

When extension files are changed, check that the structure follows Quarto
extension conventions and remains reusable outside a single site:

- Extension metadata should be clear, minimal, and installable with standard
  Quarto extension workflows.
- Format-specific assets should be organized by target format when practical:
  website, book, and RevealJS slides.
- Example projects should demonstrate use of the extension without depending on
  private data, absolute local paths, or generated personal-site output.
- Documentation should explain installation, rendering, supported formats, and
  any required Quarto version or external dependency.

Flag changes that make the package theme-specific and data-pipeline-specific at
the same time. The theme belongs here; academic data transformation logic does
not.

## SCSS And Theme Boundaries

Review SCSS, CSS, and theme defaults for separation of concerns:

- Keep reusable variables, tokens, typography, colours, and component rules in
  theme files rather than duplicating them in examples.
- Keep website, book, and RevealJS rules separated where their Quarto rendering
  models differ.
- Avoid hard-coded personal content, one-off page IDs, or selectors that only
  work for a private website.
- Avoid adding generated CSS when SCSS source is the maintained input, unless
  the release workflow explicitly requires the generated file.
- Check accessibility basics: contrast, focus visibility, readable type sizes,
  and reasonable behavior in print or exported formats when relevant.

If a visual change is hard to judge from code alone, ask for rendered output or
screenshots.

## Examples And Render Checks

For changes that affect output, verify that the pull request explains what was
rendered. Once examples exist, expect relevant checks such as:

```bash
quarto render examples/website
quarto render examples/book
quarto render examples/slides
```

Review examples for all supported formats when relevant:

- Website examples should cover navigation, listings, callouts, typography, and
  common page layouts.
- Book examples should cover chapter structure, title pages, cross-references,
  callouts, and export-friendly defaults.
- RevealJS examples should cover title slides, section dividers, typography,
  colour treatments, and common slide components.

Do not require every format for documentation-only changes. Do ask for targeted
render checks when SCSS, extension metadata, filters, templates, or examples
change visible output.

## Háskóli Íslands Design Standard Attribution

The visual direction is based on the public Háskóli Íslands design standard,
HÖNNUNARSTAÐALL HÍ: https://honnun.hi.is/.

Check that relevant documentation and release notes:

- Attribute the public design standard at https://honnun.hi.is/.
- Avoid implying official endorsement, ownership, or approval by Háskóli
  Íslands unless that status is explicitly established.
- Avoid redistributing protected marks, fonts, images, templates, or other
  third-party assets unless the repository documents that redistribution is
  allowed.

Prefer wording such as "based on the public design standard" rather than
"official theme" unless the project becomes official.

## Public-Safe Assets

Review added assets and fixtures carefully:

- Prefer synthetic data, placeholder names, simple demo charts, and small
  public-safe examples.
- Require clear licensing or attribution for third-party assets.
- Flag source PDFs, certificates, invitations, private screenshots, internal
  reports, credentials, and exported generated site files.
- Keep binary assets small and necessary for theme demonstration.

## Release Discipline

For release-facing changes, check that:

- Versioning and tags follow the documented release workflow once the extension
  is installable.
- Release notes summarize supported Quarto formats, visible theme changes,
  migration notes, render checks, and attribution updates.
- Breaking changes are documented clearly.
- README, CONTRIBUTING, LICENSE, AGENTS.md, and examples stay consistent when
  project boundaries or release workflow change.

## Review Output

Lead with concrete findings ordered by severity. Include missing render checks,
public-safety risks, licensing or attribution concerns, and release blockers
when present. If there are no issues, say so and note any residual risk, such
as examples not yet rendered or visual output not available.
