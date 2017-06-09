With Terminal_Interface.Curses;

Package Player Is
   
   Procedure Set_X
   (New_X : Terminal_Interface.Curses.Line_Count);
   
   Function Get_X
     Return Terminal_Interface.Curses.Line_Count;
   
   Procedure Set_Y
     (New_Y : Terminal_Interface.Curses.Column_Count);
   
   Function Get_Y
     Return Terminal_Interface.Curses.Column_Count;
   
   Procedure Set_Dir
     (New_Dir : Terminal_Interface.Curses.Real_Key_Code);
   
   Function Get_Dir
     Return Terminal_Interface.Curses.Real_Key_Code;
   
   Procedure Move 
     (New_Dir : Terminal_Interface.Curses.Real_Key_Code);
     
End Player;
