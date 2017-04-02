float line=10;
PGraphics mRectangle;
PGraphics topViewP;
PGraphics topViewB;
PGraphics topViewC;
PGraphics scoreBoard;
PGraphics scoreChart;

void setupSurfaces() {
  mRectangle= createGraphics(displayWidth, displayHeight-displayHeight/5, P2D); 
  //topViewP=createGraphics(2*boxX/5, 2*boxZ/5, P2D);
  topViewB=createGraphics(2*boxX/5, 2*boxZ/5, P2D);
  topViewC=createGraphics(2*boxX/5, 2*boxZ/5, P2D);
  scoreBoard=createGraphics(2*boxX/5, 2*boxZ/5, P2D);
  scoreBoard.noFill();
  scoreBoard.stroke(255, 255, 255);
}

void drawSurfaces() {
  drawMRect();
  mRectangle.noStroke();
  mRectangle.fill(255, 255, 153);
  image(mRectangle, 0, displayHeight-displayHeight/5);
  drawView();
  //image(topViewP, line, displayHeight+line-displayHeight/5);
  image(topViewB, line, displayHeight+line-displayHeight/5);
  image(topViewC, line, displayHeight+line-displayHeight/5);
  drawScore();
  image(scoreBoard, 2*boxX/5 +line, displayHeight+line-displayHeight/5);
}

void drawMRect() {
  mRectangle.beginDraw();
  mRectangle.rect(0, 0, mRectangle.width, mRectangle.height);
  mRectangle.endDraw();
}

void drawView() {
  topViewB.beginDraw();
  topViewB.pushMatrix();
  topViewB.background(0, 200, 200);
  topViewB.translate(topViewB.width/2, topViewB.width/2);
  topViewB.ellipse(2*m.location.x/5, 2*m.location.z/5, 4*m.ray/5, 4*m.ray/5);
  topViewB.popMatrix();
  topViewB.fill(200, 0, 0);
  topViewB.endDraw();

 /* topViewP.beginDraw();
  topViewP.rect(0, 0, topViewP.width, topViewP.height);
  topViewP.noStroke();
  topViewP.fill(0, 200, 200);
  topViewP.endDraw(); */

  topViewC.beginDraw();
  for (int i=0; i<cyl.size(); i++) {
    PVector v= cyl.get(i);
    topViewC.ellipse((2*v.x/5)-(((2*width/5.0)-topViewC.width)/2), (2*v.y/5)-(((2*displayHeight/5)-topViewC.height)/2), 4*cylinderBaseSize/5, 4*cylinderBaseSize/5);
  }
  topViewC.endDraw();
}

void drawScore() {
  scoreBoard.beginDraw();
  scoreBoard.background(255,255,153);
  String s= "Total Score : \n " + score + "\n Velocity : \n" + m.velocity.mag() + "\n Last Score : \n " + lpw;
  scoreBoard.fill(0);
  scoreBoard.textSize(12);
  scoreBoard.text(s, 10, 10, scoreBoard.width, scoreBoard.height);  
  scoreBoard.stroke(255);
  scoreBoard.endDraw();
}