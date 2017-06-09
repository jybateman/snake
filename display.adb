With Terminal_Interface.Curses;
With Map;

Package Body Display Is
   
   Procedure Init
     (W : Out Terminal_Interface.Curses.Window)
   Is
   Begin
      Terminal_Interface.Curses.Init_Screen;
      W := Terminal_Interface.Curses.Create (Map.Get_Width, Map.Get_Height, 0, 0);
      Terminal_Interface.Curses.Set_Keypad_Mode(W, True);
      Terminal_Interface.Curses.Set_Echo_Mode(False);
   End Init;
   
   Procedure Destroy Is
   Begin
      Terminal_Interface.Curses.End_Windows;
   End Destroy;
   
   Procedure Refresh
     (W : Terminal_Interface.Curses.Window)
   Is
   Begin
      Terminal_Interface.Curses.Refresh (W);
   End Refresh;
   
   Procedure Display_Map
     (W : Terminal_Interface.Curses.Window)
   Is
   Begin
      Terminal_Interface.Curses.Border (W);
      Terminal_Interface.Curses.Refresh (W);
   End Display_Map;
   
End Display;
