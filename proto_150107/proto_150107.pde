import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import processing.serial.*;

Minim minim;
AudioSample do_1, re, mi, fa, so, ra, si, do_2;
Serial myPort;

float[] values = new float[3];
Slide s1, s2, s3;

color blue, yellow, pink, white, black;

int soundFlag = 0;

void setup() {  
  //minim
  minim = new Minim(this);
  do_1 = minim.loadSample("do.mp3", 512);
  re = minim.loadSample("re.mp3", 512);
  mi = minim.loadSample("mi.mp3", 512);
  fa = minim.loadSample("fa.mp3", 512);
  so = minim.loadSample("so.mp3", 512);
  ra = minim.loadSample("ra.mp3", 512);
  si = minim.loadSample("si.mp3", 512);
  do_2 = minim.loadSample("do_hi.mp3", 512);
  
  //Arduino
  String arduinoPort = Serial.list()[0];
  myPort = new Serial(this, arduinoPort, 9600);
  myPort.bufferUntil('\n');

  for (int i = 0; i < values.length; i++) {
    values[i] = 0;
  }

  //Slide
  s1 = new Slide(0, values[0]);
  s2 = new Slide(1, values[1]);
  s3 = new Slide(2, values[2]);
  //s4 = new Slide(3, values[3]);

  //color
  blue = color(87, 177, 150);
  yellow = color(255, 210, 90);
  pink = color(255, 131, 123);
  white = color(232, 232, 231);
  black = color(54, 47, 60);

  //display
  size(400, 400);
  background(white);
  frameRate(60);
}

void draw() {
  //Slide class
  s1.draw();
  s2.draw();
  s3.draw();
  //s4.draw();

  //background
  fill(white, 30);
  rect(0, 0, width, height);

  //play sound
  if ((frameCount / 60 % values.length == 0)&&(soundFlag == 0)) {
    s1.play();
    fill(0);
    ellipse(360, 80, 15, 15);
    soundFlag = 1;
  } else if ((frameCount / 60 % values.length == 1)&&(soundFlag == 1)) {
    s2.play();
    fill(0);
    ellipse(360, 160, 15, 15);
    soundFlag = 2;
  } else if ((frameCount / 60 % values.length == 2)&&(soundFlag == 2)) {
    s3.play();
    fill(0);
    ellipse(360, 240, 15, 15);
    soundFlag = 0;
  } 
  /*else if ((frameCount / 60 % values.length == 3)&&(soundFlag == 3)) {
    s4.play();
    fill(0);
    ellipse(360, 320, 15, 15);
    soundFlag = 0;
  }*/
  println(frameCount / 60 % values.length);
}
void serialEvent(Serial p){
  String myString = myPort.readStringUntil('\n');
  int x[] = int(split(myString,','));
  s1.setValue(x[0]);
  s2.setValue(x[1]);
  s3.setValue(x[2]);
  println(myString);
}

void stop() {
  s1.stop();
  s2.stop();
  s3.stop();
  //s4.stop();
  super.stop();
}

void mouseDragged() {
//  s1.mouseDragged();
//  s2.mouseDragged();
//  s3.mouseDragged();
//  s4.mouseDragged();
}

