float depth = 2000;
<<<<<<< HEAD
=======
int boxX=300;
int boxY=10;
int boxZ=300;
>>>>>>> 364fce692ee3c6db48ce9471a1f01c4d9fd5fdca

boolean shift=false;
Mover m=new Mover();
ArrayList<PVector> cyl=new ArrayList();
Cylinder cylinder;
Board board;
DataView dataView;
ArrayList<Float> scores = new ArrayList<Float>();
int tickTime = 0;
float totalScore = 0;
float lastScore = 0;

HScrollbar scrollbar;

void settings() {
<<<<<<< HEAD
  size(1080, 720, P3D);
}
void setup() {
  cylinder = new Cylinder();
  board = new Board(300,10,300);
  dataView = new DataView(width, 150, 0, height-150, 400);
  scrollbar = new HScrollbar (260, 700, 300, 10);
=======
  size(displayWidth, displayHeight, P3D);
}
void setup() {
  setupSurfaces();
  setupCyl();
>>>>>>> 364fce692ee3c6db48ce9471a1f01c4d9fd5fdca
}

void draw() {
  tickTime++;
  
  if(tickTime % 50 == 0){
        scores.add(totalScore); 
  }
  background(200);
  //ambientLight(50, 100, 100);
  if (!shift) {
    drawSurfaces();
    translate(displayWidth/2, displayHeight/2, 0);
    rotateX(rotX);
    rotateZ(rotZ);
    board.display();
    m.update();
    m.checkEdges();
    m.display();
    for(PVector v: cyl)
      cylinder.drawCyl3D(v);
    
    dataView.draw();
    scrollbar.update();
    scrollbar.display();
  }
  else {  
    translate(displayWidth/2, displayHeight/2, 0);
    beginShape();
    vertex(-board.boardWidth/2, -board.boardDepth/2);
    vertex(board.boardWidth/2, -board.boardDepth/2);
    vertex(board.boardWidth/2,board.boardDepth/2);
    vertex(-board.boardWidth/2, board.boardDepth/2);
    endShape(CLOSE);
    m.display2D();
    cylinder.drawMovCyl();
    for(PVector v : cyl)
      cylinder.drawCyl(v);
  }
}