function [hMenuFig, popup] = contSelTool(varargin)
%   HBOX = contSelTool(HPARENT,HIMAGE) % usage


narginchk(3, 3);
himage = varargin{1};
gtMap = varargin{2};
vList = varargin{3};

iptcheckhandle(himage,{'image'},mfilename,'HIMAGE',1)
hMenuFig = figure('Menubar','none',...
    'IntegerHandle','off',...
    'HandleVisibility','Callback',...
    'NumberTitle','off',...
    'Name','Contour Selection', ...
    'Tag','contSellect',...
    'Visible','off');
%% set figure size
fig_pos = get(hMenuFig,'Position');
curUnits = get(hMenuFig,'Units');
set(hMenuFig,'Units','Pixels');
wid = 200;
hei = 100;
set(hMenuFig,'Position',[fig_pos(1)-wid*2 fig_pos(2)-hei wid hei]);
set(hMenuFig,'Units',curUnits);

%% drawnow is a workaround to geck 268506
drawnow;

% create panel
% strLs = getSegList(gtMap);
strLs = getSegListVL(vList);
popup = uicontrol('Style', 'popup',...
                  'String', strLs,...
                  'Parent', hMenuFig, ...
                  'Position', [10 10 wid-10 hei-20],...
                  'Value',1,'Callback',@popupCallback);  
set(hMenuFig,'Visible','on')


data = guidata(hMenuFig);
data.hMenuFig = hMenuFig;
guidata(hMenuFig,data)

end % imoverview

