$oldFound = $False;
while(1){
 $scActive = Get-CimInstance win32_desktop | where name -eq (whoami)
 if(!$scActive.ScreenSaveActive)
 {
    write-eventlog -logname Application -source ScreenSaverWatcher -eventID 1337 -message "The screensaver has been stopped , logging event and taking screenshot";
    .\CommandCam.exe
    break
 }
 sleep 1
}
