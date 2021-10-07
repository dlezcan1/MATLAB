function so = isso(R)
    arguments
        R (:,:) {mustBeSquare};
    end
    
    det_check = abs(det(R) - 1) < 1e-3;
    
    inv_check1 = norm(R * R' - eye(size(R))) < 1e-3;
    inv_check2 = norm(R' * R - eye(size(R))) < 1e-3;
    
    so = det_check && inv_check1 && inv_check2;
    
end