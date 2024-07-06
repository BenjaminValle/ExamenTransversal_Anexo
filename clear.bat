@echo off
echo Cleaning up project...

:: Remove Python cache
for /d /r %%d in (__pycache__) do if exist "%%d" rd /s /q "%%d"

:: Remove Python compiled files
for /r %%f in (*.pyc) do del "%%f"
for /r %%f in (*.pyo) do del "%%f"

:: Remove Django migrations
for /d /r %%d in (migrations) do (
    if exist "%%d" (
        cd "%%d"
        del /q *.*
        for %%f in (.) do if not exist "%%d\__init__.py" echo. > "%%d\__init__.py"
        cd..
    )
)

:: Remove SQLite database
if exist "db.sqlite3" del "db.sqlite3"

:: Remove environments
for /d %%d in (venv env .venv) do if exist "%%d" rd /s /q "%%d"

:: Remove static and media files
if exist "staticfiles" rd /s /q "staticfiles"
if exist "media" rd /s /q "media"

:: Remove pgdata folder content
if exist "pgdata" (
    echo Deleting content of pgdata...
    for /d %%d in (pgdata\*) do rd /s /q "%%d"
    for %%f in (pgdata\*) do del /q "%%f"
)

:: Ensure pgdata directory exists
if not exist "pgdata" mkdir "pgdata"
if not exist "Proyecto1/app1/migrations" mkdir "Proyecto1/app1/migrations"

echo Project cleaned.
pause
