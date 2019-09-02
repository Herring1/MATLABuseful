function [ax]=Nplots(nrows,ncols)
% Inputs:
%       nrows - number of rows of subplots in the figure window
%       ncols - number of columns of subplots in the figure window
% 
% Outputs:
%       ax    - a structure containing the handles to each axis labelled
%               numerically with linear indexing from the top left.
%
%       To set the labels/children of a particular axis be sure to use the 
%       syntax: ax.ax1 e.g.:
%           xlabel(ax.ax2,'NewX')
%           ylabel(ax.ax2,'NewY')
%           title(ax.ax2,'NewTitle')

figure('units', 'Normalized','Position',[0.1 0.1 0.75 0.75]) 
% ax={};
ax=struct();
for r=1:nrows
    for c=1:ncols
        eval(['ax' num2str(((r-1)*ncols)+c) '=subplot(nrows,ncols,((r-1)*ncols)+c);']);
        eval(['set(ax' num2str(((r-1)*ncols)+c) ',"units","Normalized","OuterPosition",[0+((1/ncols)*(c-1)) (1-(1/nrows))-((1/nrows)*(r-1)) 1/ncols 1/nrows])'])
        set(gca,'FontWeight','bold')
        xlabel('X'); ylabel('Y'); title('title')
        %Indiviual Output (must specify all outputs)
%         eval(['varargout{((r-1)*ncols)+c}=ax' num2str(((r-1)*ncols)+c) ';'])

        %Cell Output (lose axis names)       
%         eval(['ax=[ax; ax' num2str(((r-1)*ncols)+c) '];'])

        %Struct Output
        eval(['ax.ax' num2str(((r-1)*ncols)+c) '=ax' num2str(((r-1)*ncols)+c) ';'])
    end
end
end