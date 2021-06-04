function solution = subproblem1(w, r, p, q)
%SUBPROBLEM1 inverse kinematic solution for subproblem 1
%
% e^(t*w)*p = q
%
% - written by: Dimitri Lezcano

    u = p - r;
    v = q - r;
    
    up = u - w*w'*u;
    vp = v - w*w'*v;
    
    value1 = dot(w,cross(up,vp));
    value2 = dot(up,vp);
    
    solution = atan2(value1,value2);

end

