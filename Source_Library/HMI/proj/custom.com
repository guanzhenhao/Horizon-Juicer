;;;;;;;;;;;;;;;;;;;start:欢迎画面:;;;;;;;;;;;;;;;;;;;;;;;;;
//S(Start)

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型

	HS7=($85000,ac7,se1)
	VS1=($85006,ac7,se1) 
	
	PRESS(HS7)
		;ifIsExternalBegin
		LM("MASK1","grind.com");磨削界面加载
		;ifIsExternalEnd

		;ifIsInternalBegin
		LM("MASK18","grind.com");磨削界面加载
		;ifIsInternalEnd

		;ifIsCenterBegin
		LM("MASK23","centermain.com");磨削界面加载
		;ifIsCenterEnd
	END_PRESS

	PRESS(VS1)
		LM("Mask0","info.com")
	END_PRESS

//END
