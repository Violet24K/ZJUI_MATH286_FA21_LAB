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

%% 4K 0.00001 positive
h = 0.00001;           % step
x1 = x0:h:0.5;       % x
len = length(x1);

y1 = zeros(size(x1)); % y
y1(1) = y0;
for ii = 2:len
    K1 = f(x1(ii-1),y1(ii-1));
    K2 = f(x1(ii-1)+h/2,y1(ii-1)+h*K1/2);
    K3 = f(x1(ii-1)+h/2,y1(ii-1)+h*K2/2);
    K4 = f(x1(ii-1)+h,y1(ii-1)+h*K3);
    y1(ii) = y1(ii-1) + h*(K1+2*K2+2*K3+K4)/6;
end

%% 4K 0.00001 negative
h_ = -0.00001;           % step
x1_ = x0_:h_:(-0.5);       % x
len_ = length(x1_);

y1_ = zeros(size(x1_)); % y
y1_(1) = y0_;
for ii = 2:len_
    K1 = f(x1_(ii-1),y1_(ii-1));
    K2 = f(x1_(ii-1)+h_/2,y1_(ii-1)+h_*K1/2);
    K3 = f(x1_(ii-1)+h_/2,y1_(ii-1)+h_*K2/2);
    K4 = f(x1_(ii-1)+h_,y1_(ii-1)+h_*K3);
    y1_(ii) = y1_(ii-1) + h_*(K1+2*K2+2*K3+K4)/6;
end


%% plot
figure
plot(x1_,y1_,'k')
hold on;
plot(x1,y1,'k')
axis([0 1 -1 1]);
title('4K_precise');
xlabel('x');
ylabel('y');
legend('y1_','y1')