With Ada.Text_Io;
with Ada.Containers.Vectors;
With Terminal_Interface.Curses; Use Terminal_Interface.Curses;
With Map;

Package Body Player Is
   Dir : Terminal_Interface.Curses.Real_Key_Code;
   Tmp : Coord := (1, 1);
   Position : Coord_Vectors.Vector;
   
   Function Get_Body
     Return Coord_Vectors.Vector Is
   Begin
      Return Position;
   End Get_Body;
      
   Procedure Set_Dir
     (New_Dir : Terminal_Interface.Curses.Real_Key_Code) Is
   Begin
      Dir := New_Dir;
   End Set_Dir;

   Function Get_Dir
     Return Terminal_Interface.Curses.Real_Key_Code Is
   Begin
      Return Dir;
   End Get_Dir;
   
   Procedure Get_Tail
     (Tx : Out Terminal_Interface.Curses.Line_Count;
      Ty : Out Terminal_Interface.Curses.Column_Count) Is
   Begin
      Tx := Position.Last_Element.X;
      Ty := Position.Last_Element.Y;
   End Get_Tail;
   
   Procedure Move_Body Is
      Cursor : Player.Coord_Vectors.Cursor;
      Peek_Cursor : Player.Coord_Vectors.Cursor;
      
      Procedure Update_Body
	(Element : In Out Coord) Is
      Begin
	 Element.X := Player.Coord_Vectors.Element(Cursor).X;
	 Element.Y := Player.Coord_Vectors.Element(Cursor).Y;
      End Update_Body;
   Begin  
      Cursor := Player.Coord_Vectors.First(Position);
   Vector_Loop:
      While Player.Coord_Vectors.Has_Element(Cursor) Loop
	 Peek_Cursor := Player.Coord_Vectors.Next(Cursor);
	 If Player.Coord_Vectors.Has_Element(Peek_Cursor) Then
	    Position.Update_Element(Peek_Cursor, Update_Body'Access);
	 End If;
	 Player.Coord_Vectors.Next(Cursor);
      End Loop Vector_Loop;
   End Move_Body;
   
   Procedure Move Is
      Cursor : Player.Coord_Vectors.Cursor := Position.First;
      
      Procedure Up
	(Element : In Out Coord) Is
      Begin
	 Element.X := Element.X - 1;	 
      End Up;
      
      Procedure Down
	(Element : In Out Coord) Is
      Begin
	 Element.X := Element.X + 1;	 
      End Down;
      
      Procedure Left
	(Element : In Out Coord) Is
      Begin
	 Element.Y := Element.Y - 1;	 
      End Left;
      
      Procedure Right
	(Element : In Out Coord) Is
      Begin
	 Element.Y := Element.Y + 1;	 
      End Right;
   Begin
      --  Ada.Text_Io.Put_Line (Integer'Image (Integer (Position (Position'First).X)));
      --  Ada.Text_Io.Put_Line (Integer'Image (Integer(Position.Length)));
      
      Case Dir Is
	 When Terminal_Interface.Curses.Key_Up =>
	    If Position.First_Element.X-1 > 0 Then
	       Move_Body;
	       Position.Update_Element(Cursor, Up'Access);
	    End If;
	 When Terminal_Interface.Curses.Key_Down =>
	    If Position.First_Element.X+2 < Map.Get_Width then
	       Move_Body;
	       Position.Update_Element(Cursor, Down'Access);
	    End If;
	 When Terminal_Interface.Curses.Key_Left =>
	    If Position.First_Element.Y-1 > 0 then
	       Move_Body;
	       Position.Update_Element(Cursor, Left'Access);
	    End If;
	 When Terminal_Interface.Curses.Key_Right =>
	    If Position.First_Element.Y+2 < Map.Get_Height then
	       Move_Body;
	       Position.Update_Element(Cursor, Right'Access);
	    End If;
	 When Others =>
	    Return;
      End Case;
   End Move;

   Procedure Change_Dir
     (New_Dir : Terminal_Interface.Curses.Real_Key_Code)
   Is
   Begin
      If New_Dir = Terminal_Interface.Curses.Key_Up Or Else New_Dir = Terminal_Interface.Curses.Key_Down Or Else New_Dir = Terminal_Interface.Curses.Key_Right Or Else New_Dir = Terminal_Interface.Curses.Key_Left Then
	 Dir := New_Dir;
      End If;
   End Change_Dir;
   
   Procedure Grow Is   
   Begin
      Position.Append(Coord'(Position.Last_Element.X, Position.Last_Element.Y));
   End Grow;
   
Begin
   Position.Append(Coord'(1, 1));
End Player;
