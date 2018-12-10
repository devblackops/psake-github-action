FROM mcr.microsoft.com/powershell:6.1.0-ubuntu-18.04 as base
SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN Set-PSRepository -Name PSGallery -InstallationPolicy Trusted; \
    Install-Module psake        -RequiredVersion 4.8.0-alpha -Repository PSGallery -AllowPrelease; \
    Install-Module PSDepend     -RequiredVersion 0.3.0       -Repository PSGallery; \
    Install-Module BuildHelpers -RequiredVersion 2.0.1       -Repository PSGallery

FROM base as psake-build
LABEL "com.github.actions.name"         = "psake task"
LABEL "com.github.actions.description"  = "Run psake tasks"
LABEL "com.github.actions.icon"         = "box"
LABEL "com.github.actions.color"        = "blue"

LABEL "repository" = "https://github.com/devblackops/psake-github-actions"
LABEL "homepage"   = "https://github.com/psake/psake"
LABEL "maintainer" = "Brandon Olin <brandon@devblackops.io>"

ADD entrypoint.sh  /entrypoint.sh
ADD run.ps1        /run.ps1

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]