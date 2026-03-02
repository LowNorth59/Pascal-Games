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

