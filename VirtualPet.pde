PImage groundTexture;
boolean upP, downP, leftP, rightP, spaceP, shiftP= false;
boolean WP, SP, AP, DP = false;
boolean X1, X2, Y1, Y2, Z1, Z2 = false;
float adjustX, adjustY, adjustZ = 0;
float camX = 0;   
float camY = 0;   
float camZ = 1500;  
@@ -11,11 +14,17 @@ float camRotX = radians(180);
float moveSpeed = 5.0; 
float rotSpeed = .02; 

int groundScale = 5000;
int groundSize = 100;
float[][] terrain;

void setup()
{
  size(800,800, P3D);
  noCursor();
  smooth(8);
  groundTexture = loadImage("ground_texture.jpg");
  initializeTerrain();
}

//check if key is being held
@@ -49,6 +58,24 @@ void keyPressed(){
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
@@ -82,6 +109,24 @@ void keyReleased(){
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
@@ -147,8 +192,9 @@ void draw()
{
  background(100);

  ambientLight(200, 200, 200); 
  directionalLight(255, 255, 255, 0, 1, 0); 
  ambientLight(150, 150, 150); 
  
spotLight(25, 75, 150, 300, -500, 0, 0, radians(-90), radians(-30), 100, 0);   

  updateCamera();

@@ -158,8 +204,41 @@ void draw()

  camera(camX, camY, camZ, lookAtX, lookAtY, lookAtZ, 0, 1, 0);

  drawSnowman();

  //body
  drawGround();
  translate(-200,750,00);
  drawFox();
  
  if (X2) {
    //x+
    adjustX +=1;
  }
  if (X1) {
    //x-
    adjustX -=1;
  }
  if (Y2) {
    //y+
    adjustY +=1;
  }
  if (Y1) {
    //y-
    adjustY -=1;
  }
    if (Z2) {
    //z+
    adjustZ +=1;
  }
  if (Z1) {
    //z-
    adjustZ -=1;
  }
}

void drawSnowman()
{
 //body
  noStroke();
  fill(255);
    //Base
@@ -338,5 +417,258 @@ void draw()
    endShape();
    popMatrix();

}

void initializeTerrain()
{
  terrain = new float[groundSize][groundSize];
  // Initialize the terrain with random values
  for (int i = 0; i < groundSize; i++) {
    for (int j = 0; j < groundSize; j++) {
      terrain[i][j] = random(-1, 1);
    }
  }
}

void drawGround()
{
  stroke(1);
  pushMatrix();
  translate(-50000, 800, -50000);

  stroke(50);
  fill(0, 150, 50); // Green color

  for (int i = 0; i < groundSize - 1; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < groundSize; j++) {
      vertex(i * groundScale, terrain[i][j], j * groundScale);
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
 
