object Form7: TForm7
  Left = 391
  Top = 300
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1090#1086#1074#1072#1088#1086#1084
  ClientHeight = 105
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 16
    Width = 112
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
  end
  object lbl2: TLabel
    Left = 8
    Top = 48
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object edt1: TEdit
    Left = 128
    Top = 13
    Width = 353
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 128
    Top = 40
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object btn1: TBitBtn
    Left = 336
    Top = 72
    Width = 147
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btn1Click
  end
  object ADOQuery2: TADOQuery
    Parameters = <>
    Left = 208
    Top = 64
  end
end
