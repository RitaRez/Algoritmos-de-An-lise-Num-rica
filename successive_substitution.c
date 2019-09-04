#include<stdio.h>
#include<stdlib.h>

void imprime_matriz(float **mat, int x, int y){
    printf("\nSistema:\n");
    for(int i = 0; i < y; i++){
        for(int j = 0; j < x; j++){
            if( j + 1 != x)
                if(j == 0)
                    printf("%0.1f%c ", mat[i][j], (char)j+65);
                else
                    printf(" + %0.1f%c ", mat[i][j], (char)j+65);
            else
                printf("= %0.1f", mat[i][j]);
        }
        printf("\n");
    }
}

float *sucessive_substitution(float**mat, int x, int y){ //i = linhas, j = colunas
    
    int i = x, j = y;
    float *solution = (float*) malloc (i * sizeof(int));

    if(mat[i - 1][0] == 0){
        for(int a = i - 1; a >= 0; a--){
            solution[a] = mat[i-1][j]/mat[i-1][j-1];
            i--;
        }
    }
    return solution;
}

float **leitor_de_matriz(int y, int x){

    

    float **mat = (float **) malloc(x * sizeof(float));
    for(int i = 0; i < y; i++){
        mat[i] = (float*) malloc(y * sizeof(float));
    }

    for(int i = 0; i < y; i++){
        printf("\nDigite os elementos da matriz extendida expressão por expressão separados por enter: \n");
        for(int j = 0; j < x; j++){
            scanf("%f", &mat[i][j]);
        }
    }
    imprime_matriz(mat, x, y);

    return mat;
}

int main(){

    int i, j;
    printf("Digite a quantidade de variaveis do sistema: ");
    scanf("%d", &j);
    printf("Digite a quantidade de expressões do sistema : ");
    scanf("%d", &i);
    j++;
    
    float **mat = leitor_de_matriz(i, j);
    float *solution = sucessive_substitution(mat, i, j-1);
    
    for (int a = 0; a < i; a++){
        printf("%f ", solution[a]);
    }
    
    return 0;
}