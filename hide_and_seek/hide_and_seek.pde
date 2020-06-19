int tnum=8;
int[] dx=new int[tnum];
int[] dy=new int[tnum];
int[] sx=new int[tnum];
int[] sy=new int[tnum];
int sizeX=800,sizeY=700;
int score=0,status=0;
int scoreX,scoreY;
boolean outscore=true;
PImage[] pic=new PImage[5];
PImage me;
PImage[] teacher=new PImage[2];
boolean click=false;

import ddf.minim.*;

AudioPlayer player;
Minim sound;

void setup()
{
  size(sizeX,sizeY);
  smooth();
  for (int i=0;i<5;i++)
  {
      pic[i]=loadImage(i+".png");
  }
  for (int i=0;i<2;i++)
  {
    teacher[i]=loadImage("teacher"+i+".png");
  }
  me=loadImage("me"+0+".png");
  sound = new Minim(this);
  player = sound.loadFile("muzic.mp3", 4096);
  player.loop();
}

void draw()
{
  background(255);
  if (mousePressed==false)
    click=false;
  if (status==0)
    startpage();
  else if (status==1)
    playingpage();
  else if (status==2)
    winpage();
  else if (status==3)
    losepage();
}
void startpage()
{
  image(pic[0],0,0,sizeX,sizeY);
  if (mousePressed==true && click==false &&mouseX>165 && mouseX<500 && mouseY>510 && mouseY<595)
   {
     resetpage();
     status=1;
     click=true;
   } 
   score=0;
}
void resetpage()
{
  for (int i=0;i<tnum/4;i++)
  {
    dx[i]=int(random(10,200));
    dy[i]=int(random(10,200));
    int temp=-1;
    if (i%2==0)
      temp=1; 
    sx[i]=int(random(3*temp,7*temp));
    sy[i]=int(random(-3*temp,-7*temp));
  }
  for (int i=tnum/4;i<tnum/2;i++)
  {
    dx[i]=int(random(sizeX-200,sizeX-100));
    dy[i]=int(random(10,200));
    int temp=-1;
    if (i%2==0)
      temp=1; 
    sx[i]=int(random(3*temp,7*temp));
    sy[i]=int(random(-3*temp,-7*temp));
  }
  for (int i=tnum/2;i<3*tnum/4;i++)
  {
    dx[i]=int(random(10,200));
    dy[i]=int(random(sizeY-300,sizeY-200));
    int temp=-1;
    if (i%2==0)
      temp=1; 
    sx[i]=int(random(3*temp,7*temp));
    sy[i]=int(random(-3*temp,-7*temp));
  }
  for (int i=3*tnum/4;i<tnum;i++)
  {
    dx[i]=int(random(sizeX-200,sizeX-100));
    dy[i]=int(random(sizeY-300,sizeY-200));
    int temp=-1;
    if (i%2==0)
      temp=1; 
    sx[i]=int(random(3*temp,7*temp));
    sy[i]=int(random(-3*temp,-7*temp));
  }
}
void winpage()
{
  image(pic[2],0,0,sizeX,sizeY);
  if (mousePressed==true &&mouseX>175 && mouseX<500 && mouseY>495 && mouseY<585 && click==false)
   {
     status=0;
     click=true;
   } 
}
void losepage()
{
  image(pic[3],0,0,sizeX,sizeY);
  if (mousePressed==true &&mouseX>155 && mouseX<540 && mouseY>550 && mouseY<653 && click==false)
   {
     status=0;
     click=true;
   } 
}
void playingpage()
{
  image(pic[1],0,0,sizeX,sizeY);
  fill(0);
  strokeWeight(15);
  textSize(30);
  text(score,100,72);
  if (outscore==true)
  {
    outscore=false;
    scoreX=int(random(50,sizeX-50));
    scoreY=int(random(50,sizeY-50));
  }
  image(pic[4],scoreX,scoreY,50,80);
  
  if (mouseX+40>scoreX && mouseX-40<scoreX+50 && mouseY+40>scoreY && mouseY-40<scoreY+80 )
  {
    outscore=true;
    score+=1;
  }
  fill(0);
  
  for (int i=0;i<tnum;i++)
  {
    if (mouseX+40>dx[i] && mouseX-40<dx[i]+50 && mouseY+40>dy[i] && mouseY-40<dy[i]+50)
   {
     status=3;
   } 
     if (sx[i]<0)
     {
       image(teacher[1],dx[i],dy[i],80,80);
     }
    else if (sx[i]>=0)
     {
       image(teacher[0],dx[i],dy[i],80,80);
     }
     
    if( ((dx[i]+sx[i]) < 0) || ((dx[i]+sx[i]) > sizeX-50)) 
    {
      sx[i]*=-1;        
    }
    if( ((dy[i]+sy[i]) < 0) || ((dy[i]+sy[i]) > sizeY-50)) 
    {
      sy[i]*=-1;
    }
    dx[i]+=sx[i];
    dy[i]+=sy[i];
  }
  if ((mouseX-pmouseX)>0)
    me=loadImage("me"+0+".png");
  else if ((mouseX-pmouseX)<0)
    me=loadImage("me"+1+".png");
    
  image(me,mouseX-40,mouseY-40,80,80);
  if (score>=20)
  {
    status=2;
  }
}
