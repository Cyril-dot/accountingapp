# SikaBooks — a clean-room accounting & POS app for Ghana small businesses

Working name: **SikaBooks** (*sika* is "money" in Akan). Rename before release.

This workspace is the home of the rebuild described in the plan: our own
accounting, inventory, invoicing and point-of-sale app, built clean-room — same
*kind* of app as "Accounting Bookkeeping" by Tacktile Systems, but our own code,
name, screens and wording. Nothing is copied from the proprietary APK.

## What is in the workspace

| Item | What it is |
|---|---|
| `simple-accounting-bookkeeping.apk` | The proprietary app. Study object only — never decompiled for code, text, images or branding. |
| `rea-main.zip` | morluto/rea v6.9.0 (MIT) — lawful reverse-engineering study tool. |
| `astryx-main.zip` | meta/astryx `@astryxdesign/core` v0.7.17 (MIT) — design source (tokens, patterns). |
| `floorplan-main.zip` | haydenschmitty/floorplan v0.11.0 (MIT) — codebase map + health check. |
| `inspected/` | Working copies of key metadata files read to verify the zips. |
| `LICENCES.md` | Zip verification and licence inventory — the clean-room + licence tripwire. |
| `docs/data-model.md` | The accounting data model (entities, money rules, double-entry mappings). |
| `docs/feature-spec.md` | Feature spec with a proposed v1 scope. |

## Status

- [x] Verified all three zips: owners confirmed (morluto, meta, haydenschmitty), all MIT.
- [x] Confirmed APK identity (size + SHA-256 + archive layout) without decompiling code.
- [x] Wrote the licence inventory (`LICENCES.md`).
- [x] Wrote the data model (`docs/data-model.md`) — pesewa integers + balanced double-entry.
- [x] Wrote the feature spec (`docs/feature-spec.md`).
- [x] Phase 0 decisions recorded — see "Decisions" below.
- [x] Flutter repo scaffolded (android + ios), `flutter analyze` clean.
- [x] Core engine: integer-pesewa money, tax math, double-entry journalizer.
- [x] Drift SQLite schema + seed (chart of accounts, Ghana tax rates, payment methods).
- [x] Posting services (sale/purchase/payment/expense) + reports; 41 tests passing.
- [x] Onboarding + dashboard screens, PIN hashing, Riverpod wiring; 48 tests passing.
- [x] Transaction screens (sell, purchase, payment, expense), inventory, parties,
      and reports behind a bottom-nav shell.
- [x] PIN lock on launch, invoice list, per-account ledger, money-owed.
- [x] Invoice PDF generation + WhatsApp share (pdf/share_plus); 52 tests.
- [ ] POS (barcode + printer), backup/export to file.

## Decisions (Phase 0, resolved)

| Question | Decision |
|---|---|
| Platform & stack | **Flutter** — one codebase for **Android + iOS**. |
| Licence | **MIT (open source)** — see `LICENCES.md`; GPL code is still ideas-only, LGPL only as unmodified libraries. |
| Audience | **Both** — a single shop works out of the box; multi-shop is supported (the data model is already scoped by `shop_id`). |
| App name | Working name **SikaBooks**; rename before release. |
| Feature list (v1) | The `docs/feature-spec.md` "must-have" cut, with multi-shop promoted to in-scope. |

## Next step

Build the first screens — onboarding (business + shop setup + PIN) and the dashboard —
on top of the already-tested data layer in `app/lib/data/`.
