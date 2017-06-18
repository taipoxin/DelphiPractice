unit Unit1;

{
������������ ������ 5. �������� ������
������� 12. ������� ���������� �������� �������� ������. ������� �����������
�������� �������, �������������� ����� ��������� ������.
� ��������� ������������ ������������.
��������: ��������� �������, ������ 52493
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, BinTree;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  T: TTree;

implementation

{$R *.dfm}

procedure showTree(Work: TTree; var str: string);
begin
  if Work<>nil then
    begin
      showTree(Work^.Left,str);
      str := str + IntToStr(Work^.Data) + ' ';
      showTree(Work^.Right,str);
    end;
end;

function fillRandomTree(count:cardinal; from, to_ : integer):TTree;
var i: Cardinal;
    tr: TTree;
begin
  Randomize;
  tr := nil;
  if (count > 0) then
  begin
    makeTree(tr, Random(to_-from+1) + from);
    for i:=2 to count do
    begin
      InsertTree(tr, Random(to_-from+1) + from);
    end;
  end;
  Result:=tr;


end;

procedure TForm1.Button1Click(Sender: TObject);
var n : cardinal;
    index, sum : integer;
    from, to_ : Integer;
    str:string;
begin

  Val(Edit1.Text, n, index);
  if (index <> 0) or (n < 1) then
  begin
    ShowMessage('�������� ������ ������');
    Exit;
  end;
  Val(Edit2.Text, from, index);
  if (index <> 0) or (n < 1) then
  begin
    ShowMessage('�������� �������� "��"');
    Exit;
  end;
  Val(Edit3.Text, to_, index);
  if (index <> 0) or (n < 1) then
  begin
    ShowMessage('�������� �������� "��"');
    Exit;
  end;

  if (from <= to_) then
  begin
    T:=fillRandomTree(n, from, to_);
  end
  else
  begin
    ShowMessage('�������� �������� "��" ������ ��� "��"');
    exit;
  end;



  T:=fillRandomTree(n, from, to_);
  sum := 0;
  str := '';
  showTree(T, str);
  Label1.Caption:= str;
  Form1.Label2.Caption := '';

end;


procedure FindMaxEl(Work: TTree);
begin
  while Work<>nil do
    begin
      // ���������
      Form1.Label2.Caption:= '������������ ������� ������: ' +IntToStr(Work^.Data) + ' ';
      Work := Work^.Right;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
FindMaxEl(T);
if (Form1.Label2.Caption = '') then
  Form1.Label2.Caption := '������ ������.';
end;

end.      `
