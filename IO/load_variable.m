%% load_variable.m
% this is a function to load a variable from a .mat file

function v = load_variable(file, variable)
    arguments
        file string
        variable string
    end
    
    v = getfield(load(file, variable), variable);

end