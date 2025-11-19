# Shellfish QMRA Web Application

A comprehensive Quantitative Microbial Risk Assessment (QMRA) tool for evaluating norovirus infection and illness risks in shellfish consumption scenarios.

## Overview

This web application implements a Monte Carlo simulation-based QMRA framework specifically designed for shellfish-associated norovirus risk assessment. It replicates and extends the Excel-based QMRA methodology developed by Gram McBride (NIWA), providing an accessible, reproducible, and scalable analysis platform.

## Key Features

- **Monte Carlo Simulation**: 10,000 iterations with 100 people per scenario for robust statistical analysis
- **Beta-Binomial Dose-Response Model**: Norovirus-specific parameters (α=0.04, β=0.055) from Teunis et al. 2008
- **Variable Meal Size Modeling**: LogLogistic distribution (median ~74g) based on NZ shellfish consumption data
- **Comprehensive Visualizations**:
  - Site comparison charts (infections vs illness)
  - Distribution analysis (box plots, histograms, CDFs)
  - Risk percentile analysis (5th, 25th, 50th, 75th, 95th, 99th)
- **Data Quality Validation**: Built-in checks for data integrity and consistency
- **Multiple Export Formats**:
  - CSV exports (summary, percentiles, full iteration data)
  - Word reports with embedded plots and comprehensive analysis

## Installation

### Prerequisites

- Python 3.8 or higher
- pip (Python package installer)

### Setup

1. Clone this repository:
```bash
git clone https://github.com/Rezaaaaaaaaaaaaaaaa/shellfish-qmra-app.git
cd shellfish-qmra-app
```

2. Install required packages:
```bash
pip install -r requirements.txt
```

3. For plot embedding in Word reports (optional):
```bash
pip install kaleido
```

## Usage

### Starting the Application

Run the Streamlit app:
```bash
streamlit run shellfish_app.py
```

Or use the Windows batch file:
```bash
START_APP.bat
```

The app will open in your default web browser at `http://localhost:8501`

### Input Data Format

The app requires two CSV files:

#### 1. Sites Configuration (`sites.csv`)
```csv
Site_Name,Effluent_Min,Effluent_Median,Effluent_Max,WWTP_Log_Removal,Meal_Size_g,Num_People,Iterations
Beach_A,1e6,5e6,1e7,0.5,50,100,10000
Beach_B,5e5,2e6,8e6,1.0,50,100,10000
```

#### 2. Dilution Measurements (`dilutions.csv`)
```csv
Site_Name,Dilution_Value
Beach_A,100
Beach_A,105
Beach_A,95
Beach_B,75
Beach_B,80
```

### Example Data

Pre-loaded example data is included in the `example_data/` folder for testing and demonstration purposes.

## Output

### Results Displayed

- **Summary Statistics Table**: Mean and median infections/illness per site
- **Risk per Person**: Individual infection probability (%)
- **Percentile Analysis**: Distribution characteristics across all sites
- **Visualizations**: Interactive Plotly charts for comprehensive risk visualization

### Risk Categories

- **Low Risk**: <1% per person
- **Moderate Risk**: 1-5% per person
- **High Risk**: >5% per person

### Export Options

1. **Summary CSV**: Mean/median statistics for all sites
2. **Percentiles CSV**: Detailed percentile analysis
3. **Full Iteration Data CSV**: Complete Monte Carlo results
4. **Word Report**: Comprehensive analysis with embedded visualizations

## Methodology

### QMRA Framework

The application implements a four-stage QMRA process:

1. **Hazard Identification**: Norovirus in wastewater-affected shellfish harvesting areas
2. **Exposure Assessment**:
   - Wastewater effluent concentrations
   - WWTP log removal rates
   - Dilution factors (site-specific measurements)
   - Bioaccumulation factor (MHF = 19.5)
   - Meal size variability (LogLogistic distribution)
3. **Dose-Response Assessment**: Beta-Binomial model (α=0.04, β=0.055)
4. **Risk Characterization**: Monte Carlo simulation with 100 people × 10,000 iterations

### Key Model Parameters

- **Dose-Response**: Beta-Binomial (Teunis et al. 2008)
- **Pathogen**: Norovirus GII
- **Meal Size**: LogLogistic distribution (α=0.96, β=76.37)
- **Bioaccumulation**: MHF = 19.5
- **Illness | Infection**: 75% (0.75 probability)

## Technical Documentation

Detailed methodology and user guide documentation is available in:
- `SETUP_GUIDE.md` - Complete setup and configuration instructions
- `SHELLFISH_QMRA_USER_GUIDE_NIWA_CONTENT.md` - Comprehensive user manual

## Validation

This application has been validated against the original Excel-based QMRA model:

- **Beta-Binomial Model**: Exact match confirmed
- **Dose-Response Parameters**: Verified against Teunis 2008
- **Statistical Outputs**: Mean/median/percentiles match Excel @RISK results
- **Monte Carlo Structure**: Replicates 100 people × 10,000 iterations approach

## Requirements

See `requirements.txt` for complete list of dependencies:
- streamlit
- pandas
- numpy
- scipy
- plotly
- python-docx
- kaleido (optional, for Word report plot embedding)

## Support

For questions, issues, or feature requests, please open an issue on GitHub.

## License

This project is developed for NIWA (National Institute of Water and Atmospheric Research).

## Acknowledgments

- **Methodology**: Gram McBride (NIWA) - Original Excel-based QMRA framework
- **Dose-Response Model**: Teunis et al. 2008
- **Development**: NIWA Quantitative Microbial Risk Assessment Project

## Citation

If you use this application in your research, please cite:

```
Shellfish QMRA Web Application (2024)
National Institute of Water and Atmospheric Research (NIWA)
GitHub: https://github.com/Rezaaaaaaaaaaaaaaaa/shellfish-qmra-app
```

---

**Version**: 1.0.0
**Last Updated**: November 2024
**Contact**: NIWA - National Institute of Water and Atmospheric Research
