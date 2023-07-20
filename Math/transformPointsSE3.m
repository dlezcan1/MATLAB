%% transformPointsSE3.m
% - written by: Dimitri Lezcano
%
% function to transform 3D points using a rigid body transform
%
% Args:
%    - points: 3D points
%    - F (or R, t individually): the SE(3) rigid body transform
%    - axis: (Default = 1) which orientaiton the points are laid out
%               1: rows
%               2: columns
%
% Returns
%   - points_tf: transformed 3D points of the same shape as the points


%% 
function points_tf = transformPointsSE3(points, varargin)
    arguments
        points (:,:);
    end
    
    arguments(Repeating)
        varargin;
    end
    
    %% unpack varargin
    if numel(varargin) == 1 % F only
        F = varargin{1};
        axis = 1;
    elseif numel(varargin) == 2 && numel(varargin{2}) == 1% F and axis
        F = varargin{1};
        axis = varargin{2};
    elseif numel(varargin) == 2 && numel(varargin{2}) == 3 % R, t
        R = varargin{1};
        t = varargin{2};
        F = makeSE3(R, t);
        axis = 1;
    elseif numel(varargin) == 3 % R, t, and axis
        R = varargin{1};
        t = varargin{2};
        F = makeSE3(R, t);
        axis = varargin{3};
    else
        error("Input is either (points, F, axis) or (points, R, t, axis)");
    end
    
    assert(any(axis == [1,2]), 'axis can only be 1 or 2');
    
    %% Determine the axis of the points
    if axis == 2
        points = points'; % N x 3 -> 3 x N
    end
    
    %% Transform the points
    if size(points, 1) == 3
        points_h = [points; ones(1, size(points,2))];
    else
        points_h = points;
    end
    
    points_tf_h = F * points_h;
    points_tf = points_tf_h(1:end-1,:);
    
    if axis == 2
        points_tf = points_tf';
    end
    
end