% Zach Willson
% AMATH 352
% Homework 4
clear all; close all; clc
A1 = [];
A2 = [];
A3 = [];
A4 = [];
A5 = [];
A6 = [];
A7 = [];
A8 = [];
A9 = [];

A = zeros(100, 10);
for index=1:100
   A(index,1) = 1;
   A(index, 2) = 2;
   A(index, 3) = 3;
   A(index,4) = 4;
   A(index, 5) = 5;
   A(index, 6) = 6;
   A(index,7) = 7;
   A(index, 8) = 8;
   A(index, 9) = 9;
   A(index, 10) = 10;
end
B = [1 8 -1 0; 4 2 3 3; 5 -3 0 pi; 4 1 -6 2];

v = zeros(100,1);
v(1,1) = -2;
v(2,1) = 1;
C = 99.^2 .* toeplitz(v);
x = linspace(1, 2);
A1 = A;
A2 = B;
A3 = C;
A4p1 = 6 * B ^ 4;
A4p2 = 0.5 .* sin(B);
A4p3 = - 2 .* B;
A4 = A4p1 + A4p2 + A4p3;
f = @(x) x.^3 + 2 ./ x.^2 - 4 .* cos(x);
A5 = f(x);

M0 = [17 24 1 8 15; 23 5 7 14 16; 4 6 13 20 22; 10 12 19 21 3; 11 18 25 2 9];
M = 1 ./ 65 .* M0;
A6 = M;
A7 = 0.2;
M1 = 1 ./ 10 .* M0;
A8 = 4;
M2 = 1 ./ 100 .* M0;
A9 = 0;






save('A1.dat', 'A1', '-ascii')
save('A2.dat', 'A2', '-ascii')
save('A3.dat', 'A3', '-ascii')
save('A4.dat', 'A4', '-ascii')
save('A5.dat', 'A5', '-ascii')
save('A6.dat', 'A6', '-ascii')
save('A7.dat', 'A7', '-ascii')
save('A8.dat', 'A8', '-ascii')
save('A9.dat', 'A9', '-ascii')