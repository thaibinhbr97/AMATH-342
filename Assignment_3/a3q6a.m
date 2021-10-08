% Parameters:
delta = 0.02;
Tf = 2/delta;
h1 = Tf/50;
h2 = Tf/100;

% Initialization:
i = 1;
t(i) = 0.0;
y(i) = delta;

% Euler's method implementation for h1:
while (t(i) + h1 < Tf + 1.e-12);
    y(i+1) = y(i) + h1*y(i)^2 - h1*y(i)^3;
    t(i+1) = t(i) + h1;
    i = i + 1;

end

plot(t, y);
xlabel('t (h = Tf/50)');
ylabel('y');

