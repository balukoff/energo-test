object Form2: TForm2
  Left = 421
  Top = 295
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1076#1072#1078#1080
  ClientHeight = 311
  ClientWidth = 672
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrd1: TDBGrid
    Left = 8
    Top = 8
    Width = 657
    Height = 265
    BorderStyle = bsNone
    DataSource = ds1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'manager'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1086#1076#1072#1074#1077#1094
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Product'
        Title.Alignment = taCenter
        Title.Caption = #1058#1086#1074#1072#1088
        Width = 219
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SaleDate'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1076#1072#1078#1080
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SaleId'
        Visible = False
      end>
  end
  object btn1: TBitBtn
    Left = 360
    Top = 280
    Width = 97
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TBitBtn
    Left = 464
    Top = 280
    Width = 97
    Height = 25
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 2
  end
  object btn3: TBitBtn
    Left = 568
    Top = 280
    Width = 97
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 3
    OnClick = btn3Click
  end
  object btn4: TBitBtn
    Left = 8
    Top = 280
    Width = 113
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 4
    Visible = False
  end
  object ADOQuery1: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from GetSales()')
    Left = 40
    Top = 48
  end
  object ds1: TDataSource
    DataSet = ADOQuery1
    Left = 192
    Top = 240
  end
  object ADOQuery2: TADOQuery
    Parameters = <>
    Left = 112
    Top = 168
  end
end
