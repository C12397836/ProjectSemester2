package ie.dit;

import java.util.ArrayList;

import processing.core.PImage;

class MapGenerator
{
  int levelSize=37;
  int[] blockHeight = new int[levelSize+1];
  ArrayList<PImage> bla = new ArrayList();
  
  void mapCreate()
  {
    bla.add(ground);
    bla.add(ground);
    for(int i=0; i<levelSize; i++)
    {
      int num1 = getRandom(); 
      int num2 = (int)random(-30, 30);
      int num3= num1*num2;
      blockHeight[i]=-100+(num3);
      {
         int num = getRandom(); 
         if(num==1)
         {
           bla.add(ground);
         }
         if(num==2)
         {
           bla.add(water);
           if(bla.get(bla.size()-2) == water && bla.get(bla.size()-3) == water)
           {
             bla.remove(i);
             i--;
           }
         }
      }
    }
  }
  
  void update()
  {
    for(int i =0; i<bla.size()-1; i++)
    { 
      text(" "+(i+1), i*blockWidth, 200); 
      if(mouseX>= i*blockWidth && mouseX<= (i*blockWidth)+blockWidth && mousePressed)
      {
        if(bla.get(i)!=water)
        {
          if(blockHeight[i]!=-10)
          {
           blockHeight[i]+=1;
          }
        }
      }
      if(bla.get(i)==water)
      {
        if(i!=37)
        {
          if(blockHeight[i+1]>blockHeight[i-1])
          {
            if(bla.get(i+1)!=water)
            {
              blockHeight[i]=blockHeight[i+1]+10;
            }
            else{
              blockHeight[i]=blockHeight[i+1];
            }
          }
          else
          {
            if(bla.get(i-1)!=water)
            {
              blockHeight[i]=blockHeight[i-1]+10;
            }
            else{
              blockHeight[i]=blockHeight[i-1];
            }
          }
        }
      }
    }
  }   
    int getRandom()
    {
      int num=(int)random(1,3);
      return num; 
    }

}
