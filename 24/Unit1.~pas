{

 В одномерном массив, состоящем из n целых элементов,
 вычислить сумму элементов массива, расположенных до
 минимального элемента

}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    strngrd1: TStringGrid;
    btn1: TButton;
    xpmnfst1: TXPManifest;
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
  mas = array of integer;

implementation

uses
  Math;

{$R *.dfm}

procedure SetMasAnsGrid(var A: mas; n: Integer; strngrd1: TStringGrid);
var
  i: integer;
begin
  SetLength(A, n);
  strngrd1.ColCount := n;
  Randomize;
  for i := 0 to n - 1 do
  begin
    A[i] := RandomRange(-10, 10);
    strngrd1.Cells[i, 0] := IntToStr(A[i]);
  end;
end;

procedure FindIndex(A: mas; n: integer; var index1: integer);
var
  i, min: Integer;
  flag: Boolean;
begin
  min := A[0];
  for i := 1 to n - 1 do
    if A[i] < min then
    begin
      min := A[i];
      index1 := i;
    end;
end;

function FindSum(index1: Integer; A: mas): Integer;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to index1 - 1 do
    Result := Result + A[i];
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  n, index1: integer;
  A: mas;
begin
  index1 := 0;
  n := StrToInt(Edt1.Text);

  SetMasAnsGrid(A, n, strngrd1);

  FindIndex(A, n, index1);

  lbl2.Caption := 'Произведение элементов между ними = ' + IntToStr(FindSum(index1, A))
end;

end.

