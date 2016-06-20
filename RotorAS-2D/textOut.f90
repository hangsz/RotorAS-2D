subroutine  textOut
    USE IFQWIN
    use user32
    implicit none
    integer( kind = 4 ) :: results, color, i
    type (qwinfo) :: winfo
    type (windowconfig):: wc
    type (rccoord):: t
    type (xycoord):: wt
    logical( kind=4 ):: status
    character(len=300):: text
    
    results= SetWindowText( GetHwndQQ(QWIN$FRAMEWINDOW) , "RotorAS-2D"C )
    !--------------------------
    !主窗口文本输出设置
    wc%numxpixels = -1
    wc%numypixels = -1
    wc%numtextcols = -1
    wc%numtextrows = -1
    wc%numcolors = -1
    !wc%fontsize = QWIN$EXTENDFONT
    wc%title = 'version 1.2.3'C
    !wc%extendfontname = '隶书'C
    !wc%extendfontsize = #000F001F
    !wc%extendfontattributes = ior(QWIN$EXTENDFONT_ITALIC,QWIN$EXTENDFONT_BOLD ) 
    status = SETWINDOWCONFIG(wc)
    if (status == .false.) then
     !  status = MESSAGEBOXQQ('属性设置失败！系统调整中...'C, 'Error'C,MB$ICONEXCLAMATION .OR.MB$OK )
        status = SETWINDOWCONFIG(wc)
    end if
   
    results = SETTEXTCOLORRGB (000000)
    !---------------------------------------------------

    ! 设置背景颜色
    color = RGBTOINTEGER(199,237,204)
    results = SETBKCOLORRGB (color)
    call CLEARSCREEN($GCLEARSCREEN)
    winfo%type = QWIN$MAX
    ! 最大化主窗口
    !results = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo)
    ! 最大化子窗口
    results = SETWSIZEQQ (0, winfo)

    ! SETCOLORRGB才能影响OUTGTEXT输出的文本
    
    results = SETCOLORRGB (000000) 
    results = INITIALIZEFONTS()
    results = SETFONT('t''宋体''h18w9')
    ! 文本为黑色
    text = "欢饮使用 RotorAS-2D" 
    
    call MOVETO(200,50,wt)
    call OUTGTEXT(text)

    text = "目前还在完善中，欢迎一起学习交流"C
    call MOVETO(140,90,wt) 
    call OUTGTEXT(text)

   
    
    text = "主要功能："C
    call MOVETO(140,160,wt)
    call OUTGTEXT(text)
    text = "1. 结构、非结构混合网格生成（泊松方程，阵面推进法）"C
    call MOVETO(180,190,wt)
    call OUTGTEXT(text)
    text = "2. 全速域流场求解（预处理技术，动网格技术）"C
    call MOVETO(180,220,wt)
    call OUTGTEXT(text)
    text = "3. 后处理（压力分布，力（矩）迟滞回线）"C
    call MOVETO(180,250,wt)
  
    call OUTGTEXT(text)
    text = "学习交流: hangzs@nuaa.edu.cn"C
    call MOVETO(140,290,wt)
    
    call OUTGTEXT(text)
    
    ! 取消提示信息
    results = SETEXITQQ (QWIN$EXITPERSIST)
    
  
end subroutine
    