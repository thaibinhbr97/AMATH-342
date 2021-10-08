clear all;

% Parameters:
Tend = 1000;
h = 0.01;

% Initialization:
i = 1;
t(i) = 0.0;
p(i) = 0.427001854016272;
q(i) = 0.096;
x(i) = 0;
y(i) = 0.095;
pprime(i) = -x(i) - 2*x(i)*y(i);
qprime(i) = -y(i) - (x(i)^2 - y(i)^2);

V(i) = 0.5*(x(i)^2 + y(i)^2) + (x(i)^2 * y(i) - 1/3 * y(i)^3);
E(i) = V(i) + 0.5*(p(i)^2 + q(i)^2);

% Using Euler's method to find first 2 value for x, y, p, q:
while (t(i) + h < 0.01)
    x(i+1) = x(i) + h*p(i);
    y(i+1) = y(i) + h*q(i);
    p(i+1) = p(i) + h*pprime(i);
    q(i+1) = q(i) + h*qprime(i);
    V(i+1) = 0.5*(x(i+1)^2 + y(i+1)^2) + (x(i+1)^2 * y(i+1) - 1/3 * .../
        y(i+1)^3);
    E(i+1) = V(i+1) + 0.5*(p(i+1)^2 + q(i+1)^2);
    pprime(i+1) = -x(i+1) - 2*x(i+1)*y(i+1);
    qprime(i+1) = -y(i+1) - (x(i+1)^2 - y(i+1)^2);
    t(i+1) = t(i) + h;
    i = i + 1;
end

% % Using 4th order Adam Bashforth method to find the rest:
% i = 1;
% while (t(i) + h < Tend + 1.e-12)
%     x(i+4) = x(i+3) + h*(55/24 * p(i+3) - 59/24 * p(i+2) + .../
%         37/24 * p(i+1) - 9/24 * p(i));
%     y(i+4) = y(i+3) + h*(55/24 * q(i+3) - 59/24 * q(i+2) + .../
%         +37/24 * q(i+1) - 9/24 * q(i));
%     p(i+4) = p(i+3) + h*(55/24 * pprime(i+3) - 59/24 * pprime(i+2) + .../
%         37/24 * pprime(i+1) - 9/24 * pprime(i));   
%     q(i+4) = q(i+3) + h*(55/24 * qprime(i+3) - 59/24 * qprime(i+2) .../
%         + 37/24 * qprime(i+1) - 9/24 * qprime(i));  
%     V(i+4) = 0.5*(x(i+4)^2 + y(i+4)^2) + (x(i+4)^2 * y(i+4) - 1/3 .../
%         * y(i+4)^3);
%     E(i+4) = V(i+4) + 0.5*(p(i+4)^2 + q(i+4)^2);
%     pprime(i+4) = -x(i+4) - 2*x(i+4)*y(i+4);
%     qprime(i+4) = -y(i+4) - (x(i+4)^2 - y(i+4)^2);
%     t(i+1) = t(i) + h;
%     i = i + 1;
% end
E = E(1:end-3);
p = p(1:end-3);
q = q(1:end-3);
x = x(1:end-3);
y = y(1:end-3);
qprime = qprime(1:end-3);
pprine = pprime(1:end-3);

plot(t, E);
xlabel('Time (second set of conditions)');
ylabel('Energy');

%plot(x, y);
%xlabel('x (second set of conditions)');
%ylabel('y');
