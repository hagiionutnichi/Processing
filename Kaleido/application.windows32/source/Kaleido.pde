
Planet sun;

void setup() {
  background(100);
  size(800, 600);
  sun = new Planet(50, 0, 0, 1);
  sun.addSubPlanets(2);
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  sun.render();
  
}