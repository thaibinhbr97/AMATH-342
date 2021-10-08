clear all;
% Parameters:
A = 0.2;
B = 0.2;
C = 5.7;
Tend = 500;
h = 0.02;

% Initialization:
i = 1;
t(i) = 0;
x(i) = 0;
y(i) = 0;
z(i) = 0;

% 3-step ERK method:
while (t(i) + h < Tend + 1e-12)
    k1(i) = -(y(i) + z(i));
    k2(i) = k1(i) + 1/2 * h * k1(i);
    k3(i) = k1(i) + h*(k1(i) + 2*k2(i));
    x(i+1) = x(i) + h*(1/6 * k1(i) + 2/3 * k2(i) + 1/6 * k3(i));
    
    h1(i) = x(i) + A*y(i);
    h2(i) = h1(i) + 1/2 * h * h1(i);
    h3(i) = h1(i) + h*(h1(i) + 2*h2(i));
    y(i+1) = y(i) + h*(1/6 * h1(i) + 2/3 * h2(i) + 1/6 * h3(i));
    
    l1(i) = B + x(i)*z(i) - C*z(i);
    l2(i) = l1(i) + 1/2 * h * l1(i);
    l3(i) = l1(i) + h*(l1(i) + 2*l2(i));
    z(i+1) = z(i) + h*(1/6 * l1(i) + 2/3 * l2(i) + 1/6 * l3(i));
    
    t(i+1) = t(i) + h;
    i = i+1;
end

figure(1);
plot3(x,y,z);
xlabel('x');
ylabel('y');
zlabel('z');
