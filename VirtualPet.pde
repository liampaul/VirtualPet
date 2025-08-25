
boolean upP, downP, leftP, rightP, spaceP, shiftP= false;
boolean WP, SP, AP, DP = false;
float camX = 0;   
float camY = 0;   
float camZ = 1500;  

float camRotY = 0; 
float camRotX = radians(180); 

float moveSpeed = 5.0; 
float rotSpeed = .02; 

void setup()
{
  size(800,800, P3D);
  noCursor();
  smooth(8);
}

//check if key is being held
void keyPressed(){
 if (keyCode == UP){
 upP = true;
 } 
 if (keyCode == DOWN){
 downP = true;
 } 
 if (keyCode == LEFT){
 leftP = true;
 } 
 if (keyCode == RIGHT){
 rightP = true;
 } 
 if (keyCode == SHIFT){
 shiftP = true;
 } 
 if (key == ' '){
 spaceP = true;
 } 
 if (key == 'w'){
 WP = true;
 } 
 if (key == 's'){
 SP = true;
 } 
 if (key == 'a'){
 AP = true;
 } 
 if (key == 'd'){
 DP = true;
 } 
}
void keyReleased(){
 if (keyCode == UP){
 upP = false;
 } 
 if (keyCode == DOWN){
 downP = false;
 } 
 if (keyCode == LEFT){
 leftP = false;
 } 
 if (keyCode == RIGHT){
 rightP = false;
 } 
  if (keyCode == SHIFT){
 shiftP = false;
 } 
 if (key == ' '){
 spaceP = false;
 } 
 if (key == 'w'){
 WP = false;
 } 
 if (key == 's'){
 SP = false;
 } 
 if (key == 'a'){
 AP = false;
 } 
 if (key == 'd'){
 DP = false;
 } 
}

void updateCamera() {
  
  //Camera
    if (leftP) {
      camRotY += rotSpeed;
    }
    if (rightP) {
      camRotY -= rotSpeed;
    }
    if (upP) {
      camRotX -= rotSpeed;
    }
    if (downP) {
      camRotX += rotSpeed;
    }


  float forwardX = sin(camRotY) * cos(camRotX);
  float forwardY = -sin(camRotX);
  float forwardZ = cos(camRotY) * cos(camRotX);
  
  //Movement
  if (WP) {
    //Forward
    camX += forwardX * moveSpeed;
    camY += forwardY * moveSpeed;
    camZ += forwardZ * moveSpeed;
  }
  if (SP) {
    //Backward
    camX -= forwardX * moveSpeed;
    camY -= forwardY * moveSpeed;
    camZ -= forwardZ * moveSpeed;
  }
  if (AP) {
    // Left
    camX += forwardZ * moveSpeed;
    camY += forwardY * moveSpeed;
    camZ += -forwardX * moveSpeed;
  }
  if (DP) {
    //Right
    camX -= forwardZ * moveSpeed;
    camY -= forwardY * moveSpeed;
    camZ -= -forwardX * moveSpeed;
  }
  if (spaceP) {
    //Up
    camX -= forwardX * moveSpeed;
    camY -= -forwardZ * moveSpeed;
    camZ -= forwardY * moveSpeed;
  }
    if (shiftP) {
    //Down
    camX += forwardX * moveSpeed;
    camY += -forwardZ * moveSpeed;
    camZ += forwardY * moveSpeed;
  }
}
void draw()
{
  background(100);
  
  ambientLight(200, 200, 200); 
  directionalLight(255, 255, 255, 0, 1, 0); 
  
  updateCamera();

  float lookAtX = camX + sin(camRotY) * cos(camRotX);
  float lookAtY = camY - sin(camRotX);
  float lookAtZ = camZ + cos(camRotY) * cos(camRotX);
  
  camera(camX, camY, camZ, lookAtX, lookAtY, lookAtZ, 0, 1, 0);


  //body
  noStroke();
  fill(255);
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
  
  
  
  //buttons
  noStroke();
  fill(0);
  
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

    
    //left
    pushMatrix();
    translate(-230, 0, 0 );
    rotateZ(radians(-60));
    box(15, 400, 15);
    popMatrix();
    
    //right
    pushMatrix();
    translate(230,0,0);
    rotateZ(radians(60));
    box(15, 400, 15);
    popMatrix();
  //Top hat
    
    //base
    noStroke();
    pushMatrix();
    translate(0 , -450, 0);
    fill(0);
    beginShape();
    for(int i = 0; i <=20; i+=1)
    {
      float ang = radians(360) / 20 * i;
      float x = cos(ang)*200;
      float z = sin(ang)*200;
      vertex(x,0,z);
    }
    endShape();
    popMatrix();
    
    //sides
    pushMatrix();
    translate(0 , -450, 0);
    fill(0);
    beginShape(TRIANGLE_STRIP);
    for(int i = 0; i <=20; i+=1)
    {
      float ang = radians(360) / 20 * i;
      float x = cos(ang)*150;
      float z = sin(ang)*150;
      vertex(x,0,z);
      vertex(x,-300,z);
    }
    endShape();
    popMatrix();
    
    //top
    pushMatrix();
    translate(0 , -750, 0);
    fill(20);
    beginShape();
    for(int i = 0; i <=20; i+=1)
    {
      float ang = radians(360) / 20 * i;
      float x = cos(ang)*150;
      float z = sin(ang)*150;
      vertex(x,0,z);
    }
    endShape();
    popMatrix();
      
  
}
