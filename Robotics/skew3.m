function skew3 = skew3(x)

    if not(isequal(size(x),[3,1]))
        error('x should be a 3-D column vector')
        return;
    end
    
    skew3 = [0, -x(3), x(2);
             x(3), 0, -x(1);
             -x(2), x(1), 0];
         
end

