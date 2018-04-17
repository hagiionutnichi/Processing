public class QTInteger implements QTInterface
{
  public int n;
  private Point point;
  public QTInteger(Point point, int n)
  {
    this.n = n;
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
    text(n, point.getX(), point.getY());
    point.draw();
  }
}
