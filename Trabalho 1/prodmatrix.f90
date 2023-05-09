
#define MIN_SIZE 5000
#define MAX_SIZE 20000
#define SIZE_STEP 1500

! Function that multiply matrix A and vector x

function multiplyMatrixByVector(A, x)
  n = length(x);
  y = zeros(n,1);
  for i = 1:n
    for j = 1:n
      y(i) = y(i) + A(i,j)*x(j);
    endfor
  endfor
  y
endfunction

! Function that generate a random matrix A nxn

function A = generateRandomMatrix(n)
  A = zeros(n,n);
  for i = 1:n
    for j = 1:n
      A(i,j) = rand();
    endfor
  endfor
  A
endfunction

! Function that generate a random vector x nx1

function x = generateRandomVector(n)
  x = zeros(n,1);
  for i = 1:n
    x(i) = rand();
  endfor
  x
endfunction

! 

