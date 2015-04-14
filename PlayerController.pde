class PlayerController
{
  PVector plyrPos= new PVector();
  PVector scale= new PVector();
  float gravity, velocity,radar, pulseSize, jumpV;
  int terminalVelocity= 10;
  boolean[] keys;
  float moveSpeed, jumpHeight;
  int h, w, loots, score;
  boolean grounded, doubleJump, digging, pulse, pulse2, alive;

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
    h=40;
    w=40;
    moveSpeed=w/20;
    jumpHeight=10;
    grounded=false;
    digging=false;
    pulse=false;
    jumpV=blockWidth/2;
    loots=0;
    score=0;
    alive=true;
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
      jumpV=blockWidth/2;
      
      plyrPos.y-=jumpV;
      doubleJump=true; //should be true
      //plyrPos.add(velocity);
      if (keys[1]==true)
      {
        plyrPos.x+=jumpV/2;
      }
      if (keys[0]==true)
      {
        plyrPos.x-=jumpV/2;
      }
      
    }
    
    if(!grounded)
    {
      if(gravity<=terminalVelocity)
      {
         gravity+=velocity; 
      }
    }
  }
  
  void climb()
  {
    jumpV=0;
    plyrPos.y-=gravity;
    //plyr.jumpHeight=0;
    if ( keys[0]==true || keys[1]==true)
    {  
      plyrPos.y-=moveSpeed;
    }
  }
  
  int dig(int blockHeight)
  {
    if(digging)
    {
      blockHeight-=blockWidth;
      digging=false;
    }
    return blockHeight;
    
  }
  int getRandom()
  {
    int num=(int)random(2, 8);
    return num;
  }
  
  void radarPulse()
  {
    noFill();
    strokeWeight(3);
    stroke(20,255,0);
    if(radar<=500)
    {
      ellipse(plyr.plyrPos.x, plyr.plyrPos.y, radar, radar);
      radar+=5;
    }
    if(radar>=500)
    {
      pulse=false;
      radar=0;
    }
    strokeWeight(1);
  }
  void blockPulse(float posx, float posy)
  {
    noFill();
    strokeWeight(3);
    stroke(255,0,0);
    ellipse(posx+ blockWidth*int(random(-3,3)), posy + blockWidth*int(random(-3,3)), pulseSize, pulseSize);
    pulseSize+=10;
    
    if(pulseSize>=200)
    {
      pulse2=false;
      pulseSize=0;
    }
    strokeWeight(1);
  }
}

