# Data Dictionary — NECS Carbohydrate Quality Analysis

## Exposure variables (dietary carbohydrate quality)

| Variable | Description | Construction |
|---|---|---|
| Dietary glycemic index | Carbohydrate-weighted average GI across all foods | GL_food / carbs_food, summed across foods |
| Dietary glycemic load | Sum of food-level GL values | (GI × carbohydrates) / 100, summed |
| Total carbohydrate intake | Total daily carbohydrate (g/day) | Summed across all FFQ items |
| Total dietary fiber | Total daily fiber (g/day) | Summed across all FFQ items |
| Fiber density | Fiber per 1,000 kcal | (fiber / total energy) × 1000 |
| Carbohydrate-to-fiber ratio | Lower = higher carb quality | total carbs / total fiber |

All exposures except fiber density were energy-adjusted 
using the residual method prior to modeling.

## Outcome variable

| Variable | Description | Range | Notes |
|---|---|---|---|
| IADL score | Instrumental Activities of Daily Living | 0–14 | Higher = better function; mean baseline = 13.81 |

## Covariates

| Variable | Type | Notes |
|---|---|---|
| Time | Continuous | Year of visit minus year of enrollment |
| Age | Continuous | Age at enrollment |
| Sex | Binary | Male / Female |
| Education | Continuous | Years of education |
| CVD | Binary | History of cardiovascular disease |
| Stroke | Binary | History of stroke |
| Diabetes | Binary | History of diabetes diagnosis |
| Cancer | Binary | History of cancer |
| Smoking | Binary | Any smoking history |
| Alcohol use | Binary | Current alcohol use |

## Cereal classification groups

Free-text cereal responses were standardized into 11 groups:
Refined flake · Sweetened flake · Whole oat · Sweetened oat · 
Bran · Wheat-based shredded · Granola/muesli · High-fiber · 
Unspecified low-GI · Unspecified medium-GI · Unspecified high-GI

GI values assigned using University of Sydney Glycemic Index 
Research Database as primary reference.

## Exclusion criteria

- Energy intake < 600 or > 4,200 kcal/day (implausible values)
- Missing sex
- Missing IADL at all visits (participants retained with ≥1 observed score)
