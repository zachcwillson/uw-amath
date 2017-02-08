% Zach Willson
% AMATH 352
% Homework 1 - Due 1/13/17
clear all; close all; clc

%Problem 5 - done
x = [exp(1); 5^(1/3); -6*pi; 42];
y = [4; 2; -5; 20];
a1 = zeros(4,1);
a2 = 0;
% do part a
a1(1,1) = exp(1) + 5^(1/3) + (6 * pi) + 42;
a1(2,1) = sqrt(x(1,1)^2 + x(2,1)^2 + x(3,1)^2 + x(4,1)^2);
a1(3,1) = (x(1,1)^64 + x(2,1)^64 + x(3,1)^64 + x(4,1)^64)^(1/64);
a1(4,1) = 42;
% do part b
magA = sqrt(x(1,1)^2 + x(2,1)^2 + x(3,1)^2 + x(4,1)^2);
magB = sqrt(y(1,1)^2 + y(2,1)^2 + y(3,1)^2 + y(4,1)^2);
theta = acos(dot(x,y) / (magA * magB));
a2 = theta;
save('A1.dat', 'a1', '-ascii')
save('A2.dat', 'a2', '-ascii')

%Problem 6
%a - done
a3 = 0;
count = 0;
for index=1:2:1003
    if mod(count, 2) == 0
       a3 = a3 + 1 / index; 
    else
        a3 = a3 - 1 / index;
    end
    count = count + 1;
end
save('A3.dat', 'a3', '-ascii')
%b
a4 = 0;
for index1=1:2:1000
   a4 = a4 + 1 / (index1^2 * (index1+2)^2);
end
save('A4.dat', 'a4', '-ascii')

%Problem 7 - done
a5 = 0;
a6 = 0;
for index=3:20
   a5 = a5 + (index + 1) / (index - 1);
end
a5 = a5 * 20;
for index=3:100
   a6 = a6 + (index + 1) / (index - 1);
end
a6 = a6 * 100;
save('A5.dat', 'a5', '-ascii')
save('A6.dat', 'a6', '-ascii')

%Problem 8 - done
x1 = 0;
x2 = 0;
x3 = 1;
a7 = zeros(100,1);
a7(1,1) = x1;
a7(2,1) = x2;
a7(3,1) = x3;
for k = 1:97
    xkp2 = x2 + x1 + x3;
    x1 = x2;
    x2 = x3;
    x3 = xkp2;
    a7(k + 3,1) = x3;
end
save('A7.dat', 'a7', '-ascii')
a8 = a7(100,1) / a7(99,1);
save('A8.dat', 'a8', '-ascii')





