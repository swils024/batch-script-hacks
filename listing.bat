@echo off
::create a temporary drive letter mapped to your UNC location
::and list files in UNC Path in destination file

::UNC Path
set sourceDirectory=< \\servername\share\folder\ >

::Local Path
set destinationFile=< %USERPROFILE%\folder\listing.txt >
  
pushd %sourceDirectory%
echo Source directory :  %sourceDirectory%
echo Destination File :  %destinationFile%
echo:

dir /B > %destinationFile%
type %destinationFile%

echo:
findstr /R /N "^" %destinationFile% | find /C ":"
echo Files found

::remove the temporary drive letter
popd %sourceDirectory%
PAUSE