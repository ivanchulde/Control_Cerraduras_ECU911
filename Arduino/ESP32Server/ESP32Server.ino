#include <WiFi.h>
#include <HTTPClient.h>
#include <Wiegand.h>

WIEGAND wg;

const char* ssid = "Bio";
const char* password = "P*Biometrico_2025";

String servidor = "http://192.168.101.16:3000/validar-tarjeta";

int puertaID = 1;

void setup() {

  Serial.begin(115200);

  wg.begin(22,23);

  WiFi.begin(ssid, password);

  Serial.print("Conectando WiFi");

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi conectado");

  Serial.print("IP del ESP32: ");
  Serial.println(WiFi.localIP());

}

void loop() {

  if (wg.available()) {

    unsigned long tarjeta = wg.getCode();

    Serial.println("");
    Serial.print("Tarjeta detectada: ");
    Serial.println(tarjeta);

    if(WiFi.status() == WL_CONNECTED){

      HTTPClient http;

      Serial.println("Enviando al servidor...");

      http.begin(servidor);

      http.addHeader("Content-Type", "application/json");

      String body = "{\"tarjeta\":" + String(tarjeta) + ",\"puerta\":" + String(puertaID) + "}";

      Serial.print("Datos enviados: ");
      Serial.println(body);

      int httpResponseCode = http.POST(body);

      Serial.print("Codigo HTTP: ");
      Serial.println(httpResponseCode);

      if(httpResponseCode > 0){

        String respuesta = http.getString();

        Serial.print("Respuesta servidor: ");
        Serial.println(respuesta);

      }else{

        Serial.print("Error HTTP: ");
        Serial.println(httpResponseCode);

      }

      http.end();

    }else{

      Serial.println("WiFi desconectado");

    }

  }

}