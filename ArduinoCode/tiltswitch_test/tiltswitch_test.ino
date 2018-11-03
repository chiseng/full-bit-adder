int left = 8;
int forward = 9;

void setup() {
  // put your setup code here, to run once:

  // define IO
  pinMode(1, INPUT);
  pinMode(2, INPUT);
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);

  // LEDs
  pinMode(left, OUTPUT);
  pinMode(forward, OUTPUT);
  
  
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(1) == HIGH)
  {
    digitalWrite(left, HIGH);
  }
  else
  {
    digitalWrite(left, LOW);
  }

    if(digitalRead(2) == HIGH)
  {
    digitalWrite(forward, HIGH);
  }
  else
  {
    digitalWrite(forward, LOW);
  }
}
