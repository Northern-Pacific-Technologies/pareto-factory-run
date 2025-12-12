ECHO OFF
SETLOCAL
REM ---------------------------------------------------------------------------
REM © 2025 Northern Pacific Technologies, LLC. All Rights Reserved. 
REM 
REM For license details, see the LICENSE file in this project root.
REM ---------------------------------------------------------------------------

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Database Factory Generation
REM ---------------------------------------------------------------------------

SET PARETO_USERNAME=%PARETO_USERNAME%
SET PARETO_PASSWORD=%PARETO_PASSWORD%
SET PARETO_FACTORY_URL=%PARETO_FACTORY_URL%
SET PARETO_TENANT_UUID=%PARETO_TENANT_UUID%
SET PARETO_API_URL=http://localhost:11000

SET SOURCE_ROOT_DIR=%PARETO_ROOT_DIR%\pareto-factory-db
SET PARETO_BUILD_FILE=%SOURCE_ROOT_DIR%\ParetoBuild.csv

java -jar %PARETO_TOOL_DIR%\pareto-builder.jar

ECHO Completed Pareto Database Factory Generation
ENDLOCAL
