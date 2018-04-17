import java.util.List;
import java.util.ArrayList;

public class QuadTree<ObjType extends QTInterface>
{
  private QuadTree NW = null;
  private QuadTree NE = null;
  private QuadTree SE = null;
  private QuadTree SW = null;
  private Rectangle area;
  private int capacity;
  private List<ObjType> objects;
  
  public QuadTree(int capacity, Rectangle area)
  {
    this.capacity = capacity;
    this.area = area;
    this.objects = new ArrayList<ObjType>();
  }
  
  public void add(ObjType obj)
  {
    if(!area.isPointInside(obj.getPoint()))
      return;
    else if(objects.size() < capacity)
    {
      objects.add(obj);
      return;
    }
    else if(NW == null)
    {
      divide();
    }
    NW.add(obj);
    NE.add(obj);
    SE.add(obj);
    SW.add(obj);
  }
  
  private void divide()
  {
    NW = new QuadTree(capacity, new Rectangle(area.x, area.y, area.w/2, area.h/2));
    NE = new QuadTree(capacity, new Rectangle(area.x + area.w/2, area.y, area.w/2, area.h/2));
    SE = new QuadTree(capacity, new Rectangle(area.x, area.y + area.h/2, area.w/2, area.h/2));
    SW = new QuadTree(capacity, new Rectangle(area.x + area.w/2, area.y + area.h/2, area.w/2, area.h/2));
  }
  
  public void query(Rectangle qArea, ArrayList<ObjType> result)
  {
    
    for(ObjType o : objects)
        if(qArea.isPointInside(o.getPoint()))
          result.add(o);
    if(qArea.intersects(this.area) && NW != null)
    {
      NW.query(qArea, result);
      NE.query(qArea, result);
      SE.query(qArea, result);
      SW.query(qArea, result);
    }
  }
  
  
  public void draw()
  {
    area.draw();
    for(ObjType o : objects)
      o.draw();
    if(NW != null)
    {
      NW.draw();
      NE.draw();
      SE.draw();
      SW.draw();
    }
  }
  
}
