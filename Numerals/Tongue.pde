class Tongue {
  float point = -1;
  PVector position;
  Tongue(float point, float radius) {
    this.point = point;
    this.position = calculatePos(radius);
  }
  
  PVector calculatePos(float radius) {
    PVector result = new PVector(0, 0);
    
    float x = radius * sin(PI/30 * point);
    float y = -radius * cos(PI/30 * point);
    
    result.x = x;
    result.y = y;
    
    return result;
  }
  
  void show() {
    noFill();
    stroke(255);
    strokeWeight(5);
    line(0, 0, position.x, position.y);
  }
  
  
}