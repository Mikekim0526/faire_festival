#include <CurieBLE.h>

#ifdef __AVR__
#include <avr/power.h>
#endif

#define BATTERY_CNT 2
#define MAX_VOLT 4.2
#define MIN_VOLT 3.2
#define EMPTY_VOLT 3.0
#define DRIVE_SPEED 100
#define DRIVE_SPEEDh 115
#define BACK_SPEED 80
#define BACK_SPEEDh 90
#define DIRECTION_SPEED 120
#define DIRECTION_SPEEDh 140
#define DIRECTION_SPEEDw 60
#define DIRECTION_SPEEDhw 70
#define DIRECTION_SPEED_GAP 50
#define DM_SPEED_PIN1 5
#define DM_DRIVE_PIN1 2
#define DM_BACK_PIN1 4
#define DM_SPEED_PIN2 6
#define DM_DRIVE_PIN2 7
#define DM_BACK_PIN2 8
#define TRIG_PIN 12
#define ECHO_PIN 9
#define BUZZER_PIN 20


#define DANGER_THRESH 20

BLEPeripheral blePeripheral;
BLEService UARTService ("6E400001-B5A3-F393-E0A9-E50E24DCCA9E"); // Nordic UART Service -- uuid 고정 요!

// BLE UART Switch Characteristic - custom 128-bit UUID, read and writable by central
BLEUnsignedCharCharacteristic RXCharacteristic ("6E400002-B5A3-F393-E0A9-E50E24DCCA9E", BLEWrite);  // 변경하지 말 것!
BLEUnsignedCharCharacteristic TXCharacteristic ("6E400003-B5A3-F393-E0A9-E50E24DCCA9E", BLERead);

long duration, cm;
int leftDistance, rightDistance;
boolean isStarted = false;
int curSpeedVal = 0; // 현재 속도값(최초 0)

void setup() {
  Serial.begin(9600);


  blePeripheral.setLocalName ("cycrc"); // 각자 자신의 이름으로 수정할 것
  blePeripheral.setDeviceName ("cycrc"); // 각자 자신의 이름으로 수정할 것 // 각자 자신의 이름으로 수정할 것
  blePeripheral.setAdvertisedServiceUuid (UARTService.uuid());

  // 서비스 등록
  blePeripheral.addAttribute (UARTService);
  blePeripheral.addAttribute (RXCharacteristic);
  blePeripheral.addAttribute (TXCharacteristic);

  // 초기화
  RXCharacteristic.setValue (0);


  // BLE 서비스 시작
  blePeripheral.begin ();
  Serial.println ("BLE UART Peripheral");


  // 각종 핀 설정
  pinMode(DM_SPEED_PIN1, OUTPUT);
  pinMode(DM_DRIVE_PIN1, OUTPUT);
  pinMode(DM_BACK_PIN1, OUTPUT);

  pinMode(DM_SPEED_PIN2, OUTPUT);
  pinMode(DM_DRIVE_PIN2, OUTPUT);
  pinMode(DM_BACK_PIN2, OUTPUT);

  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
}

void loop() {
  // bluetooth를 통해 들어오는 값 받을 준비
  BLEDevice central = BLE.central();

  if (central) {
    if (central.connected()) {// BLE가 연결되어 있는 동안 값 받기
      if (RXCharacteristic.written()) { // 값이 들어오면
        char cmd = RXCharacteristic.value(); // 들어온 값 받기
        Serial.print (cmd);
        parseVal(cmd); // 값으로 여러 동작 구현하는 함수 호출
      }
      RXCharacteristic.setValue(0);
      delay(1000);
    } else { // BLE 연결이 끊기면 멈추기
      if (curSpeedVal > 0) {
        goStop();
        curSpeedVal = 0;
      }
    }
  }
}

void goStop() {

  curSpeedVal = 0;
  analogWrite(DM_SPEED_PIN1, curSpeedVal);
  analogWrite(DM_SPEED_PIN2, curSpeedVal);
  digitalWrite(DM_DRIVE_PIN1, LOW);
  digitalWrite(DM_BACK_PIN1, LOW);
  digitalWrite(DM_DRIVE_PIN2, LOW);
  digitalWrite(DM_BACK_PIN2, LOW);
}

void goForward() { // 전진 함수
  analogWrite(DM_SPEED_PIN1, DRIVE_SPEED);
  analogWrite(DM_SPEED_PIN2, DRIVE_SPEEDh);
  digitalWrite(DM_DRIVE_PIN1, LOW);
  digitalWrite(DM_BACK_PIN1, HIGH);
  digitalWrite(DM_DRIVE_PIN2, HIGH);
  digitalWrite(DM_BACK_PIN2, LOW);
}

void goBack() { // 후진 함수
  analogWrite(DM_SPEED_PIN1, BACK_SPEED);
  analogWrite(DM_SPEED_PIN2, BACK_SPEEDh);
  digitalWrite(DM_DRIVE_PIN1, HIGH);
  digitalWrite(DM_BACK_PIN1, LOW);
  digitalWrite(DM_DRIVE_PIN2, LOW);
  digitalWrite(DM_BACK_PIN2, HIGH);
}

void goLeft() { // 좌회전 함수
  analogWrite(DM_SPEED_PIN1, DIRECTION_SPEED);
  analogWrite(DM_SPEED_PIN2, DIRECTION_SPEEDh);
  digitalWrite(DM_DRIVE_PIN1, HIGH);
  digitalWrite(DM_BACK_PIN1, LOW);
  digitalWrite(DM_DRIVE_PIN2, HIGH);
  digitalWrite(DM_BACK_PIN2, LOW);
  delay(360);
  goStop();
}

void goRight() { // 우회전 함수 
  analogWrite(DM_SPEED_PIN1, DIRECTION_SPEED)
  
  ;
  analogWrite(DM_SPEED_PIN2, DIRECTION_SPEEDh);
  digitalWrite(DM_DRIVE_PIN1, LOW);
  digitalWrite(DM_BACK_PIN1, HIGH);
  digitalWrite(DM_DRIVE_PIN2, LOW);
  digitalWrite(DM_BACK_PIN2, HIGH);
  delay(350);
  goStop();
}

void goRightForward() { 
  analogWrite(DM_SPEED_PIN1, DIRECTION_SPEED);
  analogWrite(DM_SPEED_PIN2, DIRECTION_SPEEDhw);
  digitalWrite(DM_DRIVE_PIN1, LOW);
  digitalWrite(DM_BACK_PIN1, HIGH);
  digitalWrite(DM_DRIVE_PIN2, HIGH);
  digitalWrite(DM_BACK_PIN2, LOW);
}

void goLeftForward() { 
  analogWrite(DM_SPEED_PIN1, DIRECTION_SPEEDw);
  analogWrite(DM_SPEED_PIN2, DIRECTION_SPEEDh);
  digitalWrite(DM_DRIVE_PIN1, LOW);
  digitalWrite(DM_BACK_PIN1, HIGH);
  digitalWrite(DM_DRIVE_PIN2, HIGH);
  digitalWrite(DM_BACK_PIN2, LOW);
}


void parseVal(char cmd) {
  if (cmd == 'O') { // stop
    goStop();
  } else if (cmd == 'D') { // 전진
    goForward();
  } else if (cmd == 'H') { // 후진
    goBack();
  } else if (cmd == 'J') { // 좌 
    goLeft();
  } else if (cmd == 'F') { // 우 
    goRight();
  } else if (cmd == 'E') { // 2시
    goRightForward();
  } else if (cmd == 'K') { // 10시
    goLeftForward();
  }
}
