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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 48
    Height = 23
    Caption = #1055#1086#1080#1089#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 40
    Width = 904
    Height = 337
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
    OnContextPopup = StringGrid1ContextPopup
  end
  object AddSaleButton: TButton
    Left = 8
    Top = 392
    Width = 161
    Height = 30
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1082#1094#1080#1102
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = AddSaleButtonClick
  end
  object SearchEdit: TEdit
    Left = 62
    Top = 3
    Width = 850
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = SearchEditChange
  end
  object MainMenu1: TMainMenu
    Left = 880
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
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1088#1077#1089#1090#1086#1088#1072#1085#1072
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
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1085#1072#1073#1086#1088#1072
        object FoodSetSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = FoodSetSortAscMenuItemClick
        end
        object FoodSetSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = FoodSetSortDescMenuItemClick
        end
      end
      object N5: TMenuItem
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
      object N6: TMenuItem
        Caption = #1055#1088#1086#1094#1077#1085#1090' '#1089#1082#1080#1076#1082#1080
        object PercentSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = PercentSortAscMenuItemClick
        end
        object PercentSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = PercentSortDescMenuItemClick
        end
      end
      object N7: TMenuItem
        Caption = #1057#1088#1086#1082' '#1085#1072#1095#1072#1083#1072
        object StartDateSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = StartDateSortAscMenuItemClick
        end
        object StartDateSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = StartDateSortDescMenuItemClick
        end
      end
      object N8: TMenuItem
        Caption = #1057#1088#1086#1082' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
        object EndDateSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = EndDateSortAscMenuItemClick
        end
        object EndDateSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = EndDateSortDescMenuItemClick
        end
      end
      object N9: TMenuItem
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        object DescriptionSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = DescriptionSortAscMenuItemClick
        end
        object DescriptionSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = DescriptionSortDescMenuItemClick
        end
      end
    end
    object N11: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103
      object TitleFilterMenuItem: TMenuItem
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1088#1077#1089#1090#1086#1088#1072#1085#1072
        OnClick = TitleFilterMenuItemClick
      end
    end
    object N10: TMenuItem
      Caption = #1060#1091#1085#1082#1094#1080#1080
      object DeleteOldSalesMenuItem: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1072#1082#1094#1080#1080' '#1089' '#1080#1089#1090#1077#1082#1096#1080#1084' '#1089#1088#1086#1082#1086#1084
        OnClick = DeleteOldSalesMenuItemClick
      end
      object IncreasePercentMenuItem: TMenuItem
        Caption = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1087#1088#1086#1094#1077#1085#1090' '#1089#1082#1080#1076#1082#1080' '#1085#1072' 3%'
        OnClick = IncreasePercentMenuItemClick
      end
      object DumpSalesByPercentMenuItem: TMenuItem
        Caption = #1042#1099#1074#1077#1089#1090#1080' '#1072#1082#1094#1080#1080' '#1091' '#1082#1086#1090#1086#1088#1099#1093' '#1089#1082#1080#1076#1082#1072' '#1086#1090' 20% '#1076#1086' 40%'
        OnClick = DumpSalesByPercentMenuItemClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 848
    Top = 392
  end
end
