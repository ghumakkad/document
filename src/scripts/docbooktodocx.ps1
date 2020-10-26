if (Get-Command "pandoc.exe" -ErrorAction SilentlyContinue) 
{ 
    New-Item -ItemType Directory -Force -Path ../docx
    gci -r -i *.xml |foreach{$docx=$_.directoryname+"\..\docx\"+$_.basename+".docx";pandoc -r docbook -t docx -s $_.name -o $docx}
}
if ((Get-Command "pandoc.exe" -ErrorAction SilentlyContinue) -eq $null) 
{ 
   Write-Host "Unable to find pandoc.exe in your PATH"
}