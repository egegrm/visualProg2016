float coef=1;
float rotX=0;
float rotZ=0;

void mouseDragged() {
  float deltaX=0;
  float deltaY=0;
  deltaX=(mouseX-pmouseX);
  deltaY=(pmouseY-mouseY);

  rotZ+=map(deltaX, -height, height, -2*PI, 2*PI)*coef;
  rotX+=map(deltaY, -width, width, -2*PI, 2*PI)*coef;
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
  if (shift) 
    cyl.add(new PVector(mouseX, mouseY, 0));
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