function pnts = circle3D(center, normal, radius)
% this function is to create a 3D circle with a normal pointed along 'normal'
% and a center @ 'center' with a radius of 'radius'
%
% - taken from online forum

    t = linspace(0, 2*pi, 100);
    pnts = radius*[cos(t); sin(t); zeros(size(t))] + center;
    
    n0 = [0; 0; 1];
    n = normal/norm(normal); % normalize the normal
    if all(n0 == n)
        R = eye(3);
    else
        % theta is the angle between normals
        c = dot(n0,n) / ( norm(n0)*norm(n) ); % cos(theta)
        s = sqrt(1-c*c);                        % sin(theta)
        n2 = cross(n0,n) / ( norm(n0)*norm(n) ); % rotation axis...
        n2 = n2/norm(n2); % ... as unit vector
        C = 1-c;

        % the rotation matrix
        R = [n2(1)^2*C+c, n2(1)*n2(2)*C-n2(3)*s, n2(1)*n2(3)*C+n2(2)*s
             n2(2)*n2(1)*C+n2(3)*s, n2(2)^2*C+c, n2(2)*n2(3)*C-n2(1)*s
             n2(3)*n2(1)*C-n2(2)*s, n2(3)*n2(2)*C+n2(1)*s, n2(3)^2*C+c];
    end
    
    pnts = R * pnts;

end