format long;

r = [2.7  ; 2 ; 1.61; 1.20; 1.02];
phi = [ 48; 67; 83; 108; 126];
phi_rad = phi.*(pi/180);

[coeff, res] = polminquad(cosphi, rrec, 1);
p = 1/coeff(2);
e = coeff(1)*p;

 [x, y] = pol2cart( phi_rad, r);
for i = 1:5
  plot(x(i), y(i)); hold on
endfor;

[coeff2, res2] = polminquad(phi_rad, r, 3); %se'ns fa una grafica nova, com arreglar

d = [phi_rad(1):0.1:phi_rad(5)];
fd = polyval(coeff,d);

[d,fd] = pol2cart(d,fd);
for i = 1:5
  plot(x(i), y(i)); hold on
endfor;
plot (d, fd); hold off

[coeff2, res2] = polminquad(phi_rad, r, 4);

d = [phi_rad(1):0.1:phi_rad(5)];
fd = polyval(coeff,d);

[d,fd] = pol2cart(d,fd);
for i = 1:5
  plot(x(i), y(i)); hold on
endfor;
plot (d, fd); hold off