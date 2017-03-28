float depth = 2000;
float boxX=200;
float boxY=10;
float boxZ=200;

boolean shift=false;
Mover m=new Mover();
ArrayList<PVector> cyl=new ArrayList();

void settings() {
  size(500, 500, P3D);
}
void setup() {
  setupCyl();
}

void draw() {
  background(200);
  //ambientLight(50, 100, 100);
  if (!shift) {
    translate(width/2, height/2, 0);
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
    translate(width/2, height/2, 0);
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