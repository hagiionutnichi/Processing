import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

int w = 1900;
int h = 1200;
int cols;
int rows;
int scale = 40;
float fly = 0;
float[][] terrain;
PeasyCam cam;

void setup() {
  size(600, 600, P3D);
  cols = w / scale;
  rows = h / scale;
  terrain = new float[cols][rows];
  cam = new PeasyCam(this, 100);
}

void draw() {
  
  float yOff = fly;
  for(int y = 0; y < rows - 1; y++) {
    float xOff = 0;
    for(int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xOff, yOff), 0, 1, -300, 300);
      xOff += 0.1;
    }
    yOff +=0.1;
  }
  
  background(0, 180, 200);
  //noFill();
  fill(150);
  stroke(255);
  translate(-width, height/2, -1000);
  rotateX(PI/3);
  
  
  for(int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++) {
      vertex(x * scale, y * scale, terrain[x][y]);
      vertex(x * scale, (y + 1) * scale, terrain[x][y+1]);
    }
    endShape();
  }
  
  fly -= 0.02;
}