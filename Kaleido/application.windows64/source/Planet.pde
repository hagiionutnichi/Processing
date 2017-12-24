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

  void addSubPlanets(int numberOfPlanets) {
    planets = new Planet[numberOfPlanets];
    for (int i = 0; i < numberOfPlanets; i++) {
      float newSpeed = random(0.01, 0.03);
      float dist = radius + radius/2 + random(10, 100);
      planets[i] = new Planet(radius/2, dist, newSpeed, level+1);
      if(level<2)
        planets[i].addSubPlanets(2);
    }
  }

  void render() {
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