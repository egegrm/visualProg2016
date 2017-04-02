class DataView {

  int x,y,w,h;
  int border = 10;
  float ratio;
  int topViewBoardSize;

  color backgroundColor;
  color chartBackgroundColor = #FAD700;
  
  PGraphics background;
  PGraphics topView;
  PGraphics scoreBoard;
  PGraphics barChart;

  DataView(int w, int h, int x, int y, color bg) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.topViewBoardSize = h - 2*border;
    this.ratio = topViewBoardSize / (float) board.boardWidth;

    backgroundColor = bg;
    background = createGraphics(w, h, P2D);
    topView = createGraphics(topViewBoardSize, topViewBoardSize, P2D);
    int scoreBoardSize = 100;
    scoreBoard = createGraphics(scoreBoardSize, h - 2 * border, P2D);
    barChart = createGraphics(width - topViewBoardSize - scoreBoardSize - 6 * border, h - 30 - 2 * border, P2D );
  }

  void draw() {
    fill(255);

    //Background
    background.beginDraw();
    background.background(backgroundColor);
    background.endDraw();

    //topView
    topView.noStroke();    
    topView.beginDraw();
    topView.background(board.boxColor);
    float r = ratio * 2 * Cylinder.cylinderBaseSize;
    topView.fill(100);
    for (int i = 0; i < cyl.size(); i++) {
      PVector a = cyl.get(i);
      topView.ellipse((topViewBoardSize/2 + ratio * a.x), (topViewBoardSize/2 + ratio * a.z), r, r);
    }
    topView.fill(255);
    topView.ellipse((topViewBoardSize/2 + ratio * m.location.x), (topViewBoardSize/2 + ratio * m.location.z), ratio*2*m.ray*2, ratio*2*m.ray*2);

    topView.endDraw();

    //ScoreBoard
    scoreBoard.beginDraw();
    scoreBoard.background(backgroundColor);
    scoreBoard.textSize(12);
    scoreBoard.noFill();
    scoreBoard.stroke(255);
    int weight = 2;
    scoreBoard.strokeWeight(weight);
    scoreBoard.rect(weight, weight, scoreBoard.width - 2*weight, scoreBoard.height - 2*weight);
    scoreBoard.fill(80);
    scoreBoard.textAlign(CENTER);
    scoreBoard.text("Total Score", scoreBoard.width/2, 20);
    scoreBoard.text(totalScore, scoreBoard.width/2, 34);
    scoreBoard.text("Velocity", scoreBoard.width/2, 48);
    scoreBoard.text(m.velocity.mag(), scoreBoard.width/2, 62);
    scoreBoard.text("Last Score", scoreBoard.width/2, 76);
    scoreBoard.text(lastScore, scoreBoard.width/2, 90);
    scoreBoard.endDraw();

    //barChart
    barChart.beginDraw();
    barChart.background(chartBackgroundColor);
    barChart.fill(board.boxColor);
    barChart.stroke(chartBackgroundColor);
    barChart.strokeWeight(1);
    
    int squareHeight = 4;
    float squareWidth = 3 * (scrollbar.getPos() + 0.5) * (scrollbar.getPos() + 0.5) + 1;
    int scorePerSquare = 3;
    for (int i = 0; i<scores.size(); ++i) {
      for (int j = 0; j < scores.get(i)/scorePerSquare; j ++) {
        barChart.rect(i * squareWidth, (h-border*4) - j * squareHeight, squareWidth, squareHeight);
      }
    }


    barChart.endDraw();
    camera();
    directionalLight(80, 80, 80, 0, 0, -1);

    image(background, x, y);
    image(topView, x+border, y+border);
    image(scoreBoard, x + 2*border + topViewBoardSize, y + border);
    image(barChart, x+ 4 * border + topViewBoardSize + 100, y + border);
  }
}