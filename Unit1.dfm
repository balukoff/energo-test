object Form1: TForm1
  Left = 306
  Top = 210
  BorderStyle = bsSingle
  Caption = #1058#1077#1089#1090#1086#1074#1086#1077' '#1079#1072#1076#1072#1085#1080#1077' '
  ClientHeight = 467
  ClientWidth = 937
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mm1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mm1: TMainMenu
    Left = 184
    Top = 96
    object N1: TMenuItem
      Caption = #1055#1088#1086#1076#1072#1078#1080
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N4: TMenuItem
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1058#1086#1074#1072#1088#1099
        OnClick = N5Click
      end
    end
    object N3: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = N3Click
    end
  end
end
