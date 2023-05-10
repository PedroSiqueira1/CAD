#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MIN_SIZE 5000
#define MAX_SIZE 20000
#define SIZE_STEP 1500

void multiplyMatrixByVector(int** matrix, int* vector, int n, int m, int* result) {
    for (int j = 0; j < n; j++) {
        result[j] = 0;
        for (int i = 0; i < m; i++) {
            result[i] += matrix[i][j] * vector[j];
        }
    }
}

int** generateRandomMatrix(int n, int m) {
    int** matrix = malloc(n * sizeof(int*));
    for (int i = 0; i < n; i++) {
        matrix[i] = malloc(m * sizeof(int));
        for (int j = 0; j < m; j++) {
            matrix[i][j] = rand() % 10;
        }
    }
    return matrix;
}

int* generateRandomVector(int n) {
    int* vector = malloc(n * sizeof(int));
    for (int i = 0; i < n; i++) {
        vector[i] = rand() % 10;
    }
    return vector;
}

int main() {
    srand(time(NULL));

    for (int size = MIN_SIZE; size <= MAX_SIZE; size += SIZE_STEP) {
        int** matrix = generateRandomMatrix(size, size);
        int* vector = generateRandomVector(size);
        int* result = malloc(size * sizeof(int));

        clock_t start_time = clock();
        multiplyMatrixByVector(matrix, vector, size, size, result);
        clock_t end_time = clock();

        double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
        printf("Size: %d, Time: %lf seconds\n", size, elapsed_time);

        for (int i = 0; i < size; i++) {
            free(matrix[i]);
        }
        free(matrix);
        free(vector);
        free(result);
    }

    return 0;
}
