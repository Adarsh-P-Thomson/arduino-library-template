# Developer Documentation

This document provides technical details for developers working with or contributing to this Arduino library template.

## Table of Contents

- [Project Structure](#project-structure)
- [Build System](#build-system)
- [CI/CD Pipeline](#cicd-pipeline)
- [Code Style](#code-style)
- [Adding Features](#adding-features)
- [Debugging](#debugging)
- [Release Process](#release-process)

---

## Project Structure

### Directory Layout

```
arduino-library-template/
│
├── .github/                      # GitHub specific files
│   ├── ISSUE_TEMPLATE/          # Issue templates
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   ├── workflows/               # CI/CD workflows
│   │   └── arduino-ci.yml       # Arduino compilation tests
│   └── PULL_REQUEST_TEMPLATE.md
│
├── examples/                     # Example sketches
│   ├── BasicUsage/
│   │   └── BasicUsage.ino
│   ├── AdvancedUsage/
│   │   └── AdvancedUsage.ino
│   └── README.md                # Examples documentation
│
├── extras/                       # Additional resources
│   ├── README.txt               # Extras folder info
│   └── wiring.txt              # Wiring diagram placeholder
│
├── src/                         # Library source code
│   ├── LibraryName.h           # Main header file
│   ├── LibraryName.cpp         # Implementation
│   └── internal/               # Internal utilities
│       └── utils.h
│
├── .gitignore                   # Git ignore rules
├── CHANGELOG.md                 # Version history
├── CONTRIBUTING.md              # Contribution guidelines
├── keywords.txt                 # Arduino IDE keywords
├── library.properties           # Library metadata
├── LICENSE                      # MIT License
├── README.md                    # Main documentation
├── setup-library.ps1           # Windows setup script
└── setup-library.sh            # Unix setup script
```

### File Purposes

| File | Purpose |
|------|---------|
| `library.properties` | Arduino Library Manager metadata |
| `keywords.txt` | Syntax highlighting for Arduino IDE |
| `src/*.h` | Public API definitions |
| `src/*.cpp` | Implementation code |
| `src/internal/` | Private implementation details |
| `examples/` | Demonstration sketches |
| `extras/` | Documentation, diagrams, datasheets |

---

## Build System

### Arduino Library Format

This library follows the [Arduino Library Specification](https://arduino.github.io/arduino-cli/latest/library-specification/):

- **Layout:** Recursive (1.5 format)
- **Header Location:** `src/` directory
- **Include Path:** `#include <LibraryName.h>`
- **Compilation:** All `.cpp` files in `src/` are compiled

### library.properties Format

```properties
name=LibraryName                 # Must match repository name pattern
version=0.1.0                    # Semantic versioning (MAJOR.MINOR.PATCH)
author=Name <email@example.com>  # Author with email
maintainer=Name <email@...>      # Maintainer (can be different)
sentence=Short description       # One-line description (< 80 chars)
paragraph=Longer description     # Detailed description
category=Device Control          # Arduino category
url=https://github.com/user/lib  # Project URL
architectures=*                  # Supported architectures (* = all)
includes=LibraryName.h           # Main header file
license=MIT                      # License identifier
```

### Supported Categories

- Display
- Communication
- Signal Input/Output
- Sensors
- Device Control
- Timing
- Data Storage
- Data Processing
- Other

---

## CI/CD Pipeline

### GitHub Actions Workflow

**File:** `.github/workflows/arduino-ci.yml`

#### What It Does

1. **Triggers:** On push or pull request to `main` branch
2. **Matrix Build:** Tests on multiple Arduino architectures
   - Arduino AVR (Uno)
   - Arduino SAMD (MKR1000)
   - Arduino megaAVR (Uno WiFi Rev2)
3. **Compiles:** All example sketches
4. **Reports:** Generates compilation reports
5. **Artifacts:** Uploads reports for review

#### Workflow Steps

```yaml
1. Checkout repository
2. Compile examples with arduino/compile-sketches@v1
3. Upload sketches reports as artifacts
```

#### Adding New Test Boards

Edit `.github/workflows/arduino-ci.yml`:

```yaml
- arduino-platform: "esp32:esp32"
  fqbn: "esp32:esp32:esp32"
  artifact-name: "esp32-esp32"
```

### Local Testing

Before pushing, test locally:

```bash
# Install Arduino CLI
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

# Update core index
arduino-cli core update-index

# Install cores
arduino-cli core install arduino:avr
arduino-cli core install arduino:samd

# Compile examples
arduino-cli compile --fqbn arduino:avr:uno examples/BasicUsage
arduino-cli compile --fqbn arduino:samd:mkr1000 examples/BasicUsage
```

---

## Code Style

### C++ Conventions

```cpp
// Class names: PascalCase
class MyLibrary {
  
  public:
    // Public methods: camelCase
    void myMethod();
    int getValue();
    
  private:
    // Private members: _camelCase (underscore prefix)
    uint8_t _pin;
    bool _isActive;
    
    // Private methods: _camelCase
    void _internalMethod();
};

// Constants: UPPER_CASE
#define MAX_VALUE 100
const int BUFFER_SIZE = 64;

// Namespaces: PascalCase
namespace MyLibraryInternal {
  // Internal utilities
}
```

### Header Guards

```cpp
#ifndef LIBRARY_NAME_H
#define LIBRARY_NAME_H

// Header content

#endif
```

### Indentation

- **2 spaces** (no tabs)
- Consistent throughout

### Comments

```cpp
// Single-line comments for brief explanations

/**
 * Multi-line comments for detailed documentation
 * 
 * @param pin The Arduino pin number
 * @return true if successful, false otherwise
 */
bool initialize(uint8_t pin);
```

---

## Adding Features

### 1. Define Public API

Edit `src/LibraryName.h`:

```cpp
class LibraryName {
  public:
    // Add new public method
    void newFeature();
};
```

### 2. Implement Method

Edit `src/LibraryName.cpp`:

```cpp
void LibraryName::newFeature() {
  // Implementation
}
```

### 3. Add Keywords

Edit `keywords.txt`:

```
newFeature    KEYWORD2
```

### 4. Create Example

Create `examples/NewFeatureExample/NewFeatureExample.ino`:

```cpp
#include <LibraryName.h>

void setup() {
  LibraryName lib(13);
  lib.begin();
  lib.newFeature();  // Demonstrate new feature
}

void loop() {
  // Example usage
}
```

### 5. Update Documentation

- Update README.md API reference
- Add to CHANGELOG.md
- Update version in library.properties

### 6. Test

- Compile all examples
- Test on hardware
- Verify CI passes

---

## Debugging

### Serial Debugging

```cpp
void LibraryName::debugMethod() {
  #ifdef DEBUG_MODE
    Serial.print("Debug: ");
    Serial.println(_value);
  #endif
}
```

Enable in sketch:

```cpp
#define DEBUG_MODE
#include <LibraryName.h>
```

### Common Issues

**Compilation Errors:**
- Check include paths
- Verify all files in `src/` are valid
- Check for circular dependencies

**Linking Errors:**
- Ensure method declarations match implementations
- Check for missing method definitions

**Runtime Issues:**
- Add Serial debugging
- Check pin configurations
- Verify hardware connections

---

## Release Process

### 1. Prepare Release

- [ ] Update version in `library.properties`
- [ ] Update `CHANGELOG.md`
- [ ] Test all examples on hardware
- [ ] Verify CI passes
- [ ] Update documentation

### 2. Create Git Tag

```bash
git tag -a v0.1.0 -m "Release version 0.1.0"
git push origin v0.1.0
```

### 3. Create GitHub Release

1. Go to Releases on GitHub
2. Click "Create a new release"
3. Select the tag
4. Write release notes
5. Publish release

### 4. Submit to Arduino Library Manager

First release only:
1. Fork [arduino/library-registry](https://github.com/arduino/library-registry)
2. Add repository URL to `repositories.txt`
3. Create pull request

Subsequent releases are automatic!

---

## Testing Checklist

Before releasing:

### Code Quality
- [ ] No compiler warnings
- [ ] Code follows style guide
- [ ] Comments are clear and helpful
- [ ] No unused code or variables

### Functionality
- [ ] All examples compile
- [ ] Tested on real hardware
- [ ] Works on multiple boards (if applicable)
- [ ] No memory leaks

### Documentation
- [ ] README is up to date
- [ ] API reference is complete
- [ ] Examples are documented
- [ ] CHANGELOG is updated

### Automation
- [ ] CI tests pass
- [ ] All workflows succeed
- [ ] No failing checks

---

## Resources

- [Arduino Library Specification](https://arduino.github.io/arduino-cli/latest/library-specification/)
- [Arduino Style Guide](https://www.arduino.cc/en/Reference/StyleGuide)
- [Semantic Versioning](https://semver.org/)
- [Keep a Changelog](https://keepachangelog.com/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

---

## Need Help?

- Open an [Issue](https://github.com/Adarsh-P-Thomson/arduino-library-template/issues)
- Check [CONTRIBUTING.md](CONTRIBUTING.md)
- Ask on [Arduino Forum](https://forum.arduino.cc/)
