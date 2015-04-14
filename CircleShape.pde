class CircleShape 
{  
  PVector position;
  float radius;

  CircleShape(float x, float y, float radius)
  {
      position = new PVector(x, y);
      this.radius = radius;      
  }
  
  void display()
  {
    noStroke();
    noFill();
    ellipse(position.x, position.y, radius/2 , radius/2 );
  }
  
  // This is the collision detection bit!!
  boolean collides(CircleShape c)
  {
    // Get the distance between the 2 center points
    float dist = PVector.dist(c.position, position);
    return (dist < c.radius + radius);
  }
}
