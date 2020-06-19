PImage img_bird;
PImage img_egg;
int score=0;
int x=-100,y=50;
int egg_x,egg_y=600;
boolean life =false;


void setup()
{
  img_bird = loadImage("bird.jpg");
  img_egg  = loadImage("egg.jpg" );
  size(500,500);
  frameRate(10);
}
void draw() 
{
  background(255);
  image(img_bird,x,y,80,80);
  text("score="+score,50,50);
  
  //draw rect
  for(int k=50;k<550;k+=100)
  {
    fill(255,0,0);
    rect(k-25, 400,50, 50);
  }
  
  //score
  for(int k=50;k<550;k+=100)
  {
  if((k-25<egg_x && k+25>egg_x) && (400<egg_y && 450>egg_y))
    {
    score+=10;
    life=false;
    }
  }
  
  
  
  
  x+=20;   //bird right
  if(x>550){y+=50;x=-50;}  //bird down
  if(y>400)
  y=50;
  
  //egg
  if(mousePressed == true && life ==false)
  {
  egg_x=x+20;  
  egg_y=y+50;
  life=true;
  }
  
  if(life==true)
  {
  image(img_egg,egg_x,egg_y,20,20);
  } 
  egg_y+=20;
  if(egg_y>500)
  life=false;
}
