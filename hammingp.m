function B=hammingp(f,T,Y)

n=length (T);
if n<5
    return
end
F=zeros(1,4);
F=feval(f,T (1: 4),Y(1:4) );
h=(T (2)-T (1));
pold=0;
cold=0;
for k=4 :n-1
    p=Y(k-3)+(4*h/3)*(F*[0 2 -1 2]');
    pmod=p+112*(cold-pold)/121;
    T(k+1)=T(1)+h*k ;
    F=[F(2) F(3) F(4) feval(f,T(k+1),pmod)];
    c=(-Y(k-2)+9*Y(k))/8+(3*h/8)*(F*[0 -1 2 1]') ;
    Y(k+1)=c+9*(p-c)/121;
    pold=p;
    cold=c;
    
    F(4) =feval (f,T(k+1),Y(k+1) ) ;
end
B=[T' Y'];
end
