%% savemat_no_overwrite
%
% returns filename to make sure there is no overwriting of variables
%
% - written by: Dimitri Lezcano

function new_filename = filename_no_overwrite(filename)
    if isfile(filename)
        % split the text
        text_split = strsplit(filename, '.');
        filename_noext = strjoin(text_split(1:end-1), '.');
        ext = text_split{end};
        
        % count number of repeated files + 1
        N = numel(dir(strcat(filename_noext, "*"))) + 1;
        
        % generate the new filename
        new_filename = strcat(filename_noext, sprintf('-%03d.', N), ext);
        
    else
        new_filename = filename;
    end

end