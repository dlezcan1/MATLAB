function filename = pathjoin(path)
%PATHJOIN joins a string array into a single file name
    
    filename = strjoin(path, filesep);

end