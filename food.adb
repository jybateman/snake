With Ada.Text_Io;
With Terminal_Interface.Curses; Use Terminal_Interface.Curses;
With Ada.Numerics.Discrete_Random;
With Map;
With Player;

Package Body Food Is
   W : Terminal_Interface.Curses.Line_Count;
   
   X : Terminal_Interface.Curses.Line_Count;
   Y : Terminal_Interface.Curses.Column_Count;
   Gx : Random_X.Generator; 
   Gy : Random_Y.Generator;
      
   Function Get_X Return Terminal_Interface.Curses.Line_Count Is
   Begin
      Return X;
   End Get_X;
   
   Function Get_Y Return Terminal_Interface.Curses.Column_Count Is
   Begin
      Return Y;
   End Get_Y;
   
   Procedure New_Pos Is
      Position : Player.Coord_Vectors.Vector := Player.Get_Body;
      Cursor : Player.Coord_Vectors.Cursor;
      Is_Valid : Boolean;
   Begin
   Random_Loop:
      Loop
	 Cursor := Player.Coord_Vectors.First(Position);
	 X := Random_X.Random (Gx);
	 Y := Random_Y.Random (Gy);
	 Is_Valid := True;
      Vector_Loop:
	 While Player.Coord_Vectors.Has_Element(Cursor) Loop
	    If Player.Coord_Vectors.Element(Cursor).X = X Or Else Player.Coord_Vectors.Element(Cursor).Y = Y Then
	       Is_Valid := False;	 
	    End If;
	 Player.Coord_Vectors.Next(Cursor);
	 End Loop Vector_Loop;
	 
	 Exit Random_Loop When Not Is_Valid;
      End Loop Random_Loop;
      
      Return;
   End New_Pos;
   
Begin
   W := Map.Get_Width;
   Ada.Text_Io.New_Line;
   Ada.Text_Io.New_Line;
   Ada.Text_Io.New_Line;
   Ada.Text_Io.New_Line;
   Ada.Text_Io.New_Line;
   Ada.Text_Io.Put_Line (Integer'Image (Integer (W)));
   
   Random_X.Reset (Gx);
   Random_Y.Reset (Gy);
End Food;
