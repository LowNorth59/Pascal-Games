{
Copyright (C) 2026  NorthZide

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
}

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
		Row, Col 	: Integer;
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
			Readln(Row);
			If (Row = 0) then Break;
			Write('>>');
			Readln(Col);
			DrawTable(Table);
			
					
			If (Row in [1..3]) And (Col in [1..3]) then

			Begin
				if(Table[Row, Col] = '$') Then
				Begin
					Table[Row, Col] 	:= Player;
					Winner 				:= Winning(Table);
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
