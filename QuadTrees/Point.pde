public class Point implements QTInterface
{
  private float x;
  private float y;
  public Point(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  public float getX()
  {
    return x;
  }
  
  public float getY()
  {
    return y;
  }
  
  public void setX(float x)
  {
    this.x = x;
  }
  
  public void setY(float y)
  {
    this.y = y;
  }
  
  public void draw()
  {
    noFill();
    stroke(255, 255, 255, 100);
    strokeWeight(5);
    point(x, y);
  }
  
  public Point getPoint()
  {
    return this;
  }
}