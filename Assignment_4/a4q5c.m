clear all;

% Parameters:
N = 64;
NP1 = N + 1;
L = 1.0;
dt = 0.001;
TF = 10;
Re = 1000;
c = (2/Re)*log(N);

% Initial condition (uniform grid)
dy = L/N;
for j=1:NP1
    y(j) = (j-1)*dy;
    nun(j) = 1-y(j);
end

% Initial condition:
for i=1:NP1
    if (i < N/2 + 1)
        x(i) = 2*(1-c)*(i-1)/N;
    else
        x(i) = 1 - c + 2*c*(i - 1 - N/2)/N;
    end
    un(i) = 1-x(i);
end


% Time loop
t = 0.0;
while (t < TF)
    
    % Interior points
    for i=2:NP1-1
        dx(i) = x(i) - x(i-1);
        dx(i+1) = x(i+1) - x(i);
        a = dt / dx(i);
        b = dt/ dx(i+1);
        u(i) = un(i) - a*(un(i) - un(i-1)) + Re^-1 *b*((un(i+1) ...
            - un(i))/b - (un(i) - un(i-1))/a);            
    end
    
    for j=2:NP1-1
        nu(j) = nun(j) - dt/dy * (nun(j) - nun(j-1)) + 1/Re * dt/(dy^2)...
            *(nun(j+1) -2*nun(j) + nun(j-1));
    end
        

    % Boundary points
    u(1) = 1.0;
    u(NP1) = 0.0;
    nu(1) = 1.0;
    nu(NP1) = 0.0;

    
    % Update solution
    un = u;
    nun = nu;
    
    t = t + dt;

end


% Numberical solution:
plot(x, u, '-x', 'LineWidth', 2);
xlabel('x');
ylabel('u(x,t)');
title('Combined plot (N = 64, Re = 1000)');
hold on

plot(y, nu, '-', 'LineWidth', 2);
