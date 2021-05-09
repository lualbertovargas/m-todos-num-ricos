function y=flujo_potencia
 x0=[0;0;1];
 syms x y z
 fname=[-4-(23.47905*z*cos(2.0344-x)+58.1377*z^2*cos(-1.1071)+37.208*z*cos(2.0344-x+y));2-(34.531988*cos(1.8925-y)+37.20808*z*cos(2.0344-y+x)+28.122713);-2.5-(-23.47905*z*sin(2.0344-x)-58.1377*z^2*sin(-1.1071)-37.208*z*sin(2.0344-x+y))];
 fprima=jacobian(fname);
 tol=1.e-10;
 maxiter=30;
 iter=1;
 f=inline(fname);
 jf=inline(fprima);
 error=norm(f(x0(1),x0(2),x0(3)),2);
 fprintf('error=%12.8f\n',error);
 while error>=tol
     fx0=f(x0(1),x0(2),x0(3));
     fpx0=jf(x0(1),x0(2),x0(3));
     x1=x0-inv(fpx0)*fx0;
     fx1=f(x1(1),x1(2),x1(3));
     error=norm((fx1),2);
     fprintf(' Iter %2d raices =(%14.9f,%14.9f,%14.9f) f(x)=(%14.9f,%14.9f,%14.9f)\n',iter,x1(1),x1(2),x1(3),fx1(1),fx1(2),fx1(3));
     if iter>maxiter
         fprintf('Numero maximo de iteraciones excedidas');
         return ;
     end
     x0=x1;
     iter=iter+1;
 end