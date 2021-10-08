clear all;

% Parameters:
N = 64;
NP1 = N + 1;
L = 1.0;
dt = 0.001;
TF = 10;
Re = 40;

% Initial condition:
dx = L/N;
for i=1:NP1
    x(i) = (i-1)*dx;
    un(i) = 1-x(i);
    ue(i) = (exp(Re) - exp(Re*x(i))) / (exp(Re) - 1);
end

% Exact solution:
plot(x, ue, '-x');
figure(1);
xlabel('x');
ylabel('u(x,t)');
title('Exact solution (N = 64)');
pause

% Time loop
t = 0.0;
while (t < TF)
    
    % Interior points
    for i=2:NP1-1
        u(i) = un(i) - dt/dx * (un(i) - un(i-1)) + 1/Re * dt/(dx^2)...
            *(un(i+1) -2*un(i) + un(i-1));
        error(i) = abs(ue(i) - u(i));
    end



    % Boundary points
    u(1) = 1.0;
    u(NP1) = 0.0;


    
    % Update solution
    un = u;

    t = t + dt;

end
e = max(error(i));


% Numberical solution:
plot(x, u, '-x', 'LineWidth', 2);
xlabel('x');
ylabel('u(x,t)');
title('Numerical solution (N = 64)');
pause
