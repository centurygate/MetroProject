set b=%cd%
set dirpath=%~d0
call mvn clean package

C:
cd C:\Program Files\apache-tomcat-9.0.0.M13\webapps
del  WaterFactory.war
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
pause

