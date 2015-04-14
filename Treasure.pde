class Treasure
{

  PVector pos= new PVector();
  int r;
  int r2;
  boolean unlooted;
  
  void randomise(int levelSize, int [] blockHeight)
  {
    r =int(random(1, levelSize-1));
    r2=int(random(0, blockHeight[r-1]));
  }
  
  void create()
  {
    pos.x=(r*blockWidth)-blockWidth/2;
    pos.y=(390-blockWidth/2)-r2;
    unlooted=true;
  }

  void update()
  {
    if(unlooted)
    {
      ellipse(pos.x, pos.y, 10, 10);
    }
  }
}

