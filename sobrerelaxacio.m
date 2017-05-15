% Sobrerelaxacio
 function [x,iter]=sobrerelaxacio(A,b,x,w)
 format long ;	
tol=10^-12;
maxit=100;
%descomponem A en la suma de la seva diagonal i triangles sup/inf
% A = L + D + U
D = diag(diag(A)); %la diagonal
L = tril(A, -1); %aquest 1 fa q no inclogui la diagonal
U = triu( A, 1 );

INVDWL = inv(D+w.*L);

BSR = INVDWL*( (1-w).*D - w.*U);

normB=norm(BSR,2);
X1=sprintf('Norma sub-2 de B_SR: %f', normB);
disp(X1)

if (normB>=1) 
  disp('Radi espectral de B mes gran o igual que 1. Sobrerelaxacio no convergeix')
  return; 
  endif;

% Calculem la velocitat de convergència del mètode de jacobi
v_conveg = -log(max(abs(eig(BSR))))
CSR = w.*INVDWL*b;

iter=0;
errabs=1;
x0=x; xnext=x0;

while ( (abs(errabs) > tol) && (iter < maxit))
    x=xnext;		 
    iter=iter+1;
    xnext=BSR*x+CSR;
    errabs=norm(xnext-x,inf); 
end

XD=sprintf('\nEstimacio error absolut a la solucio iterativa: %e',errabs);
disp(XD) 
XD1=sprintf('\nIteracions usades: %d \n',iter);
disp(XD1) 
disp('Solucio aproximada:');
disp(xnext)
endfunction


% Exemple de crida des de la finestra de comandes:
% >>A=[5 -2 1;-1 -7 3;2 -1 8];
% >> x=[0 0 0]';
% >> b=[3 -2 1]';
% >> gauss_seidel(A,b,x)

% A = [ 4 0 0; -2 6 0; -1 1 7 ]