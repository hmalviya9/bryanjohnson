# v2 Design Brief — Bryan Johnson / Indian Longevity Dossier

**Drafted:** 2026-04-20
**Status:** PROPOSAL — no final HTML until outstanding verification items resolve.
**Inputs read:** `bryan-johnson-receipt.html`, `data/claims.json`, `data/verified_biology.json`, `data/verified_mortality.json`, `data/verified_prices.json`, `data/review_devil.json`, `data/review_sme.json`.

---

## 1. Preserved v1 Strengths (keep these)

The newspaper-dossier aesthetic is doing real work. The following elements should survive into v2:

- **Masthead "File № 001 · DOSSIER / LONGEVITY"** — frames this as an investigative document, not a listicle. Tone-setter.
- **Fraunces display + Instrument Serif body + JetBrains Mono for data** — editorial type hierarchy. Keeps forensic mood without feeling aggressive.
- **Paper-tone palette** (`#F2ECDD` paper, `#1A1611` ink, `#B91C1C` blood-red accent, `#1F5F3F` forest-green for the Indian side). Two-team colour system is already semantically correct.
- **Receipt metaphor** with perforated edges, dashed separators, barcode, and circular stamp. Single strongest visual device on the page; doubles as shareable image if cropped.
- **Two-cell hero verdict pair** (BJ annual burn vs You equivalent stack) — side-by-side comparison is legible at a glance.
- **Swap matrix** (BJ column → local column with arrow) — the core IP of the page; v2 keeps the layout but upgrades the content per claim card spec (see §3).
- **Spend-breakdown cards** with category %, bar, and descriptive copy — good at showing the ₹17 cr is 97.5% non-food.
- **Verdict card** (black background, stamp, pull ratio) — shareable asset.
- **Pull-quote break** between sections — gives the eye a rest and introduces a third voice.
- **Sources & Methodology section with numbered list** — existing structure is sound; v2 expands it into a verification-status legend.
- **"For educational use · not medical advice" footer** — keep, expand into §5 legal panel.

---

## 2. v2 Information Architecture

Ordered section list. Each section states purpose and the claim IDs (from `claims.json`) it is responsible for.

**S0 · Masthead + capture-date strip** *(new)*
Purpose: Version identity + honest timestamp. Displays "Dossier v2.0 · Captured 2026-04-20 · FX ₹85/USD · Next refresh 2026-07-20."
Claim IDs: meta.dossier_date, meta.fx_rate_used_in_dossier.

**S1 · Hero (replacement headline)** *(re-anchored)*
Purpose: Bounded headline stat — see §4 for three candidates.
Claim IDs: macro_bj_annual, macro_alt_daily, macro_empirical_audit. Retires macro_ratio.

**S2 · Verification-status legend** *(NEW)*
Purpose: Teach the reader how to read badges before they meet them. Three badges:
- **VERIFIED** (forest-green) — tier-1 source cited, number matches.
- **FLAGGED** (gold) — directionally correct but with material caveats (dose, subgroup, bioavailability, seasonality).
- **UNVERIFIED** (outline-only, no fill) — claim is in the protocol but we have not sourced it; do not act on.
Claim IDs: covers meta.biology_trust_tiers — the legend is the UI expression of that tier system.

**S3 · Scope honesty panel — "What we did NOT replicate"** *(NEW, high priority)*
Purpose: Kills the Devil's Advocate "92% of spend not replicated" critique up-front. Shows a pie/bar of BJ's $2M with the food+supps 2.5% slice highlighted, and a plain statement: "This dossier prices that 2.5% slice. The other 97.5% — medical team, experimental therapies, diagnostics, imaging, equipment — is NOT replicated at these prices."
Claim IDs: burn_medical_team, burn_experimental, burn_diagnostics, burn_staff_ops, burn_equipment, burn_food_supp.

**S4 · The Daily Receipt (BJ replica + Indian alt)** *(preserved, corrected)*
Purpose: Line-by-line per-day cost comparison.
Claim IDs: all of section C (bj_*) and section D (alt_*). Fix: C sums to ₹3,062 not ₹2,683 per Devil's Advocate arithmetic attack — acknowledge inline.

**S5 · Annual Burn Breakdown** *(preserved)*
Purpose: Visualise where BJ's $2M goes.
Claim IDs: B_annual_burn_breakdown entries.

**S6 · The Swap Matrix (per-claim cards)** *(re-designed)*
Purpose: One card per ingredient swap with full anatomy per §3.
Claim IDs: E_swap_pairs (9 swaps).

**S7 · Seasonal Substitution Calendar** *(NEW)*
Purpose: Address Devil's Advocate seasonality attack. A 12-month × ingredient matrix showing when jamun (May–Jul), amla (Oct–Mar), pomegranate (Sep–Feb), Kashmiri walnut (Oct harvest) are in-season vs frozen/dried fallback.
Claim IDs: swap_blueberry_jamun, alt_seasonal_fruit, alt_amla_pom.

**S8 · Indian Genetic Context** *(NEW)*
Purpose: Surface the SME "Indian genetic context unaddressed" systemic issue. Four collapsibles:
- **FADS1/FADS2** — high-frequency South Asian variants; depress ALA→EPA conversion; impacts walnut swap.
- **OCTN1 / SLC22A4** — null variants don't retain ergothioneine; impacts mushroom swap.
- **APOE** — ε4 prevalence; interacts with saturated fat load from ghee/dairy.
- **Lp(a)** — elevated in South Asians; not modifiable by diet; flags labs section.
Claim IDs: attaches to swap_macadamia_walnut, swap_shiitake_oyster, alt_ghee, lab_apob_lpa.

**S9 · Contraindications Layer** *(NEW)*
Purpose: Cross-cutting safety panel — Devil's Advocate CRITICAL flag. Items:
- Mustard oil + erucic acid + elevated ApoB / CAD.
- A2 ghee + high saturated fat + Indian baseline LDL.
- Ashwagandha + pregnancy / autoimmune / thyroid.
- Sauna + uncontrolled hypertension / pregnancy / CAD.
- CGM in non-diabetics + over-interpretation risk.
- NMN + FSSAI regulatory ambiguity.
- Moringa (powdered) + heavy-metal load + pregnancy.
Claim IDs: attaches to alt_mustard_oil, alt_ghee, alt_ksm66, swap_nmn_diet, alt_moringa_methi; also surfaces on each relevant swap card.

**S10 · PM2.5 + Water Quality — the #1 modifier** *(NEW)*
Purpose: SME flagged this as the largest absent lever. Per GBD India, PM2.5 is the #1 or #2 all-cause mortality risk factor — larger than any diet intervention. Cards:
- PM2.5 exposure map (metro-level annual averages: Delhi 110 µg/m³, Mumbai 55, Bangalore 35, vs WHO 5).
- Indoor mitigation: HEPA filters (Rs 15–40k one-time), N95/FFP2 on AQI>200 days.
- Water TDS / arsenic / fluoride context — Gangetic plain arsenic, South India fluoride, urban lead leaching. Recommended tests (Rs 1,500–3,000) and RO/UV filter price band.
Claim IDs: NEW — draft as `env_pm25`, `env_water_tds`. Not yet in claims.json; add in next iteration.

**S11 · The Core Truth — Free 5 (corrected)** *(preserved, numbers fixed)*
Purpose: Show that the foundation does 90% of the work.
Claim IDs: free5_smoking (50%), free5_weight (**15–20%**, corrected from 40%), free5_exercise (20–35% dose-dependent), free5_bp (25–30% high-risk only), free5_diet (**21%**, corrected from 25%), nuts_adventist, legume_loma (**6%**, corrected from 8%), sauna_finnish (40% all-cause, 50% fatal CVD — with cohort caveat).

**S12 · Lifestyle Protocol** *(preserved, timestamped)*
Purpose: Sleep + exercise + fasting + weight-loss context.
Claim IDs: life_sleep, life_exercise, life_fasting, life_weight_loss — each tagged with Blueprint version + capture date per Devil's Advocate stale-protocol attack.

**S13 · Devices + Labs (NEW — fills SME blocker #4)**
Purpose: The measurement layer. Two subsections:
- **Devices (Indian market):** Ultrahuman Ring Air ₹19,999, M1 CGM, Indian BP monitors, smart scales, HBOT per-session at Indian clinics, IR sauna options, RLT caps (CDSCO-registered only).
- **Labs (Indian panels):** ApoB, Lp(a), HbA1c, fasting insulin, advanced lipid, hormone panel, DunedinPACE availability, CAC score.
Claim IDs: H_devices_equipment (all), I_labs_diagnostics (all).

**S14 · Legal / Regulatory Disclaimers** *(NEW)*
Purpose: Collect every regulatory flag the Devil's Advocate surfaced into one panel. Expandable items:
- FSSAI Nutraceutical Regulations 2022 (NMN status).
- CDSCO / ICMR-DBT 2017 (stem cells, peptides, gene therapy).
- AYUSH + DMRA 1954 (therapeutic claim language).
- Medical Devices Rules 2017 (CDSCO registration for RLT, HBOT, CGM).
- Consumer Protection Act 2019 (misleading advertisement risk).
- FSSAI Health Claims Regulation 2022 (nutrient/disease claims).
- ASCI 2023 (affiliate disclosure).
Claim IDs: n/a — cross-cutting; references review_devil.legal_and_regulatory_flags.

**S15 · Sources & Methodology (expanded)** *(preserved)*
Purpose: Full citation ledger, trust-tier legend, Wayback capture references.
Claim IDs: meta.biology_trust_tiers + every source URL across verified_* files.

**S16 · "Known Limitations" honesty panel** *(preserved, expanded)*
Purpose: Public acknowledgement of the five arithmetic/rounding errors Devil's Advocate surfaced.

**S17 · Share block + footer** *(preserved)*

---

## 3. Per-Claim Card — Visual Anatomy

Each swap, mortality claim, or price claim renders as a card with this structure (top-to-bottom):

```
┌──────────────────────────────────────────────────────────┐
│ [VERIFIED] [FLAGGED] or [UNVERIFIED]   last-verified ▸  │  badge row, monospace 10px
│                                                          │
│  BRYAN'S VERSION              INDIAN ALTERNATIVE         │  two-column swap
│  Macadamia nuts 250g          Kashmiri walnuts 250g      │  Fraunces 22px
│  ₹780 – ₹1,500                ₹360 – ₹440                │  price RANGE not point
│  (promo-volatile)             (Oct harvest, stable)      │  JetBrains Mono 11px
│                                                          │
│  Biology target: MUFA + Vit E + ALA omega-3              │  Instrument Serif 15px italic
│                                                          │
│  ▸ Indian-cohort caveat (FADS1/FADS2)          [+]      │  collapsible row
│  ▸ Contraindications (none material)           [+]      │
│  ▸ Seasonality (Kashmiri walnut: Oct–Jan peak) [+]      │
│  ▸ Sources (3 PMIDs · 2 vendor URLs · Wayback) [+]      │
│                                                          │
│  Last verified: 2026-04-18 · Next refresh: 2026-07-20    │  footer, mono 10px
└──────────────────────────────────────────────────────────┘
```

**Element specs:**

- **Verification badge** — forest-green `VERIFIED`, gold `FLAGGED`, outline `UNVERIFIED`. Colour-coded and text-labelled (never colour alone, for accessibility).
- **Source URL + PMID + Wayback** — each source row renders: `PMID 30775990 · Feng 2019 · J Alzheimer's Dis · [live] [web.archive.org capture 2026-04-18]`. Live link plus Wayback link required per Devil's Advocate link-rot attack.
- **Last-verified timestamp** — ISO date, not "recent". Mandatory on every card.
- **Indian-cohort caveat toggle** — expanded text cites FADS / OCTN1 / APOE / Lp(a) / SPRINT-exclusions / Adventist-healthy-user confounding where applicable.
- **Contraindications collapsible** — bold-header list of populations who should not use this substitution without a physician. Default collapsed to avoid clutter; opens on tap.
- **Price range, not single point** — format `₹X–₹Y` with promo-flag if the low end is a discount. Per Devil's Advocate macadamia attack.
- **Seasonal availability flag** — icon + short string: `● In season (Apr)` / `○ Off-season — frozen only` / `◐ Regional (Kashmir harvest)`.

---

## 4. Hero Stat Replacement — Three Alternatives

The v1 headline "1/1,770× for 90% of measurable result" is retired (Devil's Advocate CRITICAL). Three bounded replacements, ranked:

**Option A (RECOMMENDED) — The Food Slice Ratio**
> "Bryan Johnson's $2M/year protocol includes a $50,000/year food + supplement slice. That slice — and only that slice — can be replicated in India for ~₹96,000/year (~$1,130). **~44× cheaper for the food layer.** Labs, devices, and experimental therapies are not replicated at this price."
- Bounded: explicitly scopes to food+supps.
- Verified numbers: burn_food_supp ($50K/yr) / macro_alt_daily (₹263 × 365 = ₹95,995).
- Honest: acknowledges what's excluded.
- Ratio is 44× (≈ $50,000 / $1,130), not 1,770×.

**Option B — The Free-5 Anchor**
> "The five interventions that actually move all-cause mortality — don't smoke (~50%), control weight (~15–20%), exercise (~20–35%), control BP (~25–30%), eat plant-forward (~21%) — are **free or under ₹2,500/month**. Bryan Johnson does all five. The $2M on top buys margin, not foundation."
- Bounded: names the five specific interventions.
- Verified numbers: all corrected per verified_mortality.json.
- Reframes the page from price-ratio to intervention-ranking — arguably stronger thesis.

**Option C — The Daily-Cost Line**
> "Bryan Johnson's daily food + supplement cost, replicated in India: **~₹3,062.** Same biochemical targets, Indian-sourced: **~₹263.** **~12× cheaper per day for the plate, not the protocol.**"
- Bounded: per-day, plate-only.
- Uses corrected arithmetic (₹3,062, not ₹2,683).
- Softest claim — 12× is defensible without asterisks.

**Recommendation: A as the hero, B as the subhead, C in the receipt section.**

---

## 5. Typography, Palette, Spacing

### Typography (Google Fonts, all already loaded in v1)
Keep the current pairing — it is doing the job.
- **Display:** Fraunces (opsz 144, weight 300, italic available) — headlines, section titles, big numbers.
- **Body:** Instrument Serif (regular + italic) — paragraphs, captions, pull quotes.
- **Data:** JetBrains Mono (300–700) — prices, percentages, eyebrows, badges, source citations.

**Proposed addition:** IBM Plex Sans (Google Fonts) for the legal disclaimer panel and contraindications — a non-serif signals "this is clinical/regulatory text, not editorial prose." Use sparingly (300 weight, 13–14px, tight line-height 1.45).

### Palette — keep core + add 3 new tokens
```
--paper:      #F2ECDD    /* background */
--paper-dark: #E8E0CC    /* alt panels */
--paper-line: #D6CCAD    /* dashed dividers */
--ink:        #1A1611    /* primary text */
--ink-soft:   #4A3F2E    /* secondary text */
--blood:      #B91C1C    /* BJ / high-severity / strike-through */
--blood-deep: #7F1D1D    /* hover, emphasis */
--forest:     #1F5F3F    /* Indian alt / verified */
--forest-deep:#0F3D24    /* verified badge solid */
--gold:       #B8860B    /* FLAGGED badge — NEW role */
--stamp:      #A62020    /* stamps */
/* NEW: */
--warn-bg:    #FBEFC8    /* flagged callout backdrop */
--danger-bg:  #F8DAD8    /* contraindication backdrop */
--clinical:   #2C3E50    /* legal/regulatory text */
```
Gold `#B8860B` moves from decorative to semantic (FLAGGED badge + caveat toggles). Two new backgrounds (`--warn-bg`, `--danger-bg`) signal caveat vs contraindication without relying on red alone.

### Spacing scale
Adopt a strict 4-base scale (replaces ad-hoc values in v1): 4, 8, 12, 16, 24, 32, 48, 64, 80, 120px. Section padding 80px desktop / 48px mobile. Card padding 24px / 16px.

---

## 6. Interaction + Progressive Disclosure

Design rule: **first read is clean; contraindications, sources, and disclaimers are one tap away, never zero taps and never three.**

- **Verification badges** are always visible on every claim card — non-collapsible. They are the page's trust signal.
- **Indian-cohort caveat**, **contraindications**, **seasonality**, and **sources** are collapsed by default on each card; a chevron `▸` shows there is more. Expanding one does not expand the others. Preferred `<details>`/`<summary>` native HTML (no JS required, keyboard-accessible, copy-paste safe).
- **Legal / regulatory disclaimer panel (S14)** — collapsed accordion with 8 items. A sticky "⚠ Not medical advice · Read disclaimers" pill lives in the lower-right viewport and scrolls to S14 on tap.
- **Sources** — each citation expands inline; external links open in new tab with `rel="noopener"`; Wayback links are rendered as a secondary link next to the primary.
- **Contraindications (S9)** — rendered as a dedicated section AND injected as a collapsible row on each relevant card. Redundancy is intentional: a reader who jumps directly to the mustard-oil swap sees the erucic-acid flag in context.
- **Seasonal calendar (S7)** — 12-month grid; hovering (desktop) or tapping (mobile) a month reveals which substitutes are in-season. Frozen/dried fallbacks shown greyed.
- **Known limitations / arithmetic corrections (S16)** — rendered as a card-flipped "ERRATA" panel styled like a newspaper correction box, paper-coloured with blood-red accent bar. Non-collapsible — this admission is load-bearing for trust.

---

## 7. Mobile Behaviour

v1 is desktop-first. v2 needs to flow cleanly from 360px upward.

- **Hero verdict pair**: stacked at <640px (already handled in v1).
- **Receipts (BJ + Indian alt)**: stack vertically at <820px; keep perforated edges and stamps (shrink stamps from 84px to 64px).
- **Swap matrix**: each row stacks (BJ on top, arrow rotates 90°, Indian alt below) at <720px — already in v1 CSS. Per-card collapsibles stay intact.
- **Spend-breakdown grid**: 2-column → 1-column at <700px (already in v1).
- **Seasonal calendar**: horizontal-scroll strip at <720px with snap-points per month; full grid at ≥720px.
- **Genetic-context + Contraindications**: always 1-column on mobile; open one accordion at a time to preserve scroll position.
- **Sticky disclaimer pill**: bottom-centre on mobile instead of lower-right; hides on scroll-down, returns on scroll-up (standard mobile pattern).
- **Verdict card**: stamp shrinks and repositions to top-right of card header on mobile; ratio-number clamps to 64px.
- **Tap targets**: minimum 44×44px for all collapsibles, badges, and share buttons.
- **Typography**: hero H1 clamps 44–96px (v1 goes to 124px — too tall on mobile landscape); body never below 16px; mono never below 11px.

---

## 8. Open Design Questions (max 5)

1. **Hero stat selection** — Option A (food-slice 44×), B (Free-5 anchor), or C (daily 12×)? The answer determines the whole page's tonal centre.
2. **Devices + Labs (S13) scope** — do we ship v2 with placeholders saying "coming in v2.1" for the items still unverified in `data/verified_prices.json.open_items_for_next_pass` (HBOT, epigenetic clocks, full biomarker panels), or do we block launch until those are verified?
3. **Contraindications surfacing** — inline collapsibles on each card AND a dedicated S9 panel (redundant, my recommendation), or only one of the two? Redundancy helps safety but adds weight.
4. **PM2.5 + water section (S10) data source** — use GBD India 2019 national averages as the anchor, or require live 2026 CPCB/WHO station data for the five metro cities in `meta.markets_in_scope`? Live data is stronger but adds a data-pipeline dependency.
5. **Monetisation / affiliate disclosure** — if any vendor links are monetised, ASCI 2023 disclosure is required and the legal panel (S14) text changes. Are we shipping with any affiliate links in v2, or is v2 purely editorial?

---

## Appendix — Claim-ID → Section Mapping (quick reference)

| Section | Claim IDs |
|---|---|
| S1 Hero | macro_bj_annual, macro_alt_daily, macro_empirical_audit |
| S3 Scope honesty | burn_* (all 6) |
| S4 Daily Receipt | bj_* (18 rows), alt_* (22 rows) |
| S5 Annual Burn | B_annual_burn_breakdown |
| S6 Swap Matrix | E_swap_pairs (9 swaps) |
| S7 Seasonal | swap_blueberry_jamun, alt_seasonal_fruit, alt_amla_pom |
| S8 Genetics | swap_macadamia_walnut, swap_shiitake_oyster, alt_ghee, lab_apob_lpa |
| S9 Contraindications | alt_mustard_oil, alt_ghee, alt_ksm66, swap_nmn_diet, alt_moringa_methi, sauna_finnish |
| S10 PM2.5 + Water | env_pm25 (NEW), env_water_tds (NEW) |
| S11 Free 5 | free5_smoking, free5_weight, free5_exercise, free5_bp, free5_diet, nuts_adventist, legume_loma, sauna_finnish |
| S12 Lifestyle | life_sleep, life_exercise, life_fasting, life_weight_loss |
| S13 Devices + Labs | H_devices_equipment, I_labs_diagnostics |

End of brief.
