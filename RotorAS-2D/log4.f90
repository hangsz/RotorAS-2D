! 主对话框回调子程序
subroutine log4_CB ( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log4_CB
    use IFWIN
    use IFLOGM
    use ctrl4
    use input,only:caseRoute_post,gridNum_post,fileNum_post,state,xPos,yPos
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype ,hwnd
   
    if (callbacktype == dlg_init) then 
        
        retlog = DlgSet ( log4, ID_log4_combo1,2, DLG_NUMITEMS )
        retlog = DlgSet ( log4, ID_log4_combo1, "steady", 1 )
        retlog = DlgSet ( log4, ID_log4_combo1, "unsteady", 2 )
        
        retlog = DlgSet(dlg, ID_log4_edit1, caseRoute_post)
        retlog = DlgSet(dlg, ID_log4_edit2, gridNum_post)
        retlog = DlgSet(dlg, ID_log4_edit3, fileNum_post)
        retlog = DlgSet(dlg, ID_log4_combo1, state)
        retlog = DlgSet(dlg, ID_log4_edit4, xPos)
        retlog = DlgSet(dlg, ID_log4_edit5, yPos)
    else
    ! 对话框退出时执行的代码
    endif
    !
    end subroutine
    
subroutine log4_ok_CB( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log4_ok_CB
    use IFWIN
    use IFQWIN
    use IFLOGM
    use ctrl4
    use input,only:caseRoute_post,gridNum_post,fileNum_post,state,xPos,yPos
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype
 
    retlog = DlgGet(dlg, ID_log4_edit1, caseRoute_post)
    retlog = DlgGet(dlg, ID_log4_edit2, gridNum_post)
    retlog = DlgGet(dlg, ID_log4_edit3, fileNum_post)
    retlog = DlgGet(dlg, ID_log4_combo1, state)
    !retlog = DlgGet(dlg, ID_log4_edit4, xPos)
    !retlog = DlgGet(dlg, ID_log4_edit5, yPos)
    
    call ClearScreen($GCLEARSCREEN)
    write(*,*) "!-----------输入-------------!"
    write(*,*)  "caseRoute",caseRoute_post
    write(*,*)  "gridNum: ",gridNum_post
    write(*,*)  "fileNum:  ",fileNum_post
    write(*,*)  "state:  ",state
    write(*,*)  "[x,y]:  ",xPos,yPos
    write(*,*) "!--------------------------------!"
     
    call fileSet_Post(caseRoute_post,gridNum_post,fileNum_post)
    call motionSet_Post(state)
    
   
end subroutine 
 