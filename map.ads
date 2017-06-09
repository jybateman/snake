With Terminal_Interface.Curses;

Package Map Is   
      
   Procedure Set_Width 
     (New_Width : Terminal_Interface.Curses.Line_Count);
   
   Procedure Set_Height 
     (New_Height : Terminal_Interface.Curses.Column_Count);
   
   Function Get_Width Return Terminal_Interface.Curses.Line_Count;
   
   Function Get_Height Return Terminal_Interface.Curses.Column_Count;
   
End Map;
