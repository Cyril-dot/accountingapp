# Zip verification and licence inventory

Date verified: 2026-11-19
Workspace: `C:\Users\USER\Desktop\Acc app`

This file records what each downloaded zip actually is, who owns it, and under what
licence it may be used. It is the tripwire the rebuild plan asks for, so nobody
borrows GPL/LGPL code by accident later. Every fact below was read from the files
inside each zip (LICENSE, package.json, README), not assumed.

## 1. rea-main.zip — morluto/rea (Reverse Engineer Anything)

| Field | Observed value |
|---|---|
| Package name | `rea-agents` |
| Version | `6.9.0` |
| Licence | **MIT** — `LICENSE` says "Copyright (c) 2026 morluto" |
| Repository | `https://github.com/morluto/rea` (from `package.json` `repository` field) |
| MCP id | `io.github.morluto/rea` |
| Description | "Reverse engineer anything from your terminal or agent with one CLI and MCP server." |

**Owner check: PASS.** The owner is `morluto`, exactly as the plan required. This is
the official repo, not a lookalike.

### REA's own terms (from its DISCLAIMER.md) — the clean-room line

REA is built for lawful analysis only. Its disclaimer states it will NOT help with:

- copying proprietary software or reproducing its protected code and assets;
- circumventing DRM, license checks or other technical protection measures.

It says in plain words: *"Obtaining source-like output or an analysis report does not
grant rights to the original program, its data, or the generated output."*

**Consequence for this rebuild:** REA may be used to study how an app behaves so we can
write our own version. It may NOT be used to lift the Tacktile APK's code, text, images,
or branding. The original APK stays a study object, never a source of material to copy.

## 2. astryx-main.zip — meta/astryx (Meta's design system)

| Field | Observed value |
|---|---|
| Package name (root) | `astryx` (workspace root, private) |
| Core package | `@astryxdesign/core` version `0.7.17` |
| Licence | **MIT** — `LICENSE` says "Copyright (c) 2026 Meta Platforms, Inc." |
| Repository | `https://github.com/meta/astryx` (from `packages/core/package.json`) |
| Status | "Currently in Beta" (README) |
| Stack | React 19+, StyleX |

**Owner check: PASS.** The owner is `meta` (Meta Platforms, Inc.).

**Usage in this rebuild:** Astryx is a web React design system, so its components do
not drop into a native app. We use it as the design source only — theme tokens, colour,
spacing, type scale, dark-mode and component patterns — translated into the app's own
UI toolkit. MIT permits this with attribution; no code is pasted in.

## 3. floorplan-main.zip — haydenschmitty/floorplan

| Field | Observed value |
|---|---|
| Package name | `floorplan` |
| Version | `0.11.0` (CHANGELOG, 2026-11-16) — note: the plan's earlier note said 0.2.0; the zip is 0.11.0 |
| Licence | **MIT** — `LICENSE` says "Copyright (c) 2026 Hayden Smith" |
| Repository | `https://github.com/haydenschmitty/floorplan` (README badge) |
| Type | Claude Code / Codex plugin, zero runtime dependencies |

**Owner check: PASS.** Owner is `haydenschmitty` (Hayden Smith).

**Usage in this rebuild:** maps the codebase from day one and runs a health check that
flags secrets in code, open endpoints, unused files, and oversized files. MIT licensed.

## 4. The APK — provenance only, not a source

File: `simple-accounting-bookkeeping.apk`

| Field | Observed value |
|---|---|
| Size | 13,074,189 bytes = 12,767.8 KiB (matches the plan's "12,768 KB") |
| SHA-256 | `CD3A042BB2135040024CDD4E7B0DFD5F2DB950E6FC111F529B5E5887FBF7FC47` |
| Layout | Valid APK archive: `AndroidManifest.xml`, 2 dex files, `resources.arsc`, `res/`, `lib/`, Kotlin metadata, Firebase/Play Services |

This is the proprietary Tacktile Systems app ("Accounting Bookkeeping",
`com.accounting.bookkeeping`). We only record its identity and size. It is **never**
decompiled for code, screens, text, images or branding. Features for our rebuild are
written from the public Play Store description and general accounting/POS knowledge.

## Open-source POS references (borrow ideas, respect licences)

| Reference | Licence | How we may use it |
|---|---|---|
| opensourcepos/opensourcepos | MIT | Study, adapt flows, even reuse logic with attribution. First read for the sale screen. |
| odoo/odoo (POS) | LGPL-3.0 (Community) | Link/keep separate; if we modify and ship its code, changes stay LGPL. Do not paste into a closed app. |
| frappe/erpnext (POS) | GPL-3.0 | Borrow ideas and data model only, not code, unless the rebuild itself goes open source. |
| ZXing | Apache-2.0 | Barcode scanning library. |
| Google ML Kit | Free SDK | Camera barcode scanning. |

## Rule of thumb going forward

This rebuild is **MIT (open source)** (Phase 0 decision). That still does not make GPL
code free to copy: putting GPL code into an MIT project would force the *whole* app to
be GPL. So:

- MIT → usable with attribution.
- Apache-2.0 → usable with attribution and notice.
- LGPL → only as an unmodified separate library, never copied in.
- GPL → ideas only (copying it would relicense us to GPL, which conflicts with MIT).
- The Tacktile APK → study behaviour only, copy nothing.
