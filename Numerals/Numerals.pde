Hour[] hours = new Hour[12];
Tongue secondTongue;
Tongue hourTongue;
Tongue minuteTongue;
int clockRadius = 200;
void setup() {
  size(600, 600);
  for (int i = 0; i <= 11; i++) {
    hours[i] = new Hour(i+1, clockRadius);
  }
  
}

void draw() {
  background(51);
  translate(width/2, height/2);
  
  fill(30);
  stroke(255);
  strokeWeight(1);
  ellipse(0, 0, clockRadius*2+40, clockRadius*2+40);
  
  fill(255);
  ellipse(0, 0, 10, 10);
  
  //rotate(-PI/2 + PI/6);
  for(Hour hour : hours)
    hour.show();
  secondTongue = new Tongue(second(), clockRadius);
  hourTongue = new Tongue(map(hour(), 1, 12, 0, 59), clockRadius/4);
  minuteTongue = new Tongue(minute(), clockRadius/2);
  secondTongue.show();
  hourTongue.show();
  minuteTongue.show();
}