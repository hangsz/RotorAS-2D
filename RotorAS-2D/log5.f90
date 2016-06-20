! 主对话框回调子程序
subroutine log5_CB ( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log1_CB
    use IFWIN
    use IFLOGM
    use ctrl5
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype 
    
    character(len=200):: text
    
    text = "RotorAS-2D\rVersion 1.2.3\rCopyright by 孙振航 桑树浩\r直升机旋翼动力学国家级重点实验室"C
    if (callbacktype == dlg_init) then 
        retlog = DlgSet(dlg, ID_log5_static1, text)
    else
    ! 对话框退出时执行的代码
    endif
    end subroutine
    
subroutine log5_ok_CB( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log5_ok_CB
    use IFWIN
    use IFLOGM
    use ctrl1
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype
 
  
    !retlog = DlgGet(dlg, ID_log1_edit1, caseRoute)
    !retlog = DlgGet(dlg, ID_log1_edit2, gridNum)
    !retlog = DlgGet(dlg, ID_log1_edit3, fileNum)
    !    
   
 
end subroutine 
 
    
