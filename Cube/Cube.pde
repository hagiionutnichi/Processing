import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
float angle = 0;


ArrayList<HollowBox> boxes = new ArrayList<HollowBox>();
void setup() {
  size(600, 600, P3D);
  boxes.add(new HollowBox(0, 0, 0, 200));
  PeasyCam cam = new PeasyCam(this, 500);
}

void draw() {
  background(51);

  noFill();
  stroke(255);
  //translate(width/2, height/2);
  //rotateY(angle);
  for(HollowBox box : boxes)
    box.show();
  //angle += 0.05;
}

void mousePressed() {
  for(int i = boxes.size() - 1; i >= 0; i--) {
    HollowBox box = boxes.get(i);
    boxes.addAll(box.generate());
    boxes.remove(i);
  }
}