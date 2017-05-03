% polimquad.m

function [coeff,norm2_res]=polminquad(x,y,m)
format long ;
%hem de comprovar 0 ≤ m ≤ n
n = size(x);
if ( 0 > m || m > n)
  disp('no es compleix 0 ≤ m ≤ n')
  return
  endif;
  

for i = 1:m+1;
  A(:,i)=x.^(i-1);
endfor;


%ara farem la descomposició A = QR

n = rows(A);
m = columns(A);

Q=zeros(n,m);
R=zeros(m,m);

%fem una còpia de la matriu original
AA = A;

for i = 1:m
  R(i,i)=norm(A(:,i),2);
  Q(:,i)=A(:,i)/R(i,i); %NORMALITZEM LA COLUMNA i-essima
  for j = i+1:m %bucle per ortogonalitzar la resta de columnes de A respecte Q(:,i)
    R(i,j)=dot(Q(:,i),A(:,j)); %producte escalar de la fila j-essima de A amb la columna nova de Q
    A(:,j)=A(:,j)-R(i,j)*Q(:,i) %nova columna de A
  endfor;
endfor;

%ara farem la substitucio enrera per resoldre el sistema R*coeff = Q'*y
b = (Q')*y;
coeff = zeros(m,1);

disp("La norma sub-infinit ||Q'Q - Id || es:")
N = Q'*Q - eye(m);
disp(norm( N, Inf))

for k = 1:m
  i = (m - k)+1;
  acum = 0;
  for j = k:m
  acum = acum + R(i,j)*coeff(j);
  endfor;
  coeff(i) = (b(i) - acum )/R(i,i);
endfor;

norm2_res = norm( A*coeff - y, 2)
for i = 1:n
plot(x(i),y(i),[-7,7], [-7,7]); hold on
endfor;
plot(x,polyval(coeff,x));
endfunction;

