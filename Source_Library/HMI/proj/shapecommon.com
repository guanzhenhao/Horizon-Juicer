;**********************MASK40:齿形1:panel_40:;**********************
//M(Mask40/$85459//)

	DEF VAR0=(R4/0,10//$85499,$85499,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[1]"/325,10,120/440,10,110/);齿顶长度
	DEF VAR1=(R4/0,90//$85468,$85468,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[2]"/325,40,120/440,40,110/);左斜线角度
	DEF VAR2=(R4/0,90//$85469,$85469,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[3]"/325,60,120/440,60,110/);右斜线角度

	DEF VAR3=(R4/-90,90//$85470,$85470,,$85042/WR1//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[4]"/325,90,110/440,90,110/);锥度
	DEF VAR10=(R4/-90,90//$85470,$85470,,/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[111]"/325,110,110/440,110,60/);锥度

	DEF VAR4=(R4/0,90//$85471,$85471,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[5]"/325,140,110/440,140,110/);螺距

	DEF VAR5=(R4/0,90//$85458,$85458,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[6]"/325,170,110/440,170,110/);齿高
	DEF VAR6=(R4/0,90//$85426,$85426,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[7]"/325,190,110/440,190,110/);槽高

	DEF VAR8=(R4/0,90//$85487,$85487,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[9]"/325,240,110/440,240,110/);底部延长长度(水平)
	DEF VAR9=(R4/0,90//$85475,$85475,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[10]"/325,270,110/440,270,110/);过度线角度(0-90)

	DEF DRESS_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85380,ac7,se1);"单滚轮"

	VS1=($85459,ac7,se3);"齿形1"
	VS2=($85460,ac7,se1);"齿形2"
	VS3=($85461,ac7,se1);"齿形3"
	VS4=($85462,ac7,se1);"齿形4"
	VS5=($85463,ac7,se1);"齿形5"
	VS6=($85464,ac7,se1);"齿形6"
	VS7=($85368,ac7,se1);"齿形7"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		IF DRESS_TYPE.VAL==0
			LM("MASK4","dressware.com")
		ELSE
			IF DRESS_TYPE.VAL==1
				LM("MASK12","dressware.com")
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS1)
		LM("MASK40","commonshape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK41","commonshape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK42","commonshape.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK43","commonshape.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK44","commonshape.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK45","commonshape.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK46","commonshape.com")
	END_PRESS

	PRESS(VS8)
		LM("MASK3","dress.com")
	END_PRESS

	CHANGE(VAR10)
		VAR3.VAL=SDEG(ATAN(VAR10.VAL/2,1))
	END_CHANGE

//END

;**********************MASK41:齿形2:panel_41:;**********************
//M(Mask41/$85460//)

	DEF VAR0=(R4/0,10//$85465,$85465,,$85043/WR1//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[11]"/325,10,120/440,10,110/);齿底圆弧半径
	DEF VAR1=(R4/0,10//$85466,$85466,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[12]"/325,40,120/440,40,110/);齿顶左圆弧半径
	DEF VAR2=(R4/0,10//$85467,$85467,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[13]"/325,60,120/440,60,110/);齿顶右圆弧半径
	DEF VAR3=(R4/0,90//$85468,$85468,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[14]"/325,90,120/440,90,110/);左斜线角度
	DEF VAR4=(R4/0,90//$85469,$85469,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[15]"/325,110,120/440,110,110/);右斜线角度

	DEF VAR5=(R4/-90,90//$85470,$85470,,$85042/WR1//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[16]"/325,140,110/440,140,110/);锥度
	DEF VAR12=(R4/-90,90//$85470,$85470,,/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[112]"/325,160,110/440,160,60/);锥度
	
	DEF VAR6=(R4/0,90//$85471,$85471,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[17]"/325,190,110/440,190,110/);螺距

	DEF VAR7=(R4/0,90//$85472,$85472,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[18]"/325,220,110/440,220,110/);齿高
	
	DEF VAR9=(R4/0,90//$85474,$85474,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[20]"/325,270,110/440,270,110/);底部圆弧延长长度(水平)
	DEF VAR10=(R4/0,90//$85475,$85475,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[21]"/325,290,110/440,290,110/);过度线角度(0-90)
	DEF VAR11=(R4/0,90//$85476,$85476,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[22]"/325,310,110/440,310,110/);过度线长度(水平)

	DEF DRESS_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85380,ac7,se1);"单滚轮"

	VS1=($85459,ac7,se1);"齿形1"
	VS2=($85460,ac7,se3);"齿形2"
	VS3=($85461,ac7,se1);"齿形3"
	VS4=($85462,ac7,se1);"齿形4"
	VS5=($85463,ac7,se1);"齿形5"
	VS6=($85464,ac7,se1);"齿形6"
	VS7=($85368,ac7,se1);"齿形7"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		IF DRESS_TYPE.VAL==0
			LM("MASK4","dressware.com")
		ELSE
			IF DRESS_TYPE.VAL==1
				LM("MASK12","dressware.com")
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS1)
		LM("MASK40","commonshape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK41","commonshape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK42","commonshape.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK43","commonshape.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK44","commonshape.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK45","commonshape.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK46","commonshape.com")
	END_PRESS

	PRESS(VS8)
		LM("MASK3","dress.com")
	END_PRESS

	CHANGE(VAR12)
		VAR5.VAL=SDEG(ATAN(VAR12.VAL/2,1))
	END_CHANGE

//END

;**********************MASK42:齿形3:panel_42:;**********************
//M(Mask42/$85461//)

	DEF VAR0=(R4/0,10//$85477,$85477,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[31]"/325,10,120/440,10,110/);齿底圆弧半径
	DEF VAR1=(R4/0,90//$85478,$85478,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[32]"/325,40,120/440,40,110/);第一斜边左角度
	DEF VAR2=(R4/0,90//$85479,$85479,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[33]"/325,60,120/440,60,110/);第一斜边右角度
	DEF VAR3=(R4/0,90//$85480,$85480,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[34]"/325,90,120/440,90,110/);第二斜边左角度
	DEF VAR4=(R4/0,90//$85481,$85481,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[35]"/325,110,120/440,110,110/);第二斜边右角度
	DEF VAR5=(R4/-90,90//$85482,$85482,,$85042/WR4//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[36]"/325,140,120/440,140,110/);锥度
	DEF VAR6=(R4/0,90//$85483,$85483,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[37]"/325,170,120/440,170,110/);螺距

	DEF VAR7=(R4/0,90//$85484,$85484,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[38]"/325,200,120/440,200,110/);齿高
	DEF VAR8=(R4/0,90//$85485,$85485,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[39]"/325,220,120/440,220,110/);中径小径距
	
	DEF VAR10=(R4/0,10//$85487,$85487,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[41]"/325,270,120/440,270,110/);底部斜线延长长度(水平)
	DEF VAR11=(R4/0,90//$85488,$85488,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[42]"/325,290,120/440,290,110/);过度线角度(0-90)

	DEF DRESS_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85380,ac7,se1);"单滚轮"

	VS1=($85459,ac7,se1);"齿形1"
	VS2=($85460,ac7,se1);"齿形2"
	VS3=($85461,ac7,se3);"齿形3"
	VS4=($85462,ac7,se1);"齿形4"
	VS5=($85463,ac7,se1);"齿形5"
	VS6=($85464,ac7,se1);"齿形6"
	VS7=($85368,ac7,se1);"齿形7"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		IF DRESS_TYPE.VAL==0
			LM("MASK4","dressware.com")
		ELSE
			IF DRESS_TYPE.VAL==1
				LM("MASK12","dressware.com")
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS1)
		LM("MASK40","commonshape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK41","commonshape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK42","commonshape.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK43","commonshape.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK44","commonshape.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK45","commonshape.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK46","commonshape.com")
	END_PRESS

	PRESS(VS8)
		LM("MASK3","dress.com")
	END_PRESS

//END

;**********************MASK43:齿形4:panel_43:;**********************
//M(Mask43/$85462//)

	DEF VAR0=(R4/0,90//$85489,$85489,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[51]"/325,10,120/440,10,110/);左侧斜线角度
	DEF VAR1=(R4/0,90//$85490,$85490,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[52]"/325,30,120/440,30,110/);右侧斜线角度
	DEF VAR2=(R4/-90,90//$85491,$85491,,$85042/WR4//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[53]"/325,60,120/440,60,110/);锥度
	DEF VAR3=(R4/0,90//$85492,$85492,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[54]"/325,90,120/440,90,110/);螺距

	DEF VAR4=(R4/0,90//$85493,$85493,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[55]"/325,120,120/440,120,110/);齿高
	DEF VAR5=(R4/0,90//$85494,$85494,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[56]"/325,140,120/440,140,110/);中径小径距
	
	DEF VAR7=(R4/0,10//$85496,$85496,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[58]"/325,190,120/440,190,110/);底部斜线延长长度(水平)
	DEF VAR8=(R4/0,90//$85497,$85497,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[59]"/325,220,120/440,220,110/);过度线角度(0-90)
	DEF VAR9=(R4/0,10//$85498,$85498,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[60]"/325,240,120/440,240,110/);过度线长度(水平)

	DEF DRESS_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85380,ac7,se1);"单滚轮"

	VS1=($85459,ac7,se1);"齿形1"
	VS2=($85460,ac7,se1);"齿形2"
	VS3=($85461,ac7,se1);"齿形3"
	VS4=($85462,ac7,se3);"齿形4"
	VS5=($85463,ac7,se1);"齿形5"
	VS6=($85464,ac7,se1);"齿形6"
	VS7=($85368,ac7,se1);"齿形7"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		IF DRESS_TYPE.VAL==0
			LM("MASK4","dressware.com")
		ELSE
			IF DRESS_TYPE.VAL==1
				LM("MASK12","dressware.com")
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS1)
		LM("MASK40","commonshape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK41","commonshape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK42","commonshape.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK43","commonshape.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK44","commonshape.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK45","commonshape.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK46","commonshape.com")
	END_PRESS

	PRESS(VS8)
		LM("MASK3","dress.com")
	END_PRESS

//END

;**********************MASK44:齿形5:panel_44:;**********************
//M(Mask44/$85463//)

	DEF VAR0=(R4/0,90//$85499,$85499,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[61]"/325,10,120/440,10,110/);顶部长度
	DEF VAR1=(R4/0,90//$85489,$85489,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[62]"/325,40,120/440,40,110/);左侧斜线角度
	DEF VAR2=(R4/0,90//$85490,$85490,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[63]"/325,60,120/440,60,110/);右侧斜线角度
	DEF VAR3=(R4/-90,90//$85491,$85491,,$85042/WR4//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[64]"/325,90,120/440,90,110/);锥度
	DEF VAR4=(R4/0,90//$85492,$85492,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[65]"/325,120,120/440,120,110/);螺距

	DEF VAR5=(R4/0,90//$85493,$85493,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[66]"/325,150,120/440,150,110/);齿高
	DEF VAR6=(R4/0,90//$85494,$85494,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[67]"/325,170,120/440,170,110/);中径小径距
	
	DEF VAR8=(R4/0,10//$85496,$85496,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[69]"/325,220,120/440,220,110/);底部斜线延长长度(水平)
	DEF VAR9=(R4/0,90//$85497,$85497,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[70]"/325,250,120/440,250,110/);过度线角度(0-90)

	DEF DRESS_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85380,ac7,se1);"单滚轮"

	VS1=($85459,ac7,se1);"齿形1"
	VS2=($85460,ac7,se1);"齿形2"
	VS3=($85461,ac7,se1);"齿形3"
	VS4=($85462,ac7,se1);"齿形4"
	VS5=($85463,ac7,se3);"齿形5"
	VS6=($85464,ac7,se1);"齿形6"
	VS7=($85368,ac7,se1);"齿形7"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		IF DRESS_TYPE.VAL==0
			LM("MASK4","dressware.com")
		ELSE
			IF DRESS_TYPE.VAL==1
				LM("MASK12","dressware.com")
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS1)
		LM("MASK40","commonshape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK41","commonshape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK42","commonshape.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK43","commonshape.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK44","commonshape.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK45","commonshape.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK46","commonshape.com")
	END_PRESS

	PRESS(VS8)
		LM("MASK3","dress.com")
	END_PRESS

//END
