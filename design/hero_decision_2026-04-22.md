# Hero Stat Decision — 2026-04-22

**Supersedes:** `v2_design_brief.md` §4 (Hero Stat Replacement — Three Alternatives).
**Status:** APPROVED. Round-3 item-level arithmetic verification complete.
**Evidence:** `data/verified_arithmetic_round3.json`, `data/verified_prices_v2.json`, `data/verified_mortality.json`, `data/review_devil.json`.

---

## Decision

- **Hero: Option C** (Daily-Cost Line, ~12×).
- **Subhead: Option B** (Free-5 Anchor).
- **Retired: Option A** (Food-Slice 44×).

## Rationale

| Criterion | A (44×) | B (Free-5) | **C (12×)** |
|---|---|---|---|
| Arithmetic reproducible from verified data | ✓ | N/A | ✓ |
| All numbers primary-verified | ✗ $50K is R3-owner (estimate, uncited) | ✓ all five peer-reviewed | ✓ every line-item in verified_prices_v2 |
| Scope clean | ✗ mixes geography arbitrage + substitution | ✓ | ✓ ("plate, not protocol") |
| Fixes v1 arithmetic publicly | — | — | ✓ ₹2,683 → ₹3,062 |
| Survives Devil's Advocate | ✗ "is it arbitrage or substitution?" unanswered | ✓ | ✓ |
| Round-3 recomputation | — | — | ✓ ₹259–₹267 band, "~12×" stable |

C wins because the hero number reproduces from `verified_arithmetic_round3.json` with zero assumption-layering. B wins the subhead because it names the actual evidence-based thesis (Free-5 does the mortality work). A is retired because (a) the $50K denominator is an uncited estimate and (b) the 44× ratio silently bundles geography with substitution.

---

## Final copy

### Hero (Option C)

> Bryan Johnson's daily food + supplement cost, replicated in India: **~₹3,062.**
> An Indian-sourced plate and stack built for the same nutrient and polyphenol categories: **~₹264.**
> **~12× cheaper per day for the plate, not the protocol.**
> Per-ingredient biology match varies — see each swap card.

**Key copy rule:** the fourth line is a Devil's-Advocate inoculation. It must ship with the hero — not collapsed, not footnoted. Earns trust up-front and makes readers treat the per-card caveats (FADS1/2, urolithin non-producers, flavanol UNVERIFIED, erucic acid) as honest additions rather than defensive footnotes.

### Subhead (Option B, corrected)

> The five interventions that actually move all-cause mortality —
> smoking cessation (~50%), weight control (~15–20%, RCT evidence),
> exercise (~20–35%), blood pressure control (~25–30%, high-CV-risk adults),
> Mediterranean/plant-forward diet (~21%) —
> are free or under ₹2,500/month.
> The $2M on top buys margin, not foundation.

**Corrections from v1:**
- weight: 40% → 15–20% (v1 unsupported per `verified_mortality.free5_weight`)
- diet: 25% → 21% (v1 slightly overstated per `verified_mortality.free5_diet`)
- BP: add "high-CV-risk adults" qualifier (per `verified_mortality.free5_bp`)

### Retired (Option A)

> ~~"Bryan Johnson's $2M/year protocol includes a $50,000/year food + supplement slice. That slice — and only that slice — can be replicated in India for ~₹96,000/year (~$1,130). ~44× cheaper for the food layer."~~

Do not use. Two blockers: (1) $50K denominator is an R3-owner estimate, not cited; (2) 44× ratio mixes geography arbitrage with substitution savings without separating them.

---

## Numbers the hero depends on

| Quantity | Value | Source |
|---|---|---|
| BJ replica daily | ₹3,062 | `verified_arithmetic.json macro_replica_daily` (fixes v1 ₹2,683 error) |
| Indian alt daily (mid, A2-ghee assumption) | ₹264 | `verified_arithmetic_round3.json round3_alt_daily_total` |
| Indian alt daily (low, regular-ghee) | ₹259 | same |
| Indian alt daily (high) | ₹267 | same |
| Ratio (mid) | 11.60× → "~12×" | 3062 ÷ 264 |
| FX rate for USD conversions | ₹85/USD | `claims.meta.fx_rate_used_in_dossier` |

The "~12×" phrasing is stable across the full assumption band (11.46× to 11.82×). If a future round tightens ghee or D3K2 assumptions, the rounded "~12×" claim holds without change.

---

## What ships alongside the hero

Per v2 design brief §S0–S2, the hero is framed by:
- **Capture-date strip:** "Dossier v2.0 · Captured 2026-04-22 · FX ₹85/USD · Next refresh 2026-07-22"
- **Verification-status legend:** VERIFIED / FLAGGED / UNVERIFIED badges (S2)
- **Scope-honesty panel (S3):** "97.5% of BJ's $2M/yr is NOT replicated at these prices — medical team, experimental therapies, diagnostics, imaging, equipment are excluded."

S3 is non-optional and must sit directly below the hero. Without it, the "plate, not the protocol" clause in the hero is doing trust work it cannot carry alone.

---

## Open items before hero can ship

Updated 2026-04-22 after round-4 sub-agent pass (see `data/verified_round4_findings.json`).

### Ship-ready now (do these today)

1. **Cacao-card rewrite — ACTIONABLE.** No HPLC flavanol assay exists for Mason & Co / Ariba / Wakao. "Matches Blueprint" is unsupported and carries FSSAI regulatory exposure up to ₹10 lakh under Section 53 FSS Act 2006. Ship this replacement copy: *"Mason & Co, Ariba, and Wakao sell raw, non-alkalised cacao — a category that retains substantially more flavanols than Dutched cocoa. Brand-level flavanol content has not been independently assayed and will vary by bean origin, fermentation, and roast. Do not assume per-gram equivalence to Blueprint Cocoa Flavanols until an HPLC assay is published."* Long-term remediation path: commission HPLC panel at CFTRI Mysore or Eurofins India, 3 brands × ≥1 replicate, est. ₹5-25k per sample (quote required).

### Still blocking launch

2. **Pill-stack scope definition (claims.json `bj_pill_stack`).** Current ₹620/day is structurally ambiguous. Two blockers:
   - **Stale-protocol risk:** Bryan publicly discontinued rapamycin Oct 2024 (~₹167/day); Apr 2026 status unknown. If still discontinued, pill stack drops to ~₹443/day (40% overstatement).
   - **Double-count risk:** compounds already bundled in Longevity Mix ₹387 + Essential Capsules ₹215 + Essential Softgels ₹165 include creatine, ashwagandha, TMG, taurine, glycine, D3/K2, EPA/DHA, zinc, curcumin, ginger, garlic. If the Indian-replica pill stack re-adds these, ₹200-300/day is counted twice.
   - **Fix:** define scope as either (a) Rx-only + non-Essential compounds, OR (b) comprehensive with bundled items set to ₹0. Display split: Rx-gated / OTC-available / import-only.

3. **Round-4 item verification still pending for 14 BJ-replica line items.** Sub-agents were blocked on web access. Training-knowledge priors flagged likely issues:
   - `bj_cauliflower` ₹45 → likely ~₹10 (3-5× overstated)
   - `bj_walnuts` ₹25 → computes to ₹16/10g from verified_prices_v2 (55% overstated)
   - `bj_chia_flax` ₹30 → computes to ~₹6 (5× overstated if portion size is 2 tbsp)
   - `bj_pom_juice` ₹70 → Raw Pressery priors suggest ~₹40
   - `bj_macnut_milk` ₹180 → unavailable at scale in India; needs "imported only" flag + almond-milk substitute row
   - `bj_beluga_lentil` ₹60 → imported-only; needs dual-price with sabut urad substitute
   Blueprint-branded 6 items (Longevity Mix, Essentials, EVOO, Cocoa, Pea Protein) strictly need web cart fetch or reframing as "Blueprint direct import — orientation only" since nobody actually buys these at Indian landed prices.

4. **A2-ghee ship/cut call** (from round-3). Ship at ₹11 with ApoB/LDL gating, or drop in favour of mustard-oil rotation. Mixed v1 copy is not defensible.

5. **Monthly price-refresh + Wayback snapshot cron** — built and tested before launch (DA HIGH on link-rot).

### Hero number impact

After round-4 corrections (rapamycin drop + walnut/chia/cauliflower fixes, total ~-₹180 to -₹230 on BJ side), the BJ replica daily drops from ₹3,062 to **~₹2,830–2,950**. Against alt ₹264, ratio becomes **10.7–11.2×**. Options:

- Keep **"~12×"** hero with a footnote "after round-4 pending corrections, may tighten toward 11×"
- Shift hero to **"~11×"** — honest, stable across assumption band
- Widen to **"~10–12× cheaper per day for the plate, not the protocol"** — most defensible, acknowledges open verifications

Recommendation: **shift to "~11×"** after pill-stack scope resolution. Both 10.7× and 11.2× round cleanly to 11. Don't widen unnecessarily — the point of the hero is a tight claim.
