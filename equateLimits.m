function [ax] = equateLimits(varargin)
%Automatically make all axes limits the same on a multi-axes figure

%First input is the axes array or structure containing the handles of the axes objects in a 
% multiplot figure.

% Second input is to refer to specific numbered axes objects in the figure that should be equated,
% if left blank, then all plots in the figure will have their axes matched.


if nargin<1
    ax=get(gcf,'Children');
end
structflag=0;
ax=varargin{1}; 


if isstruct(ax)==1 %Unpack into axes array
    structflag=1; %for repacking into axes structure
    temp=[];
    for i=1:length(fields(ax))
        eval(['temp=[temp; ax.ax' num2str(i) ' ];'])
    end
    ax=temp;
end
    
if nargin<2
    axind=1:length(ax);
else
    axind=varargin{2}; 
end    

if isobject(ax)==1 %ax structure not given.
    %Using 'get', find both data ranges and reset them to the extremal values of each
    xl=[]; yl=[];
    for i=1:length(axind)
        xl=[xl; ax(axind(i)).XLim];
        yl=[yl; ax(axind(i)).YLim];
    end
    for i=1:length(axind)
        ax(axind(i)).XLim=[min(xl(:,1)) max(xl(:,2))];
        ax(axind(i)).YLim=[min(yl(:,1)) max(yl(:,2))];
    end
end

if structflag==1
    %Repackage into struct if struct was given as input
    temp=varargin{1};
    for i=1:length(axind)
       eval(['temp.ax' num2str(axind(i)) '=ax(axind(i));']) 
    end
    ax=temp;
end
    

end