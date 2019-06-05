public class Square extends BoardItem {
  int SquareColor = #F5EE0C;
  private int[][] Rotation1 = {{SquareColor,SquareColor},// Piece Layout [][]
                              {SquareColor,SquareColor}};//              [][]

  Square(int rowAt, int colAt) {
    super(rowAt, colAt);
    setData(Rotation1);
  }
  
  ArrayList<Cell> getShadow(int rowOffset) {
    ArrayList<Cell> result = new ArrayList<Cell>();
      result.add( new Cell(rowId + rowOffset, colId) );
      result.add( new Cell(rowId + rowOffset, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 1, colId) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 1) );
    return result;
  }  

  ArrayList<Cell> getShadowVert(int colOffset) {
    ArrayList<Cell> result = new ArrayList<Cell>();
      result.add( new Cell(rowId, colId + colOffset) );
      result.add( new Cell(rowId, colId + colOffset + 1) );
      result.add( new Cell(rowId + 1, colId + colOffset) );
      result.add( new Cell(rowId + 1, colId + colOffset + 1) );
    return result;
  }  

}
