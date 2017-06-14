With Ada.Text_Io;
With Ada.Calendar; Use Ada.Calendar;
With Terminal_Interface.Curses; Use Terminal_Interface.Curses;
With Display;
With Map;
With Player;
With Food;
With Global;

Procedure Snake Is
   W : Terminal_Interface.Curses.Window;
   Key : Terminal_Interface.Curses.Real_Key_Code;
   T1 : Ada.Calendar.Time;
   T2 : Ada.Calendar.Time;
   Timeout : Integer;
   
   Hx : Terminal_Interface.Curses.Line_Count;
   Hy : Terminal_Interface.Curses.Column_Count;
   
   Base_Time : Constant Integer := 150;
   
Begin
   Map.Set_Width (Global.Width);
   Map.Set_Height (Global.Height);         
   
   Player.Set_Dir (Terminal_Interface.Curses.Key_Right);
   
   Display.Init (W);
   Display.Display_Map (W);
   Timeout := Base_Time;
   T1 := Ada.Calendar.Clock;
   
   Terminal_Interface.Curses.Set_Timeout_Mode (W, Terminal_Interface.Curses.Delayed, Base_Time);
   
   Player.Grow;
   Food.New_Pos;
Game_Loop :
   Loop
      Key := Terminal_Interface.Curses.Get_Keystroke (W);
      Player.Change_Dir (Key);
      T2 := Ada.Calendar.Clock;
	 
      If Base_Time - Integer ((T2-T1) * 1000) <= 0 Then
	 T1 := Ada.Calendar.Clock;
	 Terminal_Interface.Curses.Set_Timeout_Mode (W, Terminal_Interface.Curses.Delayed, Base_Time);
	 --  Ada.Text_Io.Put_Line (Integer'Image (Integer (Key)));	 
	 
	 Display.Remove_Tail (W);
	 Player.Move;
	 Display.Refresh (W);
	 
	 
	 Player.Get_Head (Hx, Hy);
	 If Food.Get_X = Hx And Then Food.Get_Y = Hy Then
	    Player.Grow;
	    Food.New_Pos;
	 End If;
      Else
	 Timeout := Base_Time - Integer ((T2-T1) * 1000);
	 Terminal_Interface.Curses.Set_Timeout_Mode (W, Terminal_Interface.Curses.Delayed, Timeout);
      End If;
   End Loop Game_Loop;
   --  Display.Destroy;
End Snake;
