@echo off
setlocal enabledelayedexpansion
 
:: ��� �ࢥ�
set server=SRV
 
:: ��� ���짮��⥫�, ᥠ�� ���ண� �㦭� ��������
set user=%1
 
:: ���� ID ᥠ�� � ��� �⪫�祭�� �� �ࢥ�
for /f "tokens=3,1,* delims= " %%i in ('qwinsta /server:%server% ^| find "%user%"') do (
  logoff %%i /server:%server% && echo ����� �ᯥ譮 �����襭
)
:: ���� ID ᥠ�� � ��� �⪫�祭�� �� �ࢥ�
for /f "tokens=3,2,* delims= " %%i in ('qwinsta /server:%server% ^| find "%user%"') do (
  logoff %%i /server:%server% && echo ����� �ᯥ譮 �����襭
)
