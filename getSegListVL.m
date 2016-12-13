function [strSegList] = getSegListVL(vList)


strSegList = cell(1,0);
strSegList{1} = 'New Contourn';
strSegList{2} = 'Finish Labeling';

plList = find(~cellfun(@isempty,vList));
for nSeg=plList
    strSegList{nSeg+2} = sprintf('Edit Contour %i', nSeg);
end
    
strSegList = strSegList(~cellfun(@isempty,strSegList));