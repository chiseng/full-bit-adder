int left = 11;
int forward = 8;
int back = 10;
int right = 9;

void setup() {
  // put your setup code here, to run once:

  // define IO
  pinMode(1, INPUT);
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);

  // LEDs
  pinMode(forward, OUTPUT);
  pinMode(back, OUTPUT);
  pinMode(left, OUTPUT);
  pinMode(right, OUTPUT);
  
  
}

void loop() {
  // put your main code here, to run repeatedly:
  // back direction
  if(digitalRead(1) == HIGH)
  {
    digitalWrite(back, HIGH);
  }
  else
  {
    digitalWrite(back, LOW);
  }

  // left direction
    if(digitalRead(2) == HIGH)
  {
    digitalWrite(left, HIGH);
  }
  else
  {
    digitalWrite(left, LOW);
  }

  // forward direction
  if(digitalRead(3) == HIGH)
  {
    digitalWrite(forward, HIGH);
  }
  else
  {
    digitalWrite(forward, LOW);
  }

  // right direction
  if(digitalRead(4) == HIGH)
  {
    digitalWrite(right, HIGH);
  }
  else
  {
    digitalWrite(right , LOW);
  }

}
