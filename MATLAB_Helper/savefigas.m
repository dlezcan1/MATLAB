%% savefigas
%
% function to wrap savefig and saveas for saving figures
%
% Args:
%   - fig: the figure handle (matlab.ui.Figure)
%   - filename: filename of the image to save (must not end in file ending)
%   
% Name-Value
%   'SaveFig' (Default = true) logical on whether to save the .fig file.
%   'Verbose': (Default = false) logical on whether to display figure
%   'ImageEnding': (Default = '.png') the output format of saveas in
%       ."ending" format  if is empty then does not use saveas
%   

function varargout = savefigas(fig, filename, options)
    %% Arguments Block
    arguments
        fig matlab.ui.Figure;
        filename string;
        options.SaveFig logical = true; 
        options.Verbose logical = false;
        options.ImageEnding char = '.png';
    end
    
    %% Set up file names
    file_fig = strcat(filename, '.fig');
    file_img = strcat(filename, options.ImageEnding);
    
    
    %% Save the figures
    % save .fig
    if options.SaveFig
        savefig(fig, file_fig);
        if options.Verbose
            fprintf("Saved figure %d to: %s\n", fig.Number, file_fig);
        end
    end
    
    % save image
    if ~isempty(options.ImageEnding)
        saveas(fig, file_img);
        if options.Verbose
            fprintf("Saved figure %d to: %s\n", fig.Number, file_img);
        end
    end
    
    %% Output arguments
    if nargout == 1 && options.SaveFig
        varargout{1} = file_fig;
        
    elseif nargout == 1 && ~isempty(options.ImageEnding)
        varargout{2} = file_img;
    
    elseif nargout == 2 && ~isempty(options.ImageEnding) && options.SaveFig
        varargout{1} = file_fig;
        varargout{2} = file_img;
    
    end
            
    
    
end