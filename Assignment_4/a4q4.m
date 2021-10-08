clear all;

% Parameters:
J = 10;
JP1 = J + 1;
L = 1.0;
dx = L / (JP1 - 1);
dt = 0.5*dx^2;
TF = 0.07;
nu = dt / dx^2;
% Initial condition:
for j=1:JP1
    x(j) = (j-1)*dx;
    if (x(j) == 1/2) 
        un(j) = 2.0;
    else
        un(j) = 1.0;
    end
end


% Time loop
t = 0.0;
while (t < TF)
    % Adjust time step if needed
    if (TF - 1.e-10 - t) < dt
        dt = TF - t;
        nu = dt / dx^2; 
    end
    
    fprintf('\nTime interval: [');
    fprintf(' %d ', t);
    fprintf(',');
    fprintf(' %d ', t + dt);
    fprintf(']\n');

        
    % Boundary points
    u(1) = 1.0;
    u(JP1) = 1.0;

    
    % Interior points 
    for j=2:JP1-1
       u(j) = nu/(1+2*nu) * (un(j-1) + un(j+1) + u(j-1) + u(j+1)) ...
           + (1-2*nu)/(1+2*nu) * un(j);
   
    end
        
 
    
    

    
    % Update solution
    un = u;
    
    
    t = t + dt;
    
end

figure(1);
plot(x, u, '-x', 'LineWidth', 2);
axis([0 1 0 1]);
xlabel('x');
ylabel('u(x,t)');
title('1D Heat Equation (dt = 0.5*dx^2)');