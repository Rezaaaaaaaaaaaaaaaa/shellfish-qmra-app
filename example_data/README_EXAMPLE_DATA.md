# Example Data Files

This folder contains sample input data for the Shellfish QMRA application.

---

## 📁 Available Files

### **1. shellfish_sites.csv** (16 sites)
**Purpose:** Full example dataset matching Excel file structure

**Sites included:**
- Currentmeter (reference site, dilution=100)
- E1 through E15 (various dilution factors 40-120)

**Use for:**
- Testing batch processing with realistic number of sites
- Comparing with Excel results
- Demonstrating full workflow

**Dilution range:** 40 to 120
**Processing time:** ~1-2 minutes (10,000 iterations per site)

---

### **2. shellfish_sites_small.csv** (5 sites)
**Purpose:** Quick test dataset for fast verification

**Sites included:**
- Test_Beach_A to Test_Beach_E
- Dilution factors: 50, 75, 90, 100, 120

**Use for:**
- Quick testing during setup
- Learning how to use the app
- Fast workflow demonstration

**Dilution range:** 50 to 120
**Processing time:** ~20-30 seconds

---

### **3. shellfish_sites_varied.csv** (10 sites)
**Purpose:** Demonstrates wide range of risk scenarios

**Sites included:**
- High risk: Near_Outfall (dilution=15), High_Risk_Site (dilution=20)
- Moderate risk: Moderate_Risk_1 & 2 (dilution=50, 80)
- Low risk: Low_Risk_1 & 2 (dilution=150, 200)
- Very low risk: Very_Low_Risk (dilution=300)

**Use for:**
- Risk categorization examples
- Sensitivity analysis
- Demonstrating effect of dilution

**Dilution range:** 15 to 300
**Processing time:** ~45-60 seconds

---

## 📝 File Format

**Required columns:**
- `Site_Name` - Unique identifier for each site (text)
- `Dilution_Factor` - Dilution from treated effluent to site (number)

**Optional columns:**
- `Meal_Size_g` - Meal size in grams (number, default=50g if not provided)
  - Note: In Advanced Mode with variable meal size, this column is ignored

**Example:**
```csv
Site_Name,Dilution_Factor,Meal_Size_g
My_Beach,100,50
Another_Beach,75,60
Third_Beach,120,45
```

---

## 🎯 How to Use

### **In the App:**

1. **Start app:** Double-click `START_APP_ADVANCED.bat`

2. **Select "Multiple Sites"** in sidebar

3. **Upload file:**
   - Click "Choose CSV file"
   - Navigate to `example_data/` folder
   - Select desired example file

4. **Set parameters:**
   - Effluent concentration (default: 1, 1000, 100000)
   - WWTP log removal (default: 2.0)
   - Number of people (default: 100)
   - Iterations (default: 10,000)

5. **Run assessment:**
   - Scroll to "⬇️ CLICK HERE TO RUN ⬇️"
   - Click "🚀 RUN BATCH QMRA"

6. **View results:**
   - Summary table
   - Comparison charts
   - Download CSV

---

## 🔬 Expected Results

### **shellfish_sites.csv (Dilution=100)**
- Mean infections: ~40-41 out of 100 people
- Risk per person: ~40-41%
- Illness cases: ~24-25 out of 100 people

### **shellfish_sites_varied.csv**

| Site | Dilution | Expected Risk |
|------|----------|---------------|
| High_Risk_Site | 20 | ~55-60% |
| Moderate_Risk_1 | 50 | ~48-52% |
| Mid_Distance | 100 | ~40-42% |
| Low_Risk_1 | 150 | ~35-38% |
| Very_Low_Risk | 300 | ~25-28% |

**Note:** Results vary slightly due to Monte Carlo random sampling

---

## ✏️ Creating Your Own Data

### **Method 1: Edit Existing File**
1. Open any example CSV in Excel or text editor
2. Replace site names and dilution factors
3. Save as new CSV file
4. Upload to app

### **Method 2: Template from App**
1. In app, select "Multiple Sites"
2. Click "📄 Download Template"
3. Open downloaded file
4. Add your site data
5. Upload back to app

### **Method 3: From Scratch**
```csv
Site_Name,Dilution_Factor,Meal_Size_g
Your_Site_1,100,50
Your_Site_2,75,50
Your_Site_3,120,50
```

Save as `.csv` file with UTF-8 encoding.

---

## 📊 Data Validation

**The app will check for:**
- Required columns present
- Dilution factors are positive numbers
- Meal sizes are positive (if provided)
- No duplicate site names (warning only)

**Common errors:**

| Error | Cause | Solution |
|-------|-------|----------|
| "Missing required column" | Wrong column names | Use exact names: `Site_Name`, `Dilution_Factor` |
| "Could not convert to numeric" | Non-numeric values | Ensure dilution is a number (e.g., 100, not "100m") |
| File won't upload | Wrong format | Save as CSV (not Excel .xlsx) |

---

## 🌊 Real-World Dilution Factors

**Typical ranges:**

- **Near outfall (< 50m):** 10-40
- **Moderate distance (50-200m):** 40-100
- **Far distance (200-500m):** 100-200
- **Well-mixed bay:** 150-300+

**Factors affecting dilution:**
- Distance from WWTP outfall
- Ocean currents and tides
- Depth and mixing
- Seasonal conditions

---

## 🔄 Updating Data

**To modify existing sites:**
1. Open CSV in text editor or Excel
2. Change values (keep column headers)
3. Save (ensure CSV format, UTF-8)
4. Re-upload to app

**To add new sites:**
1. Add new rows at bottom of CSV
2. Include Site_Name and Dilution_Factor
3. Save and upload

---

## 💾 Output Data

**Results are saved to:**
- `outputs/` folder (if you click Download in app)
- Browser downloads folder

**Output format:**
```csv
Site,Dilution,Mode,Mean Infections,Median Infections,...
```

You can use output from one run as input for comparison.

---

## ✅ Data Checklist

Before using your data, verify:

- [ ] CSV file format (not Excel .xlsx)
- [ ] Column headers spelled correctly
- [ ] Dilution factors are positive numbers
- [ ] Site names are unique
- [ ] No special characters in site names (use underscore _ instead of spaces)
- [ ] File saved with UTF-8 encoding

---

**Ready to process your own sites!** 🦪

For more information, see [SETUP_GUIDE.md](../SETUP_GUIDE.md) and [README.md](../README.md)
