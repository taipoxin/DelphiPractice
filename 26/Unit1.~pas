{
 ≈сли длина строки = 10, то удалить все буквы
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
  T := ['A'..'Z', 'a'..'z'];
  if Length(s) = 10 then
  begin
    i := 1;
    while i <> Length(s) do
    begin
      if s[i] in T then
      begin
        Delete(S, i, 1);
        Dec(i);
      end;
      Inc(i);
    end;
  end;
  lbl2.Caption := s;
end;

end.

