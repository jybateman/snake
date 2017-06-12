with Ada.Containers.Vectors;
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
      Position : Player.Coord_Vectors.Vector := Player.Get_Body;
      Cursor : Player.Coord_Vectors.Cursor;
   Begin
      Cursor := Player.Coord_Vectors.First(Position);
   Vector_Loop:
      While Player.Coord_Vectors.Has_Element(Cursor) Loop
	 Terminal_Interface.Curses.Add (W, Player.Coord_Vectors.Element(Cursor).X, Player.Coord_Vectors.Element(Cursor).Y, '#');
	 Player.Coord_Vectors.Next(Cursor);
      End Loop Vector_Loop;
      
      --  Array_Loop :
      --     --  While 
      --     for I in Position'Range Loop
      --     	 Terminal_Interface.Curses.Add (W, Position(I).X, Position(I).Y, '#');
      --     end loop Array_Loop;
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
