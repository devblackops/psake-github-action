task default -depends Succeed

task Init {
    BuildHelpers\Set-BuildEnvironment -Force -WarningAction SilentlyContinue
    Get-Item ENV:BH*
}

task Succeed -depends Init {
    'I succeeded'
}

task Fail -depends Init {
    throw 'Oops, I did it again...'
}
