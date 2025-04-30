<#
    check_cpu_util.ps1

    Script for checking CPU util 

    .SYNTAX
    	.\check_cpu_util.ps1 [-WARN] [-CRIT]
    .PARAMETERS
        -WARN <int> CPU util in % until WARNING
        -CRIT <int> CPU util in % until CRITICAL
    .VERSION
        chr0w94 v0.1
#>

#requires -version 4.0
[cmdletbinding(PositionalBinding = $false)]
param(
    [Parameter(Mandatory = $false)][int]$WARN = 80,
    [Parameter(Mandatory = $false)][int]$CRIT = 90
)

function Get-cpu-util 
{
    $computer = gc env:computername
    $ProcessorStats = Get-WmiObject win32_processor -computer $computer
    $ComputerCpu = $ProcessorStats.LoadPercentage 

    if ($ComputerCpu -ge $CRIT)
    {
        Write-Host "CRITICAL: CPU utilization is $ComputerCpu%."
        exit 2
    }
    elseif ($ComputerCpu -ge $WARN)
    {
        Write-Host "WARNING: CPU utilization is $ComputerCpu%."
        exit 1
    }
    else
    {
        Write-Host "OK: CPU utilization is $ComputerCpu%."
        exit 0
    }
}

# Start function
Get-cpu-util 
