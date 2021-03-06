      SUBROUTINE GPTSYM (GPLST,X,U,SYM,DEFORM)
C
      INTEGER GPLST(1),SYM(2),DEFORM
      REAL    X(3,1),U(2,1)
      COMMON /BLANK/ NGP
C
      CALL SYMBOL (0,0,0,-1)
C
C     IF THE GRID POINT INDEX IS 0 (NOT IN SET) OR NEGATIVE (EXCLUDED),
C     NEVER PUT A SYMBOL AT THAT GRID POINT.
C
      DO 110 I = 1,NGP
      J  = GPLST(I)
      IF (J .LE. 0) GO TO 110
      IF (DEFORM .NE. 0) GO TO 105
      XX = X(2,J)
      YY = X(3,J)
      GO TO 106
  105 XX = U(1,J)
      YY = U(2,J)
  106 CALL SYMBOL (XX,YY,SYM,0)
  110 CONTINUE
C
      CALL SYMBOL (0,0,0,1)
      RETURN
      END
