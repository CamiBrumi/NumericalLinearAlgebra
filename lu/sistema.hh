#include <cmath>
#include <iostream>


int sistema(double **a, double x[], double b[], int n, double tol);

void resol(double **a, double x[], double b[], int n, int perm []);

int pivotatge_parcial(double **a, int n, double tol, const int k);

int lu(double **a, int n, int perm[], double tol);

void interc(double **a, int b, int c);

void permuta(int perm[], int pos1, int pos2);

void escriu(double **a, int n);

void llegeix(double **a, int n);

void llegeix_taula(double v[], int n);

void escriu_taula(double p[], int n);

double residu( double **desc, int n, double b[], double x[]);


