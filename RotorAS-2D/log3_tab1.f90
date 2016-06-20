subroutine log3_tab1_set
    USE IFWIN
    USE IFLOGM
    USE ctrl3
    implicit none
    type(dialog) dlg
    integer( kind=4 )::results
    logical( kind=4 )::retlog  
    
    external:: log3_tab1_CB
    external:: log3_tab1_ok_CB

    ! 初始化对话框
    retlog = DLGINIT(ID_log3_tab1, log3_tab1)
    
    ! 对话框回调程序
    retlog = DLGSETSUB (log3_tab1,ID_log3_tab1,log3_tab1_CB )
   
    ! 设置“确定”按钮的回调子程序
    retlog = DlgSetSub(log3_tab1, ID_log3_tab1_ok, log3_tab1_ok_CB)
    
    !results = DLGMODAL (datadlg)
    
    !call DLGUNINIT (datadlg)
end subroutine 
    
subroutine log3_tab1_CB( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log3_tab1_CB
    use IFWIN
    use IFLOGM
    use ctrl3
    use input,only:Ma,Re,att,isPre
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype
 
    
    if (callbacktype == dlg_init) then
        ! 对话框显示时执行
         ! 初始化列表框
        retlog = DlgSet ( log3_tab1, ID_log3_tab1_combo1,2, DLG_NUMITEMS )
        retlog = DlgSet ( log3_tab1, ID_log3_tab1_combo1, "Y", 1 )
        retlog = DlgSet ( log3_tab1, ID_log3_tab1_combo1, "N", 2 )
    
        retlog = DlgSet(dlg, ID_log3_tab1_edit1, Ma)
        retlog = DlgSet(dlg, ID_log3_tab1_edit3, Re)
        retlog = DlgSet(dlg, ID_log3_tab1_edit2, att)
        retlog = DlgSet(dlg, ID_log3_tab1_combo1, isPre)

    else
        ! 对话框退出时执行
    endif
    
end subroutine 
    
subroutine log3_tab1_ok_CB( dlg, id, callbacktype)
    !DEC$ ATTRIBUTES DEFAULT :: log3_tab1_ok_CB
    use IFWIN
    use IFQWIN
    use IFLOGM
    use ctrl3
    use input,only:Ma,Re,att,isPre
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype
   
    retlog = DlgGet(dlg, ID_log3_tab1_edit1, Ma)
    retlog = DlgGet(dlg, ID_log3_tab1_edit3, Re)
    retlog = DlgGet(dlg, ID_log3_tab1_edit2, att)
    retlog = DlgGet(dlg, ID_log3_tab1_combo1, isPre)
    
    call ClearScreen($GCLEARSCREEN)
    write(*,*) "!-----------输入-------------!"
    write(*,*)  "Ma:",Ma
    write(*,*)  "Re:",Re
    write(*,*)  "att:",att
    write(*,*)  "isPrecondition:",isPre
    write(*,*) "!---------------------------!"
    
    
    call inflowSet_FLow(Ma,Re,att,isPre)
    
    
    
end subroutine 
 