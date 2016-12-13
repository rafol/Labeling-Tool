function [axHandler, hIm, api] = plotUI(hFig, im2 )
    figure(hFig);
    hIm = imshow(im2);
    % set window position
    figWindPos = get(hFig, 'Position');
    figWindPos(2) = figWindPos(2) + 50;
    set(hFig, 'Position', figWindPos);
    axHandler = gca;
    hSP = imscrollpanel(hFig,hIm);
    api = iptgetapi(hSP);
%     api.setMagnification(api.findFitMag());
%     api.setMagnification(2);
    % Add a Magnification Box and an Overview tool.
    imoverview(hIm);
    % add object selection tool
%     [hContSelFig, hContSelMenu] = contSelTool(hIm, gtMap);
end