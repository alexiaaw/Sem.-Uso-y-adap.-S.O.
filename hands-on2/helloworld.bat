@echo off
echo Hello World !! :)
dir
if not exist "Test" (
    mkdir Test
) else (
    echo El subdirectorio test ya existe.
)
cd Test
dir
pause
