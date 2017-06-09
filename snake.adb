With Ada.Text_Io;
With Ada.Calendar; Use Ada.Calendar;
With Terminal_Interface.Curses;
With Display;
With Map;
With Player;

Procedure Snake Is
   W : Terminal_Interface.Curses.Window;
   Key : Terminal_Interface.Curses.Real_Key_Code;
   T1 : Ada.Calendar.Time;
   T2 : Ada.Calendar.Time;
   Timeout : Integer;
   
   Base_Time : Constant Integer := 1000;
Begin
   Map.Set_Width (20);
   Map.Set_Height (20);
   
   Player.Set_X (1);
   Player.Set_Y (1);
   Player.Set_Dir (Terminal_Interface.Curses.Key_Right);
   
   Display.Init (W);
   Display.Display_Map (W);
   Timeout := Base_Time;
   T1 := Ada.Calendar.Clock;
Game_Loop :
   Loop
      Key := Terminal_Interface.Curses.Get_Keystroke (W);
      T2 := Ada.Calendar.Clock;
	 
      If (T2 - T1) * 1000 >= Duration (Base_Time) Then
	 T1 := Ada.Calendar.Clock;
	 --  Ada.Text_Io.Put_Line (Duration'Image ((T2-T1) * 1000));
	 Terminal_Interface.Curses.Set_Timeout_Mode (W, Terminal_Interface.Curses.Delayed, Base_Time);
	 --  Ada.Text_Io.Put_Line (Integer'Image (Integer (Key)));
	 --  Ada.Text_Io.Put_Line (Integer'Image (Integer (Terminal_Interface.Curses.Key_None)));
	 Player.Move;
	 Display.Refresh (W);
	 --  Ada.Text_Io.Put_Line ("hello world");
	 --  delay Duration (1);
      Else
	 Timeout := Base_Time - Integer ((T2-T1) * 1000);
	 --  Ada.Text_Io.Put_Line (Integer'Image (Timeout));
	 --  T1 := Ada.Calendar.Clock;
	 Terminal_Interface.Curses.Set_Timeout_Mode (W, Terminal_Interface.Curses.Delayed, Timeout);
      End If;
   End Loop Game_Loop;
   --  Display.Destroy;
End Snake;
