function [valor]=simpsonDos(fa,it,xo,xf)


q=int(fa,xo,xf);
online=inline(fa);

h=(xf-xo)/it;
su=0;
array=0;
i=1;
for i=2:it-1
    if mod(i,3)~=0
    array=array+feval(online,h*i+xo);
    else
    su=su+feval(online,h*i+xo);
    end
end
valor=(3*h/8)*(online(xo)+3*array+2*su+online(xf));
error=abs((q-valor)/q)*100;