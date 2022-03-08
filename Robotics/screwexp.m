%% screwexp.m
% function to return 4x4 homogeneous matrix
% given an se(3) vector and a parametrization, theta
% - written by Dimitri Lezcano

function exp_screw = screwexp(vect, theta)
    if theta == 0
        exp_screw = eye(4);
    else
        vect = theta*vect;
        v = vect(1:3);
        w = vect(4:end);
        q = cross(w,v)/norm(w)^2;
        h = transpose(w)*v/norm(w)^2;

        R = expcr(w);
        p = (eye(3) - R)*q + h*w;

        exp_screw = [R p; 0 0 0 1];
    end
end
