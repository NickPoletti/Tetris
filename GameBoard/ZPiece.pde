public class ZPiece extends BoardItem {
  int ZColor = #F01313;
  private int[][] Rotation1 = {{ZColor, ZColor,      -1}, // Piece Layout   [][] X
                                {    -1, ZColor, ZColor}};//                X [][]

  private int[][] Rotation2 = {{     -1, ZColor}, // Piece Layout  X []
                               {ZColor, ZColor},  //               [][]
                               {ZColor,      -1}};//               [] X
            

  ZPiece(int rowAt, int colAt) {
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
      result.add( new Cell(rowId + rowOffset, colId) );
      result.add( new Cell(rowId + rowOffset, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 2) );
    }
    if(pieceRotation%2 == 1){
      result.add( new Cell(rowId + rowOffset, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 1, colId) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 2, colId) );
    }
    return result;
  }  

  ArrayList<Cell> getShadowVert(int colOffset) {
    ArrayList<Cell> result = new ArrayList<Cell>();
    if(pieceRotation%2 == 0){
      result.add( new Cell(rowId, colId + colOffset) );
      result.add( new Cell(rowId, colId + colOffset + 1) );
      result.add( new Cell(rowId + 1, colId + colOffset + 1) );
      result.add( new Cell(rowId + 1, colId + colOffset + 2) );
    }
    if(pieceRotation%2 == 1){
      result.add( new Cell(rowId, colId + colOffset + 1) );
      result.add( new Cell(rowId + 1, colId + colOffset) );
      result.add( new Cell(rowId + 1, colId + colOffset + 1) );
      result.add( new Cell(rowId + 2, colId + colOffset) );
    }
    return result;
  }  

}
