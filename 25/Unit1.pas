{
 Если длина введенной строки > 10 - удалить все цифры
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
    xpmnfst1: TXPManifest;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  s: string;
  i: integer;
begin
  s := edt1.Text;

  if Length(s) > 10 then
  begin
    i := 1;
    while i <= Length(s) do
    begin
      if s[i] in ['0'..'9'] then
      begin
        Delete(s, i, 1);
        Dec(i);
      end
      else
        Inc(i);
    end;
  end;
  lbl1.Caption := 'Ответ: ' + s;
end;

end.

