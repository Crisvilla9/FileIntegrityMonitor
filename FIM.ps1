Write-Host ""
Write-Host "What would you like to do?"
Write-Host ""
Write-Host "A) Collect new Baseline?"
Write-Host "B) Begin monitoring files with saved Baseline?"
Write-Host ""

$response = Read-Host -Prompt "Please enter 'A' or 'B'"
Write-Host ""

Function Calculate-File-Hash($filepath) {
   $filehash = Get-FileHash -Path $Filepath -Algorithm SHA512
   return $filehash
}

Function Erase-Baseline-If-Already-Exists() {
    $baselineExists = Test-Path -Path .baseline.txt

    if ($baselineExists) {
        #Delete it
        Remove-Item -Path .baseline.txt
    }
}

if ($response -eq "A".ToUpper()) {
    #Delete baseline.txt if it already exists
    Erase-Baseline-If-Already-Exists

    #calculate hash from the target files and store baseline.txt
    
    #collect all files in target folder
$files = Get-ChildItem -Path .\FIMfiles
$files

    #for each file, calculate the hash and write it to baseline.txt
    foreach ($f in $files) {
      $hash = Calculate-File-Hash $f.FullName
      "$($hash.path)|$($hash.HASH)" | Out-File -FilePath .\baseline.txt -Append
    }

}
elseif($response -eq "B".ToUpper()) {
   
    $fileHashDictionary = @{}
    
    #Load file|hash from baseline.txt and store them in a dictionary
    $filePathsAndHashes = Get-Content -Path .\baseline.txt
   
    
    foreach ($f in $filePathsAndHashes) {
         $fileHashDictionary.add($f.Split("|")[0],$f.Split("|")[1])
    }

    


    #Begin (continously) monitoring files with saved baseline
    while ($true) {
    Start-Sleep -Seconds 1
        
    $files = Get-ChildItem -Path .\FIMfiles


    #for each file, calculate the hash and write it to baseline.txt
    foreach ($f in $files) {
      $hash = Calculate-File-Hash $f.FullName
      #"$($hash.path)|$($hash.HASH)" | Out-File -FilePath .\baseline.txt -Append

        #Notify if a new file has been created
        if ($fileHashDictionary[$hash.Path] -eq $null) {
        #A new file has been created
        Write-Host "$($hash.Path) has been created!" -ForegroundColor Green
        
        }

        #Notify if a file has been changed
         if ($fileHashDictionary[$hash.Path] -eq $hash.Hash) {
         #The file has not been changed
         }
          else {
          #File has been comprimised, notify the user!!
           Write-Host "$($hash.Path) has been changed!!!" -ForegroundColor Red
          
          }

        }

        foreach ($key in $fileHashDictionary.keys) {
            $baselineFileStillExists = Test-Path -Path $key
            if (-Not $baselineFileStillExists) {
                #One of the baseline files must of been deleted
                Write-Host "$($key) has been deleted!" -ForegroundColor DarkRed
            }
        }
      
    }

}
