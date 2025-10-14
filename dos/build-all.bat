ECHO OFF
REM ---------------------------------------------------------------------------
REM © 2025 Northern Pacific Technologies, LLC. All Rights Reserved. 
REM 
REM For license details, see the LICENSE file in this project root.
REM ---------------------------------------------------------------------------

CALL build-builder.bat
CALL build-db.bat
CALL build-factory.bat
CALL build-importer.bat
CALL build-loader.bat
