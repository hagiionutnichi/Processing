class HollowBox {
  float x;
  float y;
  float z;
  float size;
  float actualSize;

  HollowBox(float x, float y, float z, float size) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.size = size;
    actualSize = size / 3;
  }

  ArrayList<HollowBox> generate() {
    ArrayList<HollowBox> boxes = new ArrayList<HollowBox>();
    for (int dz = -1; dz < 2; dz++) {
      for (int dy = -1; dy < 2; dy++) {
        for (int dx = -1; dx < 2; dx++) {
          float sum = abs(dx) + abs(dy) + abs(dz);
          if (sum>1) {
            HollowBox box = new HollowBox(x + dx * actualSize, y + dy * actualSize, z + dz * actualSize, actualSize);
            boxes.add(box);
          }
        }
      }
    }
    return boxes;
  }
  
  void show() {
    pushMatrix();
    translate(x, y, z);
    stroke(255);
    fill(255, 0, 0);
    box(size);
    popMatrix();
  }
}