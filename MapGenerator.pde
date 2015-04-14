class MapGenerator
{
  int levelSize=10;
  int[] blockHeight;
  ArrayList<PImage> bla = new ArrayList();

  void mapCreate()
  {
    blockHeight = new int[levelSize+1];
    bla.add(ground);
    bla.add(ground);
    for (int i=0; i<levelSize-1; i++)
    {
      {
        int num = getRandom(); 
        if (num==1)
        {
          bla.add(ground);
        }
        if (num==2)
        {
          bla.add(water);
          if (bla.get(bla.size()-2) == water && bla.get(bla.size()-3) == water)
          {
            i--;
            bla.remove(i);
          }
        }
      }
    }
    bla.add(ground);
  }

  void update()
  {
    /*for (int i =0; i<bla.size ()-1; i++)
    { 
      text(" "+(i+1), i*blockWidth, 200);
    }*/
  }   
  int getRandom()
  {
    int num=(int)random(1, 3);
    return num;
  }
  void clearMap()
  {
    bla.clear();
  }
}

