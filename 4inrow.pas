{
Copyright (C) 2026 NorthZide

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
PROGRAM FourInARow;
Uses
	Crt, SysUtils;

Type
	TTable = Array [1..6, 1..7] of Char;


Procedure StartTable(Var Table : TTable);
Var
	i, j : Integer;
Begin
	For i := 1 to 6 do
	Begin
		For j := 1 to 7 do
		Begin
			Table[i, j] := '#';
		End;
	End;
End;

Procedure DrawTable(Const Table : TTable);
Var
	i, j : Integer;
Begin
	ClrScr;
	Writeln('  1   2   3   4   5   6   7  '); // Guía de columnas
	Writeln('╔═══╦═══╦═══╦═══╦═══╦═══╦═══╗');
	For i := 1 to 6 do
	Begin
		Write('║');
		For j := 1 to 7 do
		Begin
			Write(' ');
			If Table[i, j] = 'X' Then TextColor(Red)
			Else if Table[i,j] = 'O' Then TextColor(Green)
			Else TextColor(White);

			Write(Table[i, j]);
			TextColor(White);
			Write(' ║');	
		End;
		Writeln;	

		If i < 6 Then
			Writeln('╠═══╬═══╬═══╬═══╬═══╬═══╬═══╣')
		Else
			Writeln('╚═══╩═══╩═══╩═══╩═══╩═══╩═══╝');
	End;
End;

Function ValidMove(Const Table : TTable; Col : Integer) : Boolean;
Begin	

	If (Col < 0) Or (Col > 7) Then
	Begin
		Writeln('Fuera de Rango');
		Exit(False);
	End;

	If (Col = 0) Then 
	Begin
		Writeln('Gracias Por Jugar');
		Exit(False);
	End;

	If(Table[1,Col] <> '#') Then
	Begin
		Writeln('Movimento no Valido');
		Exit(False);
	End;
		
	Exit(True);
End;

Function Winning(Const Table : TTable; Player : Char) : Boolean;	
Var
	i, j : integer;
Begin
	for i := 1 to 6 do
		for j := 1 to 4 do
			if(Table[i,j] = Player) And
			(table[i,j + 1] = Player) And
			(table[i,j + 2] = Player) And
			(Table[i,j + 3] = Player) then
				Exit(True);

	for i := 1 to 3 do
		for j := 1 to 7 do
			if(table[i,j] = Player) And
			(table[i + 1, j] = Player) And
			(table[i + 2, j] = Player) And
			(table[i + 3, j] = Player) Then
				Exit(True);

	for i := 1 to 3 do
		for j := 1 to 4 do
			if(table[i, j] = Player) And
			(table[i+1, J+1] = Player) And
			(table[i+2, j+2] = Player) And
			(table[i+3, j+3] = Player) Then
				Exit(True);

	for i := 1 to 3 do
		for j := 1 to 4 do
			if(table[i, j] = Player) And
			(table[i-1, J+1] = Player) And
			(table[i-2, j+2] = Player) And
			(table[i-3, j+3] = Player) Then
			Exit(True);
 
	Exit(False);
End;

Procedure PutAThing(Var Table : TTable; Player : Char; Col : Integer);
Var
	i : integer;
Begin	
	For i := 6 downto 1 do
	Begin
		if (Table[i,Col] = '#') then
		Begin
			Table[i, Col] := Player;
			Exit;	
		End;
	End;
	Writeln('Columna Llena');
End;

Var
	Counter : Integer;
	Table : TTable;
	Fila : Integer;
	Player : Char;
Begin
	Player := 'X';
	Counter := 0; 
	ClrScr;

	StartTable(Table);
	DrawTable(Table);

	Repeat
		If (Counter Mod 2 = 0) Then Player := 'X'
		Else Player := 'O';

		Writeln('Turn: ',Player);
		Readln(Fila);
		If ValidMove(Table, Fila) Then
		Begin
			Inc(Counter);
			PutAThing(Table, Player, Fila);
			DrawTable(Table);

			If(Counter <> 42) And (Winning(Table, Player) = True) Then
			Begin
				DrawTable(Table);
				Writeln('Player: ', Player, ' You Win');
				Break;
			End;
		End
		Else If (Fila <> 0) Then
		Begin
			Writeln('Presiona una tecla para reintentar');
			Readkey;
			DrawTable(Table);
		End;
					
	Until (Fila = 0) Or (Counter = 42) Or (Winning(Table, Player));
	Writeln('End Of Program');
	
End.
