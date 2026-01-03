#include <DHT.h>

#define DHTPIN 2
#define DHTTYPE DHT22

DHT dht(DHTPIN, DHTTYPE);

void setup() {
  Serial.begin(9600);
  dht.begin();
}

void loop() {
  float h = dht.readHumidity();
  float t = dht.readTemperature();

  if (isnan(h) || isnan(t)) {
    Serial.println("ERR");
  } else {
    Serial.print("T=");
    Serial.print(t, 2);
    Serial.print("C H=");
    Serial.print(h, 2);
    Serial.println("%");
  }

  delay(5000);
}

