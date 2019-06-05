Board theBoard;
int BackLColor = #FF7708;
int BackZColor = #1ED11F;
int IColor = #14F2DE;
int LColor = #2739F0;
int SquareColor = #F5EE0C;
int TColor = #B90D94;
int ZColor = #F01313;
BoardItem activePiece;
int activePieceColor;
int pieceNum = (int)(random(1, 8));

public void pickPiece(int randNum) {
  if (randNum == 1) {
    activePiece = new TPiece(0, 5);
    activePieceColor = TColor;
  } else if (randNum == 2) {
    activePiece = new BackL(0, 5);
    activePieceColor = BackLColor;
  } else if (randNum == 3) {
    activePiece = new LPiece(0, 5);
    activePieceColor = LColor;
  } else if (randNum == 4) {
    activePiece = new ZPiece(0, 5);
    activePieceColor = ZColor;
  } else if (randNum == 5) {
    activePiece = new BackZ(0, 5);
    activePieceColor = BackZColor;
  } else if (randNum == 6) {
    activePiece = new IPiece(0, 5);
    activePieceColor = IColor;
  } else {
    activePiece = new Square(0, 5);
    activePieceColor = SquareColor;
  }
  theBoard.swapOutActive(activePiece);
}

void setup() {
  size(1000, 1000);
  frameRate(20);

  theBoard = new Board(width/8, height/8, 20, 10, 40);

  pickPiece(pieceNum);
}

void draw() {
  background(100);
  theBoard.show();

  if (!theBoard.isClear(activePiece.getShadow(1))) {
    theBoard.editLayer(activePiece.getShadow(0), activePieceColor);
    theBoard.Tetris(theBoard.getCompletedRows());
    pieceNum = (int)(random(1, 8));
    pickPiece(pieceNum);
  } else if (frameCount%20 == 0) {
    if (theBoard.isClear(activePiece.getShadow(1))) {
      activePiece.updateRow(1);
    }
  }
}

void mousePressed() {
  println(pieceNum);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      if(theBoard.isClear(activePiece.getShadow(1)))
        activePiece.updateRow(1);
    } else if (keyCode == LEFT) {
      if (theBoard.isClear(activePiece.getShadowVert(-1)))
        activePiece.updateCol(-1);
    } else if (keyCode == RIGHT) {
      if (theBoard.isClear(activePiece.getShadowVert(1)))
        activePiece.updateCol(1);
    }
  }
}

void keyReleased() {
  if (keyCode == UP) {
    activePiece.updateRotation(1);
  }
}
