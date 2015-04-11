class MapGenerator
{
  int levelSize=15;
  int[] blockHeight = new int[levelSize+1];
  ArrayList<PImage> bla = new ArrayList();

  void mapCreate()
  {
    bla.add(ground);
    bla.add(ground);
    for (int i=0; i<levelSize; i++)
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
  }

  void update()
  {
    for (int i =0; i<bla.size ()-1; i++)
    { 
      text(" "+(i+1), i*blockWidth, 200);
    }
  }   
  int getRandom()
  {
    int num=(int)random(1, 3);
    return num;
  }
}

