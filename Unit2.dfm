object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1092#1086#1088#1084#1072
  ClientHeight = 387
  ClientWidth = 1100
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
    Width = 1084
    Height = 337
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goFixedRowDefAlign]
    TabOrder = 0
    OnContextPopup = StringGrid1ContextPopup
    OnDblClick = StringGrid1DblClick
  end
  object AddFacilityButton: TButton
    Left = 8
    Top = 351
    Width = 1084
    Height = 30
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1098#1077#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = AddFacilityButtonClick
  end
  object MainMenu1: TMainMenu
    Left = 1056
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
        Caption = #1042#1080#1076' '#1086#1073#1098#1077#1082#1090#1072
        object CategorySortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = CategorySortAscMenuItemClick
        end
        object CategorySortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = CategorySortDescMenuItemClick
        end
      end
      object N4: TMenuItem
        Caption = #1040#1076#1088#1077#1089
        object AddressSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = AddressSortAscMenuItemClick
        end
        object AddressSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = AddressSortDescMenuItemClick
        end
      end
      object N5: TMenuItem
        Caption = #1060#1048#1054' '#1074#1083#1072#1076#1077#1083#1100#1094#1072
        object OwnerFullnameSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = OwnerFullnameSortAscMenuItemClick
        end
        object OwnerFullnameSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = OwnerFullnameSortDescMenuItemClick
        end
      end
      object N6: TMenuItem
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
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'dat'
    Filter = #1054#1073#1098#1077#1082#1090#1099'|*.dat'
    Left = 1024
    Top = 304
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'dat'
    Filter = #1054#1073#1098#1077#1082#1090#1099'|*.dat'
    Left = 992
    Top = 304
  end
end
