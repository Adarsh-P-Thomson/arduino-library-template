# Arduino Library Template

[![Arduino CI](https://github.com/Adarsh-P-Thomson/arduino-library-template/workflows/Arduino%20CI/badge.svg)](https://github.com/Adarsh-P-Thomson/arduino-library-template/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub release](https://img.shields.io/github/release/Adarsh-P-Thomson/arduino-library-template.svg)](https://github.com/Adarsh-P-Thomson/arduino-library-template/releases)

A professional, ready-to-use template for creating Arduino libraries that comply with the [Arduino Library Specification](https://arduino.github.io/arduino-cli/latest/library-specification/).

> 🚀 **Click "Use this template"** at the top of this repository to create your own Arduino library in seconds!

## 📚 Documentation

- **[Quick Reference](docs/QUICK_REFERENCE.md)** - Command cheat sheet
- **[Developer Guide](docs/DEVELOPER.md)** - Technical documentation
- **[Examples Guide](examples/README.md)** - Example sketches documentation
- **[Contributing](CONTRIBUTING.md)** - Contribution guidelines
- **[Changelog](CHANGELOG.md)** - Version history

---

## What is this?

This is a **copy-pasteable Arduino library template** designed to help you quickly create, structure, and publish Arduino libraries. It follows best practices and passes Arduino IDE and Library Manager validation.

## Who should use this?

- Beginners creating their first Arduino library
- Developers who want a clean starting point
- Anyone publishing to Arduino Library Manager
- Educators teaching library development

## Features

✅ Valid Arduino Library Manager structure  
✅ Automated CI/CD with GitHub Actions  
✅ Example sketches demonstrating usage  
✅ Clean, professional code organization  
✅ Beginner-friendly documentation  
✅ MIT License included  

## Folder Structure

```
arduino-library-template/
├── src/                          # Library source code
│   ├── LibraryName.h            # Main header file
│   ├── LibraryName.cpp          # Implementation
│   └── internal/                # Internal utilities
│       └── utils.h
├── examples/                     # Example sketches
│   ├── BasicUsage/
│   │   └── BasicUsage.ino
│   └── AdvancedUsage/
│       └── AdvancedUsage.ino
├── extras/                       # Additional files (images, docs)
│   └── wiring.png
├── .github/
│   └── workflows/
│       └── arduino-ci.yml       # Continuous integration
├── library.properties           # Arduino Library Manager metadata
├── keywords.txt                 # Syntax highlighting keywords
├── README.md                    # This file
├── CONTRIBUTING.md              # Contribution guidelines
├── LICENSE                      # MIT License
└── .gitignore                   # Git ignore rules
```

## Installation

### For Users

1. Download the library as a ZIP file from GitHub
2. Open Arduino IDE
3. Go to **Sketch → Include Library → Add .ZIP Library**
4. Select the downloaded ZIP file
5. Restart Arduino IDE

### For Developers

Clone this repository:

```bash
git clone https://github.com/Adarsh-P-Thomson/arduino-library-template.git
cd arduino-library-template
```

## Usage

### Basic Example

```cpp
#include <LibraryName.h>

LibraryName myDevice(13);

void setup() {
  myDevice.begin();
  myDevice.activate();
}

void loop() {
  delay(1000);
  myDevice.deactivate();
  delay(1000);
  myDevice.activate();
}
```

### Advanced Example

See the `examples/AdvancedUsage/` folder for more complex usage patterns.

## Quick Start Guide for Template Users

### Automated Setup (Recommended)

Run the setup script to automatically configure your library:

**Windows (PowerShell):**
```powershell
./setup-library.ps1
```

**Linux/Mac:**
```bash
chmod +x setup-library.sh
./setup-library.sh
```

The script will:
- Rename all files from `LibraryName` to your library name
- Update `library.properties` with your details
- Update all code references
- Update examples and documentation

### Manual Setup

### 1️⃣ Create Your Library

Click the green **"Use this template"** button at the top of this page, or clone manually:

```bash
git clone https://github.com/Adarsh-P-Thomson/arduino-library-template.git MyLibrary
cd MyLibrary
```

### 2️⃣ Rename Files

Replace `LibraryName` with your actual library name:
- `src/LibraryName.h` → `src/MyLibrary.h`
- `src/LibraryName.cpp` → `src/MyLibrary.cpp`
- Update all class names and includes

### 3️⃣ Update Metadata

Edit [`library.properties`](library.properties) with your details:
```properties
name=MyLibrary
author=Your Name <your@email.com>
sentence=Short description of your library
```

### 4️⃣ Write Your Code

Implement your library functionality in the `src/` folder.

### 5️⃣ Test Locally

1. Zip your library folder
2. Arduino IDE → Sketch → Include Library → Add .ZIP Library
3. Compile and test examples

### 6️⃣ Publish

1. Create a release: `git tag v0.1.0 && git push --tags`
2. Submit to [Arduino Library Manager](https://github.com/arduino/library-registry)

---

## How to Use This Template

Follow these steps to create your own library:

### Step 1: Use This Template

**Option A: Use GitHub's "Use this template" button** (Recommended)
1. Click the green "Use this template" button at the top of this repository
2. Create your new repository with your library name
3. Clone your new repository

**Option B: Manual clone**
```bash
git clone https://github.com/Adarsh-P-Thomson/arduino-library-template.git MyNewLibrary
cd MyNewLibrary
rm -rf .git
git init
```

### Step 2: Rename Files and Classes

Replace `LibraryName` with your actual library name throughout:

- Rename `src/LibraryName.h` → `src/YourLibraryName.h`
- Rename `src/LibraryName.cpp` → `src/YourLibraryName.cpp`
- Update all references to `LibraryName` in the code
- Update class names and include guards

### Step 3: Update Metadata

Edit `library.properties`:

```properties
name=YourLibraryName
version=0.1.0
author=Your Name <your.email@example.com>
maintainer=Your Name <your.email@example.com>
sentence=A short description of your library.
paragraph=A longer description with more details about functionality.
category=Device Control
url=https://github.com/yourusername/YourLibraryName
architectures=*
```

### Step 4: Update Keywords

Edit `keywords.txt` with your class and method names:

```
YourLibraryName	KEYWORD1
yourMethod	KEYWORD2
anotherMethod	KEYWORD2
```

### Step 5: Write Your Code

Implement your library logic in:
- `src/YourLibraryName.h` - Public API
- `src/YourLibraryName.cpp` - Implementation
- `src/internal/` - Internal utilities

### Step 6: Create Examples

Update the example sketches in `examples/` to demonstrate your library.

### Step 7: Update Documentation

- Edit this `README.md` with your library's documentation
- Update `CONTRIBUTING.md` with your contribution guidelines
- Add wiring diagrams or images to `extras/`

### Step 8: Test Locally

1. Zip your library folder
2. Install it in Arduino IDE
3. Compile all examples
4. Test on real hardware

### Step 9: Set Up GitHub

```bash
git add .
git commit -m "Initial commit of YourLibraryName"
git remote add origin https://github.com/yourusername/YourLibraryName.git
git branch -M main
git push -u origin main
```

### Step 10: Publish to Arduino Library Manager

#### Prerequisites
- ✅ Library is on GitHub
- ✅ At least one release tag exists (e.g., `v0.1.0`)
- ✅ `library.properties` is valid
- ✅ Examples compile successfully
- ✅ CI tests pass

#### Publishing Steps

1. **Create a GitHub Release:**
   ```bash
   git tag -a v0.1.0 -m "Initial release"
   git push origin v0.1.0
   ```
   Then create a release on GitHub with release notes.

2. **Submit to Arduino Library Manager:**
   - Fork https://github.com/arduino/library-registry
   - Edit `repositories.txt`
   - Add your repository URL: `https://github.com/yourusername/YourLibrary`
   - Create a Pull Request
   - Wait for review (usually 1-7 days)

3. **After Acceptance:**
   - Your library will appear in Arduino IDE's Library Manager
   - Users can install via: Sketch → Include Library → Manage Libraries
   - Arduino Library Manager checks for new releases automatically

#### Versioning Guidelines

Follow [Semantic Versioning](https://semver.org/):
- **MAJOR** version (1.0.0): Incompatible API changes
- **MINOR** version (0.1.0): New features, backwards compatible
- **PATCH** version (0.0.1): Bug fixes, backwards compatible

#### Release Checklist

Before each release:
- [ ] Update version in `library.properties`
- [ ] Update CHANGELOG section in README
- [ ] Test all examples on hardware
- [ ] Verify CI passes
- [ ] Create Git tag matching version
- [ ] Write clear release notes

## API Reference

### Constructor

```cpp
LibraryName(uint8_t pin)
```

Creates a new instance of the library.

**Parameters:**
- `pin` - The Arduino pin number to control

### Methods

#### `void begin()`

Initializes the library. Call this in `setup()`.

#### `void activate()`

Activates the device (sets pin HIGH).

#### `void deactivate()`

Deactivates the device (sets pin LOW).

## Requirements

- Arduino IDE 1.5.0 or higher (recommended: 2.0+)
- Compatible with all Arduino architectures by default
- No external dependencies (pure Arduino library)

## Testing Your Library

### Local Testing

1. **Zip your library:**
   ```bash
   # From parent directory
   zip -r MyLibrary.zip MyLibrary/
   ```

2. **Install in Arduino IDE:**
   - Sketch → Include Library → Add .ZIP Library
   - Select your ZIP file
   - Restart Arduino IDE

3. **Verify examples compile:**
   - File → Examples → MyLibrary → BasicUsage
   - Click Verify (✓) button
   - Should compile without errors

4. **Test on hardware:**
   - Upload to your Arduino board
   - Monitor Serial output if applicable
   - Verify expected behavior

### Continuous Integration

This template includes GitHub Actions CI that automatically:
- ✅ Compiles examples on multiple Arduino boards
- ✅ Tests on AVR, SAMD, and megaAVR architectures
- ✅ Generates compilation reports
- ✅ Validates library structure

View your CI results at: `https://github.com/yourusername/YourLibrary/actions`

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

For technical details, see [Developer Documentation](docs/DEVELOPER.md).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Authors

- **Adarsh P Thomson** - *Initial template creator*

When using this template for your own library, replace this section with your own details.

## Support

- **Issues:** https://github.com/Adarsh-P-Thomson/arduino-library-template/issues
- **Discussions:** https://github.com/Adarsh-P-Thomson/arduino-library-template/discussions
- **Arduino Forum:** https://forum.arduino.cc/
- **Documentation:** [Arduino Library Specification](https://arduino.github.io/arduino-cli/latest/library-specification/)

## Troubleshooting

### Common Issues

**❌ "Library not found" when compiling**
- Ensure library folder name matches `name` in `library.properties`
- Restart Arduino IDE after installing
- Check that library is in the correct location: `~/Documents/Arduino/libraries/`

**❌ "Multiple libraries found"**
- Remove duplicate library installations
- Check both user and system library directories
- Use unique library names

**❌ CI workflow fails**
- Check that examples compile locally first
- Verify `library.properties` syntax
- Ensure all `#include` statements are correct
- Review workflow logs for specific errors

**❌ Library Manager rejects submission**
- Must have at least one release tag
- `library.properties` must be valid
- Repository must be public
- Follow naming conventions (no spaces in library name)

### Getting Help

1. Check existing [Issues](https://github.com/Adarsh-P-Thomson/arduino-library-template/issues)
2. Read the [Arduino Library Specification](https://arduino.github.io/arduino-cli/latest/library-specification/)
3. Ask on [Arduino Forum](https://forum.arduino.cc/)
4. Open a new issue with details

## Changelog

### v0.1.0 (2026-01-22)
- ✨ Initial template release
- ✅ Complete Arduino Library Manager structure
- ✅ GitHub Actions CI/CD workflow
- ✅ Example sketches (Basic and Advanced)
- ✅ Automated setup scripts (PowerShell and Bash)
- ✅ Comprehensive documentation
- ✅ MIT License
- ✅ Valid `library.properties` configuration
- ✅ Multi-architecture support (AVR, SAMD, megaAVR)
