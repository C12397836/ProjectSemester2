class LevelManager
{
  int lvl;

  public LevelManager()
  {
    lvl=1;
  }
  
  void startScreen()
  {
    textSize(40);
    textFont(font);
    textAlign(CENTER, CENTER);
    background(0);
    image(start, 0,0 , width , height);
    image(logo, width-950, height-600);
    image(clickStart, width/3.5, height/2);
    //text("Start Screen", width/2, height/2+100);
    textSize(20);
    if (mousePressed)
    {
      text("Loading...", width/2, height/2+200);
      lvl=5;
    }
  }
  void deathScreen()
  {
    background(255);
    image(end, 0,0, width, height);
    camera();
    textSize(40);
    textFont(font);
    stroke(255);
    fill(255);
    textAlign(CENTER, CENTER);
    image(death,width-950, height-600);
    //text("Death Screen", width/2, height/2);
    textSize(20);
    String lines[] = loadStrings("highscore.txt");
    text("HighScore: Score " + int(lines[1]) + " Level "+ int(lines[2]), width/2, height/2+150);
    if(plyr.loots> int(lines[1]) && plyr.level> int(lines[2]))
    {
      String score = " " + plyr.loots + " " + plyr.level;
      String[] list = split(score, ' ');
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
      fill(255);
      textAlign(CENTER, CENTER);
      textSize(20);
      if(lvlMng.lvl>4)
      {
        fill(0,0,255);
        text("Loading...", plyr.plyrPos.x, plyr.plyrPos.y+height/2-100);
      }
      else{
        text("Loading...", width/2, height/2+200);
      }
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

