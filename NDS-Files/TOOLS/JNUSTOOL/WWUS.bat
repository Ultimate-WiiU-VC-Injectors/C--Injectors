@echo off
cd TOOLS
cd NDS
cd TOOLS
set /p TK=<Storage\WWUSTK
set /p COMMONKEY=<Storage\CKEY
cd JNUSTOOL
echo http://ccs.cdn.wup.shop.nintendo.net/ccs/download>config
echo %COMMONKEY:~0,32%>>config
echo https://tagaya.wup.shop.nintendo.net/tagaya/versionlist/EUR/EU/latest_version>>config
echo https://tagaya-wup.cdn.nintendo.net/tagaya/versionlist/EUR/EU/list/%d.versionlist>>config
java -jar JNUSTool.jar 00050000101a1f00 %TK% -file .*