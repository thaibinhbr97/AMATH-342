clear all;
% Parameters:
delta = 0.0001;
Tf = 2/delta;
h = Tf/20;
n = 1;
t = 0;
y(n) = delta;


% Code
while (t < Tf)
    w(n) = y(n);
    epsilon = 1;
    while (epsilon > 10.e-10)
        F(n) = w(n) - y(n) - h*(w(n))^2 + h*(w(n))^3;
        Fprime(n) = 1 - 2*h*w(n) + 3*h*(w(n))^2;
        w(n+1) = w(n) - F(n)/Fprime(n);
        epsilon = abs(w(n+1) - w(n));
        w(n) = w(n+1);
      
    
    end
    y(n+1) = w(n+1);
    t = t + h;
    n = n + 1;
end


plot(w, y);
xlabel('w (h = Tf/100000)');
ylabel('y');

