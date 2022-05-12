object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1092#1086#1088#1084#1072
  ClientHeight = 430
  ClientWidth = 920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 15
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 904
    Height = 337
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
  end
  object AddGroupButton: TButton
    Left = 8
    Top = 360
    Width = 161
    Height = 30
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = AddGroupButtonClick
  end
  object MainMenu1: TMainMenu
    Left = 888
    Top = 392
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object OpenMenuItem: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = OpenMenuItemClick
      end
      object SaveMenuItem: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = SaveMenuItemClick
      end
      object SaveAsMenuItem: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082
        OnClick = SaveAsMenuItemClick
      end
    end
    object N2: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object N3: TMenuItem
        Caption = #1053#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099
        object NumberSortAsc: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = NumberSortAscClick
        end
        object NumberSortDesc: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = NumberSortDescClick
        end
      end
      object N4: TMenuItem
        Caption = #1059#1088#1086#1074#1077#1085#1100
        object LevelSortAsc: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = LevelSortAscClick
        end
        object LevelSortDesc: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = LevelSortDescClick
        end
      end
      object N5: TMenuItem
        Caption = #1060#1048#1054' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103
        object FullnameSortAsc: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = FullnameSortAscClick
        end
        object FullnameSortDesc: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = FullnameSortDescClick
        end
      end
      object N6: TMenuItem
        Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1079#1072' '#1079#1072#1085#1103#1090#1080#1077
        object PriceSortAsc: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = PriceSortAscClick
        end
        object PriceSortDesc: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = PriceSortDescClick
        end
      end
      object N7: TMenuItem
        Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
        object DateSortAsc: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = DateSortAscClick
        end
        object DateSortDesc: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = DateSortDescClick
        end
      end
      object N9: TMenuItem
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1091#1095#1072#1097#1080#1093#1089#1103
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 848
    Top = 392
  end
end
