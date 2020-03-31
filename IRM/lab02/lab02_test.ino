// Lab 02 - Analog Signal Acquisition
// Sample the analog output of the hall sensor sensor
// and print the value to the serial port


void setup() {
  // setup the serial connection
  Serial.begin(115200);
  // the default resolution of the ADC is set to 10 bits (maximum is 12 bits)
  //analogReadResolution(12); // this will only work if you have the right board connected, I didn't so I uncommented it. The right solution is without the comment tag.
  pinMode(A3, INPUT);

}

void loop() {


  // initialize your parameters 
  float input;
  float voltage;

  // check if the serial port is available and if something is received from the serial port
  if(Serial.available() && (Serial.read()==114)) // r stands for read random
  {

    // Read the the hall sensor voltage
    input = analogRead(A3);     //Reads the analog value on pin A3 into input


    // Print the hall sensor voltage and the digital sampled value to the serial port
    Serial.print("Digital value: ");
    Serial.println(input);

    voltage = 3.3*input/4095; // 4095 = 2^(12)-1 is maximum that can be represented with a 12 bit word

    Serial.print("Analog value: ");
    Serial.println(voltage);

  }
delay(20);
}
