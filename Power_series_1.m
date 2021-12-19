%% initialize positive
syms x;
syms y; 
syms f;    
syms y1;
f(x,y) = y^2+x^2+x; % y'=f(x,y)
x0 = 0;
y0 = 1;            % y(0)=1
n = 3000;
a = 0: 1: n;
a(1) = 1;
a(2) = 1;
a(3) = 3/2;
a(4) = 5/3;
for i = 4:1:n
    temp = 0;
    for k = 0:1:(i-1)
        temp = temp + a(k+1)*a(i-k);
    end
    a(i+1) = temp / (i);
end
x = 0:0.01:0.9;
y = zeros(size(x));
y1 = zeros(size(x));
for j = 1:1:n
    for k = 1:1:length(x)
        y1(k) = a(j)*x(k)^(j-1);
    end
    y = y + y1;
end

plot(x,y);