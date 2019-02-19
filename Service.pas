unit Service;

interface
const
  K = 10000;
type
  MyType = integer;
  tm = array of MyType;
function time: int64;
procedure Write_Mas(const mas: tm; fn: string = '');
procedure WRITE_MAS_FOR_TREE(const mas:tm);
function Gen_Mas(const len: cardinal; Rand: integer = 0;min:Integer = -10000; max :Integer = 10000): tm;
implementation

function time: int64;
asm
   rdtsc
end;

procedure Write_Mas(const mas: tm; fn: string = '');
var
  i: cardinal;
begin
  if fn <> '' then
    fn := fn + '.txt';
  AssignFile(Output, fn);
  Rewrite(output);
  if fn <> '' then
    Writeln(Length(mas) - 1);
  for i := 0 to Length(mas) - 1 do
    writeln(mas[i]);
  CloseFile(Output);
  AssignFile(Output, '');
end;
procedure WRITE_MAS_FOR_TREE(const mas:tm);
var
  i,l:Cardinal;
begin
Writeln(mas[0]);
for i := 1 to Length(mas)-1 do
  Writeln('P',mas[(i-1)shr 1]:8,mas[i]:8);
end;
procedure Read_Mas(var mas: tm; fn: string = '');
var
  i, n: cardinal;
begin
  if fn <> '' then
    fn := fn + '.txt';
  AssignFile(input, fn);
  Reset(input);
  Readln(n);
  SetLength(mas, n);
  for i := 0 to n - 1 do
    readln(mas[i]);
  AssignFile(input, '');
end;

function Gen_Mas(const len: cardinal; Rand: integer = 0;min:Integer = -10000; max :Integer = 10000): tm;
var
  i: cardinal;
begin
  Randomize;
  if rand <> 0 then
    randseed := Rand;
  SetLength(result, Len);
  for i := 0 to Len - 1 do
    result[i] := Random((max - min) + 1) + min;
end;

end.

