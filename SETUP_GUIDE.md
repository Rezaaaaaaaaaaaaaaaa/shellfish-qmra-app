# 🚀 SETUP GUIDE - Shellfish QMRA App

**Complete installation and setup instructions for the Shellfish QMRA Streamlit application.**

---

## 📋 Prerequisites

### **Required:**
- **Python 3.8 or higher**
  - Check version: `python --version`
  - Download from: https://www.python.org/downloads/

### **Optional but Recommended:**
- **Git** (for version control)
- **Virtual environment** (for isolated installation)

---

## ⚡ Quick Setup (Windows)

### **Option 1: Automatic Installation (Recommended)**

1. **Navigate to the folder:**
   ```cmd
   cd "C:\Users\moghaddamr\OneDrive - NIWA\Quantitative Microbial Risk Assessment\Shellfish_QMRA_App"
   ```

2. **Install dependencies:**
   ```cmd
   pip install -r requirements.txt
   ```

3. **Run the app:**
   - **Basic version:** Double-click `START_APP.bat`
   - **Advanced version:** Double-click `START_APP_ADVANCED.bat`

4. **Open browser:**
   - App automatically opens at http://localhost:8501

---

## 🐍 Detailed Setup Instructions

### **Step 1: Verify Python Installation**

```cmd
python --version
```

Expected output: `Python 3.8.x` or higher

If Python is not installed:
- Download from https://www.python.org/downloads/
- During installation, **check "Add Python to PATH"**

---

### **Step 2: Create Virtual Environment (Recommended)**

**Why?** Isolates dependencies from other Python projects

```cmd
# Navigate to the app folder
cd "C:\Users\moghaddamr\OneDrive - NIWA\Quantitative Microbial Risk Assessment\Shellfish_QMRA_App"

# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate

# On Mac/Linux:
source venv/bin/activate
```

You should see `(venv)` in your command prompt.

---

### **Step 3: Install Dependencies**

```cmd
pip install -r requirements.txt
```

**This installs:**
- `streamlit` - Web framework
- `pandas` - Data manipulation
- `numpy` - Numerical computing
- `scipy` - Scientific functions (gammaln, fisk distribution)
- `plotly` - Interactive charts

**Expected output:**
```
Successfully installed streamlit-X.X.X pandas-X.X.X numpy-X.X.X scipy-X.X.X plotly-X.X.X
```

---

### **Step 4: Verify Installation**

```cmd
python -c "import streamlit, pandas, numpy, scipy, plotly; print('All packages installed successfully!')"
```

Expected output: `All packages installed successfully!`

---

### **Step 5: Run the App**

**Option A: Using Batch Files (Windows)**
```cmd
# Basic version
START_APP.bat

# Advanced version (recommended)
START_APP_ADVANCED.bat
```

**Option B: Using Command Line**
```cmd
# Basic version
streamlit run shellfish_app.py

# Advanced version
streamlit run shellfish_app_advanced.py
```

**Option C: Using Python Module**
```cmd
python -m streamlit run shellfish_app_advanced.py
```

---

### **Step 6: Open in Browser**

The app should automatically open in your default browser at:
```
http://localhost:8501
```

If it doesn't open automatically, manually navigate to that URL.

---

## 🔧 Troubleshooting

### **Problem 1: Python not found**

**Error:** `'python' is not recognized as an internal or external command`

**Solution:**
1. Reinstall Python with "Add to PATH" checked
2. Or use full path: `C:\Python311\python.exe`
3. Try `py` instead of `python`

---

### **Problem 2: pip not found**

**Error:** `'pip' is not recognized`

**Solution:**
```cmd
python -m pip install -r requirements.txt
```

---

### **Problem 3: Permission denied**

**Error:** `ERROR: Could not install packages due to an EnvironmentError`

**Solution:**
```cmd
pip install --user -r requirements.txt
```

---

### **Problem 4: Port already in use**

**Error:** `Port 8501 is already in use`

**Solution:**
```cmd
# Option 1: Use different port
streamlit run shellfish_app_advanced.py --server.port 8502

# Option 2: Kill existing process
# On Windows:
netstat -ano | findstr :8501
taskkill /PID <PID> /F

# On Mac/Linux:
lsof -i :8501
kill -9 <PID>
```

---

### **Problem 5: Import error for scipy.stats.fisk**

**Error:** `cannot import name 'fisk' from 'scipy.stats'`

**Solution:**
```cmd
# Upgrade scipy to latest version
pip install --upgrade scipy
```

Requires scipy >= 1.10.0 (fisk distribution support)

---

### **Problem 6: App doesn't open in browser**

**Solution:**
1. Manually open browser
2. Navigate to: http://localhost:8501
3. Check terminal for actual URL (may be different)

---

## 🌐 Running on Different Machines

### **To share with colleagues:**

1. **Copy entire folder** to their machine
2. **Share these instructions**
3. **They need to:**
   - Install Python 3.8+
   - Run: `pip install -r requirements.txt`
   - Double-click `START_APP_ADVANCED.bat`

### **Network Access (Optional):**

To allow others on your network to access:

```cmd
streamlit run shellfish_app_advanced.py --server.address 0.0.0.0
```

**Warning:** Only do this on trusted networks!

---

## 📦 Package Versions

**Tested and verified with:**

| Package | Minimum Version | Recommended Version |
|---------|----------------|---------------------|
| Python | 3.8 | 3.11+ |
| streamlit | 1.28.0 | Latest |
| pandas | 2.0.0 | Latest |
| numpy | 1.24.0 | Latest |
| scipy | 1.10.0 | Latest (for fisk dist) |
| plotly | 5.14.0 | Latest |

---

## 🔄 Updating the App

### **To update Python packages:**

```cmd
pip install --upgrade -r requirements.txt
```

### **To update the app code:**

If you receive updated `.py` files:
1. Replace old `shellfish_app.py` and/or `shellfish_app_advanced.py`
2. Restart the app (Ctrl+C in terminal, then re-run)

---

## 🧪 Test Installation

**Quick test to verify everything works:**

1. Start the advanced app
2. In sidebar, select "Single Site"
3. Keep all default values
4. Click "🚀 Run QMRA"
5. Expected result: ~40-41 infections out of 100 people

**If you see results**, installation is successful!

---

## 💾 Data Files

### **Sample Data Included:**

| File | Location | Description |
|------|----------|-------------|
| shellfish_sites.csv | example_data/ | 16 example sites |
| shellfish_sites_small.csv | example_data/ | 5 sites (quick test) |
| shellfish_sites_varied.csv | example_data/ | Varied dilution factors |

### **Creating Your Own Data:**

**Required columns:**
- `Site_Name` (text)
- `Dilution_Factor` (number)

**Optional columns:**
- `Meal_Size_g` (number, default 50)

**Example:**
```csv
Site_Name,Dilution_Factor,Meal_Size_g
Beach_A,100,50
Beach_B,75,60
Beach_C,120,45
```

---

## 🔐 Security Notes

- **This app runs locally** on your machine
- **No data is sent** to external servers
- **No internet required** after installation
- **Data stays on your computer**

---

## 📞 Support

**If you encounter issues:**

1. Check this guide's troubleshooting section
2. Verify Python version: `python --version`
3. Verify package installation: `pip list`
4. Check terminal/console for error messages
5. Restart the app (Ctrl+C, then re-run)

---

## ✅ Installation Checklist

- [ ] Python 3.8+ installed
- [ ] requirements.txt dependencies installed
- [ ] App starts without errors
- [ ] Browser opens to http://localhost:8501
- [ ] Can load example data (shellfish_sites.csv)
- [ ] Can run single site assessment
- [ ] Can run batch assessment
- [ ] Results display correctly

---

**Once all items are checked, your installation is complete!** 🎉

**Quick Start:** Double-click `START_APP_ADVANCED.bat` and start assessing shellfish sites!
