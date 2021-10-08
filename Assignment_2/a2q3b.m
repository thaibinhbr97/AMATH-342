clear all;

% Parameters:
Tend = 8.0;
h = 0.04;

% Initialization:
i = 1;
t(i) = 0.0;
y(i) = 0;
% Euler's method:
while (t(i) + h < Tend + 1.e-12)
    y(i+1) = y(i) + h*(sin(t(i)^2) - y(i))
    t(i+1) = t(i) + h;
    i = i+1;
end

% Initialization:
i = 1;
t(i) = 0.0;
y(i) = 0;
% Nystrom method:
while (t(i) + h < Tend + 1.e-12)
    y(i+2) = y(i) + 2*h*(sin(t(i+1)^2) - y(i+1));
    t(i+1) = t(i) + h;
    i = i+1;
end

y = y(1:end-1);
figure(1);
plot(t, y);
xlabel('t');
ylabel('y(t)');

