set b=%cd%
set dirpath=%~d0
call git pull
call mvn clean package

C:
cd C:\Program Files\apache-tomcat-9.0.0.M13\bin
call shutdown.bat


:: 等待6秒等tomcat进程结束完毕，否则del会报文件被进程占用无法删除
ping /n 6 127.1>nul
cd C:\Program Files\apache-tomcat-9.0.0.M13\webapps
del  MetroProject.war
rmdir /s /q MetroProject
del  MetroProject.war
rmdir /s /q MetroProject
del  MetroProject.war
rmdir /s /q MetroProject

echo %dirpath%
%dirpath%

echo %b%
cd %b%
copy /y "target\MetroProject.war" "C:\Program Files\apache-tomcat-9.0.0.M13\webapps"
cd C:\Program Files\apache-tomcat-9.0.0.M13\bin
call startup.bat
cd %b%
pause

