subroutine postDlg(checked)
    USE IFWIN
    USE IFLOGM
    USE ctrl4
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
 
    external::log4_CB
    external::log4_ok_CB

    ! 初始化对话框
    retlog = DLGINIT(ID_log4, log4)
   
    ! 对话框回调子程序
    retlog = DLGSETSUB (log4,ID_log4,log4_CB )
  
    ! 设置“确定”按钮的回调子程序
     retlog = DlgSetSub(log4, ID_log4_ok, log4_ok_CB)
  
    ! 显示对话框
    results = DLGMODAL (log4) 
   
    ! 释放对话框占用的资源
    call DLGUNINIT (log4)
!
    end subroutine    
    
subroutine postExe(checked)
    USE IFWIN
    use IFQWIN
    USE IFLOGM

    !use control_Grid,only:jMax,growthRate,thick,airfoilName
    use postProcess,only:postSolver
    
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
    

    integer( kind=4 )::myType,isSolve
    character(len=500):: msg
    character(len=30)::caption
   
    msg = "Do you want to continue?"
    
    caption = "后处理"  
    
    myType = MB$ICONQUESTION .or. MB$YESNO .Or. MB$DEFBUTTON1
    

    isSolve = MessageBoxQQ(msg,caption,myType)
    
    if( isSolve == MB$IDYES ) then
        call ClearScreen($GCLEARSCREEN)
        call postSolver
    end if   
    
end subroutine
    