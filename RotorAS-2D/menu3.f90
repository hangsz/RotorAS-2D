subroutine solverDlg(checked)
    USE IFWIN
    USE IFLOGM
    USE ctrl3
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
 
    external::log3_CB
    external::log3_ok_CB

    ! 初始化对话框
    retlog = DLGINIT(ID_log3, log3)
    ! 初始化选项卡控件
    ! 共有四个选项卡
    retlog = DlgSet (log3, ID_tab3, 4, DLG_NUMITEMS )
    retlog = DlgSet (log3, ID_tab3, "来流", 1) ! 第一个
    retlog = DlgSet (log3, ID_tab3, "状态", 2) ! 第二个
    retlog = DlgSet (log3, ID_tab3, "格式", 3) ! 第三个
    retlog = DlgSet (log3, ID_tab3, "收敛", 4) ! 第四个
    ! 将选项卡和对话框对应
    retlog = DlgSet (log3, ID_tab3, ID_log3_tab1, 1)
    retlog = DlgSet (log3, ID_tab3, ID_log3_tab2, 2)
    retlog = DlgSet (log3, ID_tab3, ID_log3_tab3, 3)
    retlog = DlgSet (log3, ID_tab3, ID_log3_tab4, 4)
 
    ! 初始化对话框中和tab联系的对话框且设置回调子程序
    
    call log3_tab1_set
    ! 初始化和第一个选项卡对应的对话框
    ! retlog = DLGINIT(ID_log3_tab1, log3_tab1)
    ! 设置第一个对话框的回调子程序
    ! retlog = DLGSETSUB (log3_tab1,ID_log3_tab1,log3_tab1_CB)
    ! retlog = DLGSETSUB (log3_tab1,ID_log3_tab1)
   
    !----------------------------------------------
    call log3_tab2_set
    ! 初始化和第二个选项卡对应的对话框
    !retlog = DLGINIT(ID_log3_tab2, log3_tab2)
    ! 设置第二个对话框的回调子程序
    !retlog = DLGSETSUB (log3_tab2,ID_log3_tab2,log3_tab2_CB)
    !retlog = DLGSETSUB (log3_tab2,ID_log3_tab2)
   
    !-----------------------------------------------
    call log3_tab3_set
    ! 初始化和第三个选项卡对应的对话框
    !retlog = DLGINIT(ID_log3_tab3, log3_tab3)
    
    call log3_tab4_set
    ! 初始化和第四个选项卡对应的对话框
    !retlog = DLGINIT(ID_log3_tab4, log3_tab4)
    
    ! 对话框回调子程序，用来初始化TAB控件
    retlog = DLGSETSUB (log3,ID_log3,log3_CB )
  
    ! 设置“确定”按钮的回调子程序
     retlog = DlgSetSub(log3, ID_log3_ok, log3_ok_CB)
 
    ! 显示对话框
    results = DLGMODAL(log3) 
   
    ! 释放对话框占用的资源
    call DLGUNINIT (log3)
    call DLGUNINIT (log3_tab1)
    call DLGUNINIT (log3_tab2)
    call DLGUNINIT (log3_tab3)
    call DLGUNINIT (log3_tab4)
    
    end subroutine 
    
subroutine flowExe(checked)
    USE IFWIN
    use IFQWIN
    USE IFLOGM

    !use control_Grid,only:jMax,growthRate,thick,airfoilName
    use FVM,only:solver
    
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
    

    integer( kind=4 )::myType,isSolve
    character(len=500):: msg
    character(len=30)::caption
   
    msg = "---确保流场设置正确--"
    
    caption = "求解"  
    
    myType = MB$ICONQUESTION .or. MB$YESNO .Or. MB$DEFBUTTON1
    

    isSolve = MessageBoxQQ(msg,caption,myType)
    
    if( isSolve == MB$IDYES ) then
        call ClearScreen($GCLEARSCREEN)
        call solver
    end if
    
end subroutine
    