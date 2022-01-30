
function B=milnep(f,T,Y)

n=length (T);
if n<5
    return
end
F=zeros(1,4);
F=feval(f,T (1: 4),Y(1:4) );
h=(T (2)-T (1));
pold=0;
yold=0;
for k=4 :n-1
    p=Y(k-3)+(4*h/3)*(F*[0 2 -1 2]');
    pmod=p+28*(yold-pold)/29;
    T(k+1)=T(1)+h*k ;
    F=[F(2) F(3) F(4) feval(f,T(k+1),pmod)];
    Y(k+1)=Y(k-1)+h/3*(F*[0 1 4 1]') ;
    pold=p;
    yold=Y(k+1);
    F(4) =feval (f,T(k+1),Y(k+1) ) ;
end
B=[T' Y'];
end