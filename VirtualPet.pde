
void setup()
{
  size(800,800, P3D);
}

void draw()
{
  background(0);
  
  ambientLight(200, 200, 200); 
  directionalLight(255, 255, 255, 0, 1, 0); 
  
  translate(width/2, height/2, -1000);
  rotateY(radians(frameCount));
  
  noStroke();
  fill(255);
  
  //body
  
    //Base
    pushMatrix();
    translate(0, 500, 0);
    sphere(280);
    popMatrix();
  
    //Torso
    pushMatrix();
    translate(0, 75, 0);
    sphere(250);
    popMatrix();
  
    //Head
    pushMatrix();
    translate(0, -275, 0);
    sphere(210);
    popMatrix();
  
  noStroke();
  fill(0);
  
  //buttons
  
    //1
    pushMatrix();
    translate(0, 320, 210);
    sphere(16);
    popMatrix();
  
    //2
    pushMatrix();
    translate(0, 200, 210);
    sphere(16);
    popMatrix();
    
    //3
    pushMatrix();
    translate(0, 75, 240);
    sphere(16);
    popMatrix();
  
    //4
    pushMatrix();
    translate(0, -50, 210);
    sphere(16);
    popMatrix();
    
  //eyes
  
    //left
    pushMatrix();
    translate(-80, -290, 210);
    sphere(20);
    popMatrix();
    
    //right
    pushMatrix();
    translate(80, -290, 210);
    sphere(20);
    popMatrix();
  
  //mouth
    
    //outer
    pushMatrix();
    translate(100, -200, 160);
    sphere(10);
    popMatrix();
    
    pushMatrix();
    translate(-100, -200, 160);
    sphere(10);
    popMatrix();
    
    //inner
    pushMatrix();
    translate(50, -180, 172);
    sphere(10);
    popMatrix();
    
    pushMatrix();
    translate(-50, -180, 172);
    sphere(10);
    popMatrix();
    
    //center
    pushMatrix();
    translate(0, -170, 173);
    sphere(10);
    popMatrix();
  
  //carrot
  fill(#FFA600);
  pushMatrix();
  translate(0,-240,180);
  beginShape(TRIANGLE_FAN);
  vertex(0,0, 160);
  int triangles = 20;
  int r = 20; 
  for(int i =0; i <=triangles; i+=1)
  {
    float ang = radians(360) / triangles * i;
    float x = cos(ang)*r;
    float y = sin(ang)*r;
    vertex(x,y,0);
  }
  endShape();
  popMatrix();
  
  //arms
  stroke(#956917);
   strokeWeight(15);
    
    //left
    pushMatrix();
    translate(-230,0,0);
    line(0, 0, 0, -300, -80, 0);
    popMatrix();
    
    //right
    pushMatrix();
    translate(230,0,0);
    line(0, 0, 0, 300, -80, 0);
    popMatrix();
  
}
