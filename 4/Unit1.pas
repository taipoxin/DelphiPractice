{������ 4.
�������� ����������� ��������� ���������� ����� ������ �������������� ����������, ������� �
i-�� �� k-��� �������
}
//������� ����� n ������ ������ �������������� ���������
//������ ���� + ������ ���� + ....
//����� � ����� c i �� � ����
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit_I: TEdit;
    BTCount: TButton;
    LabelRes: TLabel;
    EditQ: TEdit;
    EditB: TEdit;
    LabelB: TLabel;
    LabelQ: TLabel;
    Edit_K: TEdit;
    Label_I: TLabel;
    Label_K: TLabel;
    procedure BTCountClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//��������
function RecSumGeomProg(b1,q:Integer; i,k:Cardinal):Integer;
begin
  Dec(k);
  if k > i then
    Result:= q * RecSumGeomProg(b1,q,i,k)
  else
    if k <> 0 then
      Result:= b1 + RecSumGeomProg(b1*q,q,i,k)
    else
      Result := b1;
end;


procedure TForm1.BTCountClick(Sender: TObject);
var b,q:Integer; i,k:Cardinal;
begin

    b:=StrToInt(EditB.Text);
    q:=StrToInt(EditQ.Text);
    i:=StrToInt(Edit_I.Text);
    k:=StrToInt(Edit_K.Text);


  if (i > 0) and (k > 0) then
    LabelRes.Caption:= IntToStr(RecSumGeomProg(b,q,k - i,k))
  else
    ShowMessage('I,K ������ ���� ����� 1');

end;

end.
