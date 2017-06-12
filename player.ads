With Terminal_Interface.Curses;

Package Player Is
   type Coord is record
      X : Terminal_Interface.Curses.Line_Count;
      Y : Terminal_Interface.Curses.Column_Count;
   end record;
   type Pair_Coord is array (Positive range <>) of Coord;
   
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
   
   Procedure Get_Tail
     (Tx : Out Terminal_Interface.Curses.Line_Count;
      Ty : Out Terminal_Interface.Curses.Column_Count);
   
   Procedure Move_Body;
   
   Procedure Move;
   
   Procedure Change_Dir
     (New_Dir : Terminal_Interface.Curses.Real_Key_Code);
     
End Player;
