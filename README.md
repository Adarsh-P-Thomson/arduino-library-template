# Arduino Library Template

A professional, ready-to-use template for creating Arduino libraries that comply with the [Arduino Library Specification](https://arduino.github.io/arduino-cli/latest/library-specification/).

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
git clone https://github.com/yourusername/LibraryName.git
cd LibraryName
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

## How to Use This Template

Follow these steps to create your own library:

### Step 1: Clone and Rename

```bash
git clone https://github.com/yourusername/arduino-library-template.git MyNewLibrary
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

1. Create a GitHub release with a version tag (e.g., `v0.1.0`)
2. Submit your library to Arduino Library Manager:
   - Fork https://github.com/arduino/library-registry
   - Add your repository URL to `repositories.txt`
   - Create a pull request

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

- Arduino IDE 1.5.0 or higher
- Compatible with all Arduino architectures

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Authors

- **Your Name** - Initial template

## Acknowledgments

- Arduino community
- Contributors and users of this template

## Support

- Issues: https://github.com/yourusername/LibraryName/issues
- Documentation: https://github.com/yourusername/LibraryName/wiki
- Arduino Forum: https://forum.arduino.cc/

## Changelog

### v0.1.0 (Initial Release)
- Basic library structure
- Example sketches
- CI/CD integration
