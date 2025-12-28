#ifndef LIBRARY_NAME_H
#define LIBRARY_NAME_H

#include <Arduino.h>

class LibraryName {
  public:
    LibraryName(uint8_t pin);
    void begin();
    void activate();
    void deactivate();
    
  private:
    uint8_t _pin;
    bool _isActive;
};

#endif
