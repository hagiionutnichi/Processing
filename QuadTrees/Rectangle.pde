public class Rectangle
{
  public float x;
  public float y;
  public float w;
  public float h;
  
  public Rectangle(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public boolean isPointInside(Point point)
  {
    return (this.x <= point.x && this.y <= point.y &&
            this.x + this.w >= point.x  &&
            this.y + this.h >= point.y);
  }
  
  public boolean intersects(Rectangle other)
  {
    return x <= other.x + other.w && x + w >= other.x && y <= other.y + other.h && y + h >= other.y;
  }
  
  public void draw()
  {
    stroke(0, 255, 0);
    strokeWeight(1);
    noFill();
    rect(x, y, w, h);
  }
}
