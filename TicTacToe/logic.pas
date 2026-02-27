Unit logic;

Interface
	Uses table, win, crt;

	Procedure GameLogic;

Implementation

	Procedure GameLogic;
	Var
		Table 		: TTable;
		Player 		: Char;
		Counter 	: Integer;
		Fila, Col 	: Integer;
		Winner 	: Boolean;
	Begin
		Counter 	:= 0;
		Winner 		:= False;
			
		StartTable(Table);
		
		
		Repeat
			If (Counter Mod 2 = 0) Then Player := 'X'
			Else Player := 'O';
			
			Clrscr;
			Writeln('The Ultimate TicTacToe');
			DrawTable(Table);

			Write('Turno de ', Player,' >> ');
			Readln(Fila);
			If (Fila = 0) then Break;
			Write('>>');
			Readln(Col);
			DrawTable(Table);
			
					
			If (Fila in [1..3]) And (Col in [1..3]) then

			Begin
				if(Table[Fila, Col] = '$') Then
				Begin
					Table[Fila, Col] 	:= Player;
					Winner 			:= Winning(Table);
					If Not Winner Then Inc(Counter);
				End
				else 
				Begin
					Writeln('Space Already Taken');
					Readln;
				End;	
			End
			Else
			Begin
				Writeln('Out Of Limits');	
				Readln;
			End;

		Until (Counter >= 9) Or (Winner);
		
		DrawTable(Table);	
		If Winner Then
			Writeln('Player: ', Player, ' Has Win')
		Else
			Writeln('Empate');
	End;
End.
