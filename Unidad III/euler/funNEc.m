function [dy] = funNEc(t,y)
   %dy=[y(2);0.5*y(1)-0.5*y(2)];
    %dy=[y(1)+2*y(2);3*y(1)+2*y(2)]
    dy=[((y(1)^2)*y(2))-(1.1*y(2))]
end