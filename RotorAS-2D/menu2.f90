subroutine gridDlg(checked)
    USE IFWIN
    USE IFLOGM
    USE ctrl2
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
 
    external::log2_CB
    external::log2_ok_CB

    ! 初始化对话框
    retlog = DLGINIT(ID_log2, log2)
   
    ! 对话框回调子程序
    retlog = DLGSETSUB (log2,ID_log2,log2_CB )
  
    ! 设置“确定”按钮的回调子程序
    retlog = DlgSetSub(log2, ID_log2_ok, log2_ok_CB)
 
    ! 显示对话框
    results = DLGMODAL(log2) 
   
    ! 释放对话框占用的资源
    call DLGUNINIT (log2)

    end subroutine
    
subroutine gridExe(checked)
    USE IFWIN
    use IFQWIN
    USE IFLOGM
    USE ctrl2
    use control_Grid,only:jMax,growthRate,thick,airfoilName
    use triangleGrid,only:solverUnstructured
    
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
    
    character(len=100)::str1
    character(len=100)::str2
    character(len=100)::str3
    character(len=100)::str4
    
    integer( kind=4 )::myType,isGrid
    character(len=500):: msg
    character(len=30)::caption
   
    external::log2_CB
    external::log2_ok_CB
    
    write(str1,*)  jMax
    write(str2,"(F4.1)")  growthRate
    write(str3,"(E6.1E1)")  thick
    write(str4,*)  airfoilName
    
    
    str1 = "结构网格层数:  "//trim(str1)
    str2 = "增长率:       "//trim(str2)
    str3=  "第一层网格厚度："//trim(str3)
    str4=  "翼型名:       "//trim(str4)//".dat"
    
    !msg =   str1  &
    !    & //str2  &
    !    & //str3  &
    !    & //str4//""C
    
    !msg ="结构网格层数："//trim(str1) &
    !    &//"\n 增长率："//trim(str2)  &
    !    &//"第一层网格厚度："//trim(str3)&
    !    &//"翼型名："//str4
    
    msg="---确保网格设置正确---"
    
    caption = "网格生成"
    
    myType = MB$ICONQUESTION .or. MB$YESNO .Or. MB$DEFBUTTON1
    
    isGrid = MessageBoxQQ(msg,caption,myType)
    
    if( isGrid == MB$IDYES ) then
        call ClearScreen($GCLEARSCREEN)
        call solverUnstructured
    end if
    
end subroutine
