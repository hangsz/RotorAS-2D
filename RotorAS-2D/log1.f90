! 主对话框回调子程序
subroutine log1_CB ( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log1_CB
    use IFWIN
    use IFLOGM
    use ctrl1
    use input,only:caseRoute_file,gridNum_file,fileNum_file
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype ,hwnd
    
    if (callbacktype == dlg_init) then 
        retlog = DlgSet(dlg, ID_log1_edit1, caseRoute_file)
        retlog = DlgSet(dlg, ID_log1_edit2, gridNum_file)
        retlog = DlgSet(dlg, ID_log1_edit3, fileNum_file)
      
    else
    ! 对话框退出时执行的代码
    endif
    end subroutine
    
subroutine log1_ok_CB( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log1_ok_CB
    use IFWIN
    use IFQWIN
    use IFLOGM
    use ctrl1
    use input,only:caseRoute_file,gridNum_file,fileNum_file
    use input,only:caseRoute_grid,gridNum_grid
    use input,only:caseRoute_flow,gridNum_flow,fileNum_flow
    use input,only:caseRoute_post,gridNum_post,fileNum_post
    
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype
 
    retlog = DlgGet(dlg, ID_log1_edit1, caseRoute_file)
    retlog = DlgGet(dlg, ID_log1_edit2, gridNum_file)
    retlog = DlgGet(dlg, ID_log1_edit3, fileNum_file)
    
    
    call ClearScreen($GCLEARSCREEN)
    write(*,*) "!-----------输入-------------!"
    write(*,*)  "caseRoute",caseRoute_file
    write(*,*)  "gridNum: ",gridNum_file
    write(*,*)  "fileNum:  ",fileNum_file
    write(*,*) "!---------------------------!"
    !------------------------------------------
    !修改各个求解器的参数   
    
    call fileSet_Flow(caseRoute_file,gridNum_file,fileNum_file)
    call fileSet_Grid(caseRoute_file,gridNum_file)
    call fileSet_Post(caseRoute_file,gridNum_file,fileNum_file)
    
    !-------------------------------
    ! 修改gui显示的参数
    caseRoute_grid = caseRoute_file
    caseRoute_flow = caseRoute_file
    caseRoute_post = caseRoute_file
    
    gridNum_grid = gridNum_file
    gridNum_flow = gridNum_file
    gridNum_post = gridNum_file
    
    fileNum_flow = fileNum_file
    fileNum_post = fileNum_file
    
    !------------------------------------
    
   
  
end subroutine 
 
    
