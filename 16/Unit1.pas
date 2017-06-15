{
 Дано число n.
 Вывести сумму цифр
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    btn1: TButton;
    xpmnfst1: TXPManifest;
    lbl2: TLabel;
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

procedure Sum(number: Integer; var Otvet: integer);
begin
  if number > 10 then
  begin
    Otvet := Otvet + number mod 10;
    number := number div 10;
    Sum(number, Otvet);
  end
  else
    Otvet := Otvet + number;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  number: integer;
  otvet: integer;
begin
  number := StrToInt(edt1.Text);
  Sum(number, otvet);
  lbl2.Caption := 'Сумма =' + IntToStr(otvet);
end;

end.

