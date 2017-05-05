%SCRIPT TENTAX
format long;

r = [2.7  ; 2 ; 1.61; 1.20; 1.02];
phi = [ 48; 67; 83; 108; 126];
phi_rad = phi.*(pi/180);
rrec = 1./r;
cosphi = cos(phi_rad);

[coeff, res] = polminquad(cosphi, rrec, 1);
p = 1/coeff(2);
e = coeff(1)*p;

 [x, y] = pol2cart( phi_rad, r);
figure(1);
for i = 1:5
  plot(x(i), y(i)); hold on
endfor;

d = [0:0.1:2*pi];
fd = p./(1+e.*cos(d));
[d,fd] = pol2cart(d,fd);
set(gca, "title", text("string","Orbita aproximada amb parametres de l'equacio d'una conica.","fontsize", 15));
plot(d, fd, "linewidth", 1.5); hold off

%fins aqui funciona tot :)

%APROXIMACIÓ DE GRAU 3

figure(2);
[coeff2, res2] = polminquad(phi_rad, r, 3);

figure(3);
[x, y] = pol2cart( phi_rad, r); 
for i = 1:5
 plot(x(i), y(i)); hold on %graficar els punt que hem d'aproximar
endfor;
d = [phi_rad(1):0.05:phi_rad(5)]; %donar un domini al polinomi resultant del proces de minims quadrats
fd = polyval(coeff2,d);
[x,y] = deal(fd.*cos(d), fd.*sin(d));
set(gca, "title", text("string","Orbita aproximada amb polinomi de grau 3 (coord. cartesianes)","fontsize", 15));
plot(x, y, "linewidth", 1.5); hold off

%APROXIMACIÓ DE GRAU 4

figure(4);
[coeff3, res3] = polminquad(phi_rad, r, 4);

figure(5);
[x, y] = pol2cart( phi_rad, r); 
for i = 1:5
 plot(x(i), y(i)); hold on %graficar els punt que hem d'aproximar
endfor;
d = [phi_rad(1):0.05:phi_rad(5)]; %donar un domini al polinomi resultant del proces de minims quadrats
fd = polyval(coeff3,d);
[x,y] = deal(fd.*cos(d), fd.*sin(d));
set(gca, "title", text("string","Orbita aproximada amb polinomi de grau 4 (coord. cartesianes)","fontsize", 15));
plot(x, y, "linewidth", 1.5); hold off




%APROXIMACIÓ DE GRAU 4





