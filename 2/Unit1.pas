{������ 2.
�������� ���������� ��������� n-�� �������������� ����������}
//������� �������������� ���������� bn = b1 * q^(n-1)
//��������� b1 � q ��������

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    EditNum: TEdit;
    LabelResult: TLabel;
    BTCountNum: TButton;
    EditB1: TEdit;
    EditQ: TEdit;
    procedure BTCountNumClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  b,q:Integer;
  n:Cardinal;

implementation

{$R *.dfm}

//��������
function RecGeomProg(b1,q:Integer; n:Cardinal):Integer;
begin
  Dec(n);
  if n <> 0 then
    Result:= q * RecGeomProg(b1,q,n)
  else
    Result := b1;
end;  


procedure TForm1.BTCountNumClick(Sender: TObject);
begin
  try
    b:=StrToInt(EditB1.Text);
    q:=StrToInt(EditQ.Text);
    n:=StrToInt(EditNum.Text);
  except
    ShowMessage('�� ����� ������� ������.');
  end;

  LabelResult.Caption:= IntToStr(RecGeomProg(b,q,n));
end;

end.
