#ifndef LIBRARY_NAME_UTILS_H
#define LIBRARY_NAME_UTILS_H

#include <Arduino.h>

namespace LibraryNameInternal {
  inline bool isValidPin(uint8_t pin) {
    return pin < NUM_DIGITAL_PINS;
  }
}

#endif
