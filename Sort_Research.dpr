program Sort_Research;

{$APPTYPE CONSOLE}

uses
  SysUtils, Windows,
  Service,
  Sort;
var
  n: Cardinal;
  fname: string;
  mas: tm;
  t, fr: Int64;
  rnd:Integer;
  
begin
  rnd:=1385011712;
  while True do
  begin
    n := 0;
    while n < 1 do
    begin
      write('Enter n: ');
      readln(n);
    end;
    write('Enter output fname: ');
    Readln(fname);
    mas := Gen_mas(n,1000);
    //Write_Mas(mas,'');
   // write_mas(mas, fname);
    //1- Sort by selection n = 10000 t = 47 ms
    QueryPerformanceFrequency(fr);
    t := time;
    Sort_Selection(mas);
    t := time - t;
    Writeln;
    writeln('time = ', t / fr: 0: 4, ' ms ','SELECTION_SORT');
    //
    mas := Gen_mas(n,rnd);
    //1- Sort by BUBBLE n = 10000 t = 190 ms
    {QueryPerformanceFrequency(fr);
    t := time;
    BUBBLE_SORT(mas);
    t := time - t;
    writeln('time = ', t / fr: 0: 4, ' ms ','BUBBLE_SORT');}
    //
    mas := Gen_mas(n,rnd);
    t := time;
    SORT_INSERT(mas);
    t := time - t;
    // 17
    writeln('time = ', t / fr: 0: 4, ' ms ','SORT_INSERT');
    //
    mas := Gen_mas(n,rnd);
    t := time;
    SORT_INSERT_MOVE(mas);
    t := time - t;
    //9
    writeln('time = ', t / fr: 0: 4, ' ms ','SORT_INSERT_MOVE');
//    mas := Gen_mas(n,1000);
//    t := time;
//    SORT_INSERT_MOVE(mas);
//    t := time - t;
//    Write_Mas(SORT_INSERT_MOVE_2XRANGE(mas));
//    //
//    writeln('time = ', t / fr: 0: 4, ' ms ','SORT_INSERT_MOVE_2XRANGE');
    mas := Gen_mas(n,rnd);
    QueryPerformanceFrequency(fr);
    t := time;
    BUBBLE_SORT_2X(mas);
    t := time - t;
    //10000  150 ms
    writeln('time = ', t / fr: 0: 4, ' ms ','BUBBLE_SORT_2X');
    mas := Gen_Mas(n,rnd);
    QueryPerformanceFrequency(fr);
    t := time;
    SHELL_SORT(mas);
    t := time - t;
    //10000   2.17ms
    writeln('time = ', t / fr: 0: 4, ' ms ','SHELL_SORT');
    mas:=Gen_Mas(n,rnd);
    //Write_Mas(mas);
    t := time;
    QUICK_SORT(0,length(mas)-1,mas);
    t := time - t;
    //10000  0.75
    writeln('time = ', t / fr: 0: 4, ' ms ','MEINE_SCHNELLE_SORTIEREN');
    mas:=Gen_Mas(n,rnd);
    t := time;
    SORT_BY_SIFT_DOWN(mas);
    t := time - t;
    //10000 1ms
    writeln('time = ', t / fr: 0: 4, ' ms ','EIN_HAUFEN_SORTIREN');
    Write(stringofchar('_', 80));

  end;
end.

