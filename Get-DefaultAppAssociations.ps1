$DISM = & dism.exe /online /get-defaultappassociations
$DismString = $DISM | Out-String

if($DismString | Select-String -Pattern 'Google Chrome'){
    Write-Output "Chrome Set as Default"
}elseif($DismString | Select-String -Pattern '`??<'){
    Write-Output "Corrupt Defaults"
}else{
    Write-Output "Couldn't Parse Defaults"
}