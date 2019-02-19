unit Sort;

interface
uses Service;
//Sort by selection: n*(n-1)/2
procedure Sort_Selection(var mas: tm);
procedure Swap(var a, b: MyType);
function QUICK_SEARCH(const mas: tm; const x: MyType; LEN: cardinal; L: cardinal
  = 0): cardinal;
function SORT_INSERT_MOVE_2XRANGE(var mas: tm): tm;
function SORT_INSERT(var mas: tm): tm;
function SORT_INSERT_MOVE(var mas: tm): tm;
procedure BUBBLE_SORT(var arr: tm);
procedure BUBBLE_SORT_2X(var arr: tm);
procedure SHELL_SORT(var arr: tm);
procedure BUILD_TREE_BY_SIFT_UP(var mas: tm);
procedure SORT_BY_SIFT_DOWN(var mas: tm);
procedure QUICK_SORT(L: Cardinal; R: Cardinal; var mas: tm);
implementation

procedure Swap(var a, b: MyType);
var
  c: MyType;
begin
  c := a;
  a := b;
  b := c;
end;

procedure Sort_Selection(var mas: tm);
var
  i, j, i_min, len: Cardinal;
  min: MyType;
begin
  len := Length(mas);
  for i := 0 to len - 2 do
  begin
    min := mas[i];
    i_min := i;
    for j := i + 1 to Len - 1 do
      if mas[j] < min then
      begin
        min := mas[j];
        i_min := j;
      end;
    //if i_min <> i then //???????????????
    Swap(mas[i_min], mas[i]);
  end;
end;
//
//

function QUICK_SEARCH(const mas: tm; const x: MyType; LEN: cardinal; L: cardinal
  = 0): cardinal;
var
  i, R: cardinal;
  Cur: MyType;
begin
  result := 0;
  R := len - 1;
  if x < mas[l] then
    result := l
  else if x >= mas[r] then
    Result := r + 1
  else
  begin
    while (L <= R) do
    begin
      result := (L + R) shr 1; //div 2;
      cur := mas[result];
      if x > cur then
        L := result + 1
      else if x < cur then
        R := result - 1
      else
      begin
        inc(result);
        exit;
      end;
    end;
    if (x >= mas[Result]) then
      inc(result)
  end;
end;
//
//

function SORT_INSERT(var mas: tm): tm;
var
  k, i, j, l: Cardinal;
begin
  l := Length(mas);
  SetLength(Result, l);
  Result[0] := mas[0];
  for i := 1 to l - 1 do
  begin
    k := QUICK_SEARCH(Result, mas[i], i);
    for j := i - 1 downto k do
      result[j + 1] := result[j];
    Result[k] := mas[i];
  end;
end;

function SORT_INSERT_MOVE(var mas: tm): tm;
var
  k, i, j, l: Cardinal;
begin
  l := Length(mas);
  SetLength(Result, l);
  Result[0] := mas[0];
  for i := 1 to l - 1 do
  begin
    k := QUICK_SEARCH(Result, mas[i], i);
    move(result[k], Result[k + 1], (i - k) * 4);
    Result[k] := mas[i];
  end;
end;

function SORT_INSERT_MOVE_2XRANGE(var mas: tm): tm;
var
  k, i, j, l, left, right: Cardinal;
begin
  l := Length(mas);
  SetLength(Result, l * 2 - 1);
  Result[l - 1] := mas[0];
  left := l - 1;
  right := l - 1;
  for i := 1 to l - 1 do
  begin
    k := QUICK_SEARCH(Result, mas[i], right + 1, left);
    if k = left then
    begin
      Result[k - 1] := mas[i];
      Inc(left);
      Continue;
    end
    else if (k - left)>(right - left) div 2 then
    begin
      move(result[k], Result[k + 1], (right - k) * 4);
      Inc(right)
    end
    else
    begin
      move(result[k - left], Result[k - left - 1], (right - k) * 4);
      inc(left);
    end;
    Result[k] := mas[i];
  end;
end;

procedure BUBBLE_SORT(var arr: tm);
var
  i, j, l: cardinal;
begin
  l := length(arr) - 1;
  for i := 0 to l - 1 do
    for j := 0 to l - 1 - i do
      if arr[j] > arr[j + 1] then
        Swap(arr[j], arr[j + 1]);
end;

procedure BUBBLE_SORT_2X(var arr: tm);
var
  i, j, l: cardinal;
  flag: Boolean;
begin
  flag := True;
  l := length(arr) - 2;

  for i := 0 to l do
  begin
    for j := i to l - i do
      if arr[j] > arr[j + 1] then
      begin
        Swap(arr[j], arr[j + 1]);
        flag := False;
      end;
    if flag then
      Exit;
    flag := True;
    for j := l - i downto i + 1 do
      if arr[j - 1] > arr[j] then
        swap(arr[j - 1], arr[j]);

  end;

end;

procedure SHELL_SORT(var arr: tm);
var
  LEN, step, i, j: Cardinal;
  flag: Boolean;
begin
  flag := True;
  LEN := Length(arr);
  step := 1;
  j := 1;
  while step < LEN div 2 do
    step := step * 2 + 1;
  flag := True;
  while (flag) or (step > 1) {and (j + 2 < LEN)} do
  begin
    if (step > 1) and not (flag) then
      step := (step - 1) div 2;
    flag := False;
    for i := 0 to LEN - 1 - step do
      if arr[i] > arr[i + step] then
      begin
        Swap(arr[i], arr[i + step]);
        flag := true;
      end;

    //Inc(j);
  end;
end;

procedure SIFT_UP(var mas: tm; l: Cardinal);
var
  rot: Cardinal;
  sv: MyType;

begin
  rot := (l - 1) shr 1;
  sv := mas[l];
  while (l > 0) and (sv > mas[rot]) do
  begin
    mas[l] := mas[rot];
    l := rot;
    rot := (l - 1) shr 1;
  end;
  mas[l] := sv;
end;

procedure BUILD_TREE_BY_SIFT_UP(var mas: tm);
var
  i: Cardinal;
begin
  for i := 1 to Length(mas) - 1 do
    SIFT_UP(mas, i);
end;

procedure SIFT_DOWN(var mas: tm; len: Cardinal; i: Cardinal = 0);
var
  b, s: Cardinal;
  en: Int64;
  sv: MyType;
begin
  //Dec(len);
  if len < 2 then
    en := -1
  else
    en := (len - 2) shr 1;
  sv := mas[i];
  while i <= en do
  begin
    b := i * 2 + 2;
    s := b - 1;
    if mas[b] < mas[s] then
      b := s;
    if sv < mas[b] then
    begin
      mas[i] := mas[b];
    i := b;
      continue;
    end;
    break;
  end;
  b := i * 2 + 1;
  if Odd(len) and (b = len) then
    if sv < mas[b] then
    begin
      mas[i] := mas[b];
      i := b;
    end;
  mas[i] := sv;
end;

procedure SORT_BY_SIFT_DOWN(var mas: tm);
var
  l, i: cardinal;
begin
  l := Length(mas) - 1;
  BUILD_TREE_BY_SIFT_UP(mas);
  for i := l downto 2 do
  begin
    Swap(mas[i], mas[0]);
    SIFT_DOWN(mas, i - 1);
  end;
  swap(mas[1], mas[0]);
end;

procedure QUICK_SORT(L: Cardinal; R: Cardinal; var mas: tm);
var
  i, j: Cardinal;
  mid: MyType;
begin
  mid := mas[(R + L) shr 1];
  i := l;
  j := r;
  repeat
    while mas[i] < mid do
      Inc(i);
    while mas[j] > mid do
      dec(j);
    if i <= j then
    begin
      if i<j then Swap(mas[i], mas[j]);
      inc(i);
      if j>0 then dec(j);
    end;
  until i > j;
  if i < R then
    QUICK_SORT(i, R, mas);
  if j > L then
    QUICK_SORT(L, j, mas);
end;

{procedure BUILD_TREE_BY_SIFT_DOWN(var mas);

begin

end;  }
end.

