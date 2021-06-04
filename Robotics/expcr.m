function expcr = expcr(x)
    
    
    warning('The ||x|| should NOT be 0.')
    if norm(x) == 0
        error('||x|| = 0');
        return;
    end
    
    if not(isequal(size(x),[3,1]))
        error('x should be a 3-D column vector')
        return;
    end
    
    I = eye(3);
    n = x/norm(x);
    theta = norm(x);
    
    %%implement rodrigues formula
    expcr = I + sin(theta)*SKEW3(n) + (1 - cos(theta))*SKEW3(n)^2;
    
end