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
      text("Loading", width/2, height/2+100);
      lvl=5;
    }
  }
  void deathScreen()
  {
    background(0);
    text("Death Screen", width/2, height/2);
    if (mousePressed)
    {
      plyr.loots=0;
      plyr.level=1;
      newLevel();
    }
  }
  
  void newLevel()
  {
      text("Loading", 100, 100);
      map.clearMap();
      rects.clear();
      setup();
      plyr.alive=true;
      plyr.plyrPos.x=20;
      plyr.plyrPos.y=100;
      t.second=0;
      
      lvl=5;
  }
}

