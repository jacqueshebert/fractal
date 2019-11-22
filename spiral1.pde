
void setup() {
  fullScreen();
  stroke(255);
  strokeWeight(.1);
  noFill();
  frameRate(6);
}

void draw() {
  background(0);
  translate(displayWidth/2.0, displayHeight/2.0);
  
  for (int i = 0; i < 1000; i++) {
  rotate(1);
  scale(1.01);
  stroke(random(0,255),random(0,30),random(0,255));
  line(10, 0, 10, 15);
}
}
