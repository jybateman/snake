With Terminal_Interface.Curses; Use Terminal_Interface.Curses;
With Map;

Package Body Player Is
   X : Terminal_Interface.Curses.Line_Count;
   Y : Terminal_Interface.Curses.Column_Count;
   Dir : Terminal_Interface.Curses.Real_Key_Code;
   
   Procedure Set_X
     (New_X : Terminal_Interface.Curses.Line_Count) Is
   Begin
      X := New_X;
   End Set_X;
   
   Function Get_X
     Return Terminal_Interface.Curses.Line_Count Is
   Begin
      Return X;
   End Get_X;
   
   Procedure Set_Y
     (New_Y : Terminal_Interface.Curses.Column_Count) Is
   Begin
      Y := New_Y;
   End Set_Y;
   
   Function Get_Y
     Return Terminal_Interface.Curses.Column_Count Is
   Begin
      Return Y;
   End Get_Y;
   
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

   Procedure Move Is
   Begin
      Case Dir Is
	 When Terminal_Interface.Curses.Key_Up =>
	    If X-1 > 0 then
	       X := X - 1;
	    End If;
	 When Terminal_Interface.Curses.Key_Down =>
	    If X+2 < Map.Get_Width then
	       X := X + 1;      	 
	    End If;
	 When Terminal_Interface.Curses.Key_Left =>
	    If Y-1 > 0 then
	       Y := Y - 1;
	    End If;
	 When Terminal_Interface.Curses.Key_Right =>
	    If Y+2 < Map.Get_Height then
	       Y := Y + 1;
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
   
Begin
   X := 1;
   Y := 1;
End Player;
