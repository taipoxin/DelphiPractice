object Form1: TForm1
  Left = 234
  Top = 156
  Width = 352
  Height = 302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 32
    Top = 8
    Width = 68
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100
  end
  object lbl2: TLabel
    Left = 40
    Top = 184
    Width = 61
    Height = 13
    Caption = 'MAX - MIN ='
  end
  object edt1: TEdit
    Left = 32
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btn1: TButton
    Left = 32
    Top = 136
    Width = 113
    Height = 25
    Caption = #1047#1072#1076#1072#1090#1100' '#1080' '#1085#1072#1081#1090#1080
    TabOrder = 1
    OnClick = btn1Click
  end
  object strngrd1: TStringGrid
    Left = 32
    Top = 64
    Width = 289
    Height = 57
    DefaultColWidth = 50
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 2
  end
  object xpmnfst1: TXPManifest
    Left = 528
    Top = 32
  end
end
