import ddf.minim.AudioInput;
import ddf.minim.Minim;


  Minim minim;
  AudioInput in;
  float min;
  float max;
  
  int sampleRate = 3600;
  
 
PImage ground;
PImage water;
PImage p;

int blockWidth;

ArrayList<RectShape> rects = new ArrayList<RectShape>();
ArrayList<CircleShape> cir = new ArrayList<CircleShape>();
PlayerController plyr = new PlayerController(20, 100);
MapGenerator map = new MapGenerator();

TimeDelta t= new TimeDelta();

int[] num= new int[map.levelSize];
int[] blockHeight= new int[map.levelSize];
void setup()
{
  //size (displayWidth-200, displayHeight-200, P3D); 
  size(500, 500);
    minim = new Minim(this);
    
    in = minim.getLineIn(Minim.MONO, 10, sampleRate, 16);
    min = Float.MAX_VALUE;
    max = Float.MIN_VALUE;
    
    
  RectShape player = new RectShape(plyr.plyrPos.x, plyr.plyrPos.y, 10, 10);
  rects.add(0, player);

  ground= loadImage("ground.png");
  water= loadImage("water.png");

  p= loadImage("p.png");

  blockWidth=50;

  map.mapCreate();

  for (int i=0; i<map.levelSize-1; i++)
  {
    num[i]=plyr.getRandom();
  }

  for (int j=0; j<num.length; j++)
  {
    blockHeight[j]=(num[j]*blockWidth)-blockWidth;
  }

  for (int i=0; i<map.levelSize; i++)
  {
    RectShape ground = new RectShape(i*blockWidth, 390, blockWidth, -blockHeight[i]);
    rects.add(ground);
  }
  
  treasure.randomise(map.bla.size(), blockHeight);
  treasure.create();
  println(treasure.r);
} 

Treasure treasure = new Treasure();
void draw()
{
  background(100, 100, 170);

  //New Level Reloader doesnt work >>
  /*if(plyr.plyrPos.x>= (blockWidth*(map.levelSize-5))-blockWidth)
  {
    map.clearMap();
    blockHeight=null;
    num=null;
    setup();
  }*/
  //println(map.bla.get(treasure.r));
  if(map.bla.get(treasure.r)==water||map.bla.get(treasure.r)==null || map.blockHeight[treasure.r]> treasure.pos.y)
  {
    println("gdhafdhsgesgggfdgfdfdhghfgdhfdjsadfihdsu");
    //println("Height" + map.blockHeight[treasure.r]);
    println("Block " +treasure.r);
    treasure.randomise(map.bla.size(), blockHeight);
    treasure.create();
  }
  treasure.update();
  //println("Height " + map.blockHeight[treasure.r]);
  println("Block " +treasure.r);
  
  //map.mapCreate();
 /*  camera(plyr.plyrPos.x, plyr.plyrPos.y, (height/2.0) / tan(PI*30.0 / 180.0), // eyeX, eyeY, eyeZ
   plyr.plyrPos.x, plyr.plyrPos.y, 0, // centerX, centerY, centerZ
   0, 1, 0); // upX, upY, upZ */
   
   for (int i = 0 ; i < in.bufferSize(); i ++)
    {
      float sample = in.left.get(i);
      
      if (sample < min)
      {
        min = sample;
      }
      
      if (sample > max)
      {
        max = sample;
      }
      sample *= 1000.0;
      //println(abs(in.left.get(int(random(0,in.bufferSize()))))*1000);
      //background(abs(in.left.get(int(random(0,in.bufferSize()))))*1000,abs(in.left.get(int(random(0,in.bufferSize()))))*1000, abs(in.left.get(int(random(0,in.bufferSize()))))*1000); 
      
      if(sample>400)
      {
        plyr.pulse=true;
      }
      
    }
  plyr.grounded =false;

  t.update();
  text(" "+ t.second, width-50, 50);

  RectShape player = new RectShape(plyr.plyrPos.x, plyr.plyrPos.y, 10, 10);
  rects.add(0, player);
  rects.remove(1);

  map.update();

  rects.get(0).position.y=plyr.plyrPos.y;

  plyr.update();

  image(p, plyr.plyrPos.x, plyr.plyrPos.y, plyr.w, plyr.h);


  for (int i =0; i<rects.size ()-1; i++)
  {
    if (i!=0)
    {
      if(map.bla.get(i-1)==water)
      {
        rects.get(i).h=-blockHeight[i-1]+20;
      }
      if(map.bla.get(i-1)!=water)
      {
        rects.get(i).h=-blockHeight[i-1];
      }
      //println(i + " = " + rects.get(i).h +" and "+blockHeight[i-1]); 
    }
  }
  RectShape plyrCollide = new RectShape(plyr.plyrPos.x+plyr.w, plyr.plyrPos.y+(plyr.h/2), 4, 4);
  RectShape plyrGround = new RectShape(plyr.plyrPos.x+(plyr.w/2), plyr.plyrPos.y+plyr.h, 4, 4);
  RectShape plyrCollideBack = new RectShape(plyr.plyrPos.x, plyr.plyrPos.y+(plyr.h/2), 4, 4);
  CircleShape radar = new CircleShape(plyr.plyrPos.x, plyr.plyrPos.y, plyr.radar);
  CircleShape treasure1 = new CircleShape(treasure.pos.x, treasure.pos.y, 10);
  
  RectShape rect1 = rects.get(0);
  RectShape rect3 = plyrCollide;
  RectShape rect4 = plyrGround;
  RectShape rect5 = plyrCollideBack;
  
  CircleShape cir1 = radar;
  CircleShape cir2 = treasure1;

  //rect1.display();
  
  for (int j = 1; j < rects.size (); j ++)
  {
    RectShape rect2 = rects.get(j);
    //rect2.display();
    if (rect1.collides(rect2))
    {        
      if (plyr.plyrPos.y>rects.get(j).position.y+rects.get(j).h-10)
      {
        plyr.plyrPos.y=rects.get(j).position.y+rects.get(j).h-10;
      }
    } 

    if (rect3.collides(rect2))
    {
      plyr.plyrPos.x--;
      if (rect3.position.x+rect3.w == rect2.position.x)
      {
        plyr.climb();

        if (rect3.position.y <=rect2.position.y+rect2.h)
        {
          plyr.plyrPos.x+=plyr.w;
        }
      }
    } 
    if (rect4.collides(rect2))
    {
      plyr.grounded=true;
      plyr.gravity=0;
      plyr.plyrPos.y=rect2.position.y+rect2.h-(plyr.h+rect4.h);
      
        if (plyr.keys[3])
        {
          if (map.bla.get(j-1)!=water)
          {
            if (blockHeight[j-1]>0)
            {
                blockHeight[j-1]=plyr.dig(blockHeight[j-1]);
            }
          }
        }
    }

    if (rect5.collides(rect2))
    {
      plyr.plyrPos.x++;
      if (int(rect5.position.x+1) == rect2.position.x+rect2.w)
      {
        plyr.climb();

        if (rect5.position.y <=rect2.position.y+rect2.h)
        {
          plyr.plyrPos.x-=plyr.w;
        }
      }
    }
  }  
  if (plyr.grounded)
  {
    plyr.doubleJump=false;
  }  


  for (int i=0; i<map.levelSize-1; i++)
  {
    num[i]=(blockHeight[i]/blockWidth)+1;
    for (int j=0; j<num[i]; j++)
    {
       image(map.bla.get(i), i*blockWidth, 390-(blockWidth*j-1), blockWidth, blockWidth);
    }
  }

  plyrCollide.display();
  plyrGround.display();
  plyrCollideBack.display();

  for (int i =0; i<map.bla.size ()-2; i++)
  { 
    if (map.bla.get(i)==water)
    {
      if (i!=map.bla.size ()-3)
      {
        if (blockHeight[i-1]>blockHeight[i+1])
        {
          if (map.bla.get(i+1)!=water)
          {
            blockHeight[i]=blockHeight[i+1];
          } else {
            blockHeight[i]=blockHeight[i+1];
          }
        } else
        {
          if (map.bla.get(i-1)!=water)
          {
            blockHeight[i]=blockHeight[i-1];
          } else {
            blockHeight[i]=blockHeight[i-1];
          }
        }
      }
      if((plyr.plyrPos.x>= i*blockWidth && plyr.plyrPos.x< (i*blockWidth)+blockWidth) && map.bla.get(i)==water)
      {
        if(blockHeight[i]>blockWidth)
        {
          plyr.plyrPos.y-=0.9;
        }
      }  
    }
  }
  if(plyr.pulse)
  {
    plyr.radarPulse();
  }
    
  if(cir1.collides(cir2))
  {
    plyr.pulse2=true;
    if(plyr.pulse2)
    {
      plyr.blockPulse(cir2.position.x, cir2.position.y);
    }
  }
}

void keyPressed()
{
  if (key=='a')
    plyr.keys[0]=true;
  if (key=='d')
    plyr.keys[1]=true;
  if (key==' ')
    plyr.keys[2]=true;
  if (key== 's')
  {
    plyr.digging=true;
    plyr.keys[3]=true;
  }
}

void keyReleased()
{
  if (key=='a')
    plyr.keys[0]=false;
  if (key=='d')
    plyr.keys[1]=false;
  if (key==' ')
    plyr.keys[2]=false;
  if (key== 's')
  {
    plyr.digging=false;
    plyr.keys[3]=false;
  }
}


