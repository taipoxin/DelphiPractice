{

 В одномерном массив, состоящем из n целых элементов,
 вычислить произведение элементов массива, расположенных между
 максимальнным и минимальным элементами.

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
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    xpmnfst1: TXPManifest;
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
    A[i] := Random(50);
    strngrd1.Cells[i, 0] := IntToStr(A[i]);
  end;
end;

procedure FindMinAndMax(var min, max: Integer; A: mas; n: integer);
var
  i: Integer;
begin
  max := A[0];
  min := A[0];
  for i := 1 to n - 1 do
    if A[i] < min then
      min := A[i]
    else if A[i] > max then
      max := A[i];
end;

function FindMUL(min, max: integer; A: mas; n: Integer): Integer;
var
  flag: Boolean;
  h, i: Integer;
begin
  h := 1000;
  Result := 1;
  flag := False;
  for i := 0 to n - 1 do
  begin
    if (A[i] = min) or (A[i] = max) then
    begin
      if h < i then
        flag := False
      else
      begin
        flag := True;
        h := i;
      end;
    end;

    if (flag) and (A[i] <> min) and (A[i] <> max) then
      Result := Result * A[i];

  end;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  n, min, max: integer;
  A: mas;
begin
  n := StrToInt(Edt1.Text);

  SetMasAnsGrid(A, n, strngrd1);

  FindMinAndMax(min, max, A, n);

  lbl2.Caption := 'MIN = ' + IntToStr(min);
  lbl3.Caption := 'MAX = ' + IntToStr(max);
  lbl4.Caption := 'Произведение элементов между ними = ' + IntToStr(FindMUL(min, max, A, n))
end;

end.

