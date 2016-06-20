! flow
subroutine fileSet_Flow( str1,str2,str3)
    use IFQWIN
    use controlPara, only:caseRoute,gridNum,fileNum
    implicit none
    character(len=*),intent(in)::str1,str2,str3
    
    caseRoute = str1
    gridNum = str2
    fileNum = str3
    
    !call ClearScreen($GCLEARSCREEN)
    write(*,*) "!-----------求解器目录设置-------------!"
    write(*,*)  "caseRoute_file",caseRoute
    write(*,*)  "gridNum_file: ",gridNum
    write(*,*)  "fileNum_file:  ",fileNum
    write(*,*) "!-----------------------------------!"
    
end subroutine
      

subroutine inflowSet_Flow(str1,str2,str3,str4)

    use controlPara ,only: Ma_inf,Re_inf,att,isPrecondition
    
    implicit none
    character(len=*),intent(in)::str1,str2,str3,str4
    
    read(str1,*)  Ma_inf
    read(str2,*)  Re_inf
    read(str3,*)  att
    if(str4 =="Y") then
       isPrecondition = 1
    else
        isPrecondition = 0
    end if
    
    write(*,*) "!----------求解器-来流-------------!"
    write(*,*)  "Ma_inf:",Ma_inf
    write(*,*)  "Re_inf:",Re_inf
    write(*,*)  "att:",att
    write(*,*)  "isPrecondition:",isPrecondition
    write(*,*) "!--------------------------------!"
    
    
end subroutine

subroutine motionSet_Flow(str1,str2,str3)
    use controlPara ,only: moveNum,att_ampl,kr
    
    implicit none
    character(len=*),intent(in)::str1
    character(len=*),intent(in)::str2
    character(len=*),intent(in)::str3
     
    if(str1 =="Y") then
        moveNum = 1
    else
        moveNum = 0
    end if
    
    read(str2,*)  att_ampl
    read(str3,*)  kr
    
    write(*,*) "!----------求解器-状态-------------!"
    write(*,*) "MoveNum:",moveNum
    write(*,*) "att_ampl:",att_ampl
    write(*,*) "kr:",kr
    write(*,*) "!--------------------------------!"
    
    end subroutine
    
subroutine schemeSet_Flow(str1,str2)
    use controlPara ,only: conFluxNum,turModelNum
    implicit none
    character(len=*),intent(in)::str1
    character(len=*),intent(in)::str2
     
    if( str1 == "JST")  then
        conFluxNum = 1 
    else  !Roe
        conFluxNum = 2
    end if
    
    if( str2=="SA") then
        turModelNum =1
    elseif( str2=="SST") then
        turModelNum = 2
    else
        turModelNum = 0
    end if
    
    write(*,*) "!----------求解器-格式-------------!"
    write(*,*) "conFluxNum: ",conFluxNum
    write(*,*) "turModelNum: ",turModelNum
    write(*,*) "!--------------------------------!"
    
    end subroutine
    
subroutine iterSet_Flow(str1,str2,str3,str4,str5,str6,str7,str8,str9)
           !iterSet_Flow(staticMax,eps,cycleNum,cycleStep,steps,inStep,eps_in,CFL,dt_r)
    use controlPara ,only: staticMax,eps,cycleNum,cycleStep,steps,inStep,eps_in,CFL,dt_r
    
    implicit none
    character(len=*),intent(in)::str1,str2,str3,str4 ,str5,str6 ,str7,str8 ,str9 
    
    read(str1,*)  staticMax
    read(str2,*)  eps
    read(str3,*)  cycleNum
    read(str4,*)  cycleStep
    read(str5,*)  steps
    read(str6,*)  inStep
    read(str7,*)  eps_in
    read(str8,*)  CFL
    read(str9,*)  dt_r
    
    write(*,*) "!----------求解器-收敛-------------!"
    write(*,*)  "staticMax: ",staticMax
    write(*,*)  "eps: ",eps
    write(*,*)  "cycleNum: ",cycleNum
    write(*,*)  "cycleStep: ",cycleStep
    write(*,*)  "steps: ",steps
    write(*,*)  "inStep: ",inStep
    write(*,*)  "eps_in: ",eps_in
    write(*,*)  "CFL: ",CFL
    write(*,*)  "dt_r: ",dt_r
    write(*,*) "!--------------------------------!"
        
end subroutine


!------------------------------------
subroutine fileSet_Grid( str1,str2)
    use IFQWIN
    use control_Grid ,only: caseRoute,gridNum 
    implicit none
    character(len=*),intent(in)::str1
    character(len=*),intent(in)::str2
    
    caseRoute = str1
    gridNum = str2
    
    !call ClearScreen($GCLEARSCREEN)
    write(*,*) "!-----------网格目录设置-------------!"
    write(*,*)  "caseRoute_grid",caseRoute
    write(*,*)  "gridNum_grid: ",gridNum
    
    write(*,*) "!---------------------------------!"

    
end subroutine
       
subroutine gridSet_Grid(str1,str2,str3,str4)
    use control_Grid ,only: jMax,thick,growthRate,airfoilName
    implicit none
    character(len=*),intent(in)::str1  ! layerNum
    character(len=*),intent(in)::str2  ! growthRate
    character(len=*),intent(in)::str3  ! thick 
    character(len=*),intent(in)::str4  ! thick 
    
    read(str1,*)  jMax
    read(str2,*)  thick
    read(str3,*)  growthRate
    airfoilName = str4
    
    write(*,*) "!-----------网格设置------------!"
    write(*,*)  "jMax: ",jMax
    write(*,*)  "growthRate: ",growthRate
    write(*,*)  "thick: ",thick
    write(*,*)  "airfoilName: ",airfoilName
    write(*,*) "!-----------------------------!"
    
    end subroutine
    
    
    
!--------------------------------------------
! post

subroutine fileSet_Post( str1,str2,str3)
    use IFQWIN
    use control_Post ,only: caseRoute,gridNum,fileNum
    implicit none
    character(len=*),intent(in)::str1
    character(len=*),intent(in)::str2
    character(len=*),intent(in)::str3
    
    caseRoute = str1
    gridNum = str2
    fileNum = str3
    
    !call ClearScreen($GCLEARSCREEN)
    write(*,*) "!-----------后处理目录设置-------------!"
    write(*,*)  "caseRoute_post",caseRoute
    write(*,*)  "gridNum_post: ",gridNum
    write(*,*)  "fileNum_post:  ",fileNum
    write(*,*) "!-----------------------------------!"
    
    end subroutine
    
subroutine motionSet_Post(str1)
    use control_Post ,only: isMove
    implicit none
    character(len=*),intent(in)::str1
     
    if( str1=="steady") then
        isMove = "N"
    else
        isMove = "Y"
    end if
    
    write(*,*) "!-----------后处理设置-------------!"
    write(*,*)  "isMove:  ",isMove
    write(*,*) "!--------------------------------!"
end subroutine
      

    