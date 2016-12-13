function [strSegList] = getSegList(gtMap)


strSegList = cell(1,0);
strSegList{1} = 'New Contourn';
strSegList{2} = 'Finish Labeling';

RL = unique(gtMap(gtMap>0));
for nSeg=1:length(RL);
    strSegList{nSeg+2} = sprintf('Contour %i', nSeg);
end
    
