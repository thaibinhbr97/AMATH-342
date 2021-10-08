clear all;
% Parameters:
Tend = 10;
N = 800;
h = 10/N;

a = 5/12;
b = -4/3;
c = 23/12;

% Initialization:
i = 1;
t(i) = 0;

A = [-20 10 0 0; 10 -20 10 0; 0 10 -20 10; 0 0 10 -20];
y{i} = transpose([1 1 1 1]);
n(i) = norm(y{i});

while (t(i) + h < Tend + 1e-12)
    y{i+1} = y{i} + h*A*y{i};
    
    n(i+1) = norm(y{i+1});
    
    t(i+1) = t(i) + h;
    i = i+1;
end

%AB method

i =  1;
t1(i) = 0;
n1(i) = norm(y{i});
n1(i+1) = norm(y{i+1});
n1(i+2) = norm(y{i+2});

while (t1(i) + h < Tend + 1e-12)
    y{i+3} = y{i+2} + h*(a*A*y{i} - b*A*y{i+1} + c*A*y{i+2});
    n1(i+3) = norm(y{i+3});
    t1(i+1) = t1(i) + h;
    i = i + 1;

end
n1 = n1(1:end-2);
figure(1);
plot(t1, n1);
xlabel('t');
ylabel('Euclidean norm (3-step Adams-Bashforth)')

