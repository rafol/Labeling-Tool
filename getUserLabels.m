function [gtMap, vList] = getUserLabels(gtMap, img0, vList, fname)
    finished = false;
    if ~exist('vList', 'var')
        vList = cell(0);
    end
    HH = strel('diamond', 1);
    hFig = figure('Toolbar','none','Menubar','none');
    while ~finished
        % show image
        im2 = segImage(img0, gtMap);
        [axHandler, hIm, ~] = plotUI(hFig, im2);
        [hContSelFig, ~] = contSelTool(hIm, gtMap, vList);
        if max(gtMap(:))~=0
            uiwait(hContSelFig);
        end
        data = guidata(hContSelFig);
        delete(hContSelFig);
        if isfield(data, 'curentSlectionIDX')
            CalBackIDX = data.curentSlectionIDX;
            if CalBackIDX>2
%                 CalBackIDX = str2double(data.curentSlectionStr(9:end));
                strPts = strsplit(data.curentSlectionStr, ' ');
                roiIDX = str2double( strPts{end} );
            end
        else
            CalBackIDX = 1;
        end
        switch CalBackIDX
            case 1 % add new contourn
                [gtMap, vList] = drawNewShape(axHandler, gtMap, vList);
            case 2 % finish lalebing
                finished = true;
            otherwise % edit previous contourn
                
                % remove target contourn from map
                tmpGTMap = autoDrawShapesBut(vList, roiIDX, size(gtMap));
                % redraw UI
                im2 = segImage(img0, tmpGTMap);
                [axHandler, hIm, ~] = plotUI(hFig, im2);
                [newgtMap, vList] = redrawOldShape(axHandler, tmpGTMap, vList, roiIDX);
                gtMap = newgtMap;
        end
        % save to temp file;
%         imwrite(img0,'./temp/temp_file.png');
%         imwrite(uint16(gtMap), './temp/temp_file.pgm');
        save('./temp/tmpdata', 'fname', 'gtMap', 'vList')
    end
    delete(hFig);