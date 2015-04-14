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
    camera();
    textSize(40);
    textFont(font);
    textAlign(CENTER, CENTER);
    text("Death Screen", width/2, height/2);
    
    String lines[] = loadStrings("highscore.txt");
    text("HighScore: Score " + int(lines[0]) + " Level "+ int(lines[1]), 100, 100);
    println("HighScore: Score " + lines[0] + " Level "+ lines[1]);
    if(plyr.loots> int(lines[0]) && plyr.level> int(lines[1]))
    {
      String score = " " + plyr.loots + " " + plyr.level;
      String[] list = split(score, ' ');
      // Writes the strings to a file, each on a separate line
      saveStrings("C:/Paul/College/OOP/PlatformerGame/Data/highscore.txt", list);
    }
    
    
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

