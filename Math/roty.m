function ROTY = roty (theta)
    
    if not(isequal(size(theta),[1,1]))
        error('theta should be a scalar')
        return;
    end

    ROTY = [cos(theta), 0, sin(theta);
        0, 1, 0; 
        -sin(theta), 0, cos(theta)];

end