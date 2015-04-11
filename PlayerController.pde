class PlayerController
{
  PVector plyrPos= new PVector();
  PVector scale= new PVector();
  int  angle, speed;
  float gravity, velocity;
  int terminalVelocity= 10;
  boolean[] keys;
  float moveSpeed, jumpHeight;
  int h, w;
  boolean grounded, doubleJump;

  public PlayerController()
  {
    plyrPos.x=20;
    plyrPos.y=200;
    gravity=3;
    velocity=0.1;
    keys=new boolean[4];
    keys[0]=false;
    keys[1]=false;
    keys[2]=false;
    moveSpeed=1;
    h=20;
    w=20;
    jumpHeight=5;
    grounded=false;
    angle=30;
    scale.x=cos(angle);
    scale.y=sin(angle);
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
    jumpHeight=20;

    if ( keys[0]==true) 
    {  
      plyrPos.x-= moveSpeed;
    }
    if ( keys[1]==true) 
    {
      plyrPos.x+= moveSpeed;
    }
    if ( keys[2]==true && !doubleJump && !grounded) 
    {
      plyrPos.y-= jumpHeight;
      //plyrPos.add(velocity);
      if (keys[1]==true)
      {
        //plyrPos.add(velocity);
      }
      doubleJump=true; //should be true
    }
    
    if(!grounded)
    {
      if(gravity<=terminalVelocity)
      {
         gravity+=velocity; 
      }
    }
    
    println(gravity);
  }
  
  void climb()
  {
    plyrPos.y-=gravity;
    //plyr.jumpHeight=0;
    if ( keys[1]==true) 
    {  
      plyrPos.y--;
    }
    if ( keys[0]==true) 
    {  
      plyrPos.y--;
    }
  }
  int getRandom()
  {
    int num=(int)random(2, 8);
    return num;
  }
}

