With Terminal_Interface.Curses;
with Ada.Containers.Vectors;

Package Player Is
   type Coord is record
      X : Terminal_Interface.Curses.Line_Count;
      Y : Terminal_Interface.Curses.Column_Count;
   end record;
   type Pair_Coord is array (Positive range <>) of Coord;
   Package Coord_Vectors is new Ada.Containers.Vectors(Natural, Coord); Use Coord_Vectors;
   
   Function Get_Body
     Return Coord_Vectors.Vector;

   Procedure Set_Dir
     (New_Dir : Terminal_Interface.Curses.Real_Key_Code);
   
   Function Get_Dir
   Return Terminal_Interface.Curses.Real_Key_Code;
   
   Procedure Get_Tail
     (Tx : Out Terminal_Interface.Curses.Line_Count;
      Ty : Out Terminal_Interface.Curses.Column_Count);
   
   Procedure Get_Head
     (Hx : Out Terminal_Interface.Curses.Line_Count;
      Hy : Out Terminal_Interface.Curses.Column_Count);

   Procedure Move_Body;
   
   Procedure Move;
   
   Procedure Change_Dir
     (New_Dir : Terminal_Interface.Curses.Real_Key_Code);
     
   Procedure Grow;
     
End Player;
