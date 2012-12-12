$oldFound = $False;
while(1){
 $found = Get-Process| where { $_.processname.contains(".scr") }
 if($oldFound -and !$found)
 {
    write-eventlog -logname Application -source ScreenSaverWatcher -eventID 1337 -message "The screensaver has been stopped , logging event and taking screenshot";
    .\CommandCam.exe
 }
 $oldFound = $found;
 sleep 1
}
