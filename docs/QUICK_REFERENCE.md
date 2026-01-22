# Quick Reference

Quick command reference for Arduino library development.

## Initial Setup

```bash
# Clone template
git clone https://github.com/Adarsh-P-Thomson/arduino-library-template.git MyLibrary

# Run setup script (Windows)
./setup-library.ps1

# Run setup script (Linux/Mac)
chmod +x setup-library.sh
./setup-library.sh
```

## Essential Commands

### Git Operations

```bash
# Initialize repository
git init
git add .
git commit -m "Initial commit"

# Connect to GitHub
git remote add origin https://github.com/username/MyLibrary.git
git branch -M main
git push -u origin main

# Create release tag
git tag -a v0.1.0 -m "Release v0.1.0"
git push origin v0.1.0
```

### Arduino CLI

```bash
# Install Arduino CLI
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

# Initialize
arduino-cli config init

# Update index
arduino-cli core update-index

# Install cores
arduino-cli core install arduino:avr
arduino-cli core install arduino:samd
arduino-cli core install arduino:megaavr

# Compile example
arduino-cli compile --fqbn arduino:avr:uno examples/BasicUsage

# Upload to board
arduino-cli upload -p COM3 --fqbn arduino:avr:uno examples/BasicUsage
```

### Testing

```bash
# Zip library for manual testing
zip -r MyLibrary.zip MyLibrary/

# Or on Windows
Compress-Archive -Path MyLibrary -DestinationPath MyLibrary.zip
```

## File Checklist

### Before First Release

- [ ] Rename `LibraryName.*` files
- [ ] Update `library.properties`
- [ ] Update `keywords.txt`
- [ ] Update README.md
- [ ] Update LICENSE
- [ ] Create examples
- [ ] Test locally
- [ ] Push to GitHub
- [ ] Create release tag
- [ ] Submit to Library Manager

### Before Each Release

- [ ] Increment version in `library.properties`
- [ ] Update CHANGELOG.md
- [ ] Test all examples
- [ ] Verify CI passes
- [ ] Create git tag
- [ ] Create GitHub release

## library.properties Template

```properties
name=YourLibraryName
version=0.1.0
author=Your Name <your@email.com>
maintainer=Your Name <your@email.com>
sentence=Short one-line description
paragraph=Longer detailed description of functionality
category=Device Control
url=https://github.com/username/YourLibraryName
architectures=*
includes=YourLibraryName.h
license=MIT
```

## keywords.txt Format

```
# Classes (KEYWORD1)
YourLibraryName    KEYWORD1

# Methods (KEYWORD2)
begin              KEYWORD2
getValue           KEYWORD2
setValue           KEYWORD2

# Constants (LITERAL1)
MAX_VALUE          LITERAL1
```

## Common Categories

- **Device Control** - Actuators, motors, servos
- **Sensors** - Temperature, light, distance sensors
- **Communication** - I2C, SPI, Serial protocols
- **Display** - LCD, OLED, LED displays
- **Data Storage** - EEPROM, SD card, flash
- **Data Processing** - Math, filtering, algorithms
- **Timing** - Delays, timers, scheduling
- **Signal Input/Output** - Digital, analog I/O
- **Other** - Everything else

## Versioning Quick Guide

### Semantic Versioning (MAJOR.MINOR.PATCH)

- **PATCH** (0.0.1): Bug fixes, no API changes
- **MINOR** (0.1.0): New features, backwards compatible
- **MAJOR** (1.0.0): Breaking changes, incompatible API

### Examples

```
0.1.0 → 0.1.1   (Bug fix)
0.1.1 → 0.2.0   (New feature)
0.2.0 → 1.0.0   (Breaking change)
```

## Arduino IDE Installation

### For Library Users

1. Download ZIP from GitHub releases
2. Arduino IDE → Sketch → Include Library → Add .ZIP Library
3. Select ZIP file
4. Restart Arduino IDE

### From Library Manager

1. Arduino IDE → Sketch → Include Library → Manage Libraries
2. Search for your library name
3. Click Install
4. Done!

## Common Issues

### "Library not found"
```bash
# Check library name matches folder name
# Restart Arduino IDE
# Verify library.properties name field
```

### "Multiple libraries found"
```bash
# Remove duplicate installations
# Check: ~/Documents/Arduino/libraries/
# Remove old versions
```

### Compilation errors
```bash
# Verify all files in src/ are valid C++
# Check #include statements
# Ensure header guards are correct
```

## Links

- **Arduino CLI:** https://arduino.github.io/arduino-cli/
- **Library Spec:** https://arduino.github.io/arduino-cli/latest/library-specification/
- **Library Registry:** https://github.com/arduino/library-registry
- **Arduino Forum:** https://forum.arduino.cc/

## Support

- Issues: https://github.com/Adarsh-P-Thomson/arduino-library-template/issues
- Discussions: https://github.com/Adarsh-P-Thomson/arduino-library-template/discussions
- Arduino Forum: https://forum.arduino.cc/

---

**Made with ❤️ for the Arduino community**
