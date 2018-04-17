public class QTEmpty implements QTInterface
{
  private Point point;
  public QTEmpty(Point point)
  {
    this.point = point;
  }
  
  public Point getPoint()
  {
    return point;
  }
  
  public void draw() {}
}
