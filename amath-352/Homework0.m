% Zach Willson
% AMATH 352
% Homework 0 - Due 1/13/17
clear all; close all; clc
a = 0:2:30;
b = [5; exp(3); sin(2)];
c = zeros(10,1);
save('A1.dat', 'a', '-ascii')
save('A2.dat', 'b', '-ascii')
save('A3.dat', 'c', '-ascii')