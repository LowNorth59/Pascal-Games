Unit table;

Interface

Type
	TTable = Array[1..3,1..3] of Char;

Procedure StartTable(Var Table : TTable);
Procedure DrawTable(Const Table : TTable);


Implementation

Procedure StartTable(Var Table : TTable);
var
	i, j : integer;
Begin
	For i := 1 to 3 do
	Begin
		For j := 1 to 3 do
		Begin
			Table[i, j] := '$';
		End;
	End;

End;

Procedure DrawTable(Const Table : TTable);
Var
	i, j : integer;
Begin
	Writeln;
	For i := 1 to 3 do
	Begin
		Write(' ');
		For j := 1 to 3 do
		Begin
			Write(' ', Table[i,j], ' ');
			If j < 3 then Write('|');
		End;
		Writeln;
		if i < 3 then
			Writeln('------------');
	End;
	Writeln;
End;


End.

