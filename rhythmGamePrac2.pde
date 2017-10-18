float x,y,z;
int a;

void setup() {
  size(600,600,P3D);
  x = width/2;
  y = height/3;
  z = 0;
}

void draw() {
  background(200);
  translate(x,-y,0);
  rectMode(CENTER);

  gameSet();
  
  cell2(0);
  cell2(50);
  cell2(170);
  cell2(400);
  cell2(700);
  
  cell3(30);
  cell3(620);
}


void gameSet(){
  beginShape(LINES);
  vertex(-90,400,50);
  vertex(90,400,50);
  
  vertex(-90,430,50);
  vertex(90,430,50);

  vertex(-90,400,50);
  vertex(-90,430,50);
  
  vertex(-30,400,50);
  vertex(-30,430,50);
  
  vertex(30,400,50);
  vertex(30,430,50);
  
  vertex(90,400,50);
  vertex(90,430,50);
  endShape();
  
  
  beginShape();  
  vertex(-90,400,50);
  vertex(-90,800,1200);
  vertex(-90,830,1200);
  vertex(-90,430,50);
  endShape(CLOSE);
  
  beginShape();  
  vertex(-30,400,50);
  vertex(-30,800,1200);
  vertex(-30,830,1200);
  vertex(-30,430,50);
  endShape(CLOSE);
  
  beginShape();  
  vertex(30,400,50);
  vertex(30,800,1200);
  vertex(30,830,1200);
  vertex(30,430,50);
  endShape(CLOSE);
  
  beginShape();  
  vertex(90,400,50);
  vertex(90,800,1200);
  vertex(90,830,1200);
  vertex(90,430,50);
  endShape(CLOSE);
  
}

void cell1(int a){
  beginShape();
  vertex(30,400,z-a);
  vertex(30,430,z-a);
  vertex(-30,430,z-a);
  vertex(-30,400,z-a);
  endShape(CLOSE);
}

void cell2(int b){
  beginShape();
  vertex(30,400,z-b);
  vertex(30,430,z-b);
  vertex(-30,430,z-b);
  vertex(-30,400,z-b);
  endShape(CLOSE);
  z++;
}

void cell3(int c){
  beginShape();
  vertex(30,400,z-c);
  vertex(30,430,z-c);
  vertex(90,430,z-c);
  vertex(90,400,z-c);
  endShape(CLOSE);
}
