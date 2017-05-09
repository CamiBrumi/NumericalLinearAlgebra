    
    
/*
 * PRE: a està descomposada en lu
 *      n és la mida de la matriu
 *      paritat és el resultat de la funció sistema, i ha de valer 1 o -1 (si val 0, la matriu és singular)
 * POST: no hi ha canvis en cap dels paràmetres que es passen, i el resultat és el determinant de la matriu*/
    
double det(double **a, int n, double tol, int paritat){
    //càlcul del determinant, és (la paritat de lu)*det(U), que com és upper-diagonal, és el producte dels termes de la diagonal de a 
    double det = 1;
    for(int i= 0; ++i; i < n ){
        det *= a[i][i];
    }
    return det;
}