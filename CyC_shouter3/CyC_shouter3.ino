int led[4] = { 10, 11, 12, 13};          // LED 4개 변수
int inputed = 0;                         // 입력된 센서값
int score = 0;                           // 점수 변수

#define FIRST_MIN_VALUE 200              // 1점 올라가는 최소점수
#define FIRST_MAX_VALUE 1000             // 1점 올라가는 최대점수
 
#define SENSOR_READ A0                   // 아날로그 센서 받는 핀
 
void setup() {
  Serial.begin(9600);                   //시리얼통신 시작
  for (int i = 0; i < 4; ++i) {
    pinMode(led[i], OUTPUT);             //LED 0~4번 출력단자 설정
  }
}
 
void loop() {
  inputed = analogRead(SENSOR_READ);
  Serial.print("SENSOR : ");
  Serial.print(analogRead(SENSOR_READ));
  Serial.print("  SCORE : ");
  Serial.println(score);                //시리얼모니터에 센서값, 점수 출력
 
  if (inputed >= FIRST_MIN_VALUE &&
    inputed < FIRST_MAX_VALUE) {
    score+= 10;                          //센서값이 200이상 1000 미만에서 점수 10씩 증가
  }
 
  //=================================================
 
  if (score >= 0 &&                      //점수가 0~90에서 모든 LED 소등
    score <= 90)  {
    digitalWrite(led[0], LOW);
    digitalWrite(led[1], LOW);
    digitalWrite(led[2], LOW);
    digitalWrite(led[3], LOW);
  }
  
  else if (score >= 91 &&                //점수가 91~180에서 첫번째 LED 점등
    score <= 180) {
    digitalWrite(led[0], HIGH);
    digitalWrite(led[1], LOW);
    digitalWrite(led[2], LOW);
    digitalWrite(led[3], LOW);
  }
  
  
  else if (score >= 181 &&               //점수가 181~240에서 1,2번 LED 점등
    score <= 240) {
    digitalWrite(led[0], HIGH);
    digitalWrite(led[1], HIGH);
    digitalWrite(led[2], LOW);
    digitalWrite(led[3], LOW);
  }

  else if (score >= 241 &&               //점수가 241~310에서 1,2,3번 LED 점등
  score <= 310) {
    digitalWrite(led[0], HIGH);
    digitalWrite(led[1], HIGH);
    digitalWrite(led[2], HIGH);
    digitalWrite(led[3], LOW);
  }

   else if (score >= 310 &&              //점수가 310~350에서 모든 LED 점등
   score <= 350) {
    digitalWrite(led[0], HIGH);
    digitalWrite(led[1], HIGH);
    digitalWrite(led[2], HIGH);
    digitalWrite(led[3], HIGH);
  }
   else if (score >= 351 &&              //목표점수 돌파시 세레모니 LED
   score <= 450) { 
    digitalWrite(led[0], LOW);
    digitalWrite(led[1], LOW);
    digitalWrite(led[2], LOW);
    digitalWrite(led[3], LOW);
    delay(300);
    digitalWrite(led[0], HIGH);
    digitalWrite(led[1], LOW);
    digitalWrite(led[2], LOW);
    digitalWrite(led[3], LOW);
    delay(300);
    digitalWrite(led[0], HIGH);
    digitalWrite(led[1], HIGH);
    digitalWrite(led[2], LOW);
    digitalWrite(led[3], LOW);
    delay(300);
    digitalWrite(led[0], HIGH);
    digitalWrite(led[1], HIGH);
    digitalWrite(led[2], HIGH);
    digitalWrite(led[3], LOW);
    delay(300);
    digitalWrite(led[0], HIGH);
    digitalWrite(led[1], HIGH);
    digitalWrite(led[2], HIGH);
    digitalWrite(led[3], HIGH);
    delay(300);
    digitalWrite(led[0], LOW);
    digitalWrite(led[1], LOW);
    digitalWrite(led[2], LOW);
    digitalWrite(led[3], LOW);
    delay(120);
    digitalWrite(led[0], HIGH);
    digitalWrite(led[1], HIGH);
    digitalWrite(led[2], HIGH);
    digitalWrite(led[3], HIGH);
    delay(120);
    digitalWrite(led[0], LOW);
    digitalWrite(led[1], LOW);
    digitalWrite(led[2], LOW);
    digitalWrite(led[3], LOW);
    delay(120);
    digitalWrite(led[0], HIGH);
    digitalWrite(led[1], HIGH);
    digitalWrite(led[2], HIGH);
    digitalWrite(led[3], HIGH);
    delay(120);  
  }
  delay(200);
}
