# Results Summary
## Dietary Carbohydrate Quality and Physical Functioning — NECS

Full model details and interpretation are in `docs/Wallen_NECS_CarbQuality_Report.pdf`.  
This file presents key results in a browsable format.

---

## Study snapshot

| | |
|---|---|
| **Study** | New England Centenarian Study (NECS) |
| **N** | 438 participants |
| **Outcome** | IADL score (0–14; higher = better functioning) |
| **Mean baseline IADL** | 13.81 (near ceiling — high-functioning cohort) |
| **Method** | Generalized Estimating Equations (GEE) |
| **Correlation structure** | Exchangeable, clustered by participant ID |

---

## Model specifications

| Model | Covariates |
|---|---|
| **Model 1** | Time + exposure + age + sex + education |
| **Model 2** | Model 1 + CVD + stroke + diabetes + cancer |
| **Model 3** | Model 2 + smoking + alcohol use *(fully adjusted)* |

Reference groups: female sex, no chronic disease, non-smoker, no alcohol use.  
All exposures except fiber density were energy-adjusted using the residual method.

---

## Table 1. Baseline characteristics (N = 438)

### Continuous variables

| Variable | Mean ± SD | Min | Max |
|---|---|---|---|
| Age at enrollment (years) | 71.16 ± 7.23 | 39 | 90 |
| Education (years) | 15.81 | 8 | 26 |
| IADL score | 13.81 | 5 | 14 |
| Fiber density (g/1,000 kcal) | 11.49 ± 3.68 | 3.57 | 35.84 |
| Carbohydrate-to-fiber ratio | 10.98 ± 3.17 | 3.70 | 24.20 |
| Glycemic index (average) | 57.42 ± 3.67 | 41.00 | 70.43 |
| Glycemic load (sum) | 134.09 ± 70.52 | 5.72 | 768.92 |
| Total carbohydrate intake (g/day) | 233.96 ± 109.37 | 28.93 | 1,321.76 |
| Fiber intake (g/day) | 22.64 ± 11.99 | 3.85 | 128.04 |

### Categorical variables

| Variable | N (%) |
|---|---|
| **Sex** | |
| Female | 239 (54.6%) |
| Male | 199 (45.4%) |
| **Diabetes** | |
| No | 405 (92.5%) |
| Yes | 32 (7.7%) |
| **Cardiovascular disease** | |
| No | 415 (94.8%) |
| Yes | 22 (5.0%) |
| **Stroke** | |
| No | 429 (98.0%) |
| Yes | 8 (1.8%) |
| **Cancer** | |
| No | 357 (81.5%) |
| Yes | 80 (18.3%) |
| **Smoking history** | |
| No | 194 (44.3%) |
| Yes | 243 (55.5%) |
| **Alcohol use** | |
| No | 424 (96.8%) |
| Yes | 13 (3.0%) |
| **Any chronic disease** | |
| No | 309 (70.6%) |
| Yes | 128 (29.2%) |

---

## Table 2. Energy-adjusted dietary exposure distributions

| Variable | Mean | SD | Min | Max |
|---|---|---|---|---|
| Total carbohydrates, energy-adjusted (g/day) | 227.11 | 46.94 | 92.61 | 385.84 |
| Dietary fiber, energy-adjusted (g/day) | 21.89 | 6.97 | 5.72 | 54.99 |
| Glycemic load, energy-adjusted | 129.30 | 38.21 | 33.43 | 281.19 |
| Total energy intake (kcal/day) | 1,915.15 | 613.46 | 602.36 | 4,119.42 |

> Energy adjustment reduced variability and range of dietary variables, particularly for total
> carbohydrate intake and glycemic load, suggesting extreme unadjusted values were partially
> driven by differences in total caloric intake rather than dietary composition.

---

## Table 3. Pearson correlations among dietary carbohydrate quality variables

| | Carbohydrates (adj) | Fiber (adj) | Glycemic load (adj) |
|---|---|---|---|
| Carbohydrates, adj | 1.00 | 0.45 (p < 0.001) | 0.72 (p < 0.001) |
| Fiber, adj | — | 1.00 | 0.29 (p < 0.001) |
| Glycemic load, adj | — | — | 1.00 |

> Total carbohydrate intake and glycemic load were strongly correlated (r = 0.72).
> Fiber showed only moderate correlation with glycemic load (r = 0.29), indicating
> that fiber-containing foods varied substantially in glycemic properties across the cohort.

---

## Table 4. GEE model results — association with overall IADL level

*β = unstandardized coefficient; positive β = higher IADL (better functioning)*

### Model 1 — Age, sex, education adjusted

| Exposure | β | p-value |
|---|---|---|
| Fiber density | −0.009 | 0.90 |
| Carbohydrate-to-fiber ratio | −0.05 | 0.18 |
| Glycemic index | −0.007 | 0.80 |
| Glycemic load | −0.004 | **0.001** |
| Total carbohydrates | −0.002 | **0.0008** |

### Model 2 — Model 1 + CVD, stroke, diabetes, cancer

| Exposure | β | p-value |
|---|---|---|
| Fiber density | **0.78** | **< 0.001** |
| Carbohydrate-to-fiber ratio | **−0.23** | **< 0.001** |
| Glycemic index | −0.11 | 0.15 |
| Glycemic load | 0.008 | 0.19 |
| Total carbohydrates | 0.005 | 0.24 |

> After adjusting for chronic disease, glycemic load and total carbohydrate intake lose
> significance. Fiber density emerges as a strong positive predictor and carbohydrate-to-fiber
> ratio shows a significant negative association — suggesting carbohydrate *quality*, not
> quantity, drives the association with functional status.

### Model 3 — Fully adjusted (Model 2 + smoking, alcohol)

| Exposure | β | p-value |
|---|---|---|
| Fiber density | **0.70** | **< 0.001** |
| Carbohydrate-to-fiber ratio | **−0.19** | **< 0.001** |
| Glycemic index | 0.08 | 0.50 |
| Glycemic load | **−0.03** | **< 0.001** |
| Total carbohydrates | −0.009 | 0.059 |

> Fiber density and carbohydrate-to-fiber ratio remain significant in the fully adjusted model.
> Glycemic load re-emerges as significant, likely reflecting a suppression effect from lifestyle
> covariates.

---

## Table 5. Stratified analysis by sex (Model 3 specification)

| Exposure | Female β (N=238) | Female p | Male β (N=199) | Male p |
|---|---|---|---|---|
| Fiber density | 0.04 | 0.45 | 0.16 | 0.11 |
| Carbohydrate-to-fiber ratio | −0.04 | 0.09 | **−0.07** | **0.016** |
| Glycemic index | 0.004 | 0.83 | −0.04 | 0.17 |
| Glycemic load | −0.001 | 0.44 | −0.003 | 0.09 |
| Total carbohydrates | −0.0006 | 0.43 | −0.002 | 0.05 |

> Among male participants, higher carbohydrate-to-fiber ratio was significantly associated
> with lower IADL scores. Borderline associations were observed for glycemic load and total
> carbohydrate intake among men. No significant associations were observed among women.

---

## Table 6. Stratified analysis by diabetes status (Model 3 specification)

| Exposure | Diabetes β (N=32) | Diabetes p | No diabetes β (N=405) | No diabetes p |
|---|---|---|---|---|
| Fiber density | −0.29 | 0.40 | 0.08 | 0.11 |
| Carbohydrate-to-fiber ratio | −0.005 | 0.93 | **−0.06** | **0.012** |
| Glycemic index | −0.05 | 0.31 | −0.004 | 0.80 |
| Glycemic load | −0.005 | 0.40 | −0.001 | 0.14 |
| Total carbohydrates | −0.001 | 0.70 | −0.0009 | 0.09 |

> No carbohydrate variable was significant among participants with diabetes (N=32; likely
> underpowered). Among those without diabetes, carbohydrate-to-fiber ratio showed a
> significant negative association, suggesting carbohydrate quality may matter most before
> metabolic disease develops.

---

## Table 7. Stratified analysis by chronic disease burden (Model 3 specification)

| Exposure | Any disease β (N=128) | Any disease p | No disease β (N=309) | No disease p |
|---|---|---|---|---|
| Fiber density | 0.18 | 0.21 | 0.05 | 0.30 |
| Carbohydrate-to-fiber ratio | **−0.12** | **0.01** | −0.02 | 0.18 |
| Glycemic index | −0.13 | 0.50 | −0.006 | 0.80 |
| Glycemic load | −0.002 | 0.30 | −0.001 | 0.19 |
| Total carbohydrates | −0.0001 | 0.90 | −0.001 | 0.06 |

> Among participants with any chronic disease, carbohydrate-to-fiber ratio remained the only
> significant predictor of IADL. Null findings in the disease-free group may partly reflect
> ceiling effects — this is a high-functioning cohort, especially among those without chronic
> disease.

---

## Summary of key findings

| Finding | Direction | Consistent across models? |
|---|---|---|
| Higher fiber density → better IADL | ↑ positive | Yes (Models 2 & 3) |
| Higher carb-to-fiber ratio → lower IADL | ↓ negative | Yes (Models 2 & 3) |
| Glycemic index | Null | Yes — no association |
| Glycemic load | Inconsistent | Varies by model specification |
| Total carbohydrates | Null after adjustment | Quantity alone not predictive |
| Sex differences | Stronger in men | Carb:fiber significant in men only |
| Disease stratification | Stronger with disease | Ceiling effects in healthy group |

> **Overall interpretation:** Carbohydrate *quality* — particularly dietary fiber — is more
> functionally relevant than carbohydrate quantity in this older adult cohort. The
> carbohydrate-to-fiber ratio and fiber density were the most consistent predictors of
> IADL functioning across model specifications and stratified analyses.
