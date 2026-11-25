# Factor Analysis for Business Decision-Making Using R

Presentation and handout for the course *Data Analysis for Decision-Making* (WS 2026), Prof. Dr. Stephan Huber, Fresenius University of Applied Science.

Author: Amal Gurbanov (Matr. Nr. 401491824), gurbanov.amal@stud.hs-fresenius.de

## Files

| File | Content |
|---|---|
| `presentation.qmd` / `.html` / `.pdf` | Slides (Quarto revealjs) |
| `handout.qmd` / `.html` / `.pdf` | Handout in APA style (apaquarto, A4) |
| `references.bib` | Bibliography (BibTeX, APA style) |
| `data/make_data.R` | Creates the simulated customer survey |
| `data/customer_survey.csv` | Simulated survey data (400 customers, 12 items) |

## Reproduce

Requires R with the packages `psych`, `GPArotation`, `ggplot2`, `ragg`, and Quarto (with TinyTeX for the PDF).

```bash
Rscript data/make_data.R
quarto render handout.qmd
quarto render presentation.qmd
```
