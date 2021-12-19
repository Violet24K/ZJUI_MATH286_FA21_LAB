clear
clc
close all

%% initialize positive
syms x;
syms y; 
syms f;          % 
f(x,y) = y^2+x^2+x; % y'=f(x,y)
x0 = 0;
y0 = 1;            % y(0)=1
 
h = 0.05;           % step
x = x0:h:1;       % x
len = length(x);

%% initialize negative
syms x_;
syms y_; 
syms f;          
f(x_,y_) = y_^2+x_^2+x_; % y'=f(x,y)
x0_ = 0;
y0_ = 1;            % y(0)=1
 
h_ = -0.05;           % step
x_ = x0_:h_:(-3);       % x
len_ = length(x_);

%% Euler positive
y1 = zeros(size(x)); % y
y1(1) = y0;
for ii = 2:len
    K1 = f(x(ii-1),y1(ii-1));
    y1(ii) = y1(ii-1) + h*K1;
end

%% Euler negative
y1_ = zeros(size(x_)); % y
y1_(1) = y0_;
for ii = 2:len_
    K1 = f(x_(ii-1),y1_(ii-1));
    y1_(ii) = y1_(ii-1) + h_*K1;
end


%% improved Euler positive
y1_improved = zeros(size(x)); % y
y1_improved(1) = y0;
for ii = 2:len
    K1 = f(x(ii-1),y1_improved(ii-1));
    y1_improved(ii) = y1_improved(ii-1) + h*K1;
    K2 = f(x(ii),y1_improved(ii));
    y1_improved(ii) = y1_improved(ii-1) + h/2*(K1 + K2);
end


%% improved Euler negative
y1_improved_ = zeros(size(x_)); % y
y1_improved_(1) = y0_;
for ii = 2:len_
    K1 = f(x_(ii-1),y1_improved_(ii-1));
    y1_improved_(ii) = y1_improved_(ii-1) + h_*K1;
    K2 = f(x_(ii),y1_improved_(ii));
    y1_improved_(ii) = y1_improved_(ii-1) + h_/2*(K1 + K2);
end

%% 2K positive
y2 = zeros(size(x)); % y
y2(1) = y0;
for ii = 2:len
    K1 = f(x(ii-1),y2(ii-1));
    K2 = f(x(ii-1)+h/2,y2(ii-1)+h*K1/2);
    y2(ii) = y2(ii-1) + h*K2;
end

%% 2K negative
y2_ = zeros(size(x_)); % y
y2_(1) = y0_;
for ii = 2:len_
    K1 = f(x_(ii-1),y2_(ii-1));
    K2 = f(x_(ii-1)+h_/2,y2_(ii-1)+h_*K1/2);
    y2_(ii) = y2_(ii-1) + h_*K2;
end

%% 3K positive
y3 = zeros(size(x));
y3(1) = y0;
for ii = 2:len
    K1 = f(x(ii-1),y3(ii-1));
    K2 = f(x(ii-1)+h/2,y3(ii-1)+h*K1/2);
    K3 = f(x(ii-1)+h,y3(ii-1)+h*(K2*2-K1));
    y3(ii) = y3(ii-1) + h*(K1+4*K2+K3)/6;
end


%% 3K negative
y3_ = zeros(size(x_));
y3_(1) = y0_;
for ii = 2:len_
    K1 = f(x_(ii-1),y3_(ii-1));
    K2 = f(x_(ii-1)+h_/2,y3_(ii-1)+h_*K1/2);
    K3 = f(x_(ii-1)+h_,y3_(ii-1)+h_*(K2*2-K1));
    y3_(ii) = y3_(ii-1) + h_*(K1+4*K2+K3)/6;
end

%% 4K positive
y4 = zeros(size(x));
y4(1) = y0;
for ii = 2:len
    K1 = f(x(ii-1),y4(ii-1));
    K2 = f(x(ii-1)+h/2,y4(ii-1)+h*K1/2);
    K3 = f(x(ii-1)+h/2,y4(ii-1)+h*K2/2);
    K4 = f(x(ii-1)+h,y4(ii-1)+h*K3);
    y4(ii) = y3(ii-1) + h*(K1+2*K2+2*K3+K4)/6;
end

%% 4K negative
y4_ = zeros(size(x_));
y4_(1) = y0_;
for ii = 2:len_
    K1 = f(x_(ii-1),y4_(ii-1));
    K2 = f(x_(ii-1)+h_/2,y4_(ii-1)+h_*K1/2);
    K3 = f(x_(ii-1)+h_/2,y4_(ii-1)+h_*K2/2);
    K4 = f(x_(ii-1)+h_,y4_(ii-1)+h_*K3);
    y4_(ii) = y3_(ii-1) + h_*(K1+2*K2+2*K3+K4)/6;
end
 
%% plot
figure
plot(x_,y2_,'--r',x_,y3_,'--g',x_,y4_,'--b',x_,y1_,'--c',x_,y1_improved_,'--m')
hold on;
plot(x,y2,'--r',x,y3,'--g',x,y4,'--b',x,y1,'--c',x,y1_improved,'--m')
axis([0 1 -1 1]);
title('solution curve');
xlabel('x');
ylabel('y');
legend('2K','3K','4K','Euler','improved Euler')
 

% figure
% plot(x,y2-y,'k',x,y3-y,'--r',x,y4-y,'--g',x,y1-y,'--c',x,y1_improved-y,'--m')
% title('all method');
% xlabel('x')
% ylabel('');
% legend('RK2','RK3','RK4','Euler','Improved Euler')
