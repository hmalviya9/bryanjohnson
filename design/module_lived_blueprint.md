---
name: Lived Blueprint module — design brief
description: Four-pillar daily-protocol module (Food / Sleep / Exercise / Attention) that extends the v3 dossier into a "what do I actually do on Monday?" companion.
type: design
drafted: 2026-04-22
status: PROPOSAL — companion to v2_design_brief.md; same palette, typography, and verification system.
inputs_read: design/v2_design_brief.md, blueprints.html, data/claims.json, data/verified_biology.json, data/verified_mortality.json, review_sme.json, review_devil.json
---

# Lived Blueprint Module — Design Brief

## 0 · Why this module exists

The v3 dossier answers **"what does Bryan Johnson's $2M/year buy?"** and **"what is the Indian-market replica cost for the food slice?"** It does not yet answer the question readers actually walk away with: **"what do I do tomorrow morning?"**

The Lived Blueprint module is that answer. It is the protocol layer — a four-pillar daily scaffold that fuses (a) verified mortality/biology interventions already cited in `verified_mortality.json` and `verified_biology.json`, (b) indigenous food and movement traditions that outlived every fad diet, and (c) the attention-economy countermeasures that have no price tag but are doing 20–30% of the work.

It is explicitly **not** a cost-comparison page. The price column is retired here. This module lives alongside the dossier — linked from the topbar — and is anchored in the same verification discipline: every claim gets a VERIFIED / FLAGGED / UNVERIFIED badge, a source citation, and a last-verified ISO date.

**Why separate from the dossier:** The dossier is investigative ("here is what $2M buys, here is what ₹96k replicates"). This module is prescriptive ("here is a daily floor"). Mixing the two bloats the dossier and muddles the thesis. Separation keeps both pages honest.

---

## 1 · The Four Pillars

```
P1 FOOD          ancestral plates        → what you eat
P2 SLEEP         ragas + Ayurveda        → how you recover
P3 MOVEMENT      yoga / pranayama / sport → how you load the body
P4 ATTENTION     content + connection    → what you let into your head
```

Each pillar is a section with its own accent sub-palette (drawn from the v3 tokens, no new colours):

| Pillar | Accent | Semantic reason |
|---|---|---|
| P1 Food | `--forest` `#1F5F3F` | Plant-forward, rooted |
| P2 Sleep | `--clinical` `#2C3E50` then fades to `--ink` | Deep, nocturnal |
| P3 Movement | `--blood` `#B91C1C` | Exertion, heat |
| P4 Attention | `--gold` `#B8860B` | Attention is the currency |

---

## 2 · Information Architecture

**S0 · Masthead strip** *(parallels the dossier's S0)*
"File № 002 · PROTOCOL / LIVED BLUEPRINT · Captured 2026-04-22 · Next refresh 2026-07-22 · Companion to File № 001."

**S1 · Hero — the thesis line**
One sentence: *"The $2M protocol is optional. The four pillars below are not — and the evidence for them is older than any biotech."*
Sub-stat row (4 cells, matches `blueprints.html` `.stats-strip`):
- **~50%** mortality reduction from quitting smoking *(free5_smoking, VERIFIED)*
- **~21%** from plant-forward diet *(free5_diet, VERIFIED, corrected in v2)*
- **~20–35%** from exercise *(free5_exercise, VERIFIED, dose-dependent)*
- **~40%** all-cause / **~50%** fatal-CVD from 4–7 sauna sessions/wk *(sauna_finnish, FLAGGED for cohort)*

**S2 · Verification legend** *(identical system to v2 dossier)*
VERIFIED / FLAGGED / UNVERIFIED. Re-rendered here so the page is self-contained.

**S3 · Scope honesty panel** *(NEW-but-parallel)*
One paragraph: "This is a floor, not a ceiling. It is not medical advice. It is not a cure for any diagnosed condition. It cannot substitute for a physician, a therapist, or prescribed medication. If you are pregnant, nursing, managing a chronic condition, on blood thinners, or recovering from surgery — the starred items below are contraindicated for you and must be cleared with a doctor before adoption."

**S4 · Pillar 1 · FOOD — Ancestral Plates**
Sub-sections:
- **S4a** Intro paragraph (2–3 sentences on why indigenous diets out-survived every laboratory formula).
- **S4b** 16-card grid of indigenous / traditional foods with nutrient target + mental-health tie-in + contraindication + source badge.
- **S4c** "Blue Zones anchor" callout — Buettner's five regions (Okinawa, Sardinia, Nicoya, Ikaria, Loma Linda) and the one food each is known for.
- **S4d** A sample Indian plate for the week (thali-style rotation).

Claim IDs (new, to be added to `claims.json` in next pass):
`food_amla`, `food_moringa`, `food_natto`, `food_ragi`, `food_teff`, `food_fonio`, `food_quinoa`, `food_amaranth`, `food_maca`, `food_seaweed`, `food_okinawan_sp`, `food_nicoyan_bean`, `food_turmeric`, `food_baobab`, `food_chia`, `food_kimchi`, `food_ghee_a2`, `food_chaga`.

**S5 · Pillar 2 · SLEEP — Ragas & Ayurveda**
Sub-sections:
- **S5a** 12-raga playlist table — raga name, time-of-day tradition, rasa (mood), suggested listening window, one canonical recording (public-domain AIR / Saregama / YouTube artist + Wayback link).
- **S5b** Ayurveda sleep kit — 8 items (herbs + practices): Ashwagandha, Brahmi, Jatamansi, Tagar (Indian valerian), Shankhpushpi, warm milk + nutmeg, Abhyanga (warm sesame oil massage), Padabhyanga (foot oil massage). Each card has contraindications panel (pregnancy, autoimmune, thyroid, anticoagulants).
- **S5c** Sleep hygiene checklist — room temp, blackout, no screens 90 min pre-bed, consistent sleep-wake time, morning sunlight anchor.

12 ragas (candidate list, to be finalised with an AIR / ITC Sangeet Research Academy citation per raga):
1. **Yaman** — early evening, shanta rasa, wind-down anchor.
2. **Bhupali** — early night, pentatonic, devotional calm.
3. **Malkauns** — late night, karuna, deep meditative.
4. **Darbari Kanada** — late night, gambhir (majestic), slows HR in anecdotal reports.
5. **Bhimpalasi** — late afternoon, karuna, bridges day-to-evening.
6. **Behag** — late night, chanchal (playful) but mellow; transition raga.
7. **Bageshri** — midnight, shringar-karuna, longing / release.
8. **Chandrakauns** — late night, shanta, reduces restlessness (cited in Sairam 2004).
9. **Desh** — night, romantic-meditative, commonly prescribed in music-therapy.
10. **Jog** — late night, soulful; used in Nada Yoga for sleep onset.
11. **Khamaj** — night, playful shringar; gentle.
12. **Puriya Dhanashri** — evening sandhi-prakash, transitional; signals "day ending."

**Source anchors for raga-sleep efficacy:**
- Sairam TV (2004). *Music Therapy in India*. Nada Centre for Music Therapy — foundational text on raga-to-condition mapping. Tier 2 (expert-authored, not RCT).
- Mathur A et al. (2015). *"Effect of Raga Ahir-Bhairav on sympathetic activity."* Indian J Physiol Pharmacol — RCT-adjacent, narrow raga, autonomic markers. Tier 2.
- Sundar S (2007). *"Traditional healing systems and modern music therapy in India."* Music Therapy Today. Tier 3.
- Gupta U, Gupta BS (2016). *"Gender differences in psychophysiological responses to music listening"* — included Indian classical ragas. Tier 2.

**FLAGGED as a pillar:** raga-sleep efficacy has a *thin RCT layer*. Efficacy for general relaxation / sympathetic downshift is well-attested; efficacy specifically for sleep-onset latency is promising but under-studied. Module language must reflect this — "aids relaxation," not "cures insomnia."

Claim IDs: `sleep_raga_yaman` through `sleep_raga_puriyadhanashri` (12), `sleep_ashwagandha`, `sleep_brahmi`, `sleep_jatamansi`, `sleep_tagar`, `sleep_shankhpushpi`, `sleep_nutmeg_milk`, `sleep_abhyanga`, `sleep_padabhyanga`, `sleep_hygiene_checklist`.

**S6 · Pillar 3 · MOVEMENT — Ancient & Modern**
Sub-sections:
- **S6a** Yoga asanas — 8 poses with mental-health evidence (Balasana, Shavasana, Setu Bandhasana, Viparita Karani, Adho Mukha Svanasana, Uttanasana, Sukhasana, Vrikshasana).
- **S6b** Pranayama — 6 techniques (Nadi Shodhana / alternate nostril, Bhramari / bee-breath, Ujjayi, Kapalbhati, Anulom-Vilom, Sheetali). Each with duration, contraindications (hypertension, pregnancy, cardiac).
- **S6c** "Repackaged ancients" table — modern branded protocols traced to their roots:
    - Wim Hof Method ← Tummo (Tibetan Buddhist, ~1000 CE)
    - Box Breathing (Navy SEALs) ← 4:4:4 pranayama
    - HIIT / Tabata ← interval athletic training, codified in Japan 1996
    - Cold plunge / ice-bath ← Indian *ishnan*, Finnish sauna-then-lake, Russian banya
    - Animal Flow ← yogic-gymnastic hybrid (Mike Fitch, 2010)
    - Primal Movement ← Georges Hébert's *Méthode Naturelle* (1902) + yoga
    - Mindful movement ← Vipassana walking meditation
- **S6d** Dance as exercise — 8 forms: Garba, Bharatanatyam, Kathak, Kalaripayattu, Sufi whirling (Mevlevi), Zumba, Capoeira, Haka.
- **S6e** Sports — low-barrier indigenous games + universals: Kabaddi, Kho-Kho, Mallakhamb, Gilli-danda, badminton, swimming, cycling, pickup football, pickup cricket.
- **S6f** Sample week template (7-day): 3 strength, 2 zone-2 cardio, 1 yoga+pranayama, 1 sport-or-dance.

**Source anchors:**
- Cramer H et al. (2013). *"Yoga for depression: systematic review and meta-analysis."* Depression & Anxiety. Tier 1.
- Sharma VK et al. (2013). *"Effect of Sudarshan Kriya Yoga on depression."* Indian J Psychiatry. Tier 2.
- Streeter CC et al. (2010). *"Yoga Asana sessions increase brain GABA levels."* J Altern Complement Med. Tier 1.
- Kox M, Pickkers P et al. (2014). *"Voluntary activation of the sympathetic nervous system…"* PNAS — the Wim Hof / Tummo PNAS paper. Tier 1.
- Tabata I et al. (1996). *"Effects of moderate-intensity endurance and high-intensity intermittent training on anaerobic capacity."* Med Sci Sports Exerc. Tier 1.

Claim IDs: `move_yoga_<asana>` (8), `move_pranayama_<technique>` (6), `move_wimhof_tummo`, `move_box_breathing`, `move_hiit_tabata`, `move_cold_plunge`, `move_animal_flow`, `move_primal`, `move_dance_<form>` (8), `move_sport_<name>` (9).

**S7 · Pillar 4 · ATTENTION — Content & Connection**
Sub-sections:
- **S7a** Digital floor (non-negotiables):
    - First 90 min of day: no phone, no email, no feed.
    - Last 90 min of day: no screens.
    - Phone out of bedroom, charging in another room.
    - Grayscale mode (iOS / Android); reduces colour-reward loop.
    - Notifications: only calls from a whitelist; everything else muted.
- **S7b** Content diet:
    - Read > watch.
    - Long-form > short-form.
    - No news before breakfast.
    - One book at a time.
    - Quarterly feed / follow audit.
- **S7c** Sunday Digital Sabbath — one full day/week phone in a drawer.
- **S7d** Body defaults:
    - 10 min morning sun on skin (vit D + circadian anchor) — see Walker 2017, Blume 2019.
    - 15–20 min barefoot outdoor ("grounding" / "earthing") — physiologic effect contested; the walk itself is not contested. Frame as "outdoor barefoot walk," cite earthing studies as FLAGGED (Chevalier 2012 — small N).
- **S7e** Connection defaults:
    - One meal/day shared, phones off-table.
    - Weekly call with parents / elders.
    - One recurring "third place" — a class, sport league, spiritual gathering, volunteer crew — not work, not home. (Oldenburg 1989 framing.)
    - One long walk/month with an old friend.

**Source anchors:**
- Hunt MG et al. (2018). *"No More FOMO: Limiting Social Media Decreases Loneliness and Depression."* J Social Clin Psychol. Tier 1.
- Walker MP (2017). *Why We Sleep*. Tier 3 popular but author is Tier-1 researcher; cite primary papers where possible.
- Holt-Lunstad J et al. (2015). *"Loneliness and social isolation as risk factors for mortality."* Perspectives Psych Sci — mortality impact of social isolation comparable to smoking 15 cigarettes/day. Tier 1.
- Chevalier G et al. (2012). *"Earthing: health implications of reconnecting the human body to the Earth's surface electrons."* J Environ Public Health — FLAGGED, small N.
- Oldenburg R (1989). *The Great Good Place* — "third place" concept. Tier 3 sociology classic.

Claim IDs: `att_morning_90`, `att_evening_90`, `att_bedroom_phone`, `att_grayscale`, `att_notifications_whitelist`, `att_content_read`, `att_content_longform`, `att_news_blackout`, `att_feed_audit`, `att_sabbath`, `att_morning_sun`, `att_barefoot_walk`, `att_shared_meal`, `att_weekly_elder_call`, `att_third_place`, `att_friend_walk`.

**S8 · The Weekly Template** *(synthesis)*
A 7-day Mon–Sun grid showing how the four pillars stack into a week. Not prescriptive to the hour — a pattern, not a prison. This section is the one shareable image.

**S9 · Contraindications & Safety Panel**
A consolidated list covering:
- Ashwagandha + pregnancy / hyperthyroidism / autoimmune / anticoagulants / sedatives.
- Moringa (powdered) + heavy-metal load / pregnancy.
- A2 ghee + elevated ApoB / South Asian Lp(a) baseline.
- Kapalbhati + hypertension / hernia / pregnancy / cardiac.
- Cold plunge + uncontrolled hypertension / arrhythmia / Raynaud's.
- Intermittent fasting (if added later) + pregnancy / T1 diabetes / eating-disorder history.
- Mustard oil (cooking) + CAD / elevated ApoB (erucic-acid flag, already in the dossier S9).

**S10 · Sources & Methodology**
Same treatment as the dossier: numbered list, Tier 1 / 2 / 3 legend, live link + Wayback capture per entry, ISO last-verified date.

**S11 · Legal / Disclaimer Panel**
Mirrors the dossier's `reg-banner` language verbatim. Nothing here is medical advice. Consult a physician.

**S12 · Share block + footer**
Same receipt-style stamp, same paper aesthetic, same "File № 002" framing.

---

## 3 · Per-Pillar-Card Visual Anatomy

Each card inside a pillar uses the same shell as the dossier's swap-card (from v2_design_brief §3), adapted:

```
┌──────────────────────────────────────────────────────────┐
│ [VERIFIED] last-verified ▸                               │  badge row, mono 10px
│                                                          │
│  AMLA                          Phyllanthus emblica       │  Fraunces 24 + latin binomial
│  India · year-round            Vit C, chromium, polyphenols │ origin + targets, IS 14
│                                                          │
│  Why this is on the list:                                │
│  Highest vit C density of any common Indian fruit;       │
│  chromium aids insulin sensitivity; used in Rasayana     │  Instrument Serif 15.5
│  (rejuvenation) category of Ayurveda since Charaka.      │
│                                                          │
│  ▸ Mental-health tie-in (anxiety adjunct RCTs) [+]       │  collapsible
│  ▸ Contraindications (anticoagulants)         [+]        │
│  ▸ Sources (3 PMIDs + Charaka Samhita ref)    [+]        │
│                                                          │
│  Last verified: 2026-04-22 · Next refresh: 2026-07-22    │
└──────────────────────────────────────────────────────────┘
```

**Raga cards** add one row: a native `<audio>` reference link (public-domain AIR recording where available, else a canonical YouTube link + Wayback capture). No auto-play. No embedded player on first paint — a small `▸ Listen` disclosure that only loads the audio tag on expand. Accessibility + bandwidth.

**Movement cards** add one row: contraindications are NEVER collapsed for pranayama or cold-plunge cards. Safety outranks clutter-minimisation on these specifically.

---

## 4 · Typography, Palette, Spacing

**No new tokens.** This module uses the exact CSS custom properties already defined in `blueprints.html` / `dashboard.html`:

```
--paper, --paper-dark, --paper-line
--ink, --ink-soft
--blood, --blood-deep       → P3 Movement accent
--forest, --forest-deep     → P1 Food accent + VERIFIED badge
--gold                      → P4 Attention accent + FLAGGED badge
--stamp                     → section stamps
--warn-bg, --danger-bg      → caveat + contraindication backdrops
--clinical                  → P2 Sleep accent + legal text
```

Typography: identical pairing (Fraunces display / Instrument Serif body / JetBrains Mono data / IBM Plex Sans clinical).

Spacing: 4-base scale (4, 8, 12, 16, 24, 32, 48, 64, 80, 120). Section padding 80/48. Card padding 24/16.

---

## 5 · Interaction + Progressive Disclosure

Same rule as the dossier: **first read is clean; caveats and sources are one tap away, never zero, never three.**

- Pillars render as numbered section headers (P1 / P2 / P3 / P4) with a sticky per-pillar accent bar at the top of each section.
- Cards use native `<details>`/`<summary>` for collapsibles — no JS dependency, keyboard-accessible.
- Raga-listen links lazy-load audio only on disclosure (bandwidth + privacy).
- Contraindications on pranayama and cold-exposure cards render **open by default** — safety overrides the "clean first read" rule for those specific cards.
- A sticky lower-right pill reads "⚠ Not medical advice · Read disclaimers" and jumps to S11.

---

## 6 · Mobile Behaviour

- Pillar section headers collapse from 4-column strip to 2x2 at <720px, to stacked at <480px.
- Food card grid: 4-col → 3 → 2 → 1.
- Raga table: 12 rows stays tabular; at <560px collapses to stacked cards (raga-name / time / rasa on one line, sources disclosure below).
- Weekly template (S8): horizontal-scroll strip with snap-points at <720px.
- Sticky disclaimer pill: bottom-centre on mobile (same treatment as dossier).

---

## 7 · Open Questions (max 5)

1. **Separate page vs inline section of dashboard.html?** Recommendation: **separate page** (`lived-blueprint.html`) linked from topbar. Keeps the dossier focused on the price audit; lets this module grow its own data layer.
2. **Raga audio licensing** — AIR archival recordings are the defensible source but may not embed cleanly. Public-domain YouTube mirrors of AIR tracks (where available) + Wayback capture of the YT page is the current plan. Any vendor audio (Saregama, OKListen) needs a licensing check before embedding.
3. **Data-layer split** — do we author the claims inline in HTML for v0 and move to `data/verified_blueprint.json` in v0.1, or split from the start? Recommendation: **inline first, split once the claim set stabilises** (~2 iterations from now).
4. **Indian-cohort genetics overlay** — should the FADS / OCTN1 / APOE / Lp(a) overlay from dossier S8 re-render here when relevant (e.g. ghee card, mushroom card, seed-oil card)? Recommendation: **yes, cross-link not duplicate** — card footer links to the dossier's S8 anchor.
5. **"Weekly template" as a shareable image** — do we generate a static PNG for social share (like the receipt card), or keep it as pure HTML? Recommendation: **HTML first, image rendered from a Puppeteer step later** if share metrics warrant.

---

## Appendix A — Claim-ID → Pillar Mapping

| Pillar | Claim IDs (new) |
|---|---|
| P1 Food | food_amla, food_moringa, food_natto, food_ragi, food_teff, food_fonio, food_quinoa, food_amaranth, food_maca, food_seaweed, food_okinawan_sp, food_nicoyan_bean, food_turmeric, food_baobab, food_chia, food_kimchi, food_ghee_a2, food_chaga |
| P2 Sleep | sleep_raga_[12], sleep_ashwagandha, sleep_brahmi, sleep_jatamansi, sleep_tagar, sleep_shankhpushpi, sleep_nutmeg_milk, sleep_abhyanga, sleep_padabhyanga, sleep_hygiene |
| P3 Movement | move_yoga_[8], move_pranayama_[6], move_wimhof_tummo, move_box_breathing, move_hiit_tabata, move_cold_plunge, move_animal_flow, move_primal, move_dance_[8], move_sport_[9] |
| P4 Attention | att_[16] (see §S7) |

All new IDs need entries in a future `data/verified_blueprint.json` mirroring the shape of `verified_biology.json`.

## Appendix B — Pillar-to-Dossier Cross-References

| This module | Dossier section | Relationship |
|---|---|---|
| P1 Food · ghee card | S9 Contraindications | Share the erucic-acid + ApoB caveat |
| P1 Food · mushroom card | S8 Genetics (OCTN1) | Cross-link |
| P2 Sleep · Ashwagandha | S9 Contraindications | Share pregnancy/autoimmune/thyroid flags |
| P3 Movement · sauna | S11 Free 5 (sauna_finnish) | Share the FLAGGED status |
| P3 Movement · yoga | S12 Lifestyle (life_exercise) | Share exercise dose range |
| P4 Attention · sleep anchor | S12 Lifestyle (life_sleep) | Share sleep-hygiene basis |

End of brief.
