With Terminal_Interface.Curses;

Package Body  Map Is
   W : Terminal_Interface.Curses.Window;
   
   Procedure Make Is
   Begin
      Terminal_Interface.Curses.Init_Screen;
      W := Terminal_Interface.Curses.Create (20, 20, 0, 0);
      Terminal_Interface.Curses.Border (W);
      Terminal_Interface.Curses.Refresh (W);
   End Make;
   
   Procedure Destroy Is
   Begin
      Terminal_Interface.Curses.End_Windows;
   End Destroy;
   
 End Map;
