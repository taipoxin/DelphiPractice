{
 ����� ����� ������������� ����� ��� ������� ����������
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

function Decision(var A: mas; n: integer): Integer;
var
  i, j: integer;
begin
  Result := 0;
  for i := 0 to n - 1 do
    for j := 0 to n - 1 do
    begin
      if (i < j) and (A[i, j] > 0) then
        Result := Result + A[i, j];
    end;
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
  i, j, index, n, sum: Integer;
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
        ShowMessage('������!!!');
        Exit;
      end;
    end;
  sum := Decision(A, n);
  lbl1.Caption := '�����: ' + IntToStr(sum);
end;

end.

