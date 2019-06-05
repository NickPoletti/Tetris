public class BoardItem {

  protected int colId, rowId;
  protected int maxRow, maxCol;
  protected int pieceRotation;

  protected int[][] glyphData;

  public BoardItem(int rowAt, int colAt) {
    this.rowId = rowAt;
    this.colId = colAt;
    pieceRotation = 0;
  }

  public void setData(int[][] data) {
    glyphData = data;
  }

  public int row() {
    return rowId;
  }

  public int col() {
    return colId;
  }

  public void show(int xAt, int yAt, int cellSize) {
    for (int row = 0; row < glyphData.length; row++) {
      for (int col = 0; col < glyphData[row].length; col++) {
        int fillColor = glyphData[row][col];
        if (fillColor != -1) {
          fill(fillColor);
          stroke(0);
          strokeWeight(.5);
          int x = xAt + col*cellSize;
          int y = yAt + row*cellSize;
          rect(x, y, cellSize, cellSize);
        }
      }
    }
  }

  public String toString(){
    return rowId + ", " + colId;    
  }

  public void setBounds(int rows, int cols) {
    maxRow = rows;
    maxCol = cols;
  }

  public void updateCol(int by) {
    if (colId + by <= maxCol - glyphData[0].length && colId + by >= 0)
      colId += by;
  }

  public void updateRow(int by) {
    if(rowId + by <= maxRow - glyphData.length && rowId + by >= 0){
      rowId += by;
    }
  }

  public void updateRotation(int by) {
    int pieceRows = glyphData.length;
    int totalCols = colId + pieceRows;
    if(totalCols > maxCol){
      colId = colId - (totalCols - maxCol);
      pieceRotation += by;
    } else {
      pieceRotation += by;
    }
  }

  ArrayList<Cell> getShadow(int rowOffset) {
    ArrayList<Cell> result = new ArrayList<Cell>();
    return result;
  }
  
  ArrayList<Cell> getShadowVert(int colOffset) {
    ArrayList<Cell> result = new ArrayList<Cell>();
    return result;
  }

  public Cell[] getVanguard( char direction ) {
    ArrayList<Cell> result = new ArrayList<Cell>();
    if (direction == 'u') {
      for (int i = 0; i < glyphData[0].length; i++) {
        if (!(glyphData[0][i] == -1)) {
          int colVal = i + colId;
          int rowVal = rowId - 1;
          Cell c = new Cell(rowVal, colVal);
          result.add(c);
        }
      }
    } else if (direction == 'd') {
      for (int i = 0; i < glyphData[0].length; i++) {
        int numOfRows = glyphData.length;
        if (!(glyphData[numOfRows-1][i] == -1)) {
          int colVal = i + colId;
          int rowVal = rowId + numOfRows;
          Cell c = new Cell(rowVal, colVal);
          result.add(c);
        }
      }
    } else if (direction == 'r') {
      for (int i = 0; i < glyphData.length; i++) {
        int numOfCols = glyphData[0].length;
        if (!(glyphData[i][numOfCols-1] == -1)) {
          int colVal = colId + numOfCols;
          int rowVal = rowId + i;
          Cell c = new Cell(rowVal, colVal);
          result.add(c);
        }
      }
    } else if (direction == 'l') {
      for (int i = 0; i < glyphData.length; i++) {
        if (!(glyphData[i][0] == -1)) {
          int colVal = colId - 1;
          int rowVal = rowId + i;
          Cell c = new Cell(rowVal, colVal);
          result.add(c);
        }
      }
    }


    return result.toArray(new Cell[0]);
  }
}
