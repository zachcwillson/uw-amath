% Homework 2
clear all; close all; clc
% Problem 1
A1 = []; A2 = []; A3 = [];
%1A
test = 0;
count = 2;
while test < 10^16 
    test = cond(hilb(count), inf);
    if test < 10^16
       A1 = [A1; test]; 
    end
    count = count + 1;
end
%1B
A2 = zeros(10, 2);
for loop = 2:11
    z = ones(loop, 1);
    A2(loop - 1, 1) = norm(z - hilb(loop) \ (hilb(loop) * z), inf);
    A2(loop - 1, 2) = norm(z - hilb(loop) * (hilb(loop) \ z), inf);
end
%1C
A3 = zeros(10, 2);
for loop = 2:11
    z = ones(loop, 1);
    A3(loop - 1, 1) = norm(z - invhilb(loop) * (hilb(loop) * z), inf);
    A3(loop - 1, 2) = norm(z - hilb(loop) * (invhilb(loop) * z), inf);
end
save('A1.dat','A1','-ascii'); save('A2.dat','A2','-ascii'); save('A3.dat','A3','-ascii')




% Problem 2
%2a
A4 = []; A5 = []; A6 = []; A7 = []; A8 = [];
p1 = [4 -1 -1 0 0 0 0 0 0 0;
     -1 5 -1 -1 -1 0 0 0 0 0;
     -1 -1 5 0 -1 -1 0 0 0 0;
      0 -1 0 5 -1 0 -1 -1 0 0;
      0 -1 -1 -1 6 -1 0 -1 -1 0;
      0 0 -1 0 -1 5 0 0 -1 -1;
      0 0 0 -1 0 0 4 -1 0 0;
      0 0 0 -1 -1 0 -1 5 -1 0;
      0 0 0 0 -1 -1 0 -1 5 -1;
      0 0 0 0 0 -1 0 0 -1 4]; % huge
pAnswer = [0; 0; 0; 0; 0; 0; 1; 1; 1; 1];
A4 = (p1 \ pAnswer);
%2b
b2 = [0; 0; 0; 0; 0; 0; 0.2; 0.25; 0.25; 0.2];
px0 = [1; 0; 0; 0; 0; 0; 0; 0; 0; 0];
Di = diag(diag(p1));
Lower = tril(p1 - Di);
Upper = triu(p1 - Di);
tol=10^-4;
XXnew = [];
x = px0;
XXnew = [x];
for loop = 1:40
   xOld = x;
   x = Di\(pAnswer - (Lower + Upper)*xOld);
   XXnew = [XXnew, x];
   if norm(x-xOld, inf) < 1e-4
      break
   end
end
%2c
D = diag(diag(p1));
S = tril(p1);
T = triu(p1) - D;
x0 = [1; 0;0;0;0;0;0;0;0;0];
error = 2*tol;
x0(:,1) = x0;
iterations = 1;
while (error > tol && iterations < 30) 
   iterations = iterations + 1;
   x0(:,iterations) = S\(pAnswer - T*x0(:, iterations -1 ));
   error = norm(x0(:,iterations) - x0(:, iterations - 1), inf);
end
actual = iterations - 1;
A6 = x0;
%2d
C = bicg(p1, pAnswer);
A7 = [C;6];
%2e
M2 = [ 0 1/4 1/4 0 0 0 0 0 0 0
       1/2 0 1/4 1/4 1/6 0 0 0 0 0
       1/2 1/4 0 0 1/6 1/4 0 0 0 0
       0 1/4 0 0 1/6 0 1/2 1/4 0 0
       0 1/4 1/4 1/4 0 1/4 0 1/4 1/4 0
       0 0 1/4 0 1/6 0 0 0 1/4 1/2
       0 0 0 1/4 0 0 0 1/4 0 0 
       0 0 0 1/4 1/6 0 1/2 0 1/4 0
       0 0 0 0 1/6 1/4 0 1/4 0 1/2
       0 0 0 0 0 1/4 0 0 1/4 0];
[V, D] = eig(M2);
A8 = V(:,1);

save('A4.dat','A4','-ascii'); save('A5.dat','XXnew','-ascii'); save('A6.dat','A6','-ascii'); save('A7.dat','A7','-ascii'); save('A8.dat','A8','-ascii')


% Problem 3
A9 = []; A10 = []; A11 = []; A12 = []; A13 = [];

N = [ 7.24; 9.64; 12.87; 17.07; 23.19;
 31.44; 38.56; 50.19; 62.98; 76.21;
 92.23;106.02;123.20;132.16;151.33;
 179.32;203.30;226.54;248.71;281.42;
 307.75];
%3ai
C = 500;
y = log((C./N) - 1);
year = (-90:10:110).';
P = polyfit(year, y, 1);
A9 = P;

%3aii
left = [];
for j = -90:10:110
    left = [left; j 1];
end

newA = lsqr(left, y).';

newA = [newA, 2];
savd = [abs(newA(1) - P(1)), abs(newA(2) - P(2)), 2];
A10 = savd;
%3aiii
YT = [];
for time = 120:10:300
    YT = [YT; polyval(P, time)];
end
NT = C./(1 + exp(YT));
A11 = NT;
%3bi
x = [0.01 , 1, 500];
f = @(x, t) x(3)./(1+x(2)*exp(-x(1) * t));
A12 = lsqcurvefit(f, x, year, N);
%3bii
time = [120:10:300].';
A13 = f(A12, time);
save('A9.dat','A9','-ascii'); save('A10.dat','A10','-ascii') ;save('A11.dat','A11','-ascii'); save('A12.dat','A12','-ascii'); save('A13.dat','A13','-ascii')


% Problem 4
A14 = []; A15 = []; A16 = [];
%4a
t1 = [-90:10:110].';
p = polyfit(t1, N, 20);
t2 = [-90:110].';
A14 = polyval(p, t2);
%4b
A15 = interp1(t1, N, t2);
%4c
A16 = spline(t1, N, t2);




save('A14.dat','A14','-ascii'); save('A15.dat','A15','-ascii'); save('A16.dat','A16','-ascii')




