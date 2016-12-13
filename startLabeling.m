addpath('toyBox')
ps = 'Images/test/';
pg = 'Images/GT/';

arqs = dir([ps '*.jpg']);
mkdir(pg);
if ~exist('./temp/', 'dir'), mkdir('./temp/'); end;

if exist('./temp/tmpdata.mat', 'file')
    tmp = load('./temp/tmpdata');
    tmpF = dir('./temp/tmpdata.mat');
else
    tmp.fname = '';
    tmp.gtMap = 0;
    tmp.vList = cell(0);
    tmpF.datenum = now;
end

for imgIdx = 1:length(arqs);
    fname = arqs(imgIdx).name;
    img0 = double(imread([ps fname])) ./ 255;
    imSz = size(img0);
    gtName = [pg fname(1:end-4) '.pgm'];
    vlName = [pg fname(1:end-4) '_polyVList'];
    if exist([vlName '.mat'], 'file')==2
        oldSeg = load(vlName);
        oldF = dir([vlName '.mat']);
    else
        oldSeg.gtMap = zeros(imSz(1:2));
        oldSeg.vList = cell(0);
        oldF.datenum = tmpF.datenum-1;
    end
    if strcmp(tmp.fname, fname) 
        if oldF.datenum < tmpF.datenum
            oldSeg.gtMap = tmp.gtMap;
            oldSeg.vList = tmp.vList;
        end
    end
    [gtMap, vList] = getUserLabels(oldSeg.gtMap, img0, oldSeg.vList, fname);
    % save to file;
    save(vlName, 'vList', 'gtMap');
    newMap = splitSegComponents(gtMap);
    im3 = segImage(img0, newMap);
    imwrite(im3, [pg fname(1:end-4) '.png']);
    imwrite(uint16(newMap), gtName);
end