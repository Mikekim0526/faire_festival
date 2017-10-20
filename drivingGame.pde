PVector car;
float speed; 
float rot; 
boolean leftBoolean, rightBoolean, speedBoolean; 
PImage img;

void setup() {
  size (740, 400);
  rectMode(CENTER);
  smooth();
  car = new PVector(width/2, height/2);
  speed = 0;
  img = loadImage("car.jpg");
}

void draw() {
  background(124);
  fill(0, 30);
  rect(width,height, width*2, height*2);
  //이동
  car.x +=  cos(rot)*(speed); // current location + the next "step"
  car.y +=  sin(rot)*(speed);
  
  //ship
  pushMatrix();
  translate(car.x, car.y); 
  rotate(rot); 
  image(img, -30,-15,60,30);
  popMatrix();  
  
  //반대 반향으로 다시 나오게 한다.
  if (car.x < 0 ){
    car.x = width;
  }
  if (car.x > width) {
    car.x = 0;
  }
  if (car.y < 0 ) {
    car.y = height;
  }  
  if (  car.y > height) {
    car.y = 0;
  }

  //방향키 
  if (leftBoolean == true) {
    rot -= .05;
  } 
  else if (rightBoolean == true) {
    rot += .05;
  } 
  if (speedBoolean == true) { 
    speed += .1;
  }
  else {
    speed -= .25;
  }
  
  //속도제한
  speed = constrain(speed, 0, 6);
}

void keyPressed() {
  println(keyCode); 
  if (keyCode == LEFT) {
    leftBoolean = true;
  }
  if (keyCode == RIGHT) {
    rightBoolean = true;
  }
  if (keyCode == UP) {
    speedBoolean = true;
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    leftBoolean = false;
  }
  if (keyCode == RIGHT) {
    rightBoolean = false;
  }
  if (keyCode == UP) {
    speedBoolean = false;
  }
}