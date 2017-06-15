{

 В одномерном массив, состоящем из n целых элементов,
 вычислить сумму элементов массива, расположенных между
 первым и последним полож. элементов.

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
    A[i] := RandomRange(-3, 3);
    strngrd1.Cells[i, 0] := IntToStr(A[i]);
  end;
end;

procedure FindIndex(A: mas; n: integer; var index1, index2: integer);
var
  i: Integer;
  flag: Boolean;
begin
  flag := false;
  for i := 0 to n - 1 do
    if (A[i] > 0) and (flag = False) then
    begin
      index1 := i;
      flag := True;
    end
    else if A[i] > 0 then
      index2 := i;
end;

function FindSum(index1, index2: Integer; A: mas): Integer;
var
  i: integer;
begin
  Result := 0;
  for i := index1 + 1 to index2 - 1 do
    Result := Result + A[i];
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  n, index1, index2: integer;
  A: mas;
begin
  index1 := 0;
  index2 := 0;
  n := StrToInt(Edt1.Text);

  SetMasAnsGrid(A, n, strngrd1);

  FindIndex(A, n, index1, index2);

  lbl2.Caption := 'Сумма между первым и последним отр. элем. = ' + IntToStr(FindSum(index1, index2, A))
end;

end.

