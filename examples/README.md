# Examples Guide

This document explains the example sketches included with this library and how to use them.

## Basic Usage Example

**Location:** `examples/BasicUsage/BasicUsage.ino`

### What It Does
Demonstrates the most basic usage of the library - initializing a device and toggling it on and off.

### Circuit
```
Arduino Pin 13 → LED (with 220Ω resistor) → GND
```

### Code Overview
```cpp
#include <LibraryName.h>

LibraryName myDevice(13);  // Create instance on pin 13

void setup() {
  myDevice.begin();        // Initialize
  myDevice.activate();     // Turn on
}

void loop() {
  delay(1000);
  myDevice.deactivate();   // Turn off
  delay(1000);
  myDevice.activate();     // Turn on
}
```

### Expected Behavior
- LED blinks every second
- On for 1 second, off for 1 second

### Learn From This Example
- How to include the library
- How to create an instance
- How to initialize with `begin()`
- How to use basic methods

---

## Advanced Usage Example

**Location:** `examples/AdvancedUsage/AdvancedUsage.ino`

### What It Does
Demonstrates controlling multiple devices independently with different timing patterns.

### Circuit
```
Arduino Pin 13 → LED 1 (with 220Ω resistor) → GND
Arduino Pin 12 → LED 2 (with 220Ω resistor) → GND
```

### Code Overview
```cpp
#include <LibraryName.h>

LibraryName device1(13);  // First device
LibraryName device2(12);  // Second device

void setup() {
  device1.begin();
  device2.begin();
  device1.activate();
  device2.activate();
}

void loop() {
  // Alternating pattern
  device1.deactivate();
  delay(500);
  device1.activate();
  delay(500);
  
  device2.deactivate();
  delay(500);
  device2.activate();
  delay(500);
}
```

### Expected Behavior
- Two LEDs blink in an alternating pattern
- Each LED toggles every 500ms with offset

### Learn From This Example
- Managing multiple instances
- Independent control of devices
- Creating patterns and timing

---

## Creating Your Own Examples

When you create your own library, add examples that demonstrate:

### 1. Minimal Example
The simplest possible usage - just enough to get started.

### 2. Common Use Cases
Examples showing typical real-world usage scenarios.

### 3. Advanced Features
Demonstrate complex features or combinations.

### Example Template

```cpp
/*
  Example Name
  
  Description of what this example does and what it demonstrates.
  
  Circuit:
    - Pin X to Component Y
    - Pin Z to Component W
  
  Created: YYYY-MM-DD
  By: Your Name
  
  https://github.com/yourusername/YourLibrary
*/

#include <YourLibrary.h>

// Create instances
YourLibrary device(13);

void setup() {
  // Initialize Serial for debugging
  Serial.begin(9600);
  while (!Serial) {
    ; // Wait for serial port to connect (needed for native USB)
  }
  
  Serial.println("Example starting...");
  
  // Initialize your library
  device.begin();
}

void loop() {
  // Your example code here
  
  delay(1000);  // Add appropriate delays
}
```

### Best Practices for Examples

1. **Keep it Simple**
   - One concept per example
   - Clear variable names
   - Minimal complexity

2. **Add Comments**
   - Explain what each section does
   - Clarify non-obvious code
   - Help beginners understand

3. **Test Thoroughly**
   - Compile without warnings
   - Test on actual hardware
   - Verify expected behavior

4. **Document Hardware**
   - List required components
   - Show wiring diagrams
   - Note any special requirements

5. **Use Serial Output**
   - Print status messages
   - Help with debugging
   - Show what's happening

6. **Handle Errors**
   - Check return values
   - Validate inputs
   - Provide meaningful error messages

---

## Example Naming Convention

Use descriptive names that indicate what the example demonstrates:

- ✅ `BasicUsage` - Good
- ✅ `BlinkMultipleLEDs` - Good
- ✅ `SerialCommunication` - Good
- ❌ `Example1` - Too vague
- ❌ `Test` - Not descriptive

---

## Contributing Examples

Have a great example to share? We'd love to include it!

1. Create your example in a new folder under `examples/`
2. Follow the template above
3. Test thoroughly on hardware
4. Submit a pull request
5. Include photos/diagrams if applicable

See [CONTRIBUTING.md](../CONTRIBUTING.md) for more details.
