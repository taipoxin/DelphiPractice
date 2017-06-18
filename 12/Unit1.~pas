{
 подсчитать k - кол-во цифр в десятичной записи целого неотрицательного числа n
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



procedure count(number : Cardinal; var Otvet : Cardinal);
begin
  otvet := 0;
  if number = 0 then
    Inc(Otvet);
  while number > 0 do
  begin
    Inc(Otvet);
    number := number div 10;
  end;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  number: cardinal;
  otvet: cardinal;
  index : integer;
begin

  Val(edt1.Text, number, index);
  if (index <> 0) then
  begin
    ShowMessage('Число должно быть неотрицательным целым');
    Exit;
  end;
  count(number, otvet);
  lbl2.Caption := 'Сумма =' + IntToStr(otvet);
end;

end.

