#include <Wiegand.h>

WIEGAND wg;

void setup() {

  Serial.begin(115200);

  // Pines conectados al lector
  wg.begin(22, 23);

  Serial.println("Lector RFID listo");

}

void loop() {

  if (wg.available()) {

    unsigned long tarjeta = wg.getCode();

    Serial.print("Tarjeta detectada: ");
    Serial.println(tarjeta);

  }

}