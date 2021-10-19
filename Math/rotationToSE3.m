%% rotationToSE3.m
% - written by: Dimitri Lezcano
% 
% Turn a rotation matrix into a 4x4 SE(3) matrix
%
% Args:
%   - R: 3x3 SO(3) matrix
%   
% Kwargs:
%   - "Check": (Default = false) logical on whether to check if
%                R is in SO(3) 
%
% Returns:
%   - 4x4 SE(3) matrix

function F = rotationToSE3(R, options)
    arguments
        R (3,3);
        options.Check logical = false;
    end
    
    F = makeSE3(R, zeros(3,1), 'Check', options.Check);
    
end
    