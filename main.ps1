

try {

    # Require that the script is running as administrator 
    if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        Write-Error "Please run this script as administrator"
        # Exit
        exit
    }

    # Check if Docker Desktop is running
    $response = Read-Host "Did you quit Docker Desktop? Type 'yes'"
    if ($response -eq "yes") {
        # Proceed with your script
    }
    else {
        Write-Error "Please quit Docker Desktop before proceeding"
        # Exit
        exit
    }


    # Check if wsl terminals are still open
    $response = Read-Host "Did you close all wsl terminals? Type 'yes'"
    if ($response -eq "yes") {
        # Proceed with your script
    }
    else {
        Write-Error "Please close all wsl terminals before proceeding"
        # Exit
        exit
    }



    # turn off all distros
    wsl --shutdown


    

    # Write optimizing vhd for docker
    Write-Host "Optimizing vhd for docker"
    optimize-vhd -Path 'C:\Users\vicre\AppData\Local\Docker\wsl\data\ext4.vhdx' -Mode full
    Start-Sleep -Seconds 2

    Write-Host "Optimizing vhd for ubuntu"
    optimize-vhd -Path 'C:\Users\vicre\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\ext4.vhdx' -Mode full




}
catch {
    # Proceed with your script
    Write-Error "$PSItem"
}











