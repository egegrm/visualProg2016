class Board{
 
  int boardWidth;
  int boardDepth;
  int boardHeight;
  color boxColor = #7B9FCB;
  
  Board(int w, int h, int d) {
    boardWidth = w;
    boardHeight = h;
    boardDepth = d;
  }
  
  void display() {
    // fill(setacolor) todo
    box(boardWidth, boardHeight, boardDepth);
  }
  
}