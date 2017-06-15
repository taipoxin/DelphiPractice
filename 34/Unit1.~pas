{
 Если все элементы какой-либо строки = между собой, то заполнить 0-ми ее
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
    xpmnfst1: TXPManifest;
    lbl1: TLabel;
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
  mas = array of array of integer;

implementation

{$R *.dfm}

procedure Decision(var A: mas; n: integer);
var
  i, j: integer;
  T: set of Byte;
  f: Boolean;
begin
  T := [];
  for i := 0 to n - 1 do
  begin
    f := true;
    for j := 0 to n - 1 do
    begin
      if (A[i, j] <> A[i, j + 1]) and (j + 1 <= n - 1) then
      begin
        f := False;
        Break;
      end;
    end;
    if f then
      T := T + [i];
  end;

  for i := 0 to n - 1 do
    for j := 0 to n - 1 do
      if i in T then
        A[i, j] := 0;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  n: integer;
begin
  n := StrToInt(edt1.Text);
  strngrd1.ColCount := n;
  strngrd1.RowCount := n;
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  i, j, index, n: Integer;
  A: mas;
begin
  n := StrToInt(edt1.Text);
  SetLength(A, n, n);
  for i := 0 to n - 1 do
    for j := 0 to n - 1 do
    begin
      Val(strngrd1.Cells[j, i], A[i, j], index);
      if index <> 0 then
      begin
        ShowMessage('Ошибка!!!');
        Exit;
      end;
    end;
  Decision(A, n);

  for i := 0 to n - 1 do
    for j := 0 to n - 1 do
      strngrd1.Cells[j, i] := IntToStr(A[i, j]);
end;

end.

