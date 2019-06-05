public class Board {
  int x_pos, y_pos;
  int cellSize;
  int rows, cols;
  int[][] layer;
  ArrayList<BoardItem> items;
  int backgroundColor;
  int score = 0;

  public Board(int x, int y, int numRows, int numCols, int cellSize) {
    backgroundColor = 0;
    x_pos = x;
    y_pos = y;
    this.cellSize = cellSize;
    rows = numRows;
    cols = numCols;
    layer = new int[numRows][numCols];
    for (int row=0; row < numRows; row++) {
      for (int col=0; col < numCols; col++) {
        layer[row][col] = backgroundColor;
      }
    }
    items = new ArrayList<BoardItem>();
  }

  public void addItem(BoardItem item) {
    items.add(item);
    item.setBounds(rows, cols);
  }

  private BoardItem tetrisPiece;

  public void swapOutActive(BoardItem piece) {
    tetrisPiece = piece;
  }

  public void show() {
    pushMatrix();
    translate(x_pos, y_pos);
    for (int row=0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        int xAt = col * cellSize;
        int yAt = row * cellSize;
        stroke(255);
        fill(backgroundColor);
        rect(xAt, yAt, cellSize, cellSize);
        drawLayerCell(row, col, xAt, yAt);
      }
    }

   if(tetrisPiece != null){
     int xAt = tetrisPiece.col() * cellSize;
     int yAt = tetrisPiece.row() * cellSize;
     tetrisPiece.show(xAt, yAt, cellSize);
     tetrisPiece.setBounds(rows,cols);
   }

    fill(255);
    textSize(32);
    text("Points: " + score, 500, 10);

    popMatrix();
  }


  protected void drawLayerCell(int rowId, int colId, int xPos, int yPos) {
    if (layer != null) {
      if (layer.length > rowId) {
        if (layer[rowId].length > colId) {
          int cellColor = layer[rowId][colId];
          fill(cellColor);
          rect(xPos, yPos, cellSize, cellSize);
        }
      }
    }
  }

  public Cell getCell(int xClicked, int yClicked) {
    xClicked = xClicked - x_pos;
    yClicked = yClicked - y_pos;

    int xAt = xClicked/cellSize;
    int yAt = yClicked/cellSize;

    return new Cell(yAt, xAt);
  }

  public void addLayer(int[][] theLayer) {
    this.layer = theLayer;
  }

  public void editLayer(ArrayList<Cell> shadowCells, int pieceColor) {
    for (Cell cell : shadowCells) {
      layer[cell.rowID()][cell.colID()] = pieceColor;
    }
  }

  public boolean isClear(ArrayList<Cell> vanguardCells) {
    boolean result = true;
    for (Cell cell : vanguardCells) {
      if (cell.colID() > layer[0].length-1 || cell.colID() < 0) {
        result = false;
      } else if (cell.rowID() > layer.length - 1) {
        result = false;
      } else if (layer[cell.rowID()][cell.colID()] != backgroundColor) {
        result = false;
      }
    }
    return result;
  }

  private boolean isEmpty(int row) {
    for (int col = 0; col < layer[0].length; col++) {
      if (layer[row][col] != backgroundColor)
        return false;
    }
    return true;
  }

  private boolean isColoredRow(int row) {
    for (int col = 0; col < layer[0].length; col++) {
      if (layer[row][col] == backgroundColor)
        return false;
    }
    return true;
  }

  public ArrayList<Integer> getCompletedRows() {
    ArrayList<Integer> result = new ArrayList<Integer>();
    for (int row = layer.length - 1; row > 0; row--) {
      if (isColoredRow(row))
        result.add(row);
    }
    println(result);
    return result;
  }

  public void reset(int row, int clr) {
    for (int col = 0; col < layer[0].length; col++) {
      layer[row][col] = clr;
    }
  }

  private void copyRows(int toRow, int fromRow) {
    for (int col = 0; col < layer[0].length; col++) {
      layer[toRow][col] = layer[fromRow][col];
    }
  }

  private void fixScene(int startRow) {
    for (int i = startRow; i > 0; i--) {
      boolean shouldStop = true;
      for (int j = i - 1; j > 0; j--) {
        if (!(isEmpty(j))) {
          copyRows(i, j);
          reset(j, backgroundColor);
          shouldStop = false;
          break;
        }
      }
      if (shouldStop)
        break;
    }
  }


  public void Tetris(ArrayList<Integer> coloredRows) {
    if (coloredRows.size() > 0) {
      score += Math.pow(10,coloredRows.size());
      for (Integer row : coloredRows) {
        reset(row, backgroundColor);
      }
      fixScene(coloredRows.get(0));
    }
  }
}
