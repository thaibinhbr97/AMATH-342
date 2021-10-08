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


V(i) = 0.5*(x(i)^2 + y(i)^2) + (x(i)^2 * y(i) - 1/3 * y(i)^3);
E(i) = V(i) + 0.5*(p(i)^2 + q(i)^2);

while (t(i) + h < Tend + 1.e-12)
    k1x = x(i);
    k1p = p(i);
    k1y = y(i);
    k1q = q(i);
    
    k2x = x(i) + (h/2)*k1p;
    k2p = p(i) + (h/2)*(-k1x - 2*k1x*k1y);
    k2y = y(i) + (h/2)*k1q;
    k2q = q(i) + (h/2)*(-k1y - (k1x^2 - k1y^2));
    
    k3x = x(i) + (h/2)*k2p;
    k3p = p(i) + (h/2)*(-k2x - 2*k2x*k2y);
    k3y = y(i) + (h/2)*k2q;
    k3q = q(i) + (h/2)*(-k2y - (k2x^2 - k2y^2));
    
    k4x = x(i) + h*k3p;
    k4p = p(i) + h*(-k3x - 2*k3x*k3y);
    k4y = y(i) + h*k3q;
    k4q = q(i) + h*(-k3y - (k3x^2 - k3y^2));
    
    x(i+1) = x(i) + (h/6)*k1p + (h/3)*k2p + (h/3)*k3p + (h/6)*k4p;
    p(i+1) = p(i) + (h/6)*(-k1x - 2*k1x*k1y) + (h/3)*(-k2x - 2*k2x*k2y).../
        + (h/3)*(-k3y - (k3x^2 - k3y^2)) + (h/6)*(-k4x - 2*k4x*k4y);
    y(i+1) = y(i) + (h/6)*k1q + (h/3)*k2q + (h/3)*k3q + (h/6)*k4q;
    q(i+1) = q(i) + (h/6)*(-k1y - (k1x^2 - k1y^2)) + .../
        (h/3)*(-k2y - (k2x^2 - k2y^2)) +(h/3)*(-k3y - (k3x^2 - k3y^2)).../
        + (h/6)*(-k4x - (k4x^2 - k4y^2))
   
    t(i+1) = t(i) + h;
    i = i +1;
end
