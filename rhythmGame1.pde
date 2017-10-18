float x,y,z;

void setup() {
  size(600,600,P3D);
  x = width/2;
  y = height/2;
  z = 0;
}

void draw() {
  background(200);
  translate(x,y,0);
  rectMode(CENTER);
  
  beginShape();
  vertex(30,85,z);
  vertex(30,115,z);
  vertex(-30,115,z);
  vertex(-30,85,z);
  endShape(CLOSE);
  
  beginShape();
  vertex(30,85,z-30);
  vertex(30,115,z-30);
  vertex(90,115,z-30);
  vertex(90,85,z-30);
  endShape(CLOSE);
  
  beginShape(LINES);
  vertex(-30,85,0);
  vertex(90,85,0);
  
  vertex(-30,115,0);
  vertex(90,115,0);

  vertex(-30,85,0);
  vertex(-30,115,0);
  
  vertex(30,85,0);
  vertex(30,115,0);
  
  vertex(90,85,0);
  vertex(90,115,0);
  
  endShape();
  
  beginShape(LINES);
  vertex(-30,85,0);
  vertex(-30,85,400);
  
  vertex(30,85,0);
  vertex(30,85,400);
  
  vertex(90,85,0);
  vertex(90,85,400);
  
  vertex(-30,115,0);
  vertex(-30,115,400);
  
  vertex(30,115,0);
  vertex(30,115,400);
  
  vertex(90,115,0);
  vertex(90,115,400);
  
  endShape();
  
  z++; // The rectangle moves forward as z increments.
}
