ECHO OFF
SETLOCAL
REM ---------------------------------------------------------------------------
REM © 2025 Northern Pacific Technologies, LLC. All Rights Reserved. 
REM 
REM For license details, see the LICENSE file in this project root.
REM ---------------------------------------------------------------------------

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Factory Generation
REM ---------------------------------------------------------------------------

SET PARETO_USERNAME=%PARETO_USERNAME%
SET PARETO_PASSWORD=%PARETO_PASSWORD%
SET PARETO_FACTORY_URL=%PARETO_FACTORY_URL%
SET PARETO_TENANT_UUID=%PARETO_TENANT_UUID%

SET SOURCE_ROOT_DIR=%PARETO_ROOT_DIR%\pareto-factory-load
SET PARETO_BUILD_FILE=%SOURCE_ROOT_DIR%\src\main\resources\ParetoBuild.csv

java -jar %PARETO_TOOL_DIR%\pareto-builder.jar

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Loader Build
REM ---------------------------------------------------------------------------

CD %PARETO_ROOT_DIR%\pareto-factory-load
CALL mvn clean install package -DskipTests

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Loader Distro into %PARETO_TOOL_DIR%
REM ---------------------------------------------------------------------------

COPY /Y target\pareto-factory-load*.jar "%PARETO_TOOL_DIR%"
DEL /Q "%PARETO_TOOL_DIR%\*shaded.jar"
DEL /Q "%PARETO_TOOL_DIR%\pareto-loader.jar"
pushd "%PARETO_TOOL_DIR%"
for %%F in (pareto-factory-load*.jar) do (
    RENAME "%%F" "pareto-loader.jar"
)
popd

CD %PARETO_ROOT_DIR%\pareto-factory-run\dos

ECHO Completed Pareto Loader Distro into %PARETO_TOOL_DIR%
ENDLOCAL