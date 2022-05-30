object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1092#1086#1088#1084#1072
  ClientHeight = 388
  ClientWidth = 1000
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
    Width = 984
    Height = 337
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goFixedRowDefAlign]
    TabOrder = 0
    OnContextPopup = StringGrid1ContextPopup
  end
  object AddPerfomanceButton: TButton
    Left = 8
    Top = 351
    Width = 984
    Height = 30
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1087#1077#1082#1090#1072#1082#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = AddPerfomanceButtonClick
  end
  object MainMenu1: TMainMenu
    Left = 928
    Top = 304
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
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1087#1077#1082#1090#1072#1082#1083#1103
        object TitleSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = TitleSortAscMenuItemClick
        end
        object TitleSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = TitleSortDescMenuItemClick
        end
      end
      object N4: TMenuItem
        Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
        object DurationSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = DurationSortAscMenuItemClick
        end
        object DurationSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = DurationSortDescMenuItemClick
        end
      end
      object N5: TMenuItem
        Caption = #1042#1086#1079#1088#1072#1089#1090#1085#1086#1077' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077
        object AgeLimitSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = AgeLimitSortAscMenuItemClick
        end
        object AgeLimitSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = AgeLimitSortDescMenuItemClick
        end
      end
      object N6: TMenuItem
        Caption = #1046#1072#1085#1088
        object CategorySortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = CategorySortAscMenuItemClick
        end
        object CategorySortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = CategorySortDescMenuItemClick
        end
      end
      object N7: TMenuItem
        Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
        object PriceSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = PriceSortAscMenuItemClick
        end
        object PriceSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = PriceSortDescMenuItemClick
        end
      end
      object N8: TMenuItem
        Caption = #1044#1072#1090#1072' '#1087#1088#1077#1084#1100#1077#1088#1099
        object PremiereDateSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = PremiereDateSortAscMenuItemClick
        end
        object PremiereDateSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = PremiereDateSortDescMenuItemClick
        end
      end
      object N9: TMenuItem
        Caption = #1044#1085#1080' '#1087#1086#1082#1072#1079#1072
        object DaysSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = DaysSortAscMenuItemClick
        end
        object DaysSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = DaysSortDescMenuItemClick
        end
      end
    end
    object N10: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103
      object TitleFilterMenuItem: TMenuItem
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1087#1077#1082#1090#1072#1082#1083#1103
        OnClick = TitleFilterMenuItemClick
      end
      object DurationFilterMenuItem: TMenuItem
        Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
        OnClick = DurationFilterMenuItemClick
      end
      object AgeLimitFilterMenuItem: TMenuItem
        Caption = #1042#1086#1079#1088#1072#1089#1090#1085#1086#1077' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077
        OnClick = AgeLimitFilterMenuItemClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'dat'
    Filter = #1057#1087#1077#1082#1090#1072#1082#1083#1080'|*.dat'
    Left = 960
    Top = 304
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'dat'
    Filter = #1057#1087#1077#1082#1090#1072#1082#1083#1080'|*.dat'
    Left = 896
    Top = 304
  end
end
