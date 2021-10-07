%% theta_rot2d.m
% - written by: Dimtiri Lezcano
%
% Function to compute theta s.t. R(theta) = R in SO(2)
%
% Args:
%   - R: 2 x 2 rotation matrix
%   - check_so: logical to check if R is SO(2) (Default = false)
%
% Returns:
%   - theta as above (in the range [-pi, pi])

%% Function
function theta = theta_rot2d(R, check_so)
    arguments
        R (2,2);
        check_so logical = false;
    end
    
    %% Check for SO(2)
    if check_so
        assert(isso(R));
    end
    
    %% Determine theta
    theta = atan2(R(2,1), R(1,1));
    
end
    
    