{
 Если длина строки кратна 3, то удалить все цифры делящиеся на 3
}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    btn1: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    xpmnfst1: TXPManifest;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  s: string;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  s := edt1.Text;
  lbl1.Caption := s;
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  i: integer;
  T: set of Char;
begin
  T := ['0'..'9'];
  i := 0;
  if Length(s) mod 3 = 0 then
  begin
    while i <> Length(s) do
    begin
      Inc(i);
      if (s[i] in T) and (StrToInt(s[i]) mod 3 = 0) then
      begin
        Delete(S, i, 1);
        Dec(i);
      end;
    end;
  end;
  lbl2.Caption := s;
end;

end.

