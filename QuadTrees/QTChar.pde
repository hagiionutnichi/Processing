public class QTChar implements QTInterface
{
  public char s;
  private Point point;
  public QTChar(Point point, char s)
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
    text(s + "", point.getX(), point.getY());
    point.draw();
  }
}
