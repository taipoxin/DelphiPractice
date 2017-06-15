{
 Дано натуральное число n.
 Переставить местами первую и последнюю цифры
 числа n.
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    xpmnfst1: TXPManifest;
    btn1: TButton;
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

uses
  Math;

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  first, last, ser, index, n, d: Integer;
begin
  Val(edt1.Text, n, index);
  d := 1;
  while n div (d * 10) > 0 do
    d := d * 10;
  n := n mod 10 * d + n mod d div 10 * 10 + n div d;
  lbl2.Caption := 'Ответ: ' + IntToStr(n);
end;

end.

