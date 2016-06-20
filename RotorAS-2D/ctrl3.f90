module ctrl3        ! solver
    use IFLOGM
    use IFWIN

    integer, parameter ::  ID_log3 =             101
    integer, parameter ::  ID_log3_tab1 =        102
    integer, parameter ::  ID_log3_tab2 =        103
    integer, parameter ::  ID_log3_tab3 =        104
    integer, parameter ::  ID_log3_tab4 =        105
    integer, parameter ::  ID_tab3 =             1000
    integer, parameter ::  ID_log3_tab1_edit1 =  1002
    integer, parameter ::  ID_log3_tab1_edit2 =  1003
    integer, parameter ::  ID_log3_tab1_edit3 =  1004
    integer, parameter ::  ID_log3_tab1_combo1 = 1028
   
    integer, parameter ::  ID_log3_tab2_combo1 = 1004
    integer, parameter ::  ID_log3_tab3_combo1 = 1006
    integer, parameter ::  ID_log3_tab3_combo2 = 1007
    integer, parameter ::  ID_log3_tab1_ok =     1007
    integer, parameter ::  ID_log3_tab2_ok =     1008
    integer, parameter ::  ID_log3_tab3_ok =     1009
    integer, parameter ::  ID_log3_tab4_edit5 =  1010
    integer, parameter ::  ID_log3_tab4_edit4 =  1011
    integer, parameter ::  ID_log3_tab4_combo1 = 1012
    integer, parameter ::  ID_log3_tab4_combo2 = 1013
    integer, parameter ::  ID_log3_tab4_ok =     1014
    integer, parameter ::  ID_log3_tab4_edit6 =  1015
    integer, parameter ::  ID_log3_tab4_edit7 =  1019
    integer, parameter ::  ID_log3_tab4_edit1 =  1016
    integer, parameter ::  ID_log3_tab4_edit2 =  1017
    integer, parameter ::  ID_log3_tab4_edit3 =  1018
    integer, parameter ::  ID_log3_tab2_edit1 =  1018
    integer, parameter ::  ID_log3_tab2_edit2 =  1019
    
    integer, parameter ::  ID_log3_edit1 = 1032
    integer, parameter ::  ID_log3_edit2 = 1033
    integer, parameter ::  ID_log3_edit3 = 1034
    integer, parameter ::  ID_log3_ok = 1035

    type( DIALOG )::log3
    type( DIALOG )::log3_tab1
    type( DIALOG )::log3_tab2
    type( DIALOG )::log3_tab3
    type( DIALOG )::log3_tab4
    !---------------------------------------------
end module