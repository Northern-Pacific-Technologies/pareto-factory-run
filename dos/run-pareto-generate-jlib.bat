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

SET NORPAC_API_USERNAME=%NORPAC_TENANT_USERNAME%
SET NORPAC_API_PASSWORD=%NORPAC_TENANT_PASSWORD%

SET PARETO_API_URL=%PARETO_FACTORY_URL%
SET PARETO_API_VER=%PARETO_API_VERSION%
SET PARETO_IMP_DIR=NOTUSED

SET PLATFORM_API_URL=%PLATFORM_API_URL%
SET PLATFORM_API_VER=%PLATFORM_API_VER%
SET PLATFORM_IMP_DIR=NOTUSED

SET SOURCE_ROOT_DIR=%NORPAC_PARETO_ROOT_DIR%\pareto-factory-pareto
SET PARETO_BUILD_FILE=%SOURCE_ROOT_DIR%\ParetoBuild.csv

REM Remove previously generated files
DEL /q %SOURCE_ROOT_DIR%\src\main\java\com\norpactech\pf\api\controller\%PARETO_API_VERSION%\*.*
DEL /q %SOURCE_ROOT_DIR%\src\main\java\com\norpactech\pf\api\dto\*.*
DEL /q %SOURCE_ROOT_DIR%\src\main\java\com\norpactech\pf\api\model\*.*
DEL /q %SOURCE_ROOT_DIR%\src\main\java\com\norpactech\pf\api\repository\*.*

REM Generate new files
java -jar %PARETO_TOOL_DIR%\pareto-builder.jar

REM Build and deploy the jlib
CD %SOURCE_ROOT_DIR%
mvn clean deploy -DskipTests

ECHO Beginning Pareto Factory Java Library Generator
ENDLOCAL