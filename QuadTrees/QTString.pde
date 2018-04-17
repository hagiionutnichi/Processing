public class QTString implements QTInterface
{
  public String s;
  private Point point;
  public QTString(Point point, String s)
  {
    this.s = s;
    this.point = point;
  }
  
  public Point getPoint()
  {
    return point;
  }
  
  public void draw()
  {
    noFill();
    stroke(255, 0, 255, 100);
    strokeWeight(5);
    textAlign(CENTER, CENTER);
    text(s, point.getX(), point.getY());
    point.draw();
  }
}
