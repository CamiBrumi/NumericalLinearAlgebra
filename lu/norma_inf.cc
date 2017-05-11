#include "sistema.hh"

double norma_inf(double **a, int n) {
  double max_per_files = -1;
  for (int i = 0; i < n ; ++i) {
    double sum = 0;
    for (int j = 0; j < n; ++j) {
      sum += fabs(a[i][j]);
    }
    if (sum > max_per_files) max_per_files = sum;
  }
  return max_per_files;
}
