ECHO OFF
SETLOCAL
REM ---------------------------------------------------------------------------
REM © 2025 Northern Pacific Technologies, LLC. All Rights Reserved. 
REM 
REM For license details, see the LICENSE file in this project root.
REM ---------------------------------------------------------------------------

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Importer Build
REM ---------------------------------------------------------------------------

CD %NORPAC_PARETO_ROOT_DIR%\pareto-factory-importer
CALL mvn clean install package -DskipTests

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Importer Distro into %PARETO_TOOL_DIR%
REM ---------------------------------------------------------------------------

COPY /Y target\pareto-factory-importer*.jar "%PARETO_TOOL_DIR%"
DEL /Q "%PARETO_TOOL_DIR%\*shaded.jar"
DEL /Q "%PARETO_TOOL_DIR%\pareto-importer*.jar"
PUSHD "%PARETO_TOOL_DIR%"
FOR %%F in (pareto-factory-importer*.jar) DO (
    RENAME "%%F" "pareto-importer.jar"
)
POPD

CD %PARETO_ROOT_DIR%\pareto-factory-run\dos

ECHO Completed Pareto Importer Distro into %PARETO_TOOL_DIR%
ENDLOCAL