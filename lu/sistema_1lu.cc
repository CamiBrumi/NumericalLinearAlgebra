#include "sistema.hh"
#include <iostream>
#include <vector>

using namespace std;
//retorn la norma ||Ax - b||
double sistema_1lu(double **a, double x[], double ei[], int n, int perm[]){ //ara la x serà cada una de les columnes de la inversa
	//PRE: a apuntador d'apuntadors de files de la matriu A, n dimensió de la matriui, tol tolerància, i b terme intependent
    vector<vector<double> > aprima(n, vector<double>(n));
    //copio la matriu a element a element
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) aprima[i][j] = a[i][j]; // la a ja està descomposada en a = LU
    }
    vector<double> baux(n);
    for (int i = 0; i < n; ++i) baux[i] = ei[i];
	//int resultat = lu(a, n, perm, tol); JA TENIM FETA LA LU
	//Ara hem de resoldre n sistemes lineals per a fer la inversa ==> LU*b_j = perm*e_j

    resol(a, x, ei, n, perm); // ja permuta el vector x





    //càlcul norma residu
    double res[n];


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

	return norma;
}

	/*POST:
	 * 	la matriu A, que està descomposada LU (però és inútil a partir d'ara perquè no tenim per[]
	 * 	 x és la solució del sistema,
	 * 	i retorna:
	 * 1 si descomposició exitosa amb # parell de permutacions
	 * -1 "" "" si nombre senar
	 * 0 si és singular respecte la tolerància, i hem destruit la matriu.
	 */
