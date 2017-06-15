{

 ѕодсчитать количество строк заданной матрицы,
 которые упор€дочены по возрастанию

}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, XPMan;

type
  TForm1 = class(TForm)
    strngrd1: TStringGrid;
    edt1: TEdit;
    btn1: TButton;
    btn2: TButton;
    lbl1: TLabel;
    xpmnfst1: TXPManifest;
    Label1: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

type
  mas = array[1..100, 1..100] of Integer;

var
  n: integer;
  A: mas;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  n := StrToInt(edt1.Text);
  strngrd1.ColCount := n;
  strngrd1.RowCount := n;
end;

function Answer(var A: mas; n: Integer): integer;
var
  srv, sch, i, j: integer;
begin
  srv := -100000;
  sch := 0;
  Result := 0;
  for i := 1 to n do
  begin
    for j := 1 to n do
    begin
      if A[i, j] > srv then
      begin
        Inc(sch);
        srv := A[i, j];
      end;
    end;
    if sch = n then
      Inc(Result);
    sch := 0;
    srv := -100000;
  end;
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  i, j, index: integer;
begin
  for i := 1 to n do
    for j := 1 to n do
    begin
      Val(strngrd1.Cells[j - 1, i - 1], A[i, j], index);
      if index <> 0 then
      begin
        ShowMessage('Error');
        Exit;
      end;
    end;
  lbl1.Caption := 'ќтвет: ' + IntToStr(Answer(A, n));
end;

end.

