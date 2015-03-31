package ie.dit;

import processing.core.PVector;

class PlayerController
{
  PVector plyrPos= new PVector();
  int gravity;
  boolean[] keys;
  float moveSpeed;
  
  public PlayerController()
  {
     plyrPos.x=20;
     plyrPos.y=200;
     gravity=1;
     keys=new boolean[2];
     keys[0]=false;
     keys[1]=false;
     moveSpeed=1;
  }
  
  public PlayerController(int x, int y)
  {
     this();
     plyrPos.x=x;
     plyrPos.y=y;
  }
  
  public PlayerController(int x, int y, int gravity)
  {
     this();
     plyrPos.x=x;
     plyrPos.y=y;
     this.gravity=gravity;
  }
  
  void update()
  {
    plyrPos.y+=gravity;
  
    if( keys[0]==true) 
    {  
      plyrPos.x-= moveSpeed;
    }
    if( keys[1]==true) 
    {
      plyrPos.x+= moveSpeed;
    }
  }
}
