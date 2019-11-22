color[] list = new color[50];
int speed = 1;

void setup() 
{
  //size(1920, 1080);
  fullScreen(2);
  background(0);
  noStroke();
  frameRate(120);
  clearList();
  frameRate(144);
  //noLoop();
  
}

void clearList()
{
    list[0] = color(255);
    for(int i=1; i<list.length; i++)
    {
        list[i] = color(140);
    }
    
}

void randomColors()
{
   for(int i=0; i <list.length; i++)
   {
     list[i] = color(random(0,255), random(0,255), random(0,255));
   }  
}

void colorShift()
{
   for(int i =1; i<list.length; i++)
   {
     list[i] = list[i-1];
   }
}
void draw() 
{
  translate(960,540);
  randomColors();
  for(int i=1; i<list.length; i++)
  {
    fill(list[i]);
    ellipse(0,0,200+3*i,200+3*i);
  }
  colorShift();

}
