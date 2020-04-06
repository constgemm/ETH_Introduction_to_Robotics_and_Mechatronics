#include <Servo.h>

// declare variables

#define poti_pin A0  // analog pin used to connect the potentiometer
float val;    // variable to read the value from the analog pin
float minPoti = 0;
float maxPoti = 1024;
int angle;

// create a servo object to control the servo
Servo lukesServo;
int minPulse = 550;
int maxPulse = 2300;
int minAngle = 0;
int maxAngle = 180;
void setup() {
  
  // _______________ Begin - Setup _______________

  // Attach the servo on pin 9 to the servo object
  lukesServo.attach(9, minPulse, maxPulse);
  // Begin the serial communication
  Serial.begin(115200);
  
  // _______________ End - Setup _______________
  
}

void loop() {
  // _______________ Begin - Loop _______________

  // Read values from the analog pin and map/scale them to the movment range of the servo.
  val = analogRead(poti_pin);
  angle = map(val, minPoti, maxPoti, minAngle, maxAngle);
  // Display the reading from the potentiometer on the serial monitor
  
  Serial.print(angle);
  Serial.print ("//");
  Serial.println(val);
  // Set the servo position according to the scaled value
  lukesServo.write(angle); 
  
  // _______________ End - Loop _______________
  
  delay(15); // wait for the servo to get there
}
