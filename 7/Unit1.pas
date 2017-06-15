{

 Содержимое текстового файла f, разделенного на строки, переместить
 в текстовый файл g, перенося при это в конец каждой строки все
 входящие в него цифры, с сохранением взаимного исходного порядка

 }
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    xpmnfst1: TXPManifest;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

type
  mas = array[1..100] of string;

implementation

{$R *.dfm}

procedure recordF;
var
  F, G: TextFile;
  s: string;
  numbers: string;
  i: integer;
begin
  numbers := '';
  AssignFile(F, 'F.txt');
  AssignFile(G, 'G.txt');
  Reset(F);
  Rewrite(G);
  while not Eoln(F) do
  begin
    readLn(F, s);
    for i := 1 to Length(s) do
      if s[i] in ['0'..'9'] then
        numbers := numbers + s[i]
      else
        Write(G, s[i]);
    write(G, numbers);
    numbers := '';
    Writeln(G, '');
  end;
  CloseFile(F);
  CloseFile(G);
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  recordF;
end;

end.

