! 主对话框回调子程序
subroutine log2_CB ( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log2_CB
    use IFWIN
    use IFLOGM
    use ctrl2
    use input,only:
    use input,only:caseRoute_grid,gridNum_grid,layerNum,growthRate,thick,airfoilName
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype ,hwnd
    
    if (callbacktype == dlg_init) then
        retlog = DlgSet ( log2, ID_log2_combo1,5, DLG_NUMITEMS )
        retlog = DlgSet ( log2, ID_log2_combo1, "1.0E-3", 1 )
        retlog = DlgSet ( log2, ID_log2_combo1, "1.0E-4", 2 )
        retlog = DlgSet ( log2, ID_log2_combo1, "1.0E-5", 3 )
        retlog = DlgSet ( log2, ID_log2_combo1, "1.0E-6", 4 )
        retlog = DlgSet ( log2, ID_log2_combo1, "1.0E-7", 5 ) 
   
        retlog = DlgSet(dlg, ID_log2_edit4, caseRoute_grid)
        retlog = DlgSet(dlg, ID_log2_edit5, gridNum_grid)
        
        retlog = DlgSet(dlg, ID_log2_edit1, layerNum)
        retlog = DlgSet(dlg, ID_log2_edit2, growthRate)
        retlog = DlgSet(dlg, ID_log2_edit3, airfoilName)
        retlog = DlgSet(dlg, ID_log2_combo1, thick)
    else
     !对话框退出时执行的代码
    endif
    
    end subroutine
    
subroutine log2_ok_CB( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log2_ok_CB
    use IFWIN
    use IFQWIN
    use IFLOGM
    use ctrl2
    use input,only:caseRoute_grid,gridNum_grid,layerNum,growthRate,thick,airfoilName
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype
    
    retlog = DlgGet(dlg, ID_log2_edit4, caseRoute_grid)
    retlog = DlgGet(dlg, ID_log2_edit5, gridNum_grid)

    retlog = DlgGet(dlg, ID_log2_edit1, layerNum)
    retlog = DlgGet(dlg, ID_log2_edit2, growthRate)
    retlog = DlgGet(dlg, ID_log2_edit3, airfoilName)
    retlog = DlgGet(dlg, ID_log2_combo1, thick)
    
   
    
    call ClearScreen($GCLEARSCREEN)
    write(*,*) "!-----------输入-------------!"
    write(*,*)  "caseRoute:",caseRoute_grid
    write(*,*)  "gridNum: ",gridNum_grid
    write(*,*)
    write(*,*)  "layerNum: ",layerNum
    write(*,*)  "growthRate: ",growthRate
    write(*,*)  "thick: ",thick
    write(*,*)  "airfoilName: ",airfoilName
    write(*,*) "!---------------------------!"
    
    call fileSet_Grid(caseRoute_grid,gridNum_grid)
    call gridSet_Grid(layerNum,thick,growthRate,airfoilName )
end subroutine 
 