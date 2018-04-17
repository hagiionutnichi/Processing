QuadTree tree;
Rectangle qRect;

void setup()
{
  size(801, 601);
  tree = new QuadTree<QTChar>(4, new Rectangle(0, 0, 800, 600));
  for(int i = 0; i < 1000; i++)
  {
    float randX = (randomGaussian() * 100) + width/2;
    float randY = (randomGaussian() * 100) + height/2;
    tree.add(new QTChar(new Point(randX, randY), (char)i));
  }
  qRect = new Rectangle(width/2, height/2, 100, 80);
  //println("DONE");
}

void draw()
{
  background(51);
  qRect.x = mouseX;
  qRect.y = mouseY;
  qRect.draw();
  
  tree.draw();
  ArrayList<QTChar> result = new ArrayList<QTChar>();
  tree.query(qRect, result);
  for(QTChar p : result)
  {
    stroke(255, 0, 255);
    strokeWeight(5);
    noFill();
    point(p.getPoint().x, p.getPoint().y);
  }
}

void mouseClicked()
{
  tree.add(new QTChar(new Point(mouseX, mouseY), 'H'));
}
