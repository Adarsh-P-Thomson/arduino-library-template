#include <LibraryName.h>

LibraryName device1(13);
LibraryName device2(12);

void setup() {
  device1.begin();
  device2.begin();
  
  device1.activate();
  device2.activate();
}

void loop() {
  device1.deactivate();
  delay(500);
  device1.activate();
  
  delay(500);
  
  device2.deactivate();
  delay(500);
  device2.activate();
  
  delay(500);
}
