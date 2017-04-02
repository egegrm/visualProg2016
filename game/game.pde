float depth = 2000;
int boxX=300;
int boxY=10;
int boxZ=300;

boolean shift=false;
Mover m=new Mover();
ArrayList<PVector> cyl=new ArrayList();

void settings() {
  size(displayWidth, displayHeight, P3D);
}
void setup() {
  setupSurfaces();
  setupCyl();
}

void draw() {
  background(200);
  //ambientLight(50, 100, 100);
  if (!shift) {
    drawSurfaces();
    translate(displayWidth/2, displayHeight/2, 0);
    rotateX(rotX);
    rotateZ(rotZ);
    box(boxX, boxY, boxZ);
    m.update();
    m.checkEdges();
    m.display();
    for(PVector v: cyl)
      drawCyl3D(v);
    
  }
  else {  
    translate(displayWidth/2, displayHeight/2, 0);
    beginShape();
    vertex(-boxX/2, -boxZ/2);
    vertex(boxX/2, -boxZ/2);
    vertex(boxX/2,boxZ/2);
    vertex(-boxX/2, boxZ/2);
    endShape(CLOSE);
    m.display2D();
    drawMovCyl();
    for(PVector v : cyl)
      drawCyl(v);
  }
}