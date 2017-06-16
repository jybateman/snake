With Ada.Text_Io;
with Ada.Containers.Vectors;
With Terminal_Interface.Curses; Use Terminal_Interface.Curses;
With Map;
With Player;
With Food;
With Global;

Package Body Display Is
   
   Procedure Init
     (W : Out Terminal_Interface.Curses.Window)
   Is
      V : Terminal_Interface.Curses.Cursor_Visibility;
   Begin
      V := Terminal_Interface.Curses.Invisible;
      Terminal_Interface.Curses.Init_Screen;
                  
      W := Terminal_Interface.Curses.Create (Map.Get_Width, Map.Get_Height, 0, 0);
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
      Terminal_Interface.Curses.Add (W, Food.Get_X, Food.Get_Y, '*');
      Cursor := Player.Coord_Vectors.First(Position);
      
      --  Ada.Text_Io.Put (Integer'Image (Integer (Position.Length)));
      
   Vector_Loop:
      While Player.Coord_Vectors.Has_Element(Cursor) Loop
	 --  Ada.Text_Io.Put (Integer'Image (Integer (Player.Coord_Vectors.Element(Cursor).X)));
	 --  Ada.Text_Io.Put (Integer'Image (Integer (Player.Coord_Vectors.Element(Cursor).Y)));
	 Terminal_Interface.Curses.Add (W, Player.Coord_Vectors.Element(Cursor).X, Player.Coord_Vectors.Element(Cursor).Y, '#');
	 Player.Coord_Vectors.Next(Cursor);
      End Loop Vector_Loop;
      --  Ada.Text_Io.New_Line;      
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
   
   Procedure Game_Over
     (W : Terminal_Interface.Curses.Window)
   Is
   Begin
      Terminal_Interface.Curses.Add (W, Map.Get_Width/2, Map.Get_Height/2-5, "GAME OVER!");
      Terminal_Interface.Curses.Refresh (W);
   End Game_Over;
     
End Display;
