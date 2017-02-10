clear all; close all; clc
%1 - done
%1a
X = 0:0.01:5;
b = 10.*((X.^3)./((2.^3)+(X.^3)));
c = 2.*X;
f = b - c;
A1 = [b.' c.' f.'];
save('A1.dat', 'A1', '-ascii')
clear all; close all; clc
%1b
c = @(x) 2*x;
b = @(x) 10.*((x.^3)./((2.^3)+(x.^3)));
f = @(x) -(b(x)-c(x));
xMax = fminsearch(f, 5, optimset('Tolx', 1e-4));
A2 = [xMax; -f(xMax)];
save('A2.dat', 'A2', '-ascii');
%1c
rng(0) % Fix the random seed – added by Dr. King-Fai Li 
x0 = 5;
rng(0);
ngen = 200;
q = 10;
x = x0 + randn(1,50);
arr = [];
for jgen = 1:ngen
   f0 = f(x);
   [f0, idx] = sort(f0);
   x = x(idx(1:q));
   arr = [arr; [x(1), -f0(1)]];
   for k = 1:4
      x = [x x(1:q) + randn(1,q)/jgen]; 
   end
end
save('A3.dat', 'arr', '-ascii');
clear all; close all; clc
%2 - done
%2a
l = [1000, 600, 301; 10, 5, 3; 4, 2, 3; 2, 1, 1];
r = [2800000; 25000; 10000; 6000];
l2 = [38; 22; 12];
A4 = [l r];
save('A4.dat', 'A4', '-ascii')
%2b
b = [0; 0; 0];
u = [];
A5 = [l2 b u];
save('A5.dat', 'A5', '-ascii')
%2c
[lin,bestval]= linprog(-l2, l, r, [], [], b, u);
A6 = [round(lin);-round(bestval)];
save('A6.dat', 'A6', '-ascii')
%3 - done
t = [-90:10:110];
N = [7.24; 9.64; 12.87; 17.07; 23.19; 31.44; 38.56; 50.19; 62.98; 76.21; 92.23; 106.02; 123.20; 132.16; 151.33; 179.32; 203.30; 226.54; 248.71; 281.42; 307.75]; 
dx = t(2)-t(1);
dfdx = zeros(21,1);
dfdx(2:end - 1) = (N(3:end) - N(1:end - 2)) ./ (2 .* dx);
dfdx(1) = (-3 .* N(1) + 4 .* N(2) - N(3)) ./ (2 .* dx);
dfdx(end) = (3 .* N(end) - 4 .* N(end - 1) + N(end - 2)) ./ (2 .* dx); 
A7 = dfdx;
save('A7.dat', 'A7', '-ascii')

%clear all; close all; clc
%4 - done
x = [0.308 0.325 0.342 0.359 0.376 0.393 0.410 0.427 0.444 0.461 0.478];
y = [640 794 885 943 1034 1064 1114 1152 1204 1222 1239];
h = x(2) - x(1);
y1 = y.*x.*0.7051;
y2 = x.*0.7051;
sum1 = (h/3)*sum(y1(1:2:end-2) + 4*y1(2:2:end-1)+y1(3:2:end)); %answer to 4a
sum2 = (h/3)*sum(y2(1:2:end-2) + 4*y2(2:2:end-1)+y2(3:2:end));
Trap1 = trapz(x,y1); %answer to 4b
Trap2 = trapz(x,y2);
Tt = Trap1./Trap2;
sum = sum1./sum2;
A8 = [sum; Tt];
save('A8.dat', 'A8', '-ascii')
%5 - done
A9 = quad(@(x) 10./(-x.*sqrt(x)), 10, 5, 1e-4);
save('A9.dat', 'A9', '-ascii')