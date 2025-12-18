ECHO OFF
SETLOCAL
REM ---------------------------------------------------------------------------
REM © 2025 Northern Pacific Technologies, LLC. All Rights Reserved. 
REM 
REM For license details, see the LICENSE file in this project root.
REM ---------------------------------------------------------------------------

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Loader Build
REM ---------------------------------------------------------------------------

CD %NORPAC_PARETO_ROOT_DIR%\pareto-factory-builder
CALL mvn clean install package -DskipTests

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Loader Distro into %PARETO_TOOL_DIR%
REM ---------------------------------------------------------------------------

COPY /Y target\pareto-factory-builder*.jar "%PARETO_TOOL_DIR%"
DEL /Q "%PARETO_TOOL_DIR%\*shaded.jar"
DEL /Q "%PARETO_TOOL_DIR%\pareto-builder.jar"
PUSHD "%PARETO_TOOL_DIR%"
FOR %%F in (pareto-factory-build*.jar) DO (
    RENAME "%%F" "pareto-builder.jar"
)
POPD

CD %PARETO_ROOT_DIR%\pareto-factory-run\dos

ECHO Completed Pareto Loader Distro into %PARETO_TOOL_DIR%
ENDLOCAL