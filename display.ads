With Terminal_Interface.Curses;
With Map;

Package Display Is
   
   Procedure Init
     (W : Out Terminal_Interface.Curses.Window);
   
   Procedure Destroy;
         
   Procedure Refresh
     (W : Terminal_Interface.Curses.Window);
   
   Procedure Display_Map
     (W : Terminal_Interface.Curses.Window);
   
   Procedure Remove_Tail
     (W : Terminal_Interface.Curses.Window);   
   
   Procedure Game_Over
     (W : Terminal_Interface.Curses.Window);   

End Display; 
