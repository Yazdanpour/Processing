void setup(){
  size(900,600);
  
  //draw() function loops repeatedly be default, use this setting to ensure draw() only executes once.
  noLoop();
}

void draw(){
  //Background Color
   background(42, 255, 194);
  
  //Background Lines
  stroke(0);
  drawLeftLines(0);
  drawRightLines(width);
  
  //Sirpinkski's Triangle
  noStroke();
  float len = 300;
  float x1 = 300;
  float y1 = 300;
  float h = len*sqrt(3)/2;
  fill(255, 43, 233);
  sirpinski(x1,y1,x1+len,y1,x1+len/2, y1+h);
}


void sirpinski(float x1, float y1, float x2, float y2, float x3, float y3){
  //exit condition:
 if(0.433*pow((x2-x1),2)>5){
  triangle(x1, y1, x2, y2, x3, y3);
  
  float L = (x2-x1)/2;
  float H = L*sqrt(3)/2;
  float topx1 = (x1+x2)/2;
  float topy1 = (y1+y2)/2;
  float rightx1 = (x2+x3)/2;
  float righty1 = (y2+y3)/2;
  float leftx1  = (x1+x3)/2;
  float lefty1 = (y1+y3)/2;
  
  /* left triangle
  */
  sirpinski((leftx1 -L),lefty1,leftx1,lefty1, (leftx1 - L/2), y3); 
  /* right triangle
  */
   sirpinski(rightx1,righty1, (rightx1 +L), righty1, (rightx1 + L/2), y3); 
  /* top triangle
  */
   sirpinski(topx1-L/2,topy1-H, topx1+L/2, topy1-H, topx1,topy1);
  }
}

void drawLeftLines(float x1){
  if(abs(width-x1)>5){
    line(x1,0,x1,height);
    
    drawLeftLines(x1 + abs(x1-width)/4);
  }
}

void drawRightLines(float x1){
  if(abs(0-x1)>5){
    line(x1,0,x1,height);
    
    drawRightLines(x1 - abs(x1-0)/3);
  }
}
