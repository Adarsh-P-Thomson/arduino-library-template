#include "LibraryName.h"

LibraryName::LibraryName(uint8_t pin) {
  _pin = pin;
  _isActive = false;
}

void LibraryName::begin() {
  pinMode(_pin, OUTPUT);
  digitalWrite(_pin, LOW);
}

void LibraryName::activate() {
  digitalWrite(_pin, HIGH);
  _isActive = true;
}

void LibraryName::deactivate() {
  digitalWrite(_pin, LOW);
  _isActive = false;
}
