%% initialize positive
syms x;
syms y; 
syms f;          
f(x,y) = y^2+x^2+x; % y'=f(x,y)
x0 = 0;
y0 = 1;            % y(0)=1



%% initialize negative
syms x_;
syms y_; 
syms f;          
f(x_,y_) = y_^2+x_^2+x_; % y'=f(x,y)
x0_ = 0;
y0_ = 1;            % y(0)=1

%% Eular 0.2 positive
h = 0.2;           % step
x1 = x0:h:1;       % x
len = length(x1);

y1 = zeros(size(x1)); % y
y1(1) = y0;
for ii = 2:len
    K1 = f(x1(ii-1),y1(ii-1));
    y1(ii) = y1(ii-1) + h*K1;
end

%% Eular 0.2 negative
h_ = -0.2;           % step
x1_ = x0_:h_:(-3);       % x
len_ = length(x1_);

y1_ = zeros(size(x1_)); % y
y1_(1) = y0_;
for ii = 2:len_
    K1 = f(x1_(ii-1),y1_(ii-1));
    y1_(ii) = y1_(ii-1) + h_*K1;
end
%% Eular 0.1 positive
h = 0.1;           % step
x2 = x0:h:1;       % x
len = length(x2);

y2 = zeros(size(x2)); % y
y2(1) = y0;
for ii = 2:len
    K1 = f(x2(ii-1),y2(ii-1));
    y2(ii) = y2(ii-1) + h*K1;
end

%% Eular 0.1 negative
h_ = -0.1;           % step
x2_ = x0_:h_:(-3);       % x
len_ = length(x2_);

y2_ = zeros(size(x2_)); % y
y2_(1) = y0_;
for ii = 2:len_
    K1 = f(x2_(ii-1),y2_(ii-1));
    y2_(ii) = y2_(ii-1) + h_*K1;
end

%% Eular 0.05 positive
h = 0.05;           % step
x3 = x0:h:1;       % x
len = length(x3);

y3 = zeros(size(x3)); % y
y3(1) = y0;
for ii = 2:len
    K1 = f(x3(ii-1),y3(ii-1));
    y3(ii) = y3(ii-1) + h*K1;
end

%% Eular 0.05 negative
h_ = -0.05;           % step
x3_ = x0_:h_:(-3);       % x
len_ = length(x3_);

y3_ = zeros(size(x3_)); % y
y3_(1) = y0_;
for ii = 2:len_
    K1 = f(x3_(ii-1),y3_(ii-1));
    y3_(ii) = y3_(ii-1) + h_*K1;
end

%% Eular 0.02 positive
h = 0.02;           % step
x4 = x0:h:1;       % x
len = length(x4);

y4 = zeros(size(x4)); % y
y4(1) = y0;
for ii = 2:len
    K1 = f(x4(ii-1),y4(ii-1));
    y4(ii) = y4(ii-1) + h*K1;
end

%% Eular 0.02 negative
h_ = -0.02;           % step
x4_ = x0_:h_:(-3);       % x
len_ = length(x4_);

y4_ = zeros(size(x4_)); % y
y4_(1) = y0_;
for ii = 2:len_
    K1 = f(x4_(ii-1),y4_(ii-1));
    y4_(ii) = y4_(ii-1) + h_*K1;
end

%% Eular 0.01 positive
h = 0.01;           % step
x5 = x0:h:1;       % x
len = length(x5);

y5 = zeros(size(x5)); % y
y5(1) = y0;
for ii = 2:len
    K1 = f(x5(ii-1),y5(ii-1));
    y5(ii) = y5(ii-1) + h*K1;
end

%% Eular 0.01 negative
h_ = -0.01;           % step
x5_ = x0_:h_:(-3);       % x
len_ = length(x5_);

y5_ = zeros(size(x5_)); % y
y5_(1) = y0_;
for ii = 2:len_
    K1 = f(x5_(ii-1),y5_(ii-1));
    y5_(ii) = y5_(ii-1) + h_*K1;
end

%% plot
figure
plot(x1_,y1_,'c',x2_,y2_,'m',x3_,y3_,'r',x4_,y4_,'g',x5_,y5_,'b')
hold on;
plot(x1,y1,'c',x2,y2,'m',x3,y3,'r',x4,y4,'g',x5,y5,'b')
axis([0 1 -1 1]);
title('Eular');
xlabel('x');
ylabel('y');
legend('y1_','y2_','y3_','y4_','y5_','y1','y2','y3','y4','y5')