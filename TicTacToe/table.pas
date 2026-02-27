{
  Copyright (c) 2026 NorthZide.
  Licensed under the MIT License. 
  See LICENSE file in the project root for full license information.
}
Unit table;

Interface

Type
	TTable = Array[1..3,1..3] of Char;

Procedure StartTable(Var Table : TTable);
Procedure DrawTable(Const Table : TTable);


Implementation

Procedure StartTable(Var Table : TTable);
var
	Row, Col : integer;
Begin
	For Row := 1 to 3 do
	Begin
		For Col := 1 to 3 do
		Begin
			Table[Row, Col] := '$';
		End;
	End;

End;

Procedure DrawTable(Const Table : TTable);
Var
	Row, Col : integer;
Begin
	Writeln;
	For Row := 1 to 3 do
	Begin
		Write(' ');
		For Col := 1 to 3 do
		Begin
			Write(' ', Table[Row,Col], ' ');
			If Col < 3 then Write('|');
		End;
		Writeln;
		if Row < 3 then
			Writeln('------------');
	End;
	Writeln;
End;

End.

