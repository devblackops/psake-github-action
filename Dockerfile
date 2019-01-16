FROM mcr.microsoft.com/powershell:6.1.0-ubuntu-18.04 as base
SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN Set-PSRepository -Name PSGallery -InstallationPolicy Trusted; \
    Install-Module psake        -RequiredVersion 4.8.0-alpha -Repository PSGallery -AllowPrerelease; \
    Install-Module PSDepend     -RequiredVersion 0.3.0       -Repository PSGallery; \
    Install-Module BuildHelpers -RequiredVersion 2.0.1       -Repository PSGallery

FROM base as psake-build
LABEL "name"                            = "github-action-psake"
LABEL "version"                         = "1.1.0"
LABEL "com.github.actions.name"         = "psake task"
LABEL "com.github.actions.description"  = "Run psake tasks"
LABEL "com.github.actions.icon"="settings"
LABEL "com.github.actions.color"="green"

LABEL "repository" = "https://github.com/devblackops/psake-github-action"
LABEL "homepage"   = "https://github.com/psake/psake"
LABEL "maintainer" = "Brandon Olin <brandon@devblackops.io>"

ADD entrypoint.ps1  /entrypoint.ps1

RUN chmod +x /entrypoint.ps1

ENTRYPOINT ["pwsh", "/entrypoint.ps1"]