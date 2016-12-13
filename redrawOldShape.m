function [gtMap, vList] = redrawOldShape(axHandler, gtMap, vList, roiIDX)

% get user input
initPos = vList{roiIDX};
polyRoiH = impoly(axHandler, initPos);
wait(polyRoiH);
roiMask = createMask(polyRoiH);

% delete current polygon
vList{roiIDX} = [];

% update map
% finished = all(roiMask(:)==0);
% nReg = max(gtMap(:)) + double(~finished);
nReg = roiIDX;
gtMap(roiMask) = nReg;
% gtMap = splitSegComponents(gtMap);

% update polygon list
pos = getPosition(polyRoiH);
vList{nReg} = pos;

gtMap = autoDrawShapes(vList, size(gtMap));