unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  s, spr: string;
  pr: integer;
  i: Integer;
begin
  pr := 0;
  s := Edit1.Text;
  for i := 1 to Length(s) do
  begin
    if s[i] = '(' then
      Inc(pr);
    if s[i] = ')' then
    begin
      Dec(pr);
      if pr < 0 then
      begin
        Label1.Caption := 'Ответ: Скобки поставлены неправильно!';
        Exit;
      end;
    end;
  end;
  if pr <> 0 then
  begin
    Label1.Caption := 'Ответ: Скобки поставлены неправильно!';
    Exit;
  end
  else
    Label1.Caption := 'Ответ: Скобки поставлены правильно!';
end;

end.

