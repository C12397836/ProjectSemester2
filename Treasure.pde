class Treasure
{

  PVector pos= new PVector();
  int r;
  int r2;


  void create()
  {
    pos.x=(r*blockWidth)+20;
    pos.y=(390-blockWidth/2)-r2;
  }

  void update()
  {
    rect(pos.x, pos.y, 10, 10);
  }
  void randomise(int levelSize, int [] blockHeight)
  {
    r =int(random(0, levelSize));
    r2=int(random(0, blockHeight[r]));
  }
}

