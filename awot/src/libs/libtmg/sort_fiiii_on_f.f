      SUBROUTINE SORT_FIIII_ON_F(A,I1,I2,I3,I4,N,ELIM_DUPLICATES,M)

C  Thomas Matejka NOAA/NSSL 3 July 1995

C  This subroutine sorts the N elements of arrays A, I1, I2, I3, and I4
C  in order of ascending A.

C  If ELIM_DUPLICATES is .TRUE., then data having duplicate values of A
C  are eliminated.

C  The number of elements in the sorted list is returned as M.

      IMPLICIT NONE
      LOGICAL ELIM_DUPLICATES
      INTEGER J,K,K_MIN,N,M,ISTORE
      INTEGER I1(N),I2(N),I3(N),I4(N)
      REAL STORE,A_MIN
      REAL A(N)

C  Sort the list.
      IF(N.GT.1)THEN
         DO J=1,N-1
            A_MIN=A(J)
            K_MIN=J
            DO K=J+1,N
               IF(A(K).LT.A_MIN)THEN
                  A_MIN=A(K)
                  K_MIN=K
               ENDIF
            ENDDO
            IF(K_MIN.NE.J)THEN
               STORE=A(J)
               A(J)=A(K_MIN)
               A(K_MIN)=STORE
               ISTORE=I1(J)
               I1(J)=I1(K_MIN)
               I1(K_MIN)=ISTORE
               ISTORE=I2(J)
               I2(J)=I2(K_MIN)
               I2(K_MIN)=ISTORE
               ISTORE=I3(J)
               I3(J)=I3(K_MIN)
               I3(K_MIN)=ISTORE
               ISTORE=I4(J)
               I4(J)=I4(K_MIN)
               I4(K_MIN)=ISTORE
            ENDIF
         ENDDO

C  Eliminate duplicates.
         IF(ELIM_DUPLICATES)THEN
            M=N
            J=1
            DOWHILE(J.LT.M)
               IF(A(J).EQ.A(J+1))THEN
                  IF(J+1.LT.M)THEN
                     DO K=J+1,M-1
                        A(K)=A(K+1)
                        I1(K)=I1(K+1)
                        I2(K)=I2(K+1)
                        I3(K)=I3(K+1)
                        I4(K)=I4(K+1)
                     ENDDO
                  ENDIF
                  M=M-1
               ELSE
                  J=J+1
               ENDIF
            ENDDO
         ELSE
            M=N
         ENDIF
      ELSE
         M=N
      ENDIF

C  Done.
      RETURN
      END

