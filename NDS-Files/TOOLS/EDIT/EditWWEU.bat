@echo off
set /p Name=Enter the Name of your Game: >con
echo.>con
cd Tools/NDS/Tools/EDIT
Setlocal EnableDelayedExpansion
Set _RNDLength=4
Set _Alphanumeric=ABCDEF
Set _Str=%_Alphanumeric%987654321
:_LenLoop
IF NOT "%_Str:~18%"=="" SET _Str=%_Str:~9%& SET /A _Len+=9& GOTO :_LenLoop
SET _tmp=%_Str:~9,1%
SET /A _Len=_Len+_tmp
Set _count=0
SET _RndAlphaNum=
:_loop
Set /a _count+=1
SET _RND=%Random%
Set /A _RND=_RND%%%_Len%
SET _RndAlphaNum=!_RndAlphaNum!!_Alphanumeric:~%_RND%,1!
If !_count! lss %_RNDLength% goto _loop
set ID=!_RndAlphaNum!
cd ..
cd JNUSTOOL/WarioWareEU/code
move app.xml ../../../EDIT
cd ..
cd meta
move meta.xml ../../../EDIT
cd ../../../EDIT
fnr.exe --cl --dir "%cd%" --fileMask "app.xml" --useRegEx --find "(<title_id.*0005000010)(.{4})" --replace "$1%ID%"
fnr --cl --dir "%cd%" --fileMask "meta.xml" --useRegEx --find "(<product_code.*WUP-N-)(.{4})" --replace "$1%ID%"
fnr --cl --dir "%cd%" --fileMask "meta.xml" --useRegEx --find "(<title_id.*0005000010)(.{4})" --replace "$1%ID%"
fnr --cl --dir "%cd%" --fileMask "meta.xml" --useRegEx --find "(<shortname_.{2,3}.*\u0022>)([^<]*)" --replace "$1%Name%"
fnr --cl --dir "%cd%" --fileMask "meta.xml" --useRegEx --find "(<longname_.{2,3}.*\u0022>)([^<]*)" --replace "$1%Name%"
move app.xml ../JNUSTOOL/WarioWareEU/code
move meta.xml ../JNUSTOOL/WarioWareEU/meta

