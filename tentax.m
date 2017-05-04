%SCRIPT TENTAX
format long;

r = [2.7  ; 2 ; 1.61; 1.20; 1.02];
phi = [ 48; 67; 83; 108; 126];
phi_rad = phi.*(pi/180);
rrec = 1./r;
cosphi = -cos(phi_rad);

[coeff, res] = polminquad(cosphi, rrec, 1);
p = 1/coeff(2);
e = coeff(1)*p;

 [x, y] = pol2cart( phi_rad, r);
for i = 1:5
  plot(x(i), y(i)); hold on
endfor;

d = [0:0.1:2*pi];
fd = p./(1+e.*cos(d));
[d,fd] = pol2cart(d,fd);

plot (d, fd);

%fins aqui funciona tot :)

%anem a fer l'aproximacio per polinomis





