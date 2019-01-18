# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [1.2.1] - 2019-01-17

### Changed

- Switch to Alpine 3.8 and PowerShell 6.1.2 for container
- Install git on container so BuildHelpers doesn't throw error
- Upgrade to BuildHelpers 2.0.7

## [1.2.0] - 2019-01-15

### Changed

- Proper exit code is returned on psake task failure

## [1.1.0] - 2019-01-14

### Changed

- Moved GitHub Action to root of repository
- Action now calls PowerShell directly instead of using a bash shim

## [1.0.0] - 2019-01-06

### Added

- Initial release