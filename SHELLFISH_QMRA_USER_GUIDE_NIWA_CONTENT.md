# Shellfish QMRA Web Application - User Guide

**NIWA Earth Sciences Format**

---

**Document Information**

- **Title:** Shellfish Quantitative Microbial Risk Assessment - Web Application User Guide
- **Author:** NIWA Quantitative Microbial Risk Assessment Team
- **Version:** 1.0
- **Date:** January 2025
- **Status:** Production Ready
- **Methodology:** Gram McBride (NIWA)

---

## Executive Summary

This user guide provides step-by-step instructions for using the Shellfish QMRA web application to assess norovirus infection risks from shellfish consumption. The application is designed for water quality managers, public health assessors, and environmental scientists working on shellfish safety in New Zealand waters.

**Key Capabilities:**
- Assess multiple sites simultaneously (batch processing)
- Process unlimited dilution measurements per site
- Generate interactive risk visualizations
- Export results in multiple formats
- 100× faster than Excel-based analysis

**Target Users:**
- Water quality managers
- Public health risk assessors
- Environmental scientists
- Regulatory compliance officers

---

## 1. Introduction

### 1.1 Purpose

The Shellfish QMRA web application assesses health risks from eating shellfish harvested near wastewater outfalls. It calculates infection and illness probabilities based on:
- Wastewater pathogen concentrations
- Ocean dilution measurements
- Shellfish consumption patterns
- Treatment plant performance

### 1.2 Scope

This guide covers:
- Installing and starting the application (Windows)
- Preparing input data files
- Running risk assessments
- Understanding and interpreting results
- Exporting data for reports
- Troubleshooting common issues

**What this guide does NOT cover:**
- Theoretical QMRA background (see References)
- Field sampling methods
- Laboratory analysis procedures

---

## 2. Getting Started (Windows)

### 2.1 System Requirements

**Operating System:**
- Windows 10 or Windows 11

**Software:**
- Python 3.8 or higher (check with: `python --version` in Command Prompt)
- Web browser (Chrome, Firefox, or Edge)

**Hardware:**
- Minimum: 4 GB RAM
- Recommended: 8 GB RAM for large datasets

### 2.2 Installation

**Step 1: Check Python**

Open Command Prompt and type:
```
python --version
```

You should see: `Python 3.8.x` or higher

**Step 2: Install Required Packages**

In Command Prompt, type:
```
pip install streamlit pandas numpy scipy plotly
```

Wait for installation to complete (1-2 minutes).

**Step 3: Locate Application Files**

Ensure you have these files in your `Shellfish_QMRA_App` folder:
- `shellfish_app.py`
- `START_APP.bat`
- `example_data` folder (with sample files)

### 2.3 Starting the Application

**Easy Method (Double-Click):**
1. Open File Explorer
2. Navigate to `Shellfish_QMRA_App` folder
3. Double-click `START_APP.bat`
4. Your browser opens automatically to http://localhost:8501

**Command Line Method:**
```
cd Shellfish_QMRA_App
python -m streamlit run shellfish_app.py
```

**First Time Setup:**

When you first start the app:
- Example data loads automatically
- Click "🚀 RUN QMRA" to see a demo
- Review the example results to familiarize yourself with outputs

---

## 3. Preparing Your Data

### 3.1 Understanding the Two-File System

The application requires TWO CSV files:

**File 1: sites.csv**
- Contains site parameters (one row per site)
- Fixed configuration values

**File 2: dilutions.csv**
- Contains dilution measurements (multiple rows per site)
- Field measurement data

This separation makes it easy to add new measurements without changing site configurations.

### 3.2 Creating sites.csv

**Required Columns:**

| Column Name | Description | Example Values | Units |
|------------|-------------|----------------|-------|
| Site_Name | Unique site identifier | "Titahi_Bay", "Lyall_Bay" | Text |
| Effluent_Min | Minimum pathogen concentration in effluent | 1 | genome copies/L |
| Effluent_Median | Typical pathogen concentration | 1000 | genome copies/L |
| Effluent_Max | Maximum pathogen concentration | 100000 | genome copies/L |
| WWTP_Log_Removal | Treatment plant log reduction | 2.0 | log₁₀ units |
| Meal_Size_g | Reference meal size | 50 | grams |
| Num_People | Population size for simulation | 100 | count |
| Iterations | Monte Carlo iterations | 10000 | count |

**Example sites.csv:**
```csv
Site_Name,Effluent_Min,Effluent_Median,Effluent_Max,WWTP_Log_Removal,Meal_Size_g,Num_People,Iterations
Titahi_Bay,1,1000,100000,2.0,50,100,10000
Lyall_Bay,1,1000,100000,2.5,50,100,10000
Island_Bay,1,500,50000,3.0,50,100,10000
```

**Tips for sites.csv:**
- Use descriptive site names (no spaces recommended)
- Effluent values: Min < Median < Max (app will check)
- Iterations: Use 10,000 for production, 100 for quick testing
- WWTP_Log_Removal: Typical range 1.5-3.0 for New Zealand plants

### 3.3 Creating dilutions.csv

**Required Columns:**

| Column Name | Description | Example Values |
|------------|-------------|----------------|
| Site_Name | Must match a site in sites.csv | "Titahi_Bay" |
| Dilution_Value | Measured dilution factor | 100, 95, 110 |

**Example dilutions.csv:**
```csv
Site_Name,Dilution_Value
Titahi_Bay,100
Titahi_Bay,105
Titahi_Bay,95
Titahi_Bay,110
Titahi_Bay,98
Lyall_Bay,75
Lyall_Bay,80
Lyall_Bay,70
Lyall_Bay,78
```

**Tips for dilutions.csv:**
- Include all measurements for each site (no limit)
- Minimum 5 measurements recommended per site
- 20+ measurements preferred for statistical robustness
- Each site in sites.csv MUST have dilution data

### 3.4 Data Quality Checks

The application automatically checks your data for:

**Critical Errors (Must Fix):**
- Missing required columns
- Missing values in required fields
- Non-numeric values in number columns
- Effluent Min/Median/Max order violations
- Sites without dilution data
- Duplicate site names

**Warnings (Review Recommended):**
- Fewer than 5 dilution measurements per site
- Iteration counts below 1,000
- Unusually high WWTP log removal (>10)
- Very large meal sizes (>1000g)

**Suggestions:**
- Increase iterations to 10,000 for final analysis
- Add more dilution measurements if possible

---

## 4. Running a Risk Assessment

### 4.1 Loading Data

**Option 1: Use Example Data (Default)**
- Application loads example data automatically
- Good for familiarization and testing
- Click "🚀 RUN QMRA" immediately

**Option 2: Upload Your Own Data**
1. Click "📤 Upload Data Files" section
2. Click "Browse files" for sites.csv
3. Select your sites.csv file
4. Click "Browse files" for dilutions.csv
5. Select your dilutions.csv file
6. Data preview appears automatically

### 4.2 Reviewing Data Quality

After uploading, expand "🔍 Data Quality Report":

**Check Summary Metrics:**
- Number of sites detected
- Total dilution measurements
- Average measurements per site
- Total iterations planned

**Review Quality Report:**
- **Green (Success):** No critical errors - ready to run
- **Yellow (Warning):** Review warnings, but can proceed
- **Red (Error):** Must fix errors before running

**If Errors Appear:**
1. Read error messages carefully
2. Fix your CSV files
3. Re-upload corrected files
4. Check quality report again

### 4.3 Starting the Analysis

1. Review your data tables (sites and dilutions displayed)
2. Check data quality report (expand if needed)
3. Click large **"🚀 RUN QMRA"** button
4. Progress bar shows completion status
5. Results appear automatically when finished

**Analysis Time:**
- 5 sites × 10,000 iterations: ~10 seconds
- 20 sites × 10,000 iterations: ~30 seconds
- Much faster than Excel @RISK (5-15 minutes)

---

## 5. Understanding Results

### 5.1 Summary Statistics Table

**Columns Explained:**

| Column | Meaning | Typical Values |
|--------|---------|----------------|
| Site | Site name from your CSV | Text |
| Dilution (mean) | Average of your dilution measurements | 50-200 |
| Mean Infections | Average infections per 100 people | 0-10 |
| Median Infections | Typical infections per 100 people | 0-5 |
| Mean Illness | Average illnesses per 100 people | 0-5 |
| Median Illness | Typical illnesses per 100 people | 0-3 |
| Risk/Person (%) | Individual infection probability | 0-10% |

**Interpreting Risk Levels:**

| Risk/Person (%) | Classification | Recommended Action |
|-----------------|----------------|--------------------|
| < 0.01% | Very Low | Acceptable for unrestricted harvest |
| 0.01 - 0.1% | Low | Monitor regularly |
| 0.1 - 1% | Moderate | Consider enhanced treatment or restrictions |
| 1 - 10% | High | Significant intervention required |
| > 10% | Very High | Immediate closure recommended |

### 5.2 Site Comparison Chart

**Bar Chart Features:**
- Blue bars = Infections
- Orange bars = Illness
- Higher bars = Higher risk
- Grouped by site for easy comparison

**Use This To:**
- Identify highest-risk sites
- Compare relative risks across locations
- Prioritize management actions

### 5.3 Detailed Percentile Statistics

**Percentile Table Columns:**

| Percentile | Interpretation |
|------------|----------------|
| 5th | Best-case scenario (low exposure) |
| 25th | Better than average |
| 50th (Median) | Typical outcome |
| 75th | Worse than average |
| 95th | Worst-case realistic scenario |
| 99th | Extreme worst-case |

**How to Use:**
- **50th percentile:** Most likely outcome
- **95th percentile:** Planning for rare but possible events
- **Spread (5th to 95th):** Measure of uncertainty

### 5.4 Box Plots

**Box Plot Components:**
- **Box:** Middle 50% of results (25th to 75th percentile)
- **Line in box:** Median (50th percentile)
- **Whiskers:** Typical range (5th to 95th percentile)
- **Dots:** Outlier events (rare occurrences)

**Wider boxes = More variability in risk**

### 5.5 Distribution Histograms

**What They Show:**
- Frequency of different infection/illness counts
- Shape of risk distribution
- Whether risk is consistent or variable

**Interpretation:**
- **Tall narrow peak:** Consistent, predictable risk
- **Wide flat distribution:** High variability
- **Multiple peaks:** Multiple risk scenarios

### 5.6 Cumulative Distribution Functions (CDF)

**CDF Curves Explained:**
- X-axis: Number of infections/illnesses
- Y-axis: Probability (0 to 1)
- Steep curve: Outcomes concentrated in narrow range
- Gradual curve: Wide range of possible outcomes

**How to Read:**
- Find X value (e.g., 5 infections)
- Trace up to curve
- Read Y value = Probability of ≤ 5 infections

---

## 6. Exporting Results

### 6.1 Download Options

**Three Export Formats Available:**

**Format 1: Summary CSV**
- Contains: Summary statistics table
- Best for: Reports, presentations
- Columns: Site, Dilution, Mean/Median Infections/Illness, Risk%
- File name: `summary_results.csv`

**Format 2: Percentiles CSV**
- Contains: All percentile statistics
- Best for: Detailed statistical reporting
- Columns: Site, Infections (5th-99th), Illness (5th-99th)
- File name: `percentile_results.csv`

**Format 3: Full Iteration Data**
- Contains: All 10,000 iterations for each site
- Best for: Custom analysis, verification, modeling
- Columns: Site, Iteration, Infections, Illness
- File name: `full_iteration_data.csv`
- Size: Large file (5 sites × 10,000 rows = 50,000 rows)

### 6.2 Opening Downloaded Files

**In Excel:**
1. Download CSV file
2. Open Excel
3. File → Open → Browse to Downloads folder
4. Select CSV file
5. Data imports automatically

**Formatting Tips:**
- Convert Risk/Person (%) to percentage format
- Apply number formatting to improve readability
- Create charts using Excel's built-in tools

---

## 7. Advanced Features

### 7.1 Batch Processing Multiple Sites

**Benefits:**
- Analyze 5, 10, 20+ sites in one run
- Consistent methodology across all sites
- Time-efficient (seconds vs. hours in Excel)

**Steps:**
1. Add all sites to sites.csv
2. Include dilution measurements for all sites in dilutions.csv
3. Upload both files
4. Click RUN QMRA once
5. Results table shows all sites together

### 7.2 Sensitivity Analysis

**Testing Different Scenarios:**

Create multiple sites.csv files:
- `sites_low_treatment.csv` (WWTP_Log_Removal = 1.5)
- `sites_medium_treatment.csv` (WWTP_Log_Removal = 2.0)
- `sites_high_treatment.csv` (WWTP_Log_Removal = 2.5)

Run each separately and compare results to assess treatment impact.

### 7.3 High-Precision Runs

**For Final Reporting:**
- Increase Iterations to 50,000 or 100,000
- Produces smoother CDF curves
- Reduces Monte Carlo variability
- Takes longer but more precise

**When to Use:**
- Final regulatory submissions
- Peer-reviewed publications
- Critical decision-making

---

## 8. Troubleshooting

### 8.1 Common Data Errors

**Error: "Missing required columns"**
- **Cause:** CSV file missing Site_Name, Dilution_Value, or other required columns
- **Fix:** Check column names match exactly (case-sensitive)

**Error: "Effluent values must satisfy Min < Median < Max"**
- **Cause:** Incorrect ordering of effluent concentrations
- **Fix:** Verify Min < Median < Max for each site row

**Error: "Sites in sites.csv missing from dilutions.csv"**
- **Cause:** Site name in sites.csv has no matching dilution data
- **Fix:** Add dilution measurements for that site, or remove site from sites.csv

**Error: "Non-numeric values found in column"**
- **Cause:** Text in a number column (e.g., "high" instead of 1000)
- **Fix:** Replace text with numeric values

### 8.2 Application Issues

**Problem: App won't start (START_APP.bat doesn't work)**
- **Solution 1:** Check Python installed (`python --version`)
- **Solution 2:** Install packages: `pip install streamlit pandas numpy scipy plotly`
- **Solution 3:** Use command line: `python -m streamlit run shellfish_app.py`

**Problem: Browser doesn't open automatically**
- **Solution:** Manually open browser and go to http://localhost:8501

**Problem: "Address already in use" error**
- **Solution:** Close other Streamlit apps, or use: `streamlit run shellfish_app.py --server.port 8502`

**Problem: Results look wrong**
- **Solution 1:** Check data quality report for warnings
- **Solution 2:** Verify CSV files have correct values
- **Solution 3:** Re-run with more iterations (increase from 100 to 10,000)

### 8.3 Performance Issues

**Analysis is slow:**
- **Cause:** Too many iterations or sites
- **Fix:** For testing, use Iterations=100; for production use 10,000

**Out of memory:**
- **Cause:** System has <4 GB RAM
- **Fix:** Close other applications, or reduce number of sites

---

## 9. Best Practices

### 9.1 Data Collection

- Collect at least 10 dilution measurements per site
- Sample during different tidal and weather conditions
- Document sampling dates and conditions
- Record effluent data from WWTP operators

### 9.2 Running Analyses

- Start with 100 iterations for testing data format
- Use 10,000 iterations for production runs
- Use 50,000+ iterations for final regulatory submissions
- Save all CSV inputs with your project documentation

### 9.3 Reporting Results

- Report both mean and median values
- Include 95th percentile for worst-case planning
- Provide context on dilution measurement conditions
- Document WWTP log removal assumptions
- Export full iteration data for reproducibility

---

## 10. References

### 10.1 Scientific Basis

**Dose-Response Model:**
- Teunis, P. F. M., et al. (2008). "Norwalk virus: How infectious is it?" Journal of Medical Virology, 80(8), 1468-1476.
- Model: Beta-Binomial for norovirus (α=0.04, β=0.055)

**Shellfish Consumption:**
- Ball, A. (ESR). Shellfish dose modeling approach for Waimakariri coast (WDC).
- LogLogistic distribution for meal size variability

**QMRA Methodology:**
- McBride, G. (NIWA). QMRA methodology for shellfish risk assessment.
- Monte Carlo simulation framework: 100 people × 10,000 events

### 10.2 Guidelines and Standards

**New Zealand:**
- Ministry for Primary Industries (MPI) - Shellfish Quality Assurance Programmes
- Ministry of Health - Water Safety Plans

**International:**
- WHO Guidelines for Safe Recreational Water Environments (2021)
- Codex Alimentarius - Code of Practice for Fish and Fishery Products

---

## Appendix A: Glossary

**Beta-Binomial Model:** Statistical model describing probability of infection from pathogen exposure

**CDF (Cumulative Distribution Function):** Graph showing probability of results less than or equal to a value

**Dilution Factor:** Ratio of pathogen concentration in effluent vs. receiving water

**ECDF (Empirical Cumulative Distribution Function):** Distribution based directly on measured data

**Genome Copies:** Measure of pathogen quantity (used for norovirus)

**Iterations:** Number of Monte Carlo simulation runs (recommend 10,000)

**Log Removal:** Wastewater treatment efficiency (log₁₀ units; 2.0 = 99% removal)

**Monte Carlo Simulation:** Method using repeated random sampling to estimate risk distributions

**Norovirus:** Highly contagious virus causing gastroenteritis; primary shellfish pathogen risk

**Percentile:** Value below which a percentage of observations fall (e.g., 95th = 95% below)

**QMRA:** Quantitative Microbial Risk Assessment

**WWTP:** Wastewater Treatment Plant

---

## Appendix B: Example Files

### sites.csv (Complete Example)

```csv
Site_Name,Effluent_Min,Effluent_Median,Effluent_Max,WWTP_Log_Removal,Meal_Size_g,Num_People,Iterations
Titahi_Bay,1,1000,100000,2.0,50,100,10000
Lyall_Bay,1,1200,120000,2.2,50,100,10000
Island_Bay,1,800,80000,2.5,50,100,10000
Moa_Point,1,1500,150000,1.8,50,100,10000
Worser_Bay,1,500,50000,3.0,50,100,10000
```

### dilutions.csv (Complete Example)

```csv
Site_Name,Dilution_Value
Titahi_Bay,100
Titahi_Bay,105
Titahi_Bay,95
Titahi_Bay,110
Titahi_Bay,98
Titahi_Bay,102
Titahi_Bay,108
Titahi_Bay,92
Titahi_Bay,106
Titahi_Bay,104
Lyall_Bay,75
Lyall_Bay,80
Lyall_Bay,70
Lyall_Bay,78
Lyall_Bay,72
Lyall_Bay,82
Lyall_Bay,76
Lyall_Bay,79
Lyall_Bay,74
Lyall_Bay,81
Island_Bay,120
Island_Bay,125
Island_Bay,115
Island_Bay,130
Island_Bay,118
Island_Bay,122
Island_Bay,128
Island_Bay,112
Island_Bay,126
Island_Bay,124
Moa_Point,60
Moa_Point,65
Moa_Point,55
Moa_Point,70
Moa_Point,58
Moa_Point,62
Moa_Point,68
Moa_Point,52
Moa_Point,66
Moa_Point,64
Worser_Bay,150
Worser_Bay,155
Worser_Bay,145
Worser_Bay,160
Worser_Bay,148
Worser_Bay,152
Worser_Bay,158
Worser_Bay,142
Worser_Bay,156
Worser_Bay,154
```

---

## Appendix C: Quick Reference Card

### Starting the App (Windows)
```
1. Double-click START_APP.bat
2. Browser opens to http://localhost:8501
3. Click "🚀 RUN QMRA"
```

### Required CSV Columns

**sites.csv:**
- Site_Name
- Effluent_Min, Effluent_Median, Effluent_Max
- WWTP_Log_Removal
- Meal_Size_g
- Num_People
- Iterations

**dilutions.csv:**
- Site_Name
- Dilution_Value

### Recommended Values
- Iterations: 10,000 (production), 100 (testing)
- Num_People: 100
- WWTP_Log_Removal: 1.5 - 3.0
- Dilution measurements: 10-20 per site minimum

### Risk Classification
- < 0.01%: Very Low
- 0.01 - 0.1%: Low
- 0.1 - 1%: Moderate
- 1 - 10%: High
- \> 10%: Very High

---

**End of User Guide**

**For technical support, contact:** NIWA QMRA Team

**Version:** 1.0 | **Date:** January 2025 | **Platform:** Windows 10/11
