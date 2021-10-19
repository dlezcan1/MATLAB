%% makeSE3.m
% - written by: Dimitri Lezcano
% 
% Turn a rotation matrix and a translation vector into a 4x4 SE(3) matrix
%
% Args:
%   - R: 3x3 SO(3) matrix
%   - t: 3x1 translation vector
%   
% Kwargs:
%   - "Check": (Default = false) logical on whether to check if
%                R is in SO(3) 
%
% Returns:
%   - 4x4 SE(3) matrix of (R, t)

%%
function F = makeSE3(R, t, options)
    arguments
        R (3,3)
        t (3,1);
        options.Check logical = false;
    end
    %% Check if R is SO(3)
    if options.Check
        assert(isso(R), 'R is not SO(3)');
    end
    
    %% Build the 4x4 SE(3) matrix
    F = [R, t; zeros(1,3), 1];
    
end