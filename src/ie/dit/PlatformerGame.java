package ie.dit;

import java.util.ArrayList;

import processing.core.PImage;

public class PlatformerGame {
	
	PImage ground;
	PImage water;
	PImage p;

	int blockWidth;

	ArrayList<BoxCollider> rects = new ArrayList<BoxCollider>();
	PlayerController plyr = new PlayerController(20, 100);
	MapGenerator map = new MapGenerator();

	void setup()
	{
	  size (800, 400); 
	  
	  BoxCollider player = new BoxCollider(plyr.plyrPos.x, plyr.plyrPos.y, 10,10);
	  rects.add(0,player);
	  
	  ground= loadImage("ground.png");
	  water= loadImage("water.png");
	  
	  p= loadImage("p.png");

	  blockWidth=50;
	  
	  map.mapCreate();
	  for(int i=0; i<map.levelSize; i++)
	  {
		BoxCollider ground = new BoxCollider(i*blockWidth, 390, blockWidth, map.blockHeight[i]);
	    rects.add(ground);
	  }
	  
	} 

	void draw()
	{
	  background(100,100,170);
	  
	  BoxCollider player = new BoxCollider(plyr.plyrPos.x, plyr.plyrPos.y, 10,10);
	  rects.add(0,player);
	  rects.remove(1);
	  
	  map.update();
	  
	  rects.get(0).position.y=plyr.plyrPos.y;
	  
	  plyr.update();
	  image(p, plyr.plyrPos.x, plyr.plyrPos.y, 10,10);
	  
	  for(int i =1; i<rects.size()-1; i++)
	  {
	    rects.get(i+1).h=map.blockHeight[i];
	    
	  }
	  for(int i =0; i<map.bla.size()-1; i++)
	  {
	    image(map.bla.get(i), i*blockWidth,390, blockWidth, map.blockHeight[i]); 
	  }

	  BoxCollider rect1 = rects.get(0);
	    //rect1.display();
	    for (int j = 1 ; j < rects.size() ; j ++)
	    {
	      BoxCollider rect2 = rects.get(j);
	      //rect2.display();
	      if(rect1.collides(rect2))
	      {
	        text("Rectangle " + 0 + " collides with " + " rect " + j, 100, 100);
	        
	        plyr.plyrPos.y=rects.get(j).position.y+rects.get(j).h-10;
	      }  
	    }    
	    
	}

	void keyPressed()
	{
	  if(key=='a')
	    plyr.keys[0]=true;
	  if(key=='d')
	    plyr.keys[1]=true;
	}

	void keyReleased()
	{
	  if(key=='a')
	    plyr.keys[0]=false;
	  if(key=='d')
	    plyr.keys[1]=false;
	}
}
