float cylinderBaseSize = 20;
float cylinderHeight = 10;
int cylinderResolution = 60;
PShape openCylinder = new PShape();
PShape triangles1= new PShape();
PShape triangles2= new PShape();



void setupCyl() {
  float angle;
  float[] x = new float[cylinderResolution + 1];
  float[] y = new float[cylinderResolution + 1];
  //get the x and y position on a circle for all the sides
  for (int i = 0; i < x.length; i++) {
    angle = (TWO_PI / cylinderResolution) * i;
    x[i] = sin(angle) * cylinderBaseSize;
    y[i] = cos(angle) * cylinderBaseSize;
  }

  openCylinder = createShape();
  openCylinder.beginShape(QUAD_STRIP);
  triangles1=createShape();
  triangles1.beginShape(TRIANGLE_FAN);
  triangles2=createShape();
  triangles2.beginShape(TRIANGLE_FAN);

  //draw the border of the cylinder
  for (int i = 0; i < x.length; i++) {
    openCylinder.vertex(x[i], y[i], 0);
    openCylinder.vertex(x[i], y[i], cylinderHeight);   
    triangles1.vertex(mouseX, mouseY, 0);
    triangles1.vertex(x[i], y[i], 0);
    triangles2.vertex(mouseX, mouseY, cylinderHeight);
    triangles2.vertex(x[i], y[i], cylinderHeight);
  }    

  openCylinder.noStroke(); 

  openCylinder.endShape();
  triangles1.endShape();
  triangles2.endShape();
}
void drawCyl(PVector v) {
  pushMatrix();
  translate(v.x-displayWidth/2, v.y-displayHeight/2, 0);
  shape(openCylinder);
  shape(triangles1);
  shape(triangles2);
  popMatrix();
}

void drawCyl3D(PVector v) {
  pushMatrix();
  translate(v.x-displayWidth/2, -cylinderHeight-boxY/2, v.y-displayHeight/2);
  rotateX(-PI/2.0);
  shape(openCylinder);
  shape(triangles1);
  shape(triangles2);
  popMatrix();
}

void drawMovCyl() {
  if ( (mouseX-displayWidth/2+cylinderBaseSize)<boxX/2 && (mouseX-displayWidth/2-cylinderBaseSize)>-boxX/2 &&  (mouseY-displayHeight/2+cylinderBaseSize)<boxZ/2 && (mouseY-displayHeight/2-cylinderBaseSize)>-boxZ/2) {
    triangles1.setFill(color(0, 255, 0));
    triangles2.setFill(color(0, 255, 0));
  } else {
    triangles1.setFill(color(255, 0, 0));
    triangles2.setFill(color(255, 0, 0));
  }

  pushMatrix();
  translate(mouseX-displayWidth/2, mouseY-displayHeight/2, 0);
  shape(openCylinder);
  shape(triangles1);
  shape(triangles2);
  popMatrix();
}