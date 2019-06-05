public class TPiece extends BoardItem {
  int TColor = #B90D94;
  private int[][] Rotation1 =   {{TColor, TColor, TColor}, // Piece Layout   [][][]
                                {    -1, TColor,      -1}};//                X [] X

  private int[][] Rotation2 = {{-1, TColor},   // Piece Layout X []
                              {TColor, TColor},//              [][]
                              {-1, TColor}};   //              X []

  private int[][] Rotation3 = {{     -1, TColor,    -1}, // Piece Layout   X [] X
                               {TColor, TColor, TColor}};//                [][][]
                                
  private int[][] Rotation4 = {{TColor, -1},   // Piece Layout [] X
                              {TColor, TColor},//              [][]
                              {TColor, -1}};   //              [] X
            

  TPiece(int rowAt, int colAt) {
    super(rowAt, colAt);
    setData(Rotation1);
  }

  public void updateRotation(int by) {
    super.updateRotation(by);
    if(pieceRotation%4 == 0){
      this.setData(Rotation1);
    }
    if(pieceRotation%4 == 1){
      this.setData(Rotation2);
    }
    if(pieceRotation%4 == 2){
      this.setData(Rotation3);
    }
    if(pieceRotation%4 == 3){
      this.setData(Rotation4);
    }
  }
  
  ArrayList<Cell> getShadow(int rowOffset) {
    ArrayList<Cell> result = new ArrayList<Cell>();
    if(pieceRotation%4 == 0){
      result.add( new Cell(rowId + rowOffset, colId) );
      result.add( new Cell(rowId + rowOffset, colId + 1) );
      result.add( new Cell(rowId + rowOffset, colId + 2) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 1) );
    }
    if(pieceRotation%4 == 1){
      result.add( new Cell(rowId + rowOffset, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 1, colId) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 2, colId + 1) );
    }
    if(pieceRotation%4 == 2){
      result.add( new Cell(rowId + rowOffset, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 1, colId) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 2) );
    }
    if(pieceRotation%4 == 3){
      result.add( new Cell(rowId + rowOffset, colId) );
      result.add( new Cell(rowId + rowOffset + 1, colId) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 2, colId) );
    }
    return result;
  }  

  ArrayList<Cell> getShadowVert(int colOffset) {
    ArrayList<Cell> result = new ArrayList<Cell>();
    if(pieceRotation%4 == 0){
      result.add( new Cell(rowId, colId + colOffset) );
      result.add( new Cell(rowId, colId + colOffset + 1) );
      result.add( new Cell(rowId, colId + colOffset + 2) );
      result.add( new Cell(rowId + 1, colId + colOffset + 1) );
    }
    if(pieceRotation%4 == 1){
      result.add( new Cell(rowId, colId + colOffset + 1) );
      result.add( new Cell(rowId + 1, colId + colOffset) );
      result.add( new Cell(rowId + 1, colId + colOffset + 1) );
      result.add( new Cell(rowId + 2, colId + colOffset + 1) );
    }
    if(pieceRotation%4 == 2){
      result.add( new Cell(rowId, colId + colOffset + 1) );
      result.add( new Cell(rowId + 1, colId + colOffset) );
      result.add( new Cell(rowId + 1, colId + colOffset + 1) );
      result.add( new Cell(rowId + 1, colId + colOffset + 2) );
    }
    if(pieceRotation%4 == 3){
      result.add( new Cell(rowId, colId + colOffset) );
      result.add( new Cell(rowId + 1, colId + colOffset) );
      result.add( new Cell(rowId + 1, colId + colOffset + 1) );
      result.add( new Cell(rowId + 2, colId + colOffset) );
    }
    return result;
  }  
  
}
