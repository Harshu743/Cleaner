@echo off
color a
del C:\windows\prefetch\*.* /f /s /q
del C:\windows\temp\*.* /f /s /q
del %temp%\*.* /f /s /q
ipconfig /flushdns
exit
