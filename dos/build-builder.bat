ECHO OFF
SETLOCAL
REM ---------------------------------------------------------------------------
REM © 2025 Northern Pacific Technologies, LLC. All Rights Reserved. 
REM 
REM For license details, see the LICENSE file in this project root.
REM ---------------------------------------------------------------------------

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Builder Build
REM ---------------------------------------------------------------------------

CD %PARETO_ROOT_DIR%\pareto-builder-bin
CALL mvn clean install package -DskipTests

REM ---------------------------------------------------------------------------
ECHO Beginning Pareto Builder Distro into %PARETO_TOOL_DIR%
REM ---------------------------------------------------------------------------

COPY /Y target\pareto-builder-bin*.jar "%PARETO_TOOL_DIR%"
DEL /Q "%PARETO_TOOL_DIR%\*shaded.jar"
DEL /Q "%PARETO_TOOL_DIR%\pareto-builder.jar"
pushd "%PARETO_TOOL_DIR%"
for %%F in (pareto-builder-bin*.jar) do (
    RENAME "%%F" "pareto-builder.jar"
)
popd

CD %PARETO_ROOT_DIR%\pareto-factory-run\dos
ECHO Completed Pareto Builder Build
ENDLOCAL