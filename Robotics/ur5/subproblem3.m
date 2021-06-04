function solution = subproblem3(w, r, p, q, d)
% subproblem3: A function to compute the inverse kinematics of subproblem3
%
% || e^(t*w) - q || = d
%
% - written by: Dimitri Lezcano

    u = p - r;
    v = q - r;
    
    up = u - w*w'*u;
    vp = v - w*w'*v;
    dp_sq = d^2 - abs(dot(w,p-q));
    
    value1 = dot(w,cross(up,vp));
    value2 = dot(up,vp);
    value3 = (dot(up,up) + dot(vp,vp) - dp_sq)/(2*vecnorm(up)*vecnorm(vp));;;;;
    
    theta0 = atan2(value1,value2);
    theta1 = theta0 + acos(value3);
    theta2 = theta0 - acos(value3);
    
    solution = [theta1 theta2];
    
end
    
