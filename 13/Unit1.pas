{
 Дано n вщественных.
 Вычислить разность между маскимальным и минимальным.

}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, XPMan;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    xpmnfst1: TXPManifest;
    btn1: TButton;
    strngrd1: TStringGrid;
    lbl2: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

type
  mas = array of Extended;

implementation

{$R *.dfm}

procedure SetMas(var A: mas; n: Integer);
var
  i: integer;
begin
  for i := 0 to n - 1 do
    while not TryStrToFloat(InputBox('Массив', 'Введите вещественное число:', ''), A[i]) do
      ShowMessage('Ошибка!!!');
end;

procedure SetGrid(A: mas; n: Integer; strngrd1: TStringGrid);
var
  i: integer;
begin
  strngrd1.ColCount := n;
  for i := 0 to n - 1 do
    strngrd1.Cells[i, 0] := FloatToStr(A[i]);
end;

function FindMin(A: mas; n: Integer): Extended;
var
  min: Extended;
  i: Integer;
begin
  min := A[0];
  for i := 1 to n - 1 do
    if A[i] < min then
      Result := A[i];
end;

function FindMax(A: mas; n: Integer): Extended;
var
  max: Extended;
  i: integer;
begin
  max := A[0];
  for i := 1 to n - 1 do
    if A[i] > max then
      Result := A[i];
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  n: Integer;
  A: mas;
  res: Extended;
begin
  n := StrToInt(edt1.Text);
  SetLength(A, n);
  SetMas(A, n);
  SetGrid(A, n, strngrd1);
  res := FindMax(A, n) - FindMin(A, n);
  lbl2.Caption := 'MAX - MIN = ' + FloatToStr(res);
end;

end.

