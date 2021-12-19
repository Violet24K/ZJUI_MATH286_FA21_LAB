%% initialize positive
syms x;
syms y; 
syms f;          
f(x,y) = y^2+x^2+x; % y'=f(x,y)
x0 = 0;
y0 = 1;            % y(0)=1
n = 20;
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