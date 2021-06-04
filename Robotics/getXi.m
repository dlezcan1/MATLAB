function xi = getXi(g)
    %% get R and p values
    R = g(1:3,1:3);
    p = g(1:3,4);
    
    theta = acos((trace(R)-1)/2);
    
    % pure translation
    if theta == 0
        w = [0;0;0];
        if norm(p) == 0
            v = [0;0;0];
        else
            v = p/norm(p);
            theta = norm(p);
        end
        
    % rotation and translation
    else
        w = 1/(2*sin(theta))*(vee(R-transpose(R)));
        A = (eye(3)-EXPCR(w*theta))*SKEW3(w) + w*transpose(w)*theta;
        v = A\p;
        
    end
    
    xi = theta*[v;w];

end