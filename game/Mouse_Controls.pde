float coef=1;
float rotX=0;
float rotZ=0;

void mouseDragged() {
  float deltaX=0;
  float deltaY=0;
  deltaX=(mouseX-pmouseX);
  deltaY=(pmouseY-mouseY);

  rotZ+=map(deltaX, -displayHeight, displayHeight, -2*PI, 2*PI)*coef;
  rotX+=map(deltaY, -displayWidth, displayWidth, -2*PI, 2*PI)*coef;
  if (rotX>PI/3)
    rotX=PI/3; 
  else if (rotX<-PI/3)
    rotX=-PI/3;
  if (rotZ>PI/3)
    rotZ=PI/3;
  else if (rotZ<-PI/3)
    rotZ=-PI/3;
}

void mouseClicked() {
  if (shift) {
   if ( (mouseX-displayWidth/2+cylinderBaseSize)<boxX/2 && (mouseX-displayWidth/2-cylinderBaseSize)>-boxX/2 &&  (mouseY-displayHeight/2+cylinderBaseSize)<boxZ/2 && (mouseY-displayHeight/2-cylinderBaseSize)>-boxZ/2) {
      cyl.add(new PVector(mouseX, mouseY, 0));
    }
  }
}

void mouseWheel(MouseEvent event) {
  int e=event.getCount();        
  if (e>0) {
    if (coef<2) {
      coef +=0.1;
    } else {
      coef =2;
    }
  } else {
    if (coef>0) {
      coef -=0.1;
    } else 
    coef = 0.1;
  }
}