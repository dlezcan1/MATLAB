%% struct2array.m
%
% function to turn struct into an array
%
% - written by: Dimitri Lezcano

function arr = struct2array(s)
    arguments
        s struct;
    end
    
    arr = cell2mat(struct2cell(s));
end