! 主对话框回调子程序
subroutine log3_CB ( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log3_CB
    use IFWIN
    use IFLOGM
    use ctrl3
    use input,only:caseRoute_flow,gridNum_flow,fileNum_flow
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype ,hwnd

    if (callbacktype == dlg_init) then
        hwnd = GetDlgItem(log3%hwnd, ID_tab3)
        retlog = DlgModeless(log3_tab1, SW_hide, hwnd)
        retlog = DlgModeless(log3_tab2, SW_hide, hwnd)
        retlog = DlgModeless(log3_tab3, SW_hide, hwnd)
        retlog = DlgModeless(log3_tab4, SW_hide, hwnd)
        retlog = DlgSet(log3, ID_tab3, 1, dlg_state)
        
        retlog = DlgSet(dlg, ID_log3_edit1, caseRoute_flow)
        retlog = DlgSet(dlg, ID_log3_edit2, gridNum_flow)
        retlog = DlgSet(dlg, ID_log3_edit3, fileNum_flow)
    else
    ! 对话框退出时执行的代码
    endif
  
    end subroutine
    
subroutine log3_ok_CB( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log3_ok_CB
    use IFWIN
    use IFQWIN
    use IFLOGM
    use ctrl3
    use input,only:caseRoute_flow,gridNum_flow,fileNum_flow
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype
 
    retlog = DlgGet(dlg, ID_log3_edit1, caseRoute_flow)
    retlog = DlgGet(dlg, ID_log3_edit2, gridNum_flow)
    retlog = DlgGet(dlg, ID_log3_edit3, fileNum_flow)
        
    call fileSet_Flow(caseRoute_flow,gridNum_flow,fileNum_flow)
    
    call ClearScreen($GCLEARSCREEN)
    write(*,*) "!-----------流场文件设置-------------!"
    write(*,*)  "caseRoute",caseRoute_flow
    write(*,*)  "gridNum: ",gridNum_flow
    write(*,*)  "fileNum:  ",fileNum_flow
    write(*,*) "!---------------------------------!"
    
   
  
end subroutine 