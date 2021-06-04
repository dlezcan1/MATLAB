function finv = finv(F)
    if not(isequal(size(F),[4,4]))
        error('F should be a 4x4 matrix')
        return;
    end
    
    R = F(1:3,1:3);
    p = F(1:3,4);
    
    Rinv = transpose(R);
    pinv = -Rinv*p;
    
    finv = [Rinv pinv; 0 0 0 1];
    
end
    
    