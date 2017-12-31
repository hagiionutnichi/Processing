class Hour {
  int hour = -1;
  PVector position;
  
  Hour(int hour, float radius) {
    this.hour = hour;
    position = calculatePos(radius);
  }
  
  PVector calculatePos(float radius) {
    PVector result = new PVector(0, 0);
    
    float x = radius * sin(PI/6 * hour);
    float y = -radius * cos(PI/6 * hour);
    
    result.x = x;
    result.y = y;
    
    return result;
  }
  
  void show() {
    textAlign(CENTER, CENTER);
    textSize(32);
    noFill();
    stroke(255);
    text(hour, position.x, position.y);
  }
  
  
}