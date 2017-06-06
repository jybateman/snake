with Terminal_Interface.Curses;
with Ada.Text_Io;

Procedure Map Is
   W : Terminal_Interface.Curses.Window;
Begin
   Ada.Text_Io.Put_Line ("Hello World!");
   Terminal_Interface.Curses.Init_Screen;
   W := Terminal_Interface.Curses.Create (20, 20, 20, 20);
   Terminal_Interface.Curses.Border(W);
   Terminal_Interface.Curses.Refresh(W);
End Map;
