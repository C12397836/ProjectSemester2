class RectShape 
{
  float w, h;
  PVector position;

  RectShape(float x, float y, float w, float h)
  {
    position = new PVector(x, y);
    this.w = w;
    this.h = h;
  }  

  void display()
  {
    stroke(0, 0, 255);
    fill(0, 0, 255);
    rect(position.x, position.y, w, h);
  }

  // This is the collision detection bit!!
  boolean collides(RectShape b)
  {
    //b.h=abs(b.h);
    // Its easier to check if they DONT colide
    if (b.position.x + b.w <= position.x)
    {
      return false;
    }
    if (b.position.x > position.x + w)
    {
      return false;
    } 

    if ((b.position.y+b.h) > position.y + h)
    {
      return false;
    }

    if (b.position.y < position.y)
    {
      return false;
    }
    // If none of the above then there is a collision
    return true;
  }
}

