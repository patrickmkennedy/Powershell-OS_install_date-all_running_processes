<#
    Patrick Kennedy
    K00270774
    2nd Year
    CNSM2
#>

$kNumber = "K00270774"

Write-Host "K Number: $kNumber"
Write-Host "Script Start Date & Time: $(Get-Date)"

$outputFilePath = "$env:USERPROFILE\Desktop\SystemInfoOutput.txt"

if ($env:OS -eq "Windows_NT") {
    Write-Host "This is running on Windows"
    $osInstallDate = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty InstallDate
    Write-Host "System Install Date: $osInstallDate"

    $psVersion = $PSVersionTable.PSVersion
    $systemName = $env:COMPUTERNAME
    $currentUser = whoami
    $currentDir = Get-Location
    $runningTasks = Get-Process | Out-String
    $runningServices = Get-Service | Where-Object { $_.Status -eq 'Running' } | Select-Object DisplayName, Status | Out-String
    
    $info = "K Number: $kNumber`n" +
            "Script Run Date & Time: $(Get-Date)`n" +
            "This is running on Windows`n" +
            "System Install Date: $osInstallDate`n" +
            "PowerShell Version: $psVersion`n" +
            "System Name: $systemName`n" +
            "Current User: $currentUser`n" +
            "Current Working Directory: $currentDir`n" +
            "Running Tasks: $runningTasks`n" +
            "Running Services: $runningServices"
            
    $info | Out-File -FilePath $outputFilePath

} else {
    Write-Host "This script is not running on a Windows system."
}