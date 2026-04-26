@echo off
setlocal
set VENV_DIR=%USERPROFILE%\.jupytervenv

REM check if venv already exists in the script's directory or create new
if not exist "%VENV_DIR%" (
	echo creating virtual environment in %VENV_DIR% ...
	python -m venv "%VENV_DIR%"
)

REM activate the virtual environment
call "%VENV_DIR%\Scripts\activate"

REM check if jupyterlab is installed, otherwise install it
pip show jupyterlab >nul 2>&1
if errorlevel 1 (
	echo installing Jupyter Lab ...
	pip install jupyterlab
)

REM ============================================================
REM Add additional libraries for Jupyter Lab environment
pip install numpy pandas matplotlib
REM ============================================================

REM start Jupyter Lab
jupyter lab

pause