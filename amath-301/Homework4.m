%Homework 4
clear all; close all; clc
%Problem 1
    %a
        f = @(t,y) (2 - (2.*y.*t))./((t.^2) + 1);
        t = 0:0.1:1;
        y = zeros(1,10);
        y(1) = 1;
        h = 0.1;
        for loop = 1:10
            y(loop + 1) = y(loop) + h * f(t(loop), y(loop));
        end
        A1 = y.';
        save('A1.dat','A1','-ascii')
    %b
        y = zeros(1,10);
        y(1) = 1;
        for loop=1:10
            k1 = f(t(loop), y(loop));
            k2 = f(t(loop) + (h/2), y(loop) + (h/2) * k1);
            k3 = f(t(loop) + (h/2), y(loop) + (h/2) * k2);
            k4 = f(t(loop) + h, y(loop) + h * k3);
            y(loop + 1) = y(loop) + h/6.*(k1+2*k2+2*k3+k4);
        end
        A2 = y.';
        save('A2.dat','A2','-ascii')
    %c
        [tout, yout] = ode45(f, [0; 1], y(1));
        A3 = [tout, yout];
        save('A3.dat','A3','-ascii')
%Problem 2
    %a
        beta = -100;
        r1 = 2;
        r2 = 5;
        v1 = 110;
        r = [];
        Y1 = [];
        Y2 = [];
        Y1(1) = v1;
        Y2(1) = beta;
        Y = [Y1(1); Y2(1)];
        ode = @(R,Y) [Y2; (-2./R).*Y2];
        [R, Y] = ode45(ode, [2 5], Y);
        A4 = [Y(:,1), Y(:,2)];
        save('A4.dat', 'A4', '-ascii')
    %b
        beta = -90;
        r1 = 2;
        r2 = 5;
        v1 = 110;
        r = [];
        Y1 = [];
        Y2 = [];
        Y1(1) = v1;
        Y2(1) = beta;
        Y = [Y1(1); Y2(1)];
        ode = @(R,Y) [Y2; (-2./R).*Y2];
        [R, Y] = ode45(ode, [2; 5], Y);
        A5 = [Y(:,1), Y(:,2)];
        save('A5.dat', 'A5', '-ascii')
    %c
        beta = [];
        r1 = 2;
        r2 = 5;
        v1 = 110;
        r = [];
        Y1 = [];
        Y2 = [];
        Y1(1) = v1;
        answer = [];
        num = 1;
        for beta = -100:-90
            Y2(1) = beta;
            Y = [Y1(1); Y2(1)];
            ode = @(R,Y) [Y2; (-2./R).*Y2];
            [R, Y] = ode45(ode, [2; 5], Y);
            answer = [answer; beta, Y(end,1)];
            num = num + 1;
        end
        A6 = answer;
        save('A6.dat', 'A6', '-ascii')
    %d
        timeA7 = -100:-90;
        A7 = interp1(A6(:,2), timeA7, 0, 'linear');
        %A7 = [1];
        save('A7.dat', 'A7', '-ascii')
%Problem 3
    %a
        f = @(t,y) (-41 .* (y - t)) + 1;
        t = 0:0.05:1;
        y = zeros(1,20);
        y(1) = 1;
        h = 0.05;
        for loop = 1:20
            y(loop + 1) = y(loop) + h * f(t(loop), y(loop));
        end
        A8 = y.';
        save('A8.dat', 'A8', '-ascii')
    %b
        y = zeros(1,20);
        y(1) = 1;
        for loop = 1:20
           y(loop + 1) = fzero(@(z) z - y(loop) - h*f(t(loop + 1), z), y(loop));  
        end
        A9 = y.';
        save('A9.dat', 'A9', '-ascii')
    %c
        [t, y] = ode23tb(f, [0; 1], y(1));
        A10 = [t, y];
        save('A10.dat', 'A10', '-ascii')
%Problem 4
    %a
        sigma = 10;
        beta = 8/3;
        rho = 28;
        x0 = 2;
        y0 = 3;
        z0 = 14;
        tspan = 0:0.01:25;
        lorenz = @(t,y) [sigma*(y(2)-y(1)); y(1)*(rho-y(3))-y(2); y(1)*y(2)-beta*y(3);];
        [t1, y1] = ode45(lorenz, tspan, [2 3 14]);
        A11 = [t1, y1];
        save('A11.dat', 'A11', '-ascii')
    %b
        sigma = 10;
        beta = 8/3;
        rho = 28;
        x0 = 2;
        y0 = 3;
        z0 = 14;
        lorenz = @(t,y) [sigma*(y(2)-y(1)); y(1)*(rho-y(3))-y(2); y(1)*y(2)-beta*y(3);];
        [t2, y2] = ode45(lorenz, tspan, [2, 3, (14+(10^(-9)))]);
        A12 = [t2, y2];
        save('A12.dat', 'A12', '-ascii')
    %c
        xat = A11(:,2); %xat
        yat = A11(:,3); %yat
        zat = A11(:,4); %zat
        xbt = A12(:,2); %xbt
        ybt = A12(:,3); %ybt
        zbt = A12(:,4); %zbt
        time = 0:0.01:25;
        deltaTsquare = (xat - xbt).^2 + (yat - ybt).^2 + (zat - zbt).^2;
        deltaT = sqrt(deltaTsquare);
        A13 = polyfit(time.', log(deltaT), 1);
        save('A13.dat', 'A13', '-ascii')