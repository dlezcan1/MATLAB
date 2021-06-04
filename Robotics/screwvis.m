%% screwvis.m
% This function is to visualize screw motion.
% - written by Dimitri Lezcano
% - Date: Nov. 1, 2019


rosshutdown;
rosinit;

screw =[1; 0; 1/(2*pi); 0; 0; 1];

frame = tf_frame("base_link","Frame_Moving",eye(4))

warning('off','all')
for theta = 0:2*pi/100:2*pi
    disp(["theta = " num2str(theta)])
    etheta = screwexp(screw,theta);
    frame.move_frame("base_link",etheta)
    pause(1)
    
end
warning('on','all')