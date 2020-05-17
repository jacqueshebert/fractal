Shape[] shapes = new Shape[999];
int count =0;
float opacity = 20;
float rate = 1.0005;
void setup()
{
   background(0);
   fullScreen();
   frameRate(24);
   for(int i =0; i<shapes.length-1; i++)
   {
       shapes[i] = new Shape();
       shapes[i].setRandomColor();
     
   }
   shapes[shapes.length-1] = new Shape();
   shapes[shapes.length-1].o = 255;  
   
   
   
}

void draw()
{
   if (mousePressed == true) 
    noCursor();
   translate(displayWidth/2,displayHeight/2);
   for(int i =0; i<shapes.length-2; i++)
   {
       shapes[i].drawC();
       shapes[i].incrementSize(i);
       //shapes[i].incrementO();
   }
   
   shapes[shapes.length-1].drawC();
   shapes[shapes.length-1].size*=rate;
   count++;
   if(shapes[0].size>displayWidth)
   {
       for(int i =0; i<shapes.length-2; i++)
       {
         shapes[i] = shapes[i+1];
       }
       shapes[shapes.length-2] = new Shape();
       shapes[shapes.length-2].setRandomColor();
       //shapes[shapes.length-2].o =20;
   }
   if(shapes[shapes.length-1].size>displayWidth*2)
      exit();
    //delay(1);
  
  
}



class Shape{
  
  float g;
  float r;
  float b;
  float o;
  float size;
  int t;
  
  
  Shape()
  {
    g= 0;
    r=0;
    b=0;
    size = 50;
    t =0;
    o = opacity;
    
  }
  void incrementSize(int i)
  {
    
   this.size = 3.14*displayWidth/(i+1);
    
  }
  
  void incrementO()
  {
    
   this.o *= .9;
    
  }
  
  void setRandomColor()
  {
   
     this.r= random(50,255); 
     this.g= random(1,50); 
     this.b= random(50,255); 
     
    
  }
  void drawC()
  {
    fill(this.r,this.g,this.b,this.o);
    stroke(0,0,0,0);
    strokeWeight(0.0);
   if(t==0)
   {
      ellipse(0,0,size,size); 
   }
    
  }
}
