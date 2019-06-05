public class IPiece extends BoardItem {
  int IColor = #14F2DE;
  private int[][] Rotation1 = {{IColor}, // Piece Layout []
                               {IColor}, //              []
                               {IColor}, //              []
                               {IColor}};//              []
            
  private int[][] Rotation2 = {{IColor, IColor,IColor,IColor}};// Piece Layout [][][][]

  IPiece(int rowAt, int colAt) {
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
      result.add( new Cell(rowId + rowOffset + 1, colId) );
      result.add( new Cell(rowId + rowOffset + 2, colId) );
      result.add( new Cell(rowId + rowOffset + 3, colId) );
    }
    if(pieceRotation%2 == 1){
      result.add( new Cell(rowId + rowOffset, colId) );
      result.add( new Cell(rowId + rowOffset, colId + 1) );
      result.add( new Cell(rowId + rowOffset, colId + 2) );
      result.add( new Cell(rowId + rowOffset, colId + 3) );
    }
    return result;
  }  

  ArrayList<Cell> getShadowVert(int colOffset) {
    ArrayList<Cell> result = new ArrayList<Cell>();
    if(pieceRotation%2 == 0){
      result.add( new Cell(rowId, colId + colOffset) );
      result.add( new Cell(rowId + 1, colId + colOffset) );
      result.add( new Cell(rowId + 2, colId + colOffset) );
      result.add( new Cell(rowId + 3, colId + colOffset) );
    }
    if(pieceRotation%2 == 1){
      result.add( new Cell(rowId, colId) );
      result.add( new Cell(rowId, colId + colOffset + 1) );
      result.add( new Cell(rowId, colId + colOffset + 2) );
      result.add( new Cell(rowId, colId + colOffset + 3) );
    }
    return result;
  }    
  
}
