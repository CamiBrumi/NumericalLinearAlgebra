#include "sistema.hh"

double norma_inf(double **a, int n) {
  double max_per_cols = -1;
  for (int i = 0; i < n ; ++i) {
    double sum = 0;
    for (int j = 0; j < n; ++j) {
      sum += fabs(a[j][i]);
    }
    if (sum > max_per_cols) max_per_cols = sum;
  }
  return max_per_cols;
}
