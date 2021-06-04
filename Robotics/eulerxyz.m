function EXYZ = eulerxyz(angles)
    
    if not(isequal(size(angles),[3,1]))
        error('angles should be a 3-D column vector')
        return;
    end

    alpha = angles(1);
    beta = angles(2);
    gamma = angles(3);
    EXYZ = ROTX(alpha)*ROTY(beta)*ROTZ(gamma);

end