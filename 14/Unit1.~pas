{
 Дано n целых.
 Определить со скольки отриц. чисел она начинается

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
  mas = array of Integer;

implementation

{$R *.dfm}

procedure SetMas(var A: mas; n: Cardinal);
var
  i: integer;
begin
  for i := 0 to n - 1 do
    while not TryStrToInt(InputBox('Массив', 'Введите целое число:', ''), A[i]) do
      ShowMessage('Ошибка!!!');
end;

procedure SetGrid(A: mas; n: Cardinal; strngrd1: TStringGrid);
var
  i: integer;
begin
  strngrd1.ColCount := n;
  for i := 0 to n - 1 do
    strngrd1.Cells[i, 0] := IntToStr(A[i]);
end;


function countFirstNegativeNums(A : mas; n : cardinal):Cardinal;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to n - 1 do
  begin
    if A[i] >= 0 then
      Break;
    Inc(Result);
  end;  
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  A: mas;
  n : Cardinal;
begin
  n := StrToInt(edt1.Text);
  SetLength(A, n);
  SetMas(A, n);
  SetGrid(A, n, strngrd1);
  lbl2.Caption := IntToStr(countFirstNegativeNums(A, n));
end;

end.

