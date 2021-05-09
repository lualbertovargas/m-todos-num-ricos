function [valor] = simpsonUno(fa,it,xo,xf)

online=inline(fa);
h=(xf-xo)/it;
su=0;
array=0;
for i=1:2:it-1
    su=su+feval(online,h*i+xo);
end
for i=2:2:it-2
    array=array+feval(online,h*i+xo);
end
valor=(h/3)*(feval(online,xo)+4*su+2*array+feval(online,xf));
fprintf(2,'integral es = ')