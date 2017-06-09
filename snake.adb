With Ada.Text_Io;
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
   Player.Set_Dir (Terminal_Interface.Curses.KEY_LEFT);
   
   Display.Init (W);
   Display.Display_Map (W);
Game_Loop :
   loop
      Key := Terminal_Interface.Curses.Get_Keystroke (W);
      --  Ada.Text_Io.Put_Line (Integer'Image (Integer (Key)));
      --  Ada.Text_Io.Put_Line (Integer'Image (Integer (Terminal_Interface.Curses.KEY_UP)));
      Player.Move (Key);
      Display.Refresh (W);
      
      --  delay Duration (10);
   End Loop Game_Loop;
   --  Display.Destroy;
End Snake;
