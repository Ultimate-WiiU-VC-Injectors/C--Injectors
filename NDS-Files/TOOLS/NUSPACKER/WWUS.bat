@echo off
cd TOOLS
cd NDS
cd TOOLS
set /p COMMONKEY=<Storage\CKEY
cd JNUSTOOL
cd "WarioWareUS"
move code ../../NUSPACKER/input
move content ../../NUSPACKER/input
move meta ../../NUSPACKER/input
cd ..
rd "WarioWareUS"
cd ..
cd NUSPACKER
cls
java -jar NUSPacker.jar -in input -out output -encryptKeyWith %COMMONKEY%
rd /s /q tmp
mkdir install
cd install
mkdir injected_vc_game
cd ..
cd output
move *.* ..\install\injected_vc_game
cd ..
rd /s /q output
cd install
move injected_vc_game ../../../../../Injected_Games