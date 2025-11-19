@echo off
REM Shellfish QMRA Launcher
REM Complete Excel Replication with Advanced Features

echo ========================================
echo   SHELLFISH QMRA
echo ========================================
echo.
echo Starting Shellfish QMRA app...
echo.
echo Features:
echo  - Variable meal size (LogLogistic)
echo  - Variable BAF option
echo  - Hockey-stick concentration option
echo  - All parameters via CSV input
echo.
echo The app will open in your browser at:
echo http://localhost:8501
echo.
echo Press Ctrl+C to stop the app
echo ========================================
echo.

cd /d "%~dp0"
python -m streamlit run shellfish_app.py

pause
