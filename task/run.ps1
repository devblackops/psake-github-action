#requires -modules psake, PSDepend, BuildHelpers

[cmdletbinding(DefaultParameterSetName = 'Task')]
param(
    # Build task(s) to execute
    [parameter(ParameterSetName = 'task', position = 0)]
    [string[]]$Task = 'default',

    # List available build tasks
    [parameter(ParameterSetName = 'Help')]
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

# psake and PSDepend files
if (-not $env:PSAKE_FILE)    {$env:PSAKE_FILE    = './psakeFile.ps1'}
if (-not $env:PSDEPEND_FILE) {$env:PSDEPEND_FILE = './requirements.psd1'}

# Bootstrap dependencies...or not
if (($env:SKIP_REQS -ne 'true' -and $env:SKIP_REQS -ne 1) -and (Test-Path -Path $env:PSDEPEND_FILE)) {
    Invoke-PSDepend -Path $env:PSDEPEND_FILE -Install -Import -Force -WarningAction SilentlyContinue
}

# Execute psake task(s)
if (Test-Path -Path $env:PSAKE_FILE) {
    if ($PSCmdlet.ParameterSetName -eq 'Help') {
        Get-PSakeScriptTasks -buildFile $env:PSAKE_FILE  |
            Format-Table -Property Name, Description, Alias, DependsOn
    } else {
        Invoke-psake -buildFile $env:PSAKE_FILE -taskList $Task -nologo
        exit ([int](-not $psake.build_success))
    }
} else {
    Write-Error "Could not find psake file [$env:PSAKE_FILE]"
    exit 1
}
