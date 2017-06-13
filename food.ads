With Terminal_Interface.Curses; Use Terminal_Interface.Curses;
With Ada.Numerics.Discrete_Random;
With Map;
With Global;

Package Food Is
   --  subtype X_Range is Terminal_Interface.Curses.Line_Count range 1 .. Map.Get_Width;
   --  subtype Y_Range is Terminal_Interface.Curses.Column_Count range 1 .. Map.Get_Height;
   
   subtype X_Range is Terminal_Interface.Curses.Line_Count range 1 .. Global.W - 2;
   subtype Y_Range is Terminal_Interface.Curses.Column_Count range 1 .. Global.H - 2;

   package Random_X is new Ada.Numerics.Discrete_Random (X_Range);
   package Random_Y is new Ada.Numerics.Discrete_Random (Y_Range);
   
   Function Get_X Return Terminal_Interface.Curses.Line_Count;
   
   Function Get_Y Return Terminal_Interface.Curses.Column_Count;
   
   Procedure New_Pos;

End Food;
