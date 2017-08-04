object Form5: TForm5
  Left = 567
  Top = 234
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1079#1072#1082#1072#1079#1086#1084
  ClientHeight = 122
  ClientWidth = 441
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
    Left = 24
    Top = 24
    Width = 30
    Height = 13
    Caption = #1058#1086#1074#1072#1088
  end
  object lbl2: TLabel
    Left = 24
    Top = 56
    Width = 56
    Height = 13
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
  end
  object btn1: TSpeedButton
    Left = 408
    Top = 22
    Width = 23
    Height = 22
    Caption = '+'
    OnClick = btn1Click
  end
  object btn2: TSpeedButton
    Left = 408
    Top = 54
    Width = 23
    Height = 22
    Caption = '+'
    OnClick = btn2Click
  end
  object lbl3: TLabel
    Left = 24
    Top = 96
    Width = 69
    Height = 13
    Caption = #1062#1077#1085#1072' '#1090#1086#1074#1072#1088#1072':'
  end
  object edt1: TEdit
    Left = 86
    Top = 23
    Width = 315
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 86
    Top = 54
    Width = 315
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object btn3: TBitBtn
    Left = 320
    Top = 88
    Width = 111
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btn3Click
  end
  object ADOQuery2: TADOQuery
    Parameters = <>
    Left = 136
    Top = 80
  end
end
