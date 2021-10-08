% Parameters:
delta = 0.0001;
Tf = 2/delta;
h3 = Tf/10000;
h4 = Tf/20000;

% Initialization:
i = 1;
t(i) = 0.0;
y(i) = delta;

% Euler's method implementation for h1:
while (t(i) + h4 < Tf + 1.e-12);
    y(i+1) = y(i) + h4*y(i)^2 - h4*y(i)^3;
    t(i+1) = t(i) + h4;
    i = i + 1;

end

plot(t, y);
xlabel('t (h = Tf/20000)');
ylabel('y');

