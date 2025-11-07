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

SET PARETO_API_USERNAME=%NORPAC_TENANT_USERNAME%
SET PARETO_API_PASSWORD=%NORPAC_TENANT_PASSWORD%
SET PARETO_API_URL=%PARETO_FACTORY_URL%
SET PARETO_API_VERSION=%PARETO_API_VERSION%

SET IMPORT_DATA_DIRECTORY=%PARETO_ROOT_DIR%\pareto-factory-data

java -jar %PARETO_TOOL_DIR%\pareto-loader.jar

ECHO Completed Pareto Factory Data Loader
ENDLOCAL
