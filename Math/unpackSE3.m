%% unpackSE3.m
% - written by: Dimitri Lezcano
%
% Turn a 4x4 SE(3) matrix intro rotation matrix and a translation vector
%
% Args:
%   - 4x4 SE(3) matrix of (R, t)
% Returns:
%   - R: 3x3 SO(3) matrix
%   - t: 3x1 translation vector
%   
% Kwargs:
%   - "Check": (Default = false) logical on whether to check if
%                R is in SO(3) 
%

%%
function [R, t] = unpackSE3(F, options)
    arguments
        F (4,4);
        options.Check logical = false;
    end
    
    %% Check if SE(3)
    if options.Check
        assert(isse(F), 'F is not SE(3)');
    end
    
    %% Unpack F
    R = F(1:end-1,1:end-1);
    t = F(1:end-1,end);

end
