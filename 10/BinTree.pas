unit BinTree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
    TItem = integer; // ��� ��������������� ����

    TTree =^ TNode;
    TNode = record
      Data: TItem;
      Left: TTree;
      Right: TTree;
    end;

  procedure makeTree(var Work: TTree; x: TItem);          // �������� ������ ����
  procedure InsertTree(Work: TTree; x: TItem);        // ���������� ������ ���� � ������
  procedure DeleteTree(var Work: TTree; x: TItem);
  procedure Preorder(Work: TTree; var str: String);   // ����� ������
  procedure Inorder(Work: TTree; var str: String);   // ����� ������
  procedure Order(Work: TTree; var str: String);   // ����� ������
  function MinTree(Work: TTree): TTree;               // ���������� ������������ ���� � ������
  function MaxTree(Work: TTree): TTree;               // ���������� ������������� ���� � ������
  procedure FindInTree(Work: TTree; x: TItem; var f: boolean; var Work1: TTree);
  procedure DepthTree(Work: TTree; sum: Cardinal; var max: Cardinal);
implementation

// ������� ���������� ������ ���� ������ ������, � ���� � ��������� ������
function EmptyTree(Work: TTree): boolean;
begin
  if Work=nil then
    Result:=true
  else
    Result:=false;
end;

// ��������� �������� ������ ����
procedure makeTree(var Work: TTree; x: TItem);
begin
  New(Work);
  Work^.Data:=x;
  Work^.Left:=nil;
  Work^.Right:=nil;
end;

// ��������� ���������� ������ ����
procedure InsertTree(Work: TTree; x: TItem);
var Work1: TTree;
begin
  // ��������, �� ������ �� ������
  if EmptyTree(Work) then
    begin
      ShowMessage('������ ������!!!');
      exit;
    end;
  while Work<>nil do  // ���������� ����� ������� ������ ����
    begin
      Work1:=Work;   // ���������� ���������� ����
      if x<Work^.Data then
        Work:=Work^.Left
      else
        Work:=Work^.Right;
    end;
  Work:=Work1;
  makeTree(Work1,x);  // ������� ����� ����
  if x<Work^.Data then  // �������� � ����� ��������� ����� �������� ����� ����
    Work^.Left:=Work1
  else
    Work^.Right:=Work1;
end;

// ��������� ������ ������
procedure preorder(Work: TTree; var str: string);
begin
  if Work<>nil then
    begin
      str:=str+IntToStr(Work^.Data)+' ';
      preorder(Work^.Left,str);
      preorder(Work^.Right,str);
    end;
end;

// ��������� ������ ������
procedure inorder(Work: TTree; var str: string);
begin
  if Work<>nil then
    begin
      inorder(Work^.Left,str);
      str:=str+IntToStr(Work^.Data)+' ';
      inorder(Work^.Right,str);
    end;
end;

// ��������� ������ ������
procedure order(Work: TTree; var str: string);
begin
  if Work<>nil then
    begin
      order(Work^.Left,str);
      order(Work^.Right,str);
      str:=str+IntToStr(Work^.Data)+' ';
    end;
end;

// ������� ���������� �������� � ������
function MinTree(Work: TTree): TTree;
begin
  // ��������, �� ������ �� ������
  if EmptyTree(Work) then
    begin
      ShowMessage('������ ������!!!');
      exit;
    end;
  while Work^.Left<>nil do
    Work:=Work^.Left;
  Result:=Work;
end;

// ������� ���������� ��������� � ������
function MaxTree(Work: TTree): TTree;
begin
  // ��������, �� ������ �� ������
  if EmptyTree(Work) then
    begin
      ShowMessage('������ ������!!!');
      exit;
    end;
  while Work^.Right<>nil do
    Work:=Work^.Right;
  Result:=Work;
end;

procedure FindInTree(Work: TTree; x: TItem; var f: boolean; var Work1: TTree);
begin
  // ��������, �� ������ �� ������
  if EmptyTree(Work) then
    begin
      ShowMessage('������ ������!!!');
      exit;
    end;
  f:=false;   // ������������, ��� �������� �������� ��� � ������
  while Work<>nil do
    begin
      if Work^.Data=x then
        begin
          Work1:=Work;   // ���������� ������ �� ��������� �������
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

// ������� ���������� ������� ������
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

// ��������� �������� ���� �� ������
procedure DeleteTree(var Work: TTree; x: TItem);
var Work1: TTree;
begin
  if Work=nil then
    ShowMessage('���������� �������� � ������ ���')
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
