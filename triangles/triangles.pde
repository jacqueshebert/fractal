Tri[] triangles = new Tri[500];
PImage img;
int count =0;
float opacity = 35;
float rate = 1.0001;
void setup()
{
   fullScreen();
   background(0);
   frameRate(24);
   //img = loadImage("texture1.png");
   for(int i = 0; i< triangles.length-1; i++)
   {
     triangles[i] = new Tri();
     triangles[i].setSize(i);
     triangles[i].create();
     triangles[i].randomColor();
     
   }
    triangles[triangles.length-1] = new Tri();
     triangles[triangles.length-1].setSize(triangles.length-2);
     triangles[triangles.length-1].create();
     triangles[triangles.length-1].rotate(675/360*(triangles.length-2));
     triangles[triangles.length-1].r=0;
     triangles[triangles.length-1].g=0;
     triangles[triangles.length-1].b=0;
     triangles[triangles.length-1].o=200;
   
   
   
}

void draw()
{
          translate(displayWidth/2,displayHeight/2);
          //count++;

     for(int i =0; i<triangles.length-2; i++)
     { 
      triangles[i].drawT();
      triangles[i].setSize(i);
      //triangles[i].o = (255)/(i+1);
      triangles[i].create();
      triangles[i].rotate((675/360*i)+count);
     

      
   
     }
     triangles[triangles.length-1].drawT();
   
     for(int j=0; j<triangles.length-2; j++)
     {
        triangles[j] = triangles[j+1];
           
     }
     triangles[triangles.length-2] = new Tri();
     triangles[triangles.length-2].setSize(triangles.length-2);
     triangles[triangles.length-2].create();
     triangles[triangles.length-2].randomColor();
     triangles[triangles.length-2].rotate(675/360*(triangles.length-2));
     triangles[triangles.length-1].setSize(triangles.length-1);
     triangles[triangles.length-1].create();
     triangles[triangles.length-1].rotate((675/360*(triangles.length-2))+count);
     
     
    
  //delay(10);
}



class Tri{
  
  float r; //red
  float g; //green
  float b; //blue
  float o; //opacity
  float h; //height
  float w; //width
  float a; //angle
  PShape t;

  
  
  Tri()
  {
    g=0;
    r=0;
    b=0;
    w = 50; 
    h = 50;
    o = 150;
    a = 0;
    
   
    
  }

  void randomColor()
  {
   
     this.r= random(50,255); 
     this.g= random(1,50); 
     this.b= random(75,255); 
     this.o =opacity;
     
    
  }
  void create()
  {
    this.h = sqrt(3)/2*this.w;
    this.t  = createShape(TRIANGLE, (-1/2.0)*this.w,(-1/3.0)*this.h, (1/2.0)*this.w, (-1/3.0)*this.h, 0, (2/3.0)*this.h); 
    
  }
  void setSize(int i)
  {
    triangles[i].w = 4*displayWidth/(i+1);
    
  }
  void drawT()
  {
    

    this.t.setFill(color(this.r,this.g,this.b,this.o));
    //textureMode(IMAGE);
    //texture(img);
    this.t.setStroke(false);
    shapeMode(CENTER);
    shape(this.t,0,0);
  }
  void rotate(int d)
  {
    this.t.rotate(radians(d));
  }
}
