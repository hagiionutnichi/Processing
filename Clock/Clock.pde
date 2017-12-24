import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

float x = 0;
float y = 0;
float radius = 200;
float hour = 0;
float minute = 0;
float second = 0;
ArrayList<PVector> hourVertices = new ArrayList<PVector>();
ArrayList<PVector> minuteVertices = new ArrayList<PVector>();
ArrayList<PVector> secondVertices = new ArrayList<PVector>();
float rT = 0;
void setup() {
  size(800, 600, P3D);
  new PeasyCam();
}

void emptyArrays() {
  hourVertices = new ArrayList<PVector>();
  minuteVertices = new ArrayList<PVector>();
  secondVertices = new ArrayList<PVector>();
}

void generateVertices(float value, float radius, ArrayList<PVector> result) {
  //print(value);
  for (float i = 0; i < value; i+=360/360) {
    float heading = i * PI / 180;
    result.add(new PVector(cos(heading) * radius, sin(heading) * radius));
  }
}

void draw() {
  hour = map(hour(), 0, 23, 0, 360);;
  minute = map(minute(), 0, 59, 0, 360);;
  second = map(second(), 0, 59, 0, 360);;
  background(51);
  translate(width/2, height/2);
  strokeWeight(10);
  emptyArrays();
  generateVertices(hour, 100, hourVertices);
  generateVertices(minute, 85, minuteVertices);
  generateVertices(second, 70, secondVertices);
  //float size = map(hour, 0, 23, 0, TWO_PI);
  rotate(-PI/2);
  stroke(255, 0, 0);
  noFill();
  //rotateX(rT * 1);
  beginShape();
  for (PVector vertex : hourVertices) {
    vertex(vertex.x, vertex.y);
  }
  endShape();
  
  //rotateX(rT * 1.5);
  stroke(0,255, 0);
  beginShape();
  for (PVector vertex : minuteVertices) {
    vertex(vertex.x, vertex.y);
  }
  endShape();
  
  //rotateX(rT * 2);
  stroke(0, 0, 255);
  beginShape();
  for (PVector vertex : secondVertices) {
    vertex(vertex.x, vertex.y);
  }
  endShape();
  //hour += 0.1;
  //if(hour > 23)
  //  hour = 0;
}