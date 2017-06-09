Package Body Player Is
   type Directions is ('U', 'D', 'L', 'R');
   X : Integer;
   Y : Integer;   
   
   Procedure Set_X
     (New_X : Integer) Is
   Begin
      X := New_X;
   End Set_X;
   
   Function Get_X
     Return Integer Is
   Begin
      Return X;
   End Get_X;
   
   Procedure Set_Y
     (New_Y : Integer) Is
   Begin
      Y := New_Y;
   End Set_Y;
   
   Function Get_Y
     Return Integer Is
   Begin
      Return Y;
   End Get_Y;
   
Begin
   X := 1;
   Y := 1;
End Player;
