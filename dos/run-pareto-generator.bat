ECHO OFF
SETLOCAL
REM ---------------------------------------------------------------------------
REM © 2025 Northern Pacific Technologies, LLC. All Rights Reserved. 
REM 
REM For license details, see the LICENSE file in this project root.
REM ---------------------------------------------------------------------------

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Factory Generator
REM ---------------------------------------------------------------------------

SET PARETO_API_USERNAME=%NORPAC_TENANT_USERNAME%
SET PARETO_API_PASSWORD=%NORPAC_TENANT_PASSWORD%
SET PARETO_API_URL=%PARETO_FACTORY_URL%
SET PARETO_TENANT_UUID=%PARETO_TENANT_UUID%

REM ---------------------------------------------------------------------------
ECHO Generate the database DDL
REM ---------------------------------------------------------------------------

SET SOURCE_ROOT_DIR=%PARETO_ROOT_DIR%\pareto-factory-db
SET PARETO_BUILD_FILE=%SOURCE_ROOT_DIR%\ParetoBuild.csv

java -jar %PARETO_TOOL_DIR%\pareto-builder.jar

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Factory Generator
REM ---------------------------------------------------------------------------

SET SOURCE_ROOT_DIR=%PARETO_ROOT_DIR%\pareto-factory-api
SET PARETO_BUILD_FILE=%SOURCE_ROOT_DIR%\src\main\resources\ParetoBuild.csv

java -jar %PARETO_TOOL_DIR%\pareto-builder.jar

ECHO Completed Pareto Factory Generator

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Importer Factory Generation
REM ---------------------------------------------------------------------------

SET SOURCE_ROOT_DIR=%PARETO_ROOT_DIR%\pareto-factory-imp
SET PARETO_BUILD_FILE=%SOURCE_ROOT_DIR%\src\main\resources\ParetoBuild.csv

java -jar %PARETO_TOOL_DIR%\pareto-builder.jar

ECHO Completed Pareto Importer Factory Generation

ENDLOCAL
