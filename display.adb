With Terminal_Interface.Curses;
With Map;
With Player;

Package Body Display Is
   
   Procedure Init
     (W : Out Terminal_Interface.Curses.Window)
   Is
      V : Terminal_Interface.Curses.Cursor_Visibility;
   Begin
      V := Terminal_Interface.Curses.Invisible;
      Terminal_Interface.Curses.Init_Screen;
      W := Terminal_Interface.Curses.Create (Map.Get_Width, Map.Get_Height, 0, 0);
      --  Terminal_Interface.Curses.Set_Timeout_Mode (W, Terminal_Interface.Curses.Delayed, 500);
      Terminal_Interface.Curses.Set_Keypad_Mode (W, True);
      Terminal_Interface.Curses.Set_Echo_Mode (False);
      Terminal_Interface.Curses.Set_Cursor_Visibility (V);
   End Init;
   
   Procedure Destroy Is
   Begin
      Terminal_Interface.Curses.End_Windows;
   End Destroy;
   
   Procedure Refresh
     (W : Terminal_Interface.Curses.Window)
   Is
   Begin
      --  Terminal_Interface.Curses.Clear (W);
      Terminal_Interface.Curses.Border (W);
      Terminal_Interface.Curses.Add (W, Player.Get_X, Player.Get_Y, '#');
      Terminal_Interface.Curses.Refresh (W);
   End Refresh;
   
   Procedure Display_Map
     (W : Terminal_Interface.Curses.Window)
   Is
   Begin
      Terminal_Interface.Curses.Border (W);
      Terminal_Interface.Curses.Refresh (W);
   End Display_Map;
   
   Procedure Remove_Tail
     (W : Terminal_Interface.Curses.Window)
   Is
      X : Terminal_Interface.Curses.Line_Count;
      Y : Terminal_Interface.Curses.Column_Count;
   Begin
      Player.Get_Tail (X, Y);
      Terminal_Interface.Curses.Add (W, X, Y, ' ');
      Terminal_Interface.Curses.Refresh (W);
   End Remove_Tail;
   
End Display;
