function [newMap] = splitSegComponents(gtMap)


newMap = zeros(size(gtMap));
nReg = max(gtMap(:));
nSeg = 1;

for r=1:nReg
    [L, n] = bwlabel(gtMap==r);
    for i=1:n
        newMap(L==i) = nSeg;
        nSeg = nSeg + 1;
    end
end
    
