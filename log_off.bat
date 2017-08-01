@echo off
setlocal enabledelayedexpansion
 
:: Имя сервера
set server=SRV
 
:: Имя пользователя, сеанс которого нужно завершить
set user=%1
 
:: Поиск ID сеанса и его отключение от сервера
for /f "tokens=3,1,* delims= " %%i in ('qwinsta /server:%server% ^| find "%user%"') do (
  logoff %%i /server:%server% && echo Сеанс успешно завершен
)
:: Поиск ID сеанса и его отключение от сервера
for /f "tokens=3,2,* delims= " %%i in ('qwinsta /server:%server% ^| find "%user%"') do (
  logoff %%i /server:%server% && echo Сеанс успешно завершен
)
