#requires -modules psake, PSDepend, BuildHelpers

[cmdletbinding()]
param(
    # Build task(s) to execute
    [string[]]$Task = 'default'
)

# psake and PSDepend files
if (-not $env:PSAKE_FILE)    {$env:PSAKE_FILE    = './psakeFile.ps1'}
if (-not $env:PSDEPEND_FILE) {$env:PSDEPEND_FILE = './requirements.psd1'}

# Bootstrap dependencies...or not
if (($env:SKIP_REQS -ne 'true' -and $env:SKIP_REQS -ne 1) -and (Test-Path -Path $env:PSDEPEND_FILE)) {
    Invoke-PSDepend -Path $env:PSDEPEND_FILE -Install -Import -Force -WarningAction SilentlyContinue -ErrorAction Stop
}

# Execute psake task(s)
if (Test-Path -Path $env:PSAKE_FILE) {
    Invoke-psake -buildFile $env:PSAKE_FILE -taskList $Task -nologo
    if (-not $psake.build_success) {
        throw 'psake failed'
    }
} else {
    throw "Could not find psake file [$env:PSAKE_FILE]"
}
