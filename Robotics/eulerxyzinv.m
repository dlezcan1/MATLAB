function EXYZinv = eulerxyzinv(R)
    %{
        alpha -> Rx
        beta  -> Ry
        gamma -> Rz
    %}
    
    warning('Note that the following conditions will result in the inverse not existing:\n1. R33 = 0\n2. R11 = 0\n3. R23 and R33 = 0');
    if not(isequal(size(R),[3,3]))
        error('R should be a 3x3 matrix')
        return;
    end
    
    if (R(2,3)== 0 && R(3,3) == 0)
        return;
    end
        
    if (R(1,1) == 0)
        return;
    end
    
    if (R(3,3) == 0)
        return;
    end
    
    
    
    alpha = atan2(R(1,3),sqrt(R(2,3)^2 + R(3,3)^2));
    beta = atan2(-R(2,3),R(3,3));
    gamma = atan2(-R(1,2),R(1,1));
    
    EXYZinv = [alpha; beta; gamma];

end
