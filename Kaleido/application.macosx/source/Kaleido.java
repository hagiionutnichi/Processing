import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Kaleido extends PApplet {


Planet sun;

public void setup() {
  background(100);
  
  sun = new Planet(50, 0, 0, 1);
  sun.addSubPlanets(2);
}

public void draw() {
  background(0);
  
  translate(width/2, height/2);
  sun.render();
  
}
class Planet {
  float radius;
  float angle;
  float distance;
  float orbitSpeed;
  int level;

  Planet[] planets;

  Planet(float radius, float distance, float orbitSpeed, int level) {
    this.radius = radius;
    this.distance = distance;
    this.angle = random(TWO_PI);
    this.orbitSpeed = orbitSpeed;
    this.level = level;
  }

  public void addSubPlanets(int numberOfPlanets) {
    planets = new Planet[numberOfPlanets];
    for (int i = 0; i < numberOfPlanets; i++) {
      float newSpeed = random(0.01f, 0.03f);
      float dist = radius + radius/2 + random(10, 100);
      planets[i] = new Planet(radius/2, dist, newSpeed, level+1);
      if(level<2)
        planets[i].addSubPlanets(2);
    }
  }

  public void render() {
    pushMatrix();
    stroke(255);
    fill(random(255), 10, random(255));
    rotate(angle);
    translate(distance, 0);
    ellipse(0, 0, radius * 2, radius * 2);
    if (planets != null) {
      for (Planet planet : planets)
        planet.render();
    }
    angle += orbitSpeed;
    
    popMatrix();
  }
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Kaleido" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
