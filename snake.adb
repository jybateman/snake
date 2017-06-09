With Terminal_Interface.Curses;
With Display;
With Map;
With Player;

Procedure Snake Is
   W : Terminal_Interface.Curses.Window;
   Key : Terminal_Interface.Curses.Real_Key_Code;
Begin
   Map.Set_Width (20);
   Map.Set_Height (20);
   
   Player.Set_X (1);
   Player.Set_Y (1);
   
   Display.Init (W);
   Display.Display_Map (W);
Game_Loop :
   loop
      Key := Terminal_Interface.Curses.Get_Keystroke (W);
      Display.Refresh (W);
      --  delay Duration (10);
   End Loop Game_Loop;
   Display.Destroy;
End Snake;
