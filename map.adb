With Terminal_Interface.Curses;

Package Body  Map Is
   Width : Terminal_Interface.Curses.Line_Count;
   Height : Terminal_Interface.Curses.Column_Count;
   
   Procedure Set_Width 
     (New_Width : Terminal_Interface.Curses.Line_Count)
   Is
   Begin
      Width := New_Width;
   End Set_Width;
   
   Procedure Set_Height 
     (New_Height : Terminal_Interface.Curses.Column_Count)
   Is
   Begin
      Height := New_Height;
   End Set_Height;
   
   Function Get_Width Return Terminal_Interface.Curses.Line_Count Is
   Begin
      Return Width;
   End Get_Width;
   
   Function Get_Height Return Terminal_Interface.Curses.Column_Count Is
   Begin
      Return Height;
   End Get_Height;
   
End Map;
