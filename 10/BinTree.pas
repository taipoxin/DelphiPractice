unit BinTree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
    TItem = integer; // тип информационного поля

    TTree =^ TNode;
    TNode = record
      Data: TItem;
      Left: TTree;
      Right: TTree;
    end;

  procedure makeTree(var Work: TTree; x: TItem);          // создание нового узла
  procedure InsertTree(Work: TTree; x: TItem);        // добовление нового узла в дерево
  procedure DeleteTree(var Work: TTree; x: TItem);
  procedure Preorder(Work: TTree; var str: String);   // обход дерева
  procedure Inorder(Work: TTree; var str: String);   // обход дерева
  procedure Order(Work: TTree; var str: String);   // обход дерева
  function MinTree(Work: TTree): TTree;               // нахождение минимального узла в дереве
  function MaxTree(Work: TTree): TTree;               // нахождение максимального узла в дереве
  procedure FindInTree(Work: TTree; x: TItem; var f: boolean; var Work1: TTree);
  procedure DepthTree(Work: TTree; sum: Cardinal; var max: Cardinal);
implementation

// функция возвращает ИСТИНУ если дерево пустое, и ЛОЖЬ в противном случае
function EmptyTree(Work: TTree): boolean;
begin
  if Work=nil then
    Result:=true
  else
    Result:=false;
end;

// процедура создания нового узла
procedure makeTree(var Work: TTree; x: TItem);
begin
  New(Work);
  Work^.Data:=x;
  Work^.Left:=nil;
  Work^.Right:=nil;
end;

// процедура добовления нового узла
procedure InsertTree(Work: TTree; x: TItem);
var Work1: TTree;
begin
  // проверка, не пустое ли дерево
  if EmptyTree(Work) then
    begin
      ShowMessage('Дерево пустое!!!');
      exit;
    end;
  while Work<>nil do  // нахождение место вставки нового узла
    begin
      Work1:=Work;   // запаминаем предыдущий узел
      if x<Work^.Data then
        Work:=Work^.Left
      else
        Work:=Work^.Right;
    end;
  Work:=Work1;
  makeTree(Work1,x);  // создаем новый узел
  if x<Work^.Data then  // проверко в какое поддерево нужно вставить новый узел
    Work^.Left:=Work1
  else
    Work^.Right:=Work1;
end;

// процедура обхода дерева
procedure preorder(Work: TTree; var str: string);
begin
  if Work<>nil then
    begin
      str:=str+IntToStr(Work^.Data)+' ';
      preorder(Work^.Left,str);
      preorder(Work^.Right,str);
    end;
end;

// процедура обхода дерева
procedure inorder(Work: TTree; var str: string);
begin
  if Work<>nil then
    begin
      inorder(Work^.Left,str);
      str:=str+IntToStr(Work^.Data)+' ';
      inorder(Work^.Right,str);
    end;
end;

// процедура обхода дерева
procedure order(Work: TTree; var str: string);
begin
  if Work<>nil then
    begin
      order(Work^.Left,str);
      order(Work^.Right,str);
      str:=str+IntToStr(Work^.Data)+' ';
    end;
end;

// функция нахождения минимума в дереве
function MinTree(Work: TTree): TTree;
begin
  // проверка, не пустое ли дерево
  if EmptyTree(Work) then
    begin
      ShowMessage('Дерево пустое!!!');
      exit;
    end;
  while Work^.Left<>nil do
    Work:=Work^.Left;
  Result:=Work;
end;

// функция нахождения максимума в дереве
function MaxTree(Work: TTree): TTree;
begin
  // проверка, не пустое ли дерево
  if EmptyTree(Work) then
    begin
      ShowMessage('Дерево пустое!!!');
      exit;
    end;
  while Work^.Right<>nil do
    Work:=Work^.Right;
  Result:=Work;
end;

procedure FindInTree(Work: TTree; x: TItem; var f: boolean; var Work1: TTree);
begin
  // проверка, не пустое ли дерево
  if EmptyTree(Work) then
    begin
      ShowMessage('Дерево пустое!!!');
      exit;
    end;
  f:=false;   // предполагаем, что искомого элемента нет в дереве
  while Work<>nil do
    begin
      if Work^.Data=x then
        begin
          Work1:=Work;   // возвращаем ссылку на найденный элемент
          f:=true;
          break;
        end
      else
        begin
          if x<Work^.Data then
            Work:=Work^.Left
          else
            Work:=Work^.Right;
        end;
    end;
end;

// функция нахождения глубины дерева
procedure DepthTree(Work: TTree; sum: Cardinal; var max: Cardinal);
begin
  if Work<>nil then
    begin
      inc(sum);
      DepthTree(Work^.Left,sum,max);
      DepthTree(Work^.Right,sum,max);
    end
  else
    if sum>max then
      max:=sum;
end;

// процедура удаления узла из дерева
procedure DeleteTree(var Work: TTree; x: TItem);
var Work1: TTree;
begin
  if Work=nil then
    ShowMessage('Удоляемого элемента в дереве нет')
  else
    begin
      if x<Work^.Data then
        DeleteTree(Work^.Left,x)
      else
        if x>Work^.Data then
          DeleteTree(Work^.Right,x)
        else
          if Work^.Left=nil then
            begin
              Work1:=Work;
              Work:=Work1^.Right;
              Dispose(Work1);
            end
          else
            if Work^.Right=nil then
              begin
                Work1:=Work;
                Work:=Work^.Left;
                Dispose(Work1);
              end
            else
              begin
                Work1:=MinTree(Work^.Right);
                Work^.Data:=Work1^.Data;
                DeleteTree(Work^.Right,Work^.Data);
              end;
    end;
end;


end.
