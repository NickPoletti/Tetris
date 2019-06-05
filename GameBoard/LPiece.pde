public class LPiece extends BoardItem {
  int LColor = #2739F0;
  private int[][] Rotation1 = {{LColor,       -1}, // Piece Layout   [] X
                                {LColor,      -1}, //                [] X
                                {LColor, LColor}}; //                [][]

  private int[][] Rotation2 = {{ LColor, LColor,  LColor},   // Piece Layout   [][][]
                                { LColor,      -1,      -1}};//                [] X X

  private int[][] Rotation3 = {{ LColor, LColor }, // Piece Layout [][]
                                {      -1, LColor},//              X []
                                {     -1, LColor}};//              X []
                                
  private int[][] Rotation4 = {{      -1,    -1, LColor },// Piece Layout  X X[]
                                {LColor, LColor, LColor}};//              [][][]
            

  LPiece(int rowAt, int colAt) {
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
      result.add( new Cell(rowId + rowOffset + 1, colId) );
      result.add( new Cell(rowId + rowOffset + 2, colId) );
      result.add( new Cell(rowId + rowOffset + 2, colId + 1) );
    }
    if(pieceRotation%4 == 1){
      result.add( new Cell(rowId + rowOffset, colId) );
      result.add( new Cell(rowId + rowOffset + 1, colId) );
      result.add( new Cell(rowId + rowOffset, colId + 1) );
      result.add( new Cell(rowId + rowOffset, colId + 2) );
    }
    if(pieceRotation%4 == 2){
      result.add( new Cell(rowId + rowOffset, colId) );
      result.add( new Cell(rowId + rowOffset, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 2, colId + 1) );
    }
    if(pieceRotation%4 == 3){
      result.add( new Cell(rowId + rowOffset, colId + 2) );
      result.add( new Cell(rowId + rowOffset + 1, colId) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 1) );
      result.add( new Cell(rowId + rowOffset + 1, colId + 2) );
    }
    return result;
  }  

  ArrayList<Cell> getShadowVert(int colOffset) {
    ArrayList<Cell> result = new ArrayList<Cell>();
    if(pieceRotation%4 == 0){
      result.add( new Cell(rowId, colId + colOffset) );
      result.add( new Cell(rowId + 1, colId + colOffset) );
      result.add( new Cell(rowId + 2, colId + colOffset) );
      result.add( new Cell(rowId + 2, colId + colOffset + 1) );
    }
    if(pieceRotation%4 == 1){
      result.add( new Cell(rowId, colId + colOffset) );
      result.add( new Cell(rowId + 1, colId + colOffset) );
      result.add( new Cell(rowId, colId + colOffset + 1) );
      result.add( new Cell(rowId, colId + colOffset + 2) );
    }
    if(pieceRotation%4 == 2){
      result.add( new Cell(rowId, colId + colOffset) );
      result.add( new Cell(rowId, colId + colOffset + 1) );
      result.add( new Cell(rowId + 1, colId + colOffset + 1) );
      result.add( new Cell(rowId + 2, colId + colOffset + 1) );
    }
    if(pieceRotation%4 == 3){
      result.add( new Cell(rowId, colId + colOffset + 2) );
      result.add( new Cell(rowId + 1, colId + colOffset) );
      result.add( new Cell(rowId + 1, colId + colOffset + 1) );
      result.add( new Cell(rowId + 1, colId + colOffset + 1) );
    }
    return result;
  }   
  
}
