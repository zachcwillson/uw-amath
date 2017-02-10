% Zachary Willson
% zach18@uw.edu
% 1435474
% Homework 1

clear all; close all; clc

% Problem 1

A = [1, -6; -2, 5];
B = [0, 7; -7 0];
C = [1, -9, 5; 2, 0, -5];
D = [-1, 0; 0, 4; 3, 0];
x = [1; 0];
y = [0; 1];
z = [-1; 2; -3];

A1 = A + B;                % a
A2 = 2 * x + 3 * y;        % b
A3 = A * y;                % c
A4 = B*((2*x)-(3*y));      % d
A5 = D.' * z;                  % e
A6 = C.' * x + 3 * z;      % f
A7 = C * D;               % g
A8 = B * A;                % h
A9 = A - ((D.') * (C.'));      % i
A10 = D(1, :);             % j
A11 = C(1, 2);             % k
A12 = D(2 : end, 2);  % l
A13 = D.^2;                % m

for j = 1 : 13 % saves each in format A(j).dat for variable A(j) in -ascii
    save (['A', num2str(j), '.dat'], ['A', num2str(j)], '-ascii') 
end

clear all; close all; clc

% Problem 2

x1 = 200;
for j = 1 : 2000
    x1 = abs(x1 - 0.1);

    
end
%TRY THIS? sum(ones([max of for loop], 1)*increment)
%200 - sum(ones(2000, 1)*0.1)

x2 = 200;
for j = 1 : 1600
   x2 = abs(x2 - 0.125);
end

x3 = 200;
for j = 1 : 1000
   x3 = abs(x3 - 0.2);
end

x4 = 200;
for j = 1 : 800
   x4 = abs(x4 - 0.25);
end

x5 = 200;
for j = 1 : 500
    x5 = abs(x5 - 0.4);
end

x6 = 200;
for j = 1 : 400
   x6 = abs(x6 - 0.5);
end
xTotal = [x1, x2, x3, x4, x5, x6];
save ('A14.dat', 'xTotal', '-ascii')

clear all; close all; clc

% Problem 3
xr = 200;
xl = 100;
xStorage = [];
for loop = 1 : 1000
    xc = (xl + xr) / 2;
    xStorage = [xStorage; xc];
    fc = sqrt((xc * 9.8) ./ 0.25).* tanh(sqrt(0.25 * 9.8 ./ xc) .* 4) - 36;
    if fc < 0
        xl = xc;
    else
        xr = xc;
    end
    if abs(fc) < 10^(-4)
        break
    end
end
final = @(x) sqrt((x * 9.8) ./ 0.25).* tanh(sqrt(0.25 * 9.8 ./ x) .* 4.0) - 36.0;
fTerminal = fzero(final, 100, optimset('Tolx', 1ef-6));
xStorage = [xStorage; fTerminal];
save('A15.dat', 'xStorage', '-ascii')

%clear all; close all; clc

% Problem 4

% Part A
A = [40, -20, -5; -20, 75, -25; -5, -25, 40];
[L, U, P] = lu(A);
save('A16.dat', 'A', 'P', 'L', 'U', '-ascii')

% Part B
ender1 = zeros(3,26);
loopVar = 1;
% Part C
ender2 = zeros(3,26);
enderFinal = zeros(3,26);
for v1 = 49 : 2 : 99
    ender1(:, loopVar) = A \ [v1; 0; 50];
    ender2(:, loopVar) = inv(A) * [v1; 0; 50];
    enderFinal(:, loopVar) = abs((ender1(:, loopVar) - ender2(:, loopVar)));
    loopVar = loopVar + 1;
end
save('A17.dat', 'ender1', '-ascii')
save('A18.dat', 'enderFinal', '-ascii')

%clear all; close all; clc

