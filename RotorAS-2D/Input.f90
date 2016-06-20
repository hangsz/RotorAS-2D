module input
    implicit none
    
    ! file
    character(len=100),save::caseRoute_file="D:\Users\Hang\Documents\Visual Studio\Case"
    character(len=1),save:: gridNum_file="2" 
    character(len=1),save:: fileNum_file="3"
    
    ! grid
    character(len=100),save::caseRoute_grid="D:\Users\Hang\Documents\Visual Studio\Case"
    character(len=1),save:: gridNum_grid="2" 
    
    character(len=3),save::layerNum = "30"
    character(len=3),save::growthRate = "1.2"
    character(len=7),save::thick = "1.0E-5"
    character(len=30),save::airfoilName ="naca0012-130"
    
    ! flow
    character(len=100),save::caseRoute_flow="D:\Users\Hang\Documents\Visual Studio\Case"
    character(len=1),save:: gridNum_flow="2" 
    character(len=1),save:: fileNum_flow="3"
    !来流
    character(len=5),save::Ma = "0.6"
    character(len=10),save::Re = "5.0E6"
    character(len=5),save::att = "2.89"
    character(len=1),save::isPre = "N"
    !状态 
    character(len=1),save::isMove="N"
    character(len=5),save::ampl="2.41"
    character(len=6),save::kr="0.0808"
    !格式
    character(len=3),save::conFluxNum ="JST"
    character(len=3),save::turModelNum ="SA"
    
    !收敛
    character(len=5),save::staticMax="250"
    character(len=6),save::eps="1.0E-5"
    character(len=1),save::cycleNum="3"
    character(len=3),save::cycleStep="200"
    character(len=2),save::steps="25"
    character(len=3),save::inStep="200"
    character(len=6),save::eps_in="1.0E-2"
    character(len=9),save::CFL="10000.0"
    character(len=6),save::dt_r="0.05"
    !-----------------------------------------------
    !后处理
    character(len=100),save:: caseRoute_post="D:\Users\Hang\Documents\Visual Studio\Case"
    character(len=1),save:: gridNum_post="2" 
    character(len=1),save:: fileNum_post="3"
    character(len=10),save:: state = "unsteady"
    character(len=5),save:: xPos="0.25",yPos="0.0"
end module
    