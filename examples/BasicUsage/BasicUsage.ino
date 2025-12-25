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
