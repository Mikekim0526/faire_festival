float x,y,z;
float time1,time2,time3;
boolean button1,button2,button3 = false;
boolean rPressed=false;
PFont font1;
import ddf.minim.*;
Minim minim;
AudioPlayer player;
int score = 0;

void setup() {
  size(900,900,P3D);
  x = width/2;
  y = height/3;
  z = -2000;
  font1= createFont("Arial Bold", 40);
  
  minim = new Minim(this);
  player = minim.loadFile("ENLedit.MP3",2048);
}

void draw() {
  background(130,130,200);
  translate(x,-y,0);
  rectMode(CENTER);

  gameStart();
  
  gameSet();
  
  textSize(36);
  text("score : " + score, 180,530);
}


void gameSet(){
  fill(0);
  stroke(0);
  textSize(90);
  textFont(font1);
  text("←", -200, height*8/15, z/2-100);
  text("↓", -40, height*8/15, z/2-100);
  text("→", 120, height*8/15, z/2-100);
  
  textSize(30);
  text("←", -83, height+30, 300);
  text("↓", -4, height+30, 300);
  text("→", 48, height+30, 300);
  
  stroke(0);
  beginShape(LINES);
  vertex(-120,height,-1200); //
  vertex(120,height,-1200);
  
  vertex(-90,height+30,-1200);
  vertex(90,height+30,-1200);

  vertex(-120,height,-1200);
  vertex(-90,height+30,-1200);
  
  vertex(-40,height,-1200);
  vertex(-30,height+30,-1200);
  
  vertex(40,height,-1200);
  vertex(30,height+30,-1200);
  
  vertex(120,height,-1200);
  vertex(90,height+30,-1200); // block comes from the far
  
  
  vertex(-120,height,200); //
  vertex(120,height,200);
  
  vertex(-90,height+30,200);
  vertex(90,height+30,200);

  vertex(-120,height,200);
  vertex(-90,height+30,200);
  
  vertex(-40,height,200);
  vertex(-30,height+30,200);
  
  vertex(40,height,200);
  vertex(30,height+30,200);
  
  vertex(120,height,200);
  vertex(90,height+30,200); // block target point
  endShape();
  
  fill(200,170,170);
  beginShape();  
  vertex(-120,height,-2000); //
  vertex(-120,height,1200);
  vertex(-90,height+30,1200);
  vertex(-90,height+30,-2000); // rail 1
  endShape(CLOSE);
  
  beginShape();  
  vertex(-40,height,-2000); //
  vertex(-40,height,1200);
  vertex(-30,height+30,1200);
  vertex(-30,height+30,-2000); // rail 2
  endShape(CLOSE);
  
  beginShape();  
  vertex(40,height,-2000); //
  vertex(40,height,1200);
  vertex(30,height+30,1200);
  vertex(30,height+30,-2000); // rail 3
  endShape(CLOSE);
  
  beginShape();  
  vertex(120,height,-2000);
  vertex(120,height,1200);
  vertex(90,height+30,1200);
  vertex(90,height+30,-2000); // rail 4
  endShape(CLOSE);
  
  beginShape(LINES);
  vertex(90,height*103/120,-2000);
  vertex(90,height*103/120,1200);
  
  vertex(60,height*4/5,-2000);
  vertex(60,height*4/5,1200);
  
  vertex(20,height*47/60,-2000);
  vertex(20,height*47/60,1200);
  
  vertex(0,height*93/120,-2000);
  vertex(0,height*93/120,1200);
  
  vertex(-20,height*47/60,-2000);
  vertex(-20,height*47/60,1200);
  
  vertex(-60,height*4/5,-2000);
  vertex(-60,height*4/5,1200);
  
  vertex(-90,height*103/120,-2000);
  vertex(-90,height*103/120,1200);
  endShape();
  
  fill(255,200);
  beginShape();
  vertex(-90,height+30,-2000); //
  vertex(90,height+30,-2000);
  vertex(120,height,-2000);
  vertex(90,height*103/120,-2000);
  vertex(60,height*4/5,-2000);
  vertex(20,height*47/60,-2000);
  vertex(-20,height*47/60,-2000);
  vertex(-60,height*4/5,-2000);
  vertex(-90,height*103/120,-2000);
  vertex(-120,height,-2000); // entrance
  endShape(CLOSE);
  z+=10;
  
  if(button1 == true){
    noStroke();
    fill(180,130,200,200);
    beginShape();
    vertex(-90,height+30,-2000);
    vertex(-90,height+30,1200);
    vertex(-30,height+30,1200);
    vertex(-30,height+30,-2000);
    endShape();
  }
  if(button2 == true){
    noStroke();
    fill(180,130,200,200);
    beginShape();
    vertex(-30,height+30,-2000);
    vertex(-30,height+30,1200);
    vertex(30,height+30,1200);
    vertex(30,height+30,-2000);
    endShape();
  }
  if(button3 == true){
    noStroke();
    fill(180,130,200,200);
    beginShape();
    vertex(30,height+30,-2000);
    vertex(30,height+30,1200);
    vertex(90,height+30,1200);
    vertex(90,height+30,-2000);
    endShape();
  }
  if(button1==true||button2==true||button3==true){
      fill(random(150,200),random(20,70),random(90));
      beginShape();
      vertex(-90,height*103/120,-2000);
      vertex(-60,height*4/5,-2000);
      vertex(-60,height*4/5,1200);
      vertex(-90,height*103/120,1200);
      endShape(CLOSE);
      beginShape();
      vertex(-20,height*47/60,-2000);
      vertex(0,height*93/120,-2000);
      vertex(0,height*93/120,1200);
      vertex(-20,height*47/60,1200);
      endShape(CLOSE);
      beginShape();
      vertex(20,height*47/60,-2000);
      vertex(60,height*4/5,-2000);
      vertex(60,height*4/5,1200);
      vertex(20,height*47/60,1200);
      endShape(CLOSE);
      
      fill(random(50,100),random(150,250),random(100,150));
      beginShape();
      vertex(-20,height*47/60,-2000);
      vertex(-60,height*4/5,-2000);
      vertex(-60,height*4/5,1200);
      vertex(-20,height*47/60,1200);
      endShape(CLOSE);
      beginShape();
      vertex(20,height*47/60,-2000);
      vertex(0,height*93/120,-2000);
      vertex(0,height*93/120,1200);
      vertex(20,height*47/60,1200);
      endShape(CLOSE);
      beginShape();
      vertex(90,height*103/120,-2000);
      vertex(60,height*4/5,-2000);
      vertex(60,height*4/5,1200);
      vertex(90,height*103/120,1200);
      endShape(CLOSE);
  }
  
  println(time1 + "   " + time2 + "   " + time3);
}

void gameStart(){
  player.play();
  cell3(2020);
  cell2(2490);
  cell1(2990);
  
  cell2(4030);
  cell2(4470);
  cell2(5000);
  
  cell3(5990);
  cell3(6910);
  
  
  cell2(7800);
  cell2(8400);
  cell2(9200);
  cell1(8000);
  cell1(8800);
  cell3(8100);
  cell3(8440);
  cell3(8800);
  
  cell2(11000);
  cell2(11500);
  cell2(12000);
  cell2(13000);
  cell3(13500);
  cell2(14000);
  
  cell2(14960);
  cell2(15490);
  cell2(15920);
  
  cell2(17880);
  cell2(18410);
  cell2(18940);
  
  cell1(20960);
  cell2(21510);
  cell3(22000);
  
  cell2(23040);
  cell3(23520);
  cell2(24050);
}

void cell1(int a){
  stroke(0,100);
  fill(200,180,90);
  beginShape();
  vertex(-120,height,z-a);
  vertex(-90,height+30,z-a);
  vertex(-30,height+30,z-a);
  vertex(-40,height,z-a);
  endShape(CLOSE);
  
    if(time1-200<a+30 && time1-200>a-30){
      fill(0);
      textFont(font1);
      text("Perfect", -120, height*8/15, z-a-250);
    } else if(time1-200<a+70 && time1-200>a-70){
      fill(0);
      textFont(font1);
      text("Great", -120, height*8/15, z-a-250);
    } else if(time1-200<a+100 && time1-200>a-100){
      fill(0);
      textFont(font1);
      text("Good", -120, height*8/15, z-a-250);
    }
  if(button1==false){
    score+=0;
  } else {
    if(-200<a+30 && time1-200>a-30){
      score+=500;
    } else if(time1-200<a+70 && time1-200>a-70){
      score+=300;
    } else if(time1-200<a+100 && time1-200>a-100){
      score+=200;
    }
  }
}

void cell2(int b){
  fill(200,180,120);
  beginShape();
  vertex(40,height,z-b);
  vertex(30,height+30,z-b);
  vertex(-30,height+30,z-b);
  vertex(-40,height,z-b);
  endShape(CLOSE);
  
    if(time2-200<b+50 && time1-200>b-50){
      fill(0);
      textFont(font1);
      text("Perfect", -40, height*8/15, z-b-250);
    } else if(time2-200<b+100 && time2-200>b-100){
      fill(0);
      textFont(font1);
      text("Great", -40, height*8/15, z-b-250);
    } else if(time2-200<b+150 && time2-200>b-150){
      fill(0);
      textFont(font1);
      text("Good", -40, height*8/15, z-b-250);
    }
  if(button2==false){
    score+=0;
  } else {
    if(time2-200<b+50 && time1-200>b-50){
      score+=500;
    } else if(time2-200<b+100 && time2-200>b-100){
      score+=300;
    } else if(time2-200<b+150 && time2-200>b-150){
      score+=200;
    }
  }
}

void cell3(int c){
  fill(200,180,100);
  beginShape();
  vertex(40,height,z-c);
  vertex(30,height+30,z-c);
  vertex(90,height+30,z-c);
  vertex(120,height,z-c);
  endShape(CLOSE);
  
  if(time3-200<c+50 && time3-200>c-50){
      fill(0);
      textFont(font1);
      text("Perfect", 40, height*2/3, z-c-250);
    } else if(time3-200<c+100 && time3-200>c-100){
      fill(0);
      textFont(font1);
      text("Great", 40, height*2/3, z-c-250);
    } else if(time3-200<c+150 && time3-200>c-150){
      fill(0);
      textFont(font1);
      text("Good", 40, height*2/3, z-c-250);
    }
  if(button3==true){ 
    if(time3-200<c+50 && time3-200>c-50){
      score+=500;
    } else if(time3-200<c+100 && time3-200>c-100){
      score+=300;
    } else if(time3-200<c+150 && time3-200>c-150){
      score+=200;
    }
  }
}

void keyPressed(){
    if(keyCode == LEFT || key == 'j'){
      button1 = true;
      time1=z;
    }
    if(keyCode == DOWN || key == 'k'){
      button2 = true;
      time2=z;
    }
    if(keyCode == RIGHT || key == 'l'){
      button3 = true;
      time3=z;
    }
    if(key == 'p'){
      rPressed = true;
    }
    if(rPressed == true){
      z=-2000;
      player.close();
      player = minim.loadFile("ENLedit.MP3",2048);
      gameStart();
      score=0;
    }
}

void keyReleased(){
  if(keyCode == LEFT || key == 'j'){
      button1 = false;
    }
    if(keyCode == DOWN|| key == 'k'){
      button2 = false;
    }
    if(keyCode == RIGHT || key == 'l'){
      button3 = false;
    }
    if(key == 'p'){
      rPressed = false;
    }
}
