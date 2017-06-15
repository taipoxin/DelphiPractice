unit Unit1;

{
Лабораторная работа 5. Бинарное дерево
Вариант 12. Создать программой числовое двоичное дерево. Описать рекурсивную
числовую функцию, подсчитывающую сумму элементов дерева.
В программе использовать подпрограммы.
Выполнил: Ермакович Дмитрий, группа 52493
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
    procedure Button1Click(Sender: TObject);
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

procedure calculateTree(Work: TTree; var sum: integer);
begin
  if Work<>nil then
    begin
      calculateTree(Work^.Left,sum);
      sum:=sum+Work^.Data;
      Form1.Label2.Caption:= Form1.Label2.Caption + IntToStr(Work^.Data) + ' ';
      calculateTree(Work^.Right,sum);
    end;
end;

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
    ShowMessage('Неверный размер дерева');
    Exit;
  end;
  Val(Edit2.Text, from, index);
  if (index <> 0) or (n < 1) then
  begin
    ShowMessage('Неверное значение "от"');
    Exit;
  end;
  Val(Edit3.Text, to_, index);
  if (index <> 0) or (n < 1) then
  begin
    ShowMessage('Неверное значение "до"');
    Exit;
  end;

  if (from <= to_) then
  begin
    T:=fillRandomTree(n, from, to_);
  end
  else
  begin
    ShowMessage('Неверное значение "до" меньше чем "от"');
    exit;
  end;



  T:=fillRandomTree(n, from, to_);
  sum := 0;
  str := '';
  calculateTree(T, sum);
  showTree(T, str);
  Label1.Caption:= str;
  Label2.Caption:= IntToStr(sum);

end;


{
изменен порядок вывода
вывод элементов вынесен в отдельную процедуру
}

end.      `
