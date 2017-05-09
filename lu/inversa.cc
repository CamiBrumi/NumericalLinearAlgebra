# define  TOLDET = 1.e-10;

int inversa(double **a, double **inva, int n, double tol) {
    if (det(a) < TOLDET) return -1;
    
    int perm[n];
	for (int i = 0; i < n; ++i) perm[i] = i;
    
    int res = lu(a, n, perm, 0.00000000001);
    for (int i = 0; i < n; ++i) {
        //creem el vector b terme independent que es la columna i-èssima de la matriu identitat
        double *b = new double [n];
        for( int j = 0; j < n; ++j) b[j] = 0;
        b[i] = 1;
        
    }
    
    
    
}
