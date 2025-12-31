ECHO OFF
SETLOCAL
REM ---------------------------------------------------------------------------
REM © 2025 Northern Pacific Technologies, LLC. All Rights Reserved. 
REM 
REM For license details, see the LICENSE file in this project root.
REM ---------------------------------------------------------------------------

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Factory Data Loader
REM ---------------------------------------------------------------------------

SET NORPAC_API_USERNAME=%NORPAC_API_USERNAME%
SET NORPAC_API_PASSWORD=%NORPAC_API_PASSWORD%

SET PARETO_API_URL=%PARETO_API_URL%
SET PARETO_API_VER=%PARETO_API_VER%
SET PARETO_IMP_DIR=%NORPAC_PARETO_ROOT_DIR%\pareto-factory-load-data

SET PLATFORM_API_URL=%PLATFORM_API_URL%
SET PLATFORM_API_VER=%PLATFORM_API_VER%
SET PLATFORM_IMP_DIR=NOTUSED

java -jar %PARETO_TOOL_DIR%\pareto-loader.jar

ECHO Completed Pareto Factory Data Loader
ENDLOCAL
