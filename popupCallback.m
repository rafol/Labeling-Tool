function popupCallback(hObject, eventdata, handles)
    sels = get(hObject,'String');
    idx  = get(hObject,'Value');
    
%     set(handles.popupmenu, 'UserData', idx);
    data = guidata(hObject);
    data.curentSlectionIDX = idx;
    data.curentSlectionStr = sels{idx};
    guidata(hObject,data)
    
    uiresume(data.hMenuFig);

end