clear all;
% Parameters:
Tend = 10;
N = 100;
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

y1 = y{2};
y2 = y{3};

%AB method
i =  1;
t1(i) = 0;
y{i} = transpose([1 1 1 1]);
y{i+1} = y1;
y{i+2} = y2;
n1(i) = norm(y{i});

while (t1(i) + h < Tend + 1e-12)
    y{i+3} = y{i+2} + h*(a*y{i} - b*y{i+1} + c*y{i+2});
    n1(i+1) = norm(y{i+1});
    t1(i+1) = t1(i) + h;
    i = i + 1;

end

figure(1);
plot(t1, n1);
xlabel('t');
ylabel('Euclidean norm')

