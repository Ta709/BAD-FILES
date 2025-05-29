@echo off
setlocal enableDelayedExpansion

set "main_data_directory=C:\VaultOfForeverFiles"
set "num_outer_folders=1000"
set "num_inner_files_per_folder=720"
set "random_words_per_file=100000"


REM Create the main directory on C:
md "%main_data_directory%" >nul 2>&1
if not exist "%main_data_directory%" (
    echo ERROR: Could not create main directory %main_data_directory%.
    echo Please ensure you have write permissions to C:\ and try again.
    pause
    exit /b 1
)


REM Loop to create the 500 outer folders (named 1 through 500)
for /L %%o in (1,1,%num_outer_folders%) do (
    set "current_outer_folder=%main_data_directory%\%%o"
    echo Creating folder: !current_outer_folder!
    md "!current_outer_folder!" >nul 2>&1

    REM Loop to create 500 text files within each outer folder
    for /L %%i in (1,1,%num_inner_files_per_folder%) do (
        set "current_file=!current_outer_folder!\%%i.txt"
        REM echo Generating content for: !current_file!

        REM Generate 1000 random "words" (random numbers) and pipe directly to the file
        (
        for /L %%w in (1,1,%random_words_per_file%) do (
            echo %RANDOM%
        )
        ) > "!current_file!"
    )
)


pause