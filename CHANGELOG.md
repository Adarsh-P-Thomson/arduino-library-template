# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-01-22

### Added
- Initial template release with complete Arduino Library structure
- GitHub Actions CI/CD workflow for automated testing
- Support for multiple Arduino architectures (AVR, SAMD, megaAVR)
- Example sketches demonstrating basic and advanced usage
- Automated setup scripts for Windows (PowerShell) and Unix (Bash)
- Comprehensive README with step-by-step guide
- CONTRIBUTING.md with contribution guidelines
- MIT License
- Valid library.properties configuration
- Keywords file for Arduino IDE syntax highlighting
- Internal utilities namespace structure
- Proper .gitignore for Arduino development

### Documentation
- Complete API reference
- Installation instructions for users and developers
- Publishing guide for Arduino Library Manager
- Troubleshooting section
- Testing guidelines
- Versioning best practices

### Workflow
- Automated compilation testing on push/pull request
- Multi-architecture validation
- Sketches report generation
- Artifact upload for CI results

## [Unreleased]

### Planned
- Python setup script for cross-platform support
- Unit testing framework integration
- Documentation generator integration
- Advanced example: Multiple sensor support
- Power management utilities
- I2C/SPI helper functions

---

## How to Update This Changelog

When creating a new release:

1. Move changes from `[Unreleased]` to a new version section
2. Add the release date
3. Create a Git tag: `git tag -a v0.2.0 -m "Release v0.2.0"`
4. Update `library.properties` version number
5. Push tag: `git push origin v0.2.0`

### Categories

- **Added** - New features
- **Changed** - Changes in existing functionality
- **Deprecated** - Soon-to-be removed features
- **Removed** - Now removed features
- **Fixed** - Bug fixes
- **Security** - Vulnerability fixes
