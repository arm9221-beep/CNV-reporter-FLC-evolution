# CNV reporter evolution under fluconazole (FLC)

Website presenting the flow cytometry (Cytek) analysis of the yeast mCitrine CNV reporter evolution experiment. Populations are evolved in four media (SCGlu, YPGly, YPD, SD) at several fluconazole concentrations, and copy-number changes are followed over passages using mCitrine fluorescence (B2-A) compared to each column's 1-copy and 2-copy controls.

Live site: https://arm9221-beep.github.io/CNV-reporter-FLC-evolution/ (published via GitHub Pages from this repository's `main` branch).

## Contents

- `index.html` — landing page: experiment overview, passage/reading procedure, SD passage numbering, YPD controls note, and links to the report and code.
- `reports/FCS_analysis.html` — the knitted R Markdown report (self-contained; all figures embedded):
  - SSC singlet gating QC
  - median mCitrine (B2-A) over time per media, with 1-copy / 2-copy controls
  - B2-A/FSC-A histograms per media + FLC, one row per passage and one column per replicate
  - FSC-A vs B2-A plots with rectangular 1-copy / 2-copy gates fitted to the controls
  - SpectroFlo `SSC_S_2copy % Parent` values over time
- `reports/FCS_analysis.Rmd` — R Markdown source of the report.
- `reports/find_channelsMOD.R`, `reports/read_extract_singleMOD.R`, `reports/read_extract_dirMOD.R` — helper functions for reading the `.fcs` files (sourced by the Rmd).

Experimental replicates are shown separately in every plot (Rep 1 / 2 / 3 = plate rows D / E / F). SD lines were started later and are numbered by their own passage count (SD P1 = plate passage 4).

The raw `.fcs` files and SpectroFlo CSV exports are not included in this repository.
