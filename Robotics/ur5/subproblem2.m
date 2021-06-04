function solution = subproblem2(w1, w2, r, p, q)
%subproblem2: Inverse kinematic solution for subproblem 2
%
% e^(t1*w1)*e^(t2*w2)*p = q
%
% - written by: Dimitri Lezcano

    u = p - r;
    v = p - r;
    
    alpha = (dot(w1,w2)*dot(w2,u) - dot(w1,v))/(dot(w1,w2)^2 - 1);
    beta = (dot(w1,w2)*dot(w1,v) - dot(w2,u))/(dot(w1,w2)^2 - 1);
    gamma_sq = (dot(u,u) - alpha^2 - beta^2 - 2*alpha*beta*dot(w1,w2))/vecnorm(cross(w1,w2))^2;
    gamma1 = sqrt(gamma_sq);
    gamma2 = -gamma1;
    z1 = alpha*w1 + beta*w2 + gamma1*cross(w1,w2);
    z2 = alpha*w1 + beta*w2 + gamma2*cross(w1,w2);
    
    
    if all(z1 == z2)
        c1 = z1 + r;
        theta1 = subproblem1(-w1,r,q,c1);
        theta2 = subproblem1(w2,r,q,c1);
        
        solution = [theta1; theta2];
        
    else
        c1 = z1 + r;
        theta11 = subproblem1(-w1,r,q,c1);
        theta12 = subproblem1(w2,r,q,c1);
        
        c2 = z2 + r;
        theta21 = subproblem1(-w1,r,q,c2);
        theta22 = subproblem1(w2,r,q,c2);
        solution = [theta11 theta12; theta21 theta22];
        
    end
    
end
    
    
    
    