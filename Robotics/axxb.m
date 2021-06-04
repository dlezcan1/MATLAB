function X=axxb( e_bh, e_sc )
% e_bh: a Nx7 matrix that contain N forward kinematics measurements
%   obtained from tf_echo. The format of each row must be
%   [tx ty tz qx qy qz qw]
% e_sc: a Nx7 matrix that contain N AR tag measurements obtained from
%   tf_echo. The format of each row must be [tx ty tz qx qy qz qw]
% return: the 4x4 homogeneous transformation of the hand-eye
%  calibration
    
%% Data pre-processing
    alphas = []; betas = [];
    R_a = []; t_a = []; R_b = []; t_b = [];

    % extract the R's and t's
    invE_bh1 = FINV([quat2rotm(e_bh(1,[7, 4:6])), e_bh(1,1:3)'; 0 0 0 1]);
    E_sc1 = [quat2rotm(e_sc(1,[7, 4:6])), e_sc(1,1:3)'; 0 0 0 1];
    for i = 2:size(e_bh,1)
        % find the current transformations
        E_bhi = [quat2rotm(e_bh(i,[7, 4:6])), e_bh(i,1:3)'; 0 0 0 1];
        E_sci = [quat2rotm(e_sc(i,[7, 4:6])), e_sc(i,1:3)'; 0 0 0 1];

        % calculate the relative transformation
        E_a = invE_bh1 * E_bhi;
        E_b = E_sc1 * FINV(E_sci);
        
        % append the valeues 
        t_a = [t_a E_a(1:3,4)];
        t_b = [t_b E_b(1:3,4)];
        R_a = cat(3, R_a, E_a(1:3,1:3));
        R_b = cat(3, R_b, E_b(1:3,1:3));
        alphas = [alphas; vee(logm(E_a(1:3,1:3)))'];
        betas = [betas; vee(logm(E_b(1:3,1:3)))'];
        
    end

    
%% Find Rx
    Rx = solveRx(alphas, betas);
    
%% Find tx
    tx = solveTx(R_a, t_a, R_b, t_b, Rx);

%% return X
    X = [Rx tx; 0 0 0 1];

end