PROGRAM matrix_vector_multiply

  IMPLICIT NONE
  
  INTEGER, PARAMETER :: MIN_SIZE = 5000
  INTEGER, PARAMETER :: MAX_SIZE = 20000
  INTEGER, PARAMETER :: SIZE_STEP = 1500
  
  INTEGER :: i, j, n
  REAL :: start, finish, time
  INTEGER, DIMENSION(:,:), ALLOCATABLE :: A
  INTEGER, DIMENSION(:), ALLOCATABLE :: x, y


  ! Main program
  DO n = MIN_SIZE, MAX_SIZE, SIZE_STEP
    ALLOCATE(A(n,n))
    ALLOCATE(x(n))
    ALLOCATE(y(n))
    
    CALL RANDOM_SEED()


    CALL generateRandomMatrix(n)
    CALL generateRandomVector(n)
    
    ! Measure time
    call cpu_time(start) 
    CALL multiplyMatrixByVector(A, x, y)
    call cpu_time(finish) 
    time = finish - start
    
    ! Print results
    PRINT *, "n = ", n, " time = ", time
    
    DEALLOCATE(A)
    DEALLOCATE(x)
    DEALLOCATE(y)
    
  END DO

  CONTAINS
  
  ! Function that multiplies matrix A and vector x

  SUBROUTINE multiplyMatrixByVector(A, x, y)
    INTEGER, DIMENSION(:,:), INTENT(IN) :: A
    INTEGER, DIMENSION(:), INTENT(IN) :: x
    INTEGER, DIMENSION(:) :: y
    INTEGER :: i, j, n
    n = SIZE(x)
    DO i = 1, n
      y(i) = 0
      DO j = 1, n
        y(i) = y(i) + A(i,j) * x(j)
      END DO
    END DO
  END SUBROUTINE multiplyMatrixByVector
  
  ! Function that generates a random matrix A nxn
  SUBROUTINE generateRandomMatrix(n)
    INTEGER :: n, i, j
    REAL :: number
    INTEGER, DIMENSION(n,n) :: A
    DO i = 1, n
      DO j = 1, n
        CALL RANDOM_NUMBER(number)
        A(i,j) = INT(10.0 * number)
      END DO
    END DO
  END SUBROUTINE generateRandomMatrix

  ! Function that generates a random vector x nx1
  SUBROUTINE generateRandomVector(n)
    INTEGER :: n, i
    REAL :: number
    INTEGER, DIMENSION(n) :: x
    DO i = 1, n
      CALL RANDOM_NUMBER(number)
      x(i) = INT(10.0 * number)
    END DO
  END SUBROUTINE generateRandomVector
  

END PROGRAM matrix_vector_multiply
