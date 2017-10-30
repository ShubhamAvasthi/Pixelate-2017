void setup() {
  // put your setup code here, to run once:
  pinMode(7,OUTPUT);//red
  pinMode(6,OUTPUT);
  pinMode(5,OUTPUT);//green
  pinMode(4,OUTPUT);
  pinMode(3,OUTPUT);//blue
  pinMode(2,OUTPUT);
  
  pinMode(8,OUTPUT);    //rf
  pinMode(9,OUTPUT);    //rb
  pinMode(10,OUTPUT);   //lb
  pinMode(11,OUTPUT);   //lf
  pinMode(12,OUTPUT);   //gu
  pinMode(13,OUTPUT);   //gd
  
  Serial.begin(9600);
}

char ch;
int t=30;

void loop() {
  
  while(Serial.available())
  {
    ch=Serial.read();
    if(ch=='r')
    {
      digitalWrite(3,LOW);
      digitalWrite(5,LOW);
      digitalWrite(7,HIGH);
    }
    else if(ch=='g')
    {
      digitalWrite(3,LOW);
      digitalWrite(7,LOW);
      digitalWrite(5,HIGH);
    }
    else if(ch=='b')
    {
      digitalWrite(5,LOW);
      digitalWrite(7,LOW);
      digitalWrite(3,HIGH);
    }
    else if(ch=='f')
    {
     analogWrite(8,128);
     analogWrite(11,128);
     delay(t);
     digitalWrite(8,LOW);
     digitalWrite(11,LOW);
    }
    else if(ch=='v')
    {
     analogWrite(9,128);
     analogWrite(10,128);
     delay(t);
     digitalWrite(9,LOW);
     digitalWrite(10,LOW);
    }
    else if(ch=='u')
    {
      digitalWrite(13,LOW);
      analogWrite(12,128);
    }
    else if(ch=='d')
    {
      digitalWrite(12,LOW);
      analogWrite(13,128);
    }
    else if(ch=='a')
    {
     analogWrite(8,128);
     analogWrite(10,128);
     delay(t);
     digitalWrite(8,LOW);
     digitalWrite(10,LOW);
    }
    else if(ch=='c')
    {
      analogWrite(9,128);
      analogWrite(11,128);
      delay(t);
      digitalWrite(9,LOW);
      digitalWrite(11,LOW);
    }
  }
}
