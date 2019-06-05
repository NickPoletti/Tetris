public class BackZ extends BoardItem {
  int BackZColor = #1ED11F;
  private int[][] Rotation1 = {{     -1, BackZColor, BackZColor}, // Piece Layout   X [][]
                               {BackZColor, BackZColor,      -1}};//                [][] X

  private int[][] Rotation2 = {{BackZColor,      -1},    // Piece Layout  [] X
                               {BackZColor, BackZColor}, //               [][]
                               {     -1, BackZColor}};   //               X []
            

  BackZ(int rowAt, int colAt) {
    super(rowAt, colAt);
    setData(Rotation1);
  }

  public void updateRotation(int by) {
    super.updateRotation(by);
    if(pieceRotation%2 == 0){
      this.setData(Rotation1);
    }
    if(pieceRotation%2 == 1){
      this.setData(Rotation2);
    }
  }
  
  ArrayList<Cell> getShadow(int rowOffset) {
    ArrayList<Cell> result = new ArrayList<Cell>();
    if(pieceRotation%2 == 0){
      result.add( new Cell(rowId + rowOffset, colId + 1) );
      result.add( new Cell(rowId + rowOffset, colId + 2) );
      result.add( new Cell(rowId + rowOffset + 1, colId) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 1) );
    }
    if(pieceRotation%2 == 1){
      result.add( new Cell(rowId + rowOffset, colId) );
      result.add( new Cell(rowId + rowOffset + 1, colId) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 2, colId + 1) );
    }
    return result;
  }  

  ArrayList<Cell> getShadowVert(int colOffset) {
    ArrayList<Cell> result = new ArrayList<Cell>();
    if(pieceRotation%2 == 0){
      result.add( new Cell(rowId, colId + colOffset + 1) );
      result.add( new Cell(rowId, colId + colOffset + 2) );
      result.add( new Cell(rowId + 1, colId + colOffset) );
      result.add( new Cell(rowId + 1, colId + colOffset + 1) );
    }
    if(pieceRotation%2 == 1){
      result.add( new Cell(rowId, colId + colOffset) );
      result.add( new Cell(rowId + 1, colId + colOffset) );
      result.add( new Cell(rowId + 1, colId + colOffset + 1) );
      result.add( new Cell(rowId + 2, colId + colOffset + 1) );
    }
    return result;
  }   
  
}
