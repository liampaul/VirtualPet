
boolean upP, downP, leftP, rightP, spaceP, shiftP= false;
boolean WP, SP, AP, DP = false;
boolean X1, X2, Y1, Y2, Z1, Z2 = false;
float adjustX, adjustY, adjustZ = 0;
float camX = 0;   
float camY = 0;   
float camZ = 1500;  

float camRotY = 0; 
float camRotX = radians(180); 

float moveSpeed = 5.0; 
float rotSpeed = .02; 

int groundScale = 5000;
int groundSize = 30;
float[][] terrain;

ArrayList<Snowflake> snowflakes;
int numberOfSnowflakes = 300;

void setup()
{
  size(800,800, P3D);
  noCursor();
  smooth(8);
  initializeTerrain();
    snowflakes = new ArrayList<Snowflake>();
  for (int i = 0; i < numberOfSnowflakes; i++) {
    snowflakes.add(new Snowflake());
  }
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
  if (key == 'u'){
  X1 = true;
 } 
 if (key == 'i'){
 X2 = true;
 } 
 if (key == 'j'){
 Y1 = true;
 } 
 if (key == 'k'){
 Y2 = true;
 } 
 if (key == 'm'){
 Z1 = true;
 } 
  if (key == ','){
 Z2 = true;
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
 if (key == 'u'){
  X1 = false;
 } 
 if (key == 'i'){
 X2 = false;
 } 
 if (key == 'j'){
 Y1 = false;
 } 
 if (key == 'k'){
 Y2 = false;
 } 
 if (key == 'm'){
 Z1 = false;
 } 
  if (key == ','){
 Z2 = false;
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

class Snowflake {
  float x, y, z;
  float speed;
  float size;
  
  Snowflake(){
    x= (float) ((Math.random()*4000)-2000);
    y = (float) ((Math.random()*1000)-2000); 
    z = (float) ((Math.random()*4000)-2000);
    
    speed = (float) ((Math.random()*2)+1);
    size = (float) ((Math.random()*3)+2);
  }
  void update() {
    y+=speed;
    
    if (y > 800){
    x= (float) ((Math.random()*4000)-2000);
    y = (float) ((Math.random()*1000)-2000); 
    z = (float) ((Math.random()*4000)-2000);
    }
  }
  
  void display() {
    pushMatrix();
    translate(x, y, z);
    
    noStroke();
    fill(255);
    sphere(size);
    popMatrix();
  }
}
    
void draw()
{
  
  background(100);
  
  ambientLight(150, 150, 150); 
  
spotLight(25, 75, 150, 300, -500, 0, 0, radians(-90), radians(-30), 100, 0);   
  
  updateCamera();

  float lookAtX = camX + sin(camRotY) * cos(camRotX);
  float lookAtY = camY - sin(camRotX);
  float lookAtZ = camZ + cos(camRotY) * cos(camRotX);
  
  camera(camX, camY, camZ, lookAtX, lookAtY, lookAtZ, 0, 1, 0);

  for (Snowflake flake : snowflakes) {
  flake.update();
  flake.display();
  }
  drawSnowman();

  drawGround();
  translate(-200,750,00);
  drawFox();
  
  if (X2) {
    //x+
    adjustX +=1;
  }
  if (X1) {
    //Backward
    adjustX -=1;
  }
  if (Y2) {
    //x+
    adjustY +=1;
  }
  if (Y1) {
    //Backward
    adjustY -=1;
  }
    if (Z2) {
    //x+
    adjustZ +=1;
  }
  if (Z1) {
    //Backward
    adjustZ -=1;
  }
}

void drawSnowman()
{
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

void initializeTerrain()
{
  terrain = new float[groundSize][groundSize];
  // Initialize the terrain with random values
  for (int i = 0; i < groundSize; i++) {
    for (int j = 0; j < groundSize; j++) {
      terrain[i][j] = 0;
    }
  }
}

void drawGround()
{
  stroke(1);
  pushMatrix();
  translate(-50000, 800, -50000);

  // Draw the terrain as a series of connected triangles
  stroke(50);
  fill(0, 150, 50); // Green color
  
  // Loop through the grid
  for (int i = 0; i < groundSize - 1; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < groundSize; j++) {
      // Define the first vertex with its random Y displacement
      vertex(i * groundScale, terrain[i][j], j * groundScale);
      // Define the second vertex with its random Y displacement
      vertex((i + 1) * groundScale, terrain[i + 1][j], j * groundScale);
    }
    endShape();
   
  }
  popMatrix();
}

void drawFox()
{    
    stroke(1);
    //body  
    pushMatrix();
    translate(700 , 0, 0);
    rotateY(radians(-140));
    fill(#F58020);
    beginShape(TRIANGLE_STRIP);
    float h = 0;
    for(int i = 0; i <=20; i+=1)
    {
      
      float ang = radians(-300) / 20 * i;
      float x = cos(ang)*150;
      float z = sin(ang)*150;
      vertex(x,0-h,z);
      vertex(x,-75-h,z);
      h+=3;
    }
    endShape();
        beginShape(TRIANGLE_STRIP);
    h = 0;
    for(int i = 0; i <=20; i+=1)
    {
      float ang = radians(-300) / 20 * i;
      float x = cos(ang)*75;
      float z = sin(ang)*75;
      vertex(x,0-h,z);
      vertex(x,-75-h,z);
      h+=3;
    }
    endShape();
    beginShape(TRIANGLE_STRIP);
    h = 0;
    for(int i = 0; i <=20; i+=1)
    {
      
      float ang = radians(-300) / 20 * i;
      float x1 = cos(ang)*150;
      float z1 = sin(ang)*150;
      float x2 = cos(ang)*75;
      float z2 = sin(ang)*75;
      vertex(x1,-75-h,z1);
      vertex(x2,-75-h,z2);
      h +=3;
    }
    endShape();
    popMatrix();
    
    //tail
    pushMatrix();
    translate(640,30,75);
    beginShape(TRIANGLE_FAN);
    vertex(-200, -30, -150);
    
    vertex(2, -105, -27); 
    vertex(2, -30, -27);
    vertex(-61,-30, 18);
    vertex(-61,-105, 18);
    vertex(2, -105, -27); 
    endShape();
    popMatrix();
    
    fill(255);
    pushMatrix();
    translate(640,30,75);
    beginShape(TRIANGLE_FAN);
    vertex(-200, -30, -150);
    vertex(-99, -67, -89); 
    vertex(-106, -23, -97);
    vertex(-154,-35, -46);
    vertex(-108,-86, -51);
    vertex(-99, -67, -89);
    endShape();
    popMatrix();
    
    
    //head
    translate(585,-158,5);
    System.out.println(640+adjustX + "" + -300+adjustY + " " + 10+adjustZ);
       beginShape(TRIANGLES);
       
       //center
       fill(252, 160, 48);
       vertex(0,0,0);
       vertex(0,75,10);
       vertex(25, 5, -5);
       fill(252, 149, 45);
       vertex(0,0,0);
       vertex(0,75,10);
       vertex(-25, 5, -5);
       
       //side1
       fill(255, 154, 38);
       vertex(0,75,10);
       vertex(25, 5, -5);
       vertex(60, 35, -10);
       fill(219, 88, 22);
       vertex(0,75,10);
       vertex(-25, 5, -5);
       vertex(-60, 35, -10);
       
       //side 2 
       fill(255, 159, 33);
       vertex(25, 5, -5);
       vertex(60, 35, -10);
       vertex(65, 0, -15);
       fill(217, 85, 20);
       vertex(-25, 5, -5);
       vertex(-60, 35, -10);
       vertex(-65, 0, -15);
       
       //center bottom
       fill(255, 254, 232);
       vertex(0,75,10);
       vertex(60, 35, -10);
       vertex(90, 40, -20);
       fill(222, 199, 169);
       vertex(0,75,10);
       vertex(-60, 35, -10);
       vertex(-90, 40, -20);
       
       // side 3
       fill(252, 154, 33);
       vertex(60, 35, -10);
       vertex(90, 40, -20);
       vertex(65, 0, -15);
       fill(214, 86, 21);
       vertex(-60, 35, -10);
       vertex(-90, 40, -20);
       vertex(-65, 0, -15);
       
       //bottom
       fill(255, 187, 110);
       vertex(0,75,10);
       vertex(90, 40, -20);
       vertex(20, 90, -25);
       fill(189, 146, 117);
       vertex(0,75,10);
       vertex(-90, 40, -20);
       vertex(-20, 90, -25);
       
       // bottom connectore
       fill(219, 115, 35);
       vertex(0,75,10);
       vertex(20, 90, -25);
       vertex(-20, 90, -25);
       
       // side top
       fill(252, 172, 50);
       vertex(25, 5, -5);
       vertex(65, 0, -15);
       vertex(22, -20, -20);
       fill(247, 112, 27);
       vertex(-25, 5, -5);
       vertex(-65, 0, -15);
       vertex(-22, -20, -20);
       
       //left ear
       fill(255, 155, 48);
       vertex(-70, 0, -15);
       vertex(-22, -20, -20);
       vertex(-90, -80, -20);
       fill(255, 216, 148);
       vertex(-55, 10, -15);
       vertex(-35, -20, -15);
       vertex(-85, -70, -15);
       
       //right ear fold
       fill(255, 140, 42);
       vertex(72, -50, -20);
       vertex(53, -60, -20);
       vertex(57, -30, 0);
       
       endShape();
       
       beginShape(QUADS);
       
       // center top
       fill(255, 172, 64);
       vertex(0,0,0);
       vertex(0,-30, -30);
       vertex(22, -20, -20);
       vertex(25, 5, -5);
       fill(252, 155, 58);
       vertex(0,0,0);
       vertex(0,-30, -30);
       vertex(-22, -20, -20);
       vertex(-25, 5, -5);
       
       //right ear base
       fill(255, 155, 48);
       vertex(70, 0, -15);
       vertex(72, -50, -20);
       vertex(53, -60, -20);
       vertex(22, -20, -20);
       fill(255, 216, 148);
       vertex(55, 10, -15);
       vertex(68, -40, -15);
       vertex(60, -50, -15);
       vertex(35, -20, -15);
       endShape();
       
       fill(0);
       //eyes and nose
       pushMatrix();
       translate(0, 0, 5);
       ellipse(25,40, 10, 10);
       translate(0, 0, 5);
       ellipse(-25,40, 10, 10);
       translate(0, 70, 10);
       sphere(8);
       popMatrix();
      
}
    
