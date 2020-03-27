@ECHO OFF
SET tooling_jar=tooling-1.0.4-SNAPSHOT-jar-with-dependencies.jar
SET input_cache_path=%~dp0input-cache
SET spreadsheet_directory_path=%~dp0input\vocabulary\valueset\spreadsheets
SET output_path=%~dp0input\vocabulary\valueset

SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

IF EXIST "%input_cache_path%\%tooling_jar%" (
	ECHO running: JAVA -jar "%input_cache_path%\%tooling_jar%" -VsacXlsxToValueSetBatch -ptsd=spreadsheet_directory_path -vssrc=vsac -op=output_path
	JAVA -jar "%input_cache_path%\%tooling_jar%" -VsacXlsxToValueSetBatch -ptsd=%spreadsheet_directory_path% -vssrc=vsac -op=%output_path%
) ELSE If exist "..\%tooling_jar%" (
	ECHO running: JAVA -jar "..\%tooling_jar%" -VsacXlsxToValueSetBatch -ptsd=spreadsheet_directory_path -vssrc=vsac -op=output_path
	JAVA -jar "..\%tooling_jar%" -VsacXlsxToValueSetBatch -ptsd=spreadsheet_directory_path -vssrc=vsac -op=output_path
) ELSE (
	ECHO IG Tooling NOT FOUND in input-cache or parent folder.  Please run _updateRefreshIG.  Aborting...
)

PAUSE
