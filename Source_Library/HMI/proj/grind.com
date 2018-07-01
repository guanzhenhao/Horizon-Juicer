;ifIsExternalBegin
;**********************MASK1:磨削参数_外:panel_1:;**********************
//M(Mask1/$85020/"panel_1_1_chs.png"/)

	DEF DIAMETER_ADJ=(R///$85174,$85174,$85043,/WR2/"panel_1_26_chs.png"/"/NC/_N_NC_GD2_ACX/GRIND[5]"/360,330,202/460,330,60/);单次中径调整值
	DEF PianDaoTiaoZheng=(R/-100,100//$85175,$85175,$85043,/WR2/"panel_1_27_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[43]"/360,350,202/460,350,60/);Z轴偏刀调整

	;++++++++++++++++根据类型按需选择
	DEF VAR1=(I/*0=$85135,1=$85136,2=$85137,3=$85138,4=$85139/0/$85134,,,/WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型,生成文件用,螺纹磨使用此行
	;DEF VAR1=(I/*0=$85135,1=$85136,2=$85137,3=$85138,4=$85139/2/$85134,,,/WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型,生成文件用,蜗杆磨床使用此行

	DEF VAR7=(R3/0,50//$85104,$85104,$85043,/WR2/"panel_1_6_chs.png"/"/NC/_N_NC_GD2_ACX/INI[5]"/360,80,202/460,80,60/);工件螺距输入
	;DEF CHIJU=(R////WR4//"/NC/_N_NC_GD2_ACX/INI[5]"/0,0,0/0,0,0);蜗杆齿距引用
	;DEF MOSHU=(R3/0,50//$85173,$85173,,/WR4/"panel_1_28_chs.png"/"/NC/_N_NC_GD2_ACX/INI[77]"/360,80,202/460,80,60/);蜗杆模数输入
	;DEF M_OR_L=(I/*0=$85179,1=$85178//,,,/WR4/"panel_1_28_chs.png"/"/NC/_N_NC_GD2_ACX/INI[87]"/0,0,0/360,10,70/);选择输入模数0还是输入螺距1
	;DEF WORK_MID_DIA=(R/0,400//$85107,$85107,$85043,/WR4/"panel_1_22_chs.png"/"/NC/_N_NC_GD2_ACX/INI[40]"/360,310,202/460,310,60/);分度圆直径
	;+++++++++++++++++++++++
	
	DEF X_IM=(R///$8518,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/);X_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,30,20/30,30,60/);Z_IM
	DEF X_DRF=(R///$85116,$85116,,/WR1//"$AC_DRF[X]"/120,10,50/170,10,60/);DRF_X
	DEF Z_DRF=(R///$85117,$85117,,/WR1//"$AC_DRF[Z]"/120,30,50/170,30,60/);DRF_Z

	DEF VAR11=(I/*0=$85146,1=$85147,2=$85148//$85145,,,/WR2/"panel_1_3_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[20]"/0,0,0/270,10,70/);选择对刀位置

	DEF PIECE_VOLUME=(I/*0=$85166,1=$85167//$85170,$85170,,/WR2/"panel_1_17_chs.png"/"/NC/_N_NC_GD2_ACX/INI[27]"/360,10,70/460,10,80/);单件/批量磨削方式选择
	DEF SCREW_R=(I/*0=$85124,1=$85125//$85103,$85103,,/WR2/"panel_1_4_chs.png"/"/NC/_N_NC_GD2_ACX/INI[1]"/360,40,70/460,40,60/);螺纹旋向
	DEF VAR6=(I/0,50//$85102,$85102,$85051,/WR2/"panel_1_5_chs.png"/"/NC/_N_NC_GD2_ACX/WORK[1]"/360,60,202/460,60,60/);工件头数

	DEF VAR8=(R3/-2000,2000//$85108,$85108,,/WR2/"panel_1_7_chs.png"/"/NC/_N_NC_GD2_ACX/INI[2]"/360,100,202/460,100,60/);工件左端
	DEF VAR9=(R3/-2000,2000//$85109,$85109,,/WR2/"panel_1_8_chs.png"/"/NC/_N_NC_GD2_ACX/INI[3]"/360,120,202/460,120,60/);工件右端
	DEF VAR10=(R/-500,500//$85165,$85165,,/WR2/"panel_1_9_chs.png"/"/NC/_N_NC_GD2_ACX/INI[11]"/360,150,202/460,150,60/);对刀起始位置
	DEF GRIND_SAFE=(R/-500,500//$85172,$85172,,/WR2/"panel_1_23_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[17]"/360,170,202/460,170,60/);磨削安全位置
	DEF X_QUIT=(R/-500,500//$85106,$85106,,/WR2/"panel_1_10_chs.png"/"/NC/_N_NC_GD2_ACX/INI[24]"/360,190,202/460,190,60/);退刀位置
	DEF PITCH_COM=(R/-500,500//$85105,$85105,$85043,/WR2/"panel_1_11_chs.png"/"/NC/_N_NC_GD2_ACX/INI[25]"/360,210,202/460,210,60/);全长导程补偿
	
	DEF VAR20=(I/*0=$85014,1=$85013//$85159,$85159,,/WR2/"panel_1_12_chs.png"/"/NC/_N_NC_GD2_ACX/INI[12]"/360,270,80/405,270,30/);是否有锥度
	DEF VAR21=(I/-10,10//$85160,,,$85052/WR2/"panel_1_13_chs.png"/"/NC/_N_NC_GD2_ACX/INI[13]"/0,0,0/460,270,85/);锥度分子,默认内螺纹大头往小头磨,外螺纹小头往大头磨
	DEF VAR22=(I/0,800//$85161,,,/WR2/"panel_1_14_chs.png"/"/NC/_N_NC_GD2_ACX/INI[14]"/0,0,0/505,270,40/);锥度分母

	DEF VAR23=(I/*0=$85014,1=$85013//$85164,$85164,,/WR2/"panel_1_18_chs.png"/"/NC/_N_NC_GD2_ACX/INI[39]"/360,290,80/405,290,30/);螺旋升角自动计算
	DEF VAR24=(I/0,45//$85055,,,$85042/WR2/"panel_1_19_chs.png"/"/NC/_N_NC_GD2_ACX/INI[18]"/0,290,0/460,290,75/);度
	DEF VAR25=(I/0,59//$85056,,,$85053/WR2/"panel_1_20_chs.png"/"/NC/_N_NC_GD2_ACX/INI[19]"/0,290,0/495,290,70/);分
	DEF VAR26=(I/0,59//$85057,,,$85054/WR2/"panel_1_21_chs.png"/"/NC/_N_NC_GD2_ACX/INI[20]"/0,290,0/525,290,70/);秒
	DEF WORK_MID_DIA=(R/0,400//$85171,$85171,$85043,/WR4/"panel_1_22_chs.png"/"/NC/_N_NC_GD2_ACX/INI[40]"/360,310,202/460,310,60/);工件中径

	DEF INITANG=(R///$85176,$85176,$85042,/WR1//"/NC/_N_NC_GD2_ACX/TOOL_SET[5]"/10,310,210/120,310,60/);头架初始角
	DEF VAR19=(R///$85158,$85158,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[5]"/10,330,210/120,330,60/);当前磨削接触位
	DEF WHELL_POS_INI=(R///$85169,$85169,,/WR1/"panel_1_24_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[14]"/10,350,210/120,350,60/);初始磨削接触位(对刀完成后磨削接触位)
	DEF SHOUJIAN=(I/*0=$85087,1=$85088//$85089,,,/WR2/"panel_1_24_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[58]"/0,0,0/200,350,70/);是否是首件工件

	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测
	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=($85001,ac7,se3);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se1);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto
	HS8=($85005,ac7,se1);返回

	VS1=("")

	PRESS(HS1)
		LM("MASK1","grind.com")
	END_PRESS

	PRESS(HS2)
		IF VAR45.VAL==0;基本工艺
			IF PIECE_VOLUME.VAL==0;单件
				LM("MASK29","process.com")
			ELSE
				LM("MASK2","process.com")
			ENDIF
		ELSE
			IF PIECE_VOLUME.VAL==0;单件
				LM("MASK30","process.com")
			ELSE
				LM("MASK20","process.com")
			ENDIF
		ENDIF
	END_PRESS

	PRESS(HS3)
		LM("MASK3","dress.com")
	END_PRESS

	PRESS(HS4)
		LM("MASK21","auto.com")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS

	CHANGE(VAR1)
		IF VAR1.VAL==1
			LM("MASK18","grind.com")
		ENDIF
	END_CHANGE
	
	CHANGE(M_OR_L)
		IF VAR1.VAL==2
			IF M_OR_L.VAL==0;模数
				VAR7.WR=4
				IF QCHECK.VAL==0
					MOSHU.WR=2
				ELSE
					MOSHU.WR=1
				ENDIF
				CHIJU.VAL=PI*MOSHU.VAL;蜗杆齿距计算
			ELSE;螺距
				IF QCHECK.VAL==0
					VAR7.WR=2
				ELSE
					VAR7.WR=1
				ENDIF
				MOSHU.WR=4
			ENDIF
		ELSE
			IF QCHECK.VAL==0
				VAR7.WR=2
			ELSE
				VAR7.WR=1
			ENDIF
		ENDIF
	END_CHANGE
	
	CHANGE(MOSHU)
		IF VAR1.VAL==2
			IF M_OR_L.VAL==0;模数
				VAR7.WR=4
				IF QCHECK.VAL==0
					MOSHU.WR=2
				ELSE
					MOSHU.WR=1
				ENDIF
				CHIJU.VAL=PI*MOSHU.VAL;蜗杆齿距计算
			ELSE;螺距
				IF QCHECK.VAL==0
					VAR7.WR=2
				ELSE
					VAR7.WR=1
				ENDIF
				MOSHU.WR=4
			ENDIF
		ELSE
			IF QCHECK.VAL==0
				VAR7.WR=2
			ELSE
				VAR7.WR=1
			ENDIF
		ENDIF
		CALL("UP3")
	END_CHANGE
	
	CHANGE(VAR6)
		call("UP3")
	END_CHANGE

	CHANGE(WORK_MID_DIA)
		call("UP3")
	END_CHANGE

	CHANGE(VAR20)
		call("UP2")
	END_CHANGE
	
	CHANGE(VAR23)
		call("UP2")
		call("UP3")
	END_CHANGE
	
	CHANGE(QCHECK)
		call("UP2")
	END_CHANGE

	SUB(UP2)
		IF QCHECK.VAL==1
			SCREW_R.WR=1
			VAR6.WR=1
			M_OR_L.WR=1
			VAR8.WR=1
			VAR9.WR=1
			VAR10.WR=1
			GRIND_SAFE.WR=1
			X_QUIT.WR=1
			PITCH_COM.WR=1
			PIECE_VOLUME.WR=1
			VAR20.WR=1
			VAR21.WR=1
			VAR22.WR=1
			VAR23.WR=1
			VAR11.WR=1;对刀位置
			SHOUJIAN.WR=1
			IF VAR23.VAL==0
				VAR24.WR=1
				VAR25.WR=1
				VAR26.WR=1
				WORK_MID_DIA.WR=4
			ELSE
				VAR24.WR=1
				VAR25.WR=1
				VAR26.WR=1
				WORK_MID_DIA.WR=1
			ENDIF
		ELSE
			SCREW_R.WR=2
			VAR6.WR=2
			M_OR_L.WR=2
			VAR8.WR=2
			VAR9.WR=2
			VAR10.WR=2
			GRIND_SAFE.WR=2
			X_QUIT.WR=2
			PITCH_COM.WR=2
			PIECE_VOLUME.WR=2
			VAR20.WR=2
			VAR11.WR=2;对刀位置
			SHOUJIAN.WR=2
			IF VAR20.VAL==0
				VAR21.WR=1
				VAR22.WR=1
			ELSE
				VAR21.WR=2
				VAR22.WR=2
			ENDIF
			VAR23.WR=2
			IF VAR23.VAL==0
				VAR24.WR=2
				VAR25.WR=2
				VAR26.WR=2
				WORK_MID_DIA.WR=4
			ELSE
				VAR24.WR=1
				VAR25.WR=1
				VAR26.WR=1
				WORK_MID_DIA.WR=2
			ENDIF
		ENDIF
	END_SUB

	SUB(UP3)
		IF VAR23.VAL==1
			IF WORK_MID_DIA.VAL>0
				IF (VAR1.VAL==2) AND (M_OR_L.VAL==0);蜗杆and模数输入
					VAR24.VAL=SDEG(ATAN((VAR6.VAL*CHIJU.VAL),(PI*WORK_MID_DIA.VAL)))
					VAR25.VAL=(SDEG(ATAN((VAR6.VAL*CHIJU.VAL),(PI*WORK_MID_DIA.VAL)))-VAR24.VAL)*60
					VAR26.VAL=((SDEG(ATAN((VAR6.VAL*CHIJU.VAL),(PI*WORK_MID_DIA.VAL)))-VAR24.VAL)*60-VAR25.VAL)*60
				ELSE
					VAR24.VAL=SDEG(ATAN((VAR6.VAL*VAR7.VAL),(PI*WORK_MID_DIA.VAL)))
					VAR25.VAL=(SDEG(ATAN((VAR6.VAL*VAR7.VAL),(PI*WORK_MID_DIA.VAL)))-VAR24.VAL)*60
					VAR26.VAL=((SDEG(ATAN((VAR6.VAL*VAR7.VAL),(PI*WORK_MID_DIA.VAL)))-VAR24.VAL)*60-VAR25.VAL)*60
				ENDIF
			ENDIF
		ENDIF
	END_SUB

//END
;ifIsExternalEnd

;ifIsInternalOrCenterBegin
;**********************MASK18:磨削参数_内:panel_18:;**********************
//M(Mask18/$85020/"panel_18_4_chs.png"/)

	DEF DIAMETER_ADJ=(R///$85174,$85174,$85043,/WR2/"panel_18_29_chs.png"/"/NC/_N_NC_GD2_ACX/GRIND[5]"/360,330,202/460,330,60/);单次中径调整值
	DEF PianDaoTiaoZheng=(R/-100,100//$85175,$85175,$85043,/WR2/"panel_18_30_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[43]"/360,350,202/460,350,60/);Z轴偏刀调整

	DEF VAR1=(I/*0=$85135,1=$85136,2=$85137,3=$85138,4=$85139/1/$85134,,,/WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/10,10,60/);磨削类型,生成文件用	

	DEF X_IM=(R///$8518,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/);X_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,30,20/30,30,60/);Z_IM
	DEF X_DRF=(R///$85116,$85116,,/WR1//"$AC_DRF[X]"/120,10,50/170,10,60/);DRF_X
	DEF Z_DRF=(R///$85117,$85117,,/WR1//"$AC_DRF[Z]"/120,30,50/170,30,60/);DRF_Z

	DEF PIECE_VOLUME=(I/*0=$85166,1=$85167//$85170,$85170,,/WR2/"panel_18_17_chs.png"/"/NC/_N_NC_GD2_ACX/INI[27]"/360,10,70/460,10,80/);单件/批量磨削方式选择
	DEF SCREW_R=(I/*0=$85124,1=$85125//$85103,$85103,,/WR2/"panel_18_4_chs.png"/"/NC/_N_NC_GD2_ACX/INI[1]"/360,40,70/460,40,60/);螺纹旋向
	DEF VAR6=(I/0,50//$85102,$85102,$85051,/WR2/"panel_18_5_chs.png"/"/NC/_N_NC_GD2_ACX/WORK[1]"/360,60,202/460,60,60/);工件头数
	DEF VAR7=(R3/0,50//$85104,$85104,$85043,/WR2/"panel_18_6_chs.png"/"/NC/_N_NC_GD2_ACX/INI[5]"/360,80,202/460,80,60/);工件螺距
	DEF VAR8=(R3/-2000,2000//$85108,$85108,,/WR2/"panel_18_7_chs.png"/"/NC/_N_NC_GD2_ACX/INI[2]"/360,100,202/460,100,60/);工件左端
	DEF VAR9=(R3/-2000,2000//$85109,$85109,,/WR2/"panel_18_8_chs.png"/"/NC/_N_NC_GD2_ACX/INI[3]"/360,120,202/460,120,60/);工件右端
	DEF VAR10=(R/-500,500//$85165,$85165,,/WR2/"panel_18_9_chs.png"/"/NC/_N_NC_GD2_ACX/INI[11]"/360,150,202/460,150,60/);缓冲位置
	DEF X_QUIT=(R/-500,500//$85106,$85106,,/WR2/"panel_18_25_chs.png"/"/NC/_N_NC_GD2_ACX/INI[24]"/360,170,202/460,170,60/);退刀位置
	DEF PITCH_COM=(R/-500,500//$85105,$85105,$85043,/WR2/"panel_18_26_chs.png"/"/NC/_N_NC_GD2_ACX/INI[25]"/360,190,202/460,190,60/);全长导程补偿
	DEF C_INIT=(R/0,360//$85100,$85100,$85042,/WR2/"panel_18_22_chs.png"/"/NC/_N_NC_GD2_ACX/INI[28]"/360,220,202/460,220,60/);头架在程序结束调整到合适角度
	DEF Z_INIT=(R/-2000,2000//$85101,$85101,,/WR2/"panel_18_23_chs.png"/"/NC/_N_NC_GD2_ACX/INI[29]"/360,240,202/460,240,60/);内螺纹时台面起始位置

	DEF VAR20=(I/*0=$85014,1=$85013//$85159,$85159,,/WR2/"panel_18_12_chs.png"/"/NC/_N_NC_GD2_ACX/INI[12]"/360,270,80/405,270,30/);是否有锥度
	DEF VAR21=(I/-10,10//$85160,,,$85052/WR2/"panel_18_13_chs.png"/"/NC/_N_NC_GD2_ACX/INI[13]"/0,0,0/460,270,85/);锥度分子,默认内螺纹大头往小头磨,外螺纹小头往大头磨
	DEF VAR22=(I/0,800//$85161,,,/WR2/"panel_18_14_chs.png"/"/NC/_N_NC_GD2_ACX/INI[14]"/0,0,0/505,270,40/);锥度分母

	DEF VAR23=(I/*0=$85014,1=$85013//$85164,$85164,,/WR2/"panel_18_18_chs.png"/"/NC/_N_NC_GD2_ACX/INI[39]"/360,290,80/405,290,30/);螺旋升角自动计算
	DEF VAR24=(I/0,45//$85055,,,$85042/WR2/"panel_18_19_chs.png"/"/NC/_N_NC_GD2_ACX/INI[18]"/0,290,0/460,290,75/);度
	DEF VAR25=(I/0,59//$85056,,,$85053/WR2/"panel_18_20_chs.png"/"/NC/_N_NC_GD2_ACX/INI[19]"/0,290,0/495,290,70/);分
	DEF VAR26=(I/0,59//$85057,,,$85054/WR2/"panel_18_21_chs.png"/"/NC/_N_NC_GD2_ACX/INI[20]"/0,290,0/525,290,70/);秒
	DEF WORK_MID_DIA=(R/0,200//$85171,$85171,$85043,/WR4/"panel_18_24_chs.png"/"/NC/_N_NC_GD2_ACX/INI[40]"/360,310,202/460,310,60/);工件中径

	DEF INITANG=(R///$85176,$85176,$85042,/WR1//"/NC/_N_NC_GD2_ACX/TOOL_SET[5]"/10,310,210/120,310,60/);头架初始角
	DEF VAR19=(R///$85158,$85158,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[5]"/10,330,210/120,330,60/);当前磨削接触位
	DEF WHELL_POS_INI=(R///$85169,$85169,,/WR1/"panel_18_27_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[14]"/10,350,210/120,350,60/);初始磨削接触位(对刀完成后磨削接触位)
	DEF SHOUJIAN=(I/*0=$85087,1=$85088//$85089,,,/WR2/"panel_18_27_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[58]"/0,0,0/200,350,70/);是否是首件工件

	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测
	
	HS1=($85001,ac7,se3);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se1);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	;ifIsCenterBegin
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	;ifIsCenterEnd

	HS8=($85005,ac7,se1);返回

	VS1=("")

	PRESS(HS1)
		LM("MASK18","grind.com")
	END_PRESS

	PRESS(HS2)
		IF VAR45.VAL==0;基本工艺
			IF PIECE_VOLUME.VAL==0;单件
				LM("MASK29","process.com")
			ELSE
				LM("MASK2","process.com")
			ENDIF
		ELSE
			IF PIECE_VOLUME.VAL==0;单件
				LM("MASK30","process.com")
			ELSE
				LM("MASK20","process.com")
			ENDIF
		ENDIF
	END_PRESS

	PRESS(HS3)
		LM("MASK3","dress.com")
	END_PRESS

	PRESS(HS4)
		LM("MASK21","auto.com")
	END_PRESS

	PRESS(HS5)
		LM("MASK31","centerwaiyuan.com")
	END_PRESS
	
	PRESS(HS6)
		LM("MASK32","centerduanmian.com")
	END_PRESS
	
	PRESS(HS7)
		LM("MASK23","centermain.com")
	END_PRESS
	
	PRESS(HS8)
		EXIT
	END_PRESS

	CHANGE(VAR1)
		IF VAR1.VAL<>1
			LM("MASK1","grind.com")
		ENDIF
	END_CHANGE

	CHANGE(VAR6)
		call("UP3")
	END_CHANGE

	CHANGE(VAR7)
		call("UP3")
	END_CHANGE

	CHANGE(WORK_MID_DIA)
		call("UP3")
	END_CHANGE

	CHANGE(VAR20)
		call("UP2")
	END_CHANGE
	
	CHANGE(VAR23)
		call("UP2")
		call("UP3")
	END_CHANGE
	
	CHANGE(QCHECK)
		call("UP2")
	END_CHANGE

	CHANGE(VAR9)
		IF Z_INIT.VAL<VAR9.VAL+30
			Z_INIT.VAL=VAR9.VAL+30
		ENDIF
	END_CHANGE

	CHANGE(Z_INIT)
		IF Z_INIT.VAL<VAR9.VAL+30
			Z_INIT.VAL=VAR9.VAL+30
		ENDIF
	END_CHANGE

	SUB(UP2)
		IF QCHECK.VAL==1
			SCREW_R.WR=1
			VAR6.WR=1
			VAR7.WR=1
			VAR8.WR=1
			VAR9.WR=1
			VAR10.WR=1
			X_QUIT.WR=1
			PITCH_COM.WR=1
			PIECE_VOLUME.WR=1
			C_INIT.WR=1
			Z_INIT.WR=1
			SHOUJIAN.WR=1
			VAR20.WR=1
			VAR21.WR=1
			VAR22.WR=1
			VAR23.WR=1
			IF VAR23.VAL==0
				VAR24.WR=1
				VAR25.WR=1
				VAR26.WR=1
				WORK_MID_DIA.WR=4
			ELSE
				VAR24.WR=1
				VAR25.WR=1
				VAR26.WR=1
				WORK_MID_DIA.WR=1
			ENDIF
		ELSE
			SCREW_R.WR=2
			VAR6.WR=2
			VAR7.WR=2
			VAR8.WR=2
			VAR9.WR=2
			VAR10.WR=2
			X_QUIT.WR=2
			PITCH_COM.WR=2
			PIECE_VOLUME.WR=2
			C_INIT.WR=2
			Z_INIT.WR=2
			SHOUJIAN.WR=2
			VAR20.WR=2
			IF VAR20.VAL==0
				VAR21.WR=1
				VAR22.WR=1
			ELSE
				VAR21.WR=2
				VAR22.WR=2
			ENDIF
			VAR23.WR=2
			IF VAR23.VAL==0
				VAR24.WR=2
				VAR25.WR=2
				VAR26.WR=2
				WORK_MID_DIA.WR=4
			ELSE
				VAR24.WR=1
				VAR25.WR=1
				VAR26.WR=1
				WORK_MID_DIA.WR=2
			ENDIF
		ENDIF
	END_SUB

	SUB(UP3)
		IF VAR23.VAL==1
			IF WORK_MID_DIA.VAL>0
				VAR24.VAL=SDEG(ATAN((VAR6.VAL*VAR7.VAL),(PI*WORK_MID_DIA.VAL)))
				VAR25.VAL=(SDEG(ATAN((VAR6.VAL*VAR7.VAL),(PI*WORK_MID_DIA.VAL)))-VAR24.VAL)*60
				VAR26.VAL=((SDEG(ATAN((VAR6.VAL*VAR7.VAL),(PI*WORK_MID_DIA.VAL)))-VAR24.VAL)*60-VAR25.VAL)*60
			ENDIF
		ENDIF
	END_SUB

//END
;ifIsInternalOrCenterEnd

