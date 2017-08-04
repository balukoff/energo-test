object Form3: TForm3
  Left = 408
  Top = 273
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
  ClientHeight = 313
  ClientWidth = 626
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrd1: TDBGrid
    Left = 8
    Top = 8
    Width = 609
    Height = 265
    Ctl3D = False
    DataSource = ds1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Name'
        Title.Alignment = taCenter
        Title.Caption = #1060#1048#1054
        Width = 592
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'managerID'
        Visible = False
      end>
  end
  object btn1: TBitBtn
    Left = 296
    Top = 280
    Width = 107
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TBitBtn
    Left = 408
    Top = 280
    Width = 97
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TBitBtn
    Left = 512
    Top = 280
    Width = 105
    Height = 25
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 3
    OnClick = btn3Click
  end
  object btn4: TBitBtn
    Left = 8
    Top = 280
    Width = 121
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 4
    Visible = False
    OnClick = btn4Click
  end
  object ds1: TDataSource
    DataSet = ADOQuery1
    Left = 96
    Top = 96
  end
  object ADOQuery1: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 208
    Top = 96
  end
  object ADOQuery2: TADOQuery
    Parameters = <>
    Left = 176
    Top = 192
  end
end
