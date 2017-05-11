#include "sistema.hh"
#include <iostream>

using namespace std;

const double TOLDET = 0.0000000001;

int inversa(double **a, double **inv_a, int n, double tol) {
    

    int perm[n];
	for (int i = 0; i < n; ++i) perm[i] = i;

    int res = lu(a, n, perm, tol);
    if (res == 0) return 0; // si la descomposicio LU no ha estat exitosa
    
    if (det(a, n, res) < TOLDET) return 0; //si el determinant és massa petit d'acord amb la tolerància
    
    for (int i = 0; i < n; ++i) {
        //creem el vector b terme independent que es la columna i-èssima de la matriu identitat
        double *ei = new double [n];
        for( int j = 0; j < n; ++j) ei[j] = 0;
        ei[i] = 1;
        double col_i_inva[n];
        sistema_1lu(a, col_i_inva, ei, n, perm);
        for (int j = 0; j < n; ++j) inv_a[j][i] = col_i_inva[j];
    }
    return 1;
    //càlcul norma residu ||a*inv_a - I||
    /*double res[n];


    for( int  i = 0; i < n; ++i){ //bucle del producte ax (-b)
        double aux = 0;
        for( int j = 0; j < n; ++j){
            aux += aprima[i][j]*x[j];
        }
        res[i] = aux - baux[i];
    }
    double norma = 0;
    for( int i = 0; i < n; ++i){ //bucle de la norma
        norma += res[i]*res[i];
    }

    norma = sqrt(norma);
    cout << " La norma del residu ||Ax - b|| és: " << norma << '.' << endl;

	return resultat;	*/
}
