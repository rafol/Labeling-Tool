function [gtMap, vList] = drawNewShape(axHandler, gtMap, vList)

polyRoiH = impoly(axHandler);
wait(polyRoiH);
roiMask = createMask(polyRoiH);

% update map
nReg = max(gtMap(:)) + 1;
gtMap(roiMask) = nReg;
% gtMap = splitSegComponents(gtMap);

% update polygon list
pos = getPosition(polyRoiH);
vList{nReg} = pos;