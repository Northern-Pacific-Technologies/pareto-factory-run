ECHO OFF
SETLOCAL
REM ---------------------------------------------------------------------------
REM © 2025 Northern Pacific Technologies, LLC. All Rights Reserved. 
REM 
REM For license details, see the LICENSE file in this project root.
REM ---------------------------------------------------------------------------

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Factory Java Library Generator
REM ---------------------------------------------------------------------------

SET PARETO_API_USERNAME=%NORPAC_TENANT_USERNAME%
SET PARETO_API_PASSWORD=%NORPAC_TENANT_PASSWORD%
SET PARETO_API_URL=%PARETO_FACTORY_URL%
SET PARETO_TENANT_UUID=%PARETO_TENANT_UUID%

REM ---------------------------------------------------------------------------
ECHO Generate the database DDL
REM ---------------------------------------------------------------------------

SET SOURCE_ROOT_DIR=%NORPAC_PARETO_ROOT_DIR%\pareto-factory-pareto
SET PARETO_BUILD_FILE=%SOURCE_ROOT_DIR%\ParetoBuild.csv

java -jar %PARETO_TOOL_DIR%\pareto-builder.jar

ECHO Beginning Pareto Factory Java Library Generator
ENDLOCAL
