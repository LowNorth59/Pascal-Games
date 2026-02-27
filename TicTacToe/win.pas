Unit win;

Interface
	Uses table;
	Function Winning(Table : TTable) : Boolean;


Implementation

	Function Winning(Table : TTable) : Boolean;
	Var
		k : integer;

	Begin
		For k := 1 to 3 do
		Begin
			If (Table[k,1] = Table[k,2]) And (Table[k,2] = table[k,3]) And (Table[k,3] <> '$') Then Exit(True);
			If (Table[1,k] = Table[2,k]) And (Table[2,k] = table[3,k]) And (Table[3,k] <> '$') Then Exit(True);
		End;

		If (Table[1,1] = Table[2,2]) And (Table[2,2] = Table[3,3]) And (Table[3,3] <> '$') Then Exit(True);
		If (Table[1,3] = Table[2,2]) And (Table[2,2] = Table[3,1]) And (Table[3,1] <> '$') Then Exit(True);

	Exit(False);
	End;
End.
