class LevelManager
{
  int lvl;

  public LevelManager()
  {
    lvl=1;
  }
  
  void startScreen()
  {
    background(0);
    text("Start Screen", width/2, height/2);
    if (mousePressed)
    {
      lvl=5;
    }
  }
  void deathScreen()
  {
    background(0);
    text("Death Screen", width/2, height/2);
    if (mousePressed)
    {
      lvl=5;
    }
  }
}

