% Zach Willson
% AMATH 352
% Homework 2 - Due 1/20/17
clear all; close all; clc
A1 = [];
A2 = [];
A3 = [];
A4 = [];

% Problem 6
v = zeros(100, 1);
for index=1:100
    v(index, 1) = index^2;
end
A1 = v;
u = zeros(30,1);
for index=1:30
    u(index, 1) = cumulative_geometric_mean(v, index);
end
A2 = u;
% Problem 7
u = zeros(5,1);
u(1,1) = approximate_pi(5);
u(2,1) = approximate_pi(10);
u(3,1) = approximate_pi(20);
u(4,1) = approximate_pi(50);
u(5,1) = approximate_pi(100);
A3 = u;
count = 0;
while approximate_pi(count) + 1e-12 < pi
    count = count + 1;
end
A4 = count + 1;




save('A1.dat', 'A1', '-ascii')
save('A2.dat', 'A2', '-ascii')
save('A3.dat', 'A3', '-ascii')
save('A4.dat', 'A4', '-ascii')