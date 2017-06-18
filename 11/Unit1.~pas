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
  Dialogs, StdCtrls, BinTree, Math;

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
  showTree(T, str);
  Label1.Caption:= str;
  Form1.Label2.Caption := '';

end;


function isHaveSimilar(current: TTree; parent: TTree): boolean;
begin
  Result:= False;
  if current<>nil then
    begin
      if (parent <> nil) then
      begin
        // проверка на дублирование
        if (current.Data = parent.Data) then
        begin
          Result := True;
          exit;
        end;
      end;
      Result := isHaveSimilar(current.Left, current);
      if (Result = False) then
        Result:= isHaveSimilar(current.Right, current);
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if (T = nil) then
begin
  ShowMessage('Дерево пустое');
  Exit;
end;
if (isHaveSimilar(T, nil)) then
begin
  Form1.Label2.Caption := 'В дереве есть одинаковые элементы';
end
else
  Form1.Label2.Caption := 'В дереве нет одинаковых элементов';
end;

end.      `
