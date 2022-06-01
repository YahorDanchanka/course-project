object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1092#1086#1088#1084#1072
  ClientHeight = 428
  ClientWidth = 1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 23
  object StringGrid1: TStringGrid
    Left = 8
    Top = 48
    Width = 1084
    Height = 337
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goFixedRowDefAlign]
    ParentFont = False
    TabOrder = 0
    OnContextPopup = StringGrid1ContextPopup
    OnDblClick = StringGrid1DblClick
  end
  object AddFacilityButton: TButton
    Left = 8
    Top = 391
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
  object SearchEdit: TEdit
    Left = 8
    Top = 8
    Width = 1084
    Height = 31
    TabOrder = 2
    TextHint = #1055#1086#1080#1089#1082'...'
    OnChange = SearchEditChange
  end
  object MainMenu1: TMainMenu
    Left = 1056
    Top = 344
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
      object N7: TMenuItem
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
      object N8: TMenuItem
        Caption = #1060#1048#1054' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
        object CustomerFullnameSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = CustomerFullnameSortAscMenuItemClick
        end
        object CustomerFullnameSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = CustomerFullnameSortDescMenuItemClick
        end
      end
      object N9: TMenuItem
        Caption = #1044#1072#1090#1072' '#1087#1088#1086#1076#1072#1078#1080
        object SaleDateSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = SaleDateSortAscMenuItemClick
        end
        object SaleDateSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = SaleDateSortDescMenuItemClick
        end
      end
    end
    object N10: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103
      object CategoryFilterMenuItem: TMenuItem
        Caption = #1042#1080#1076' '#1086#1073#1098#1077#1082#1090#1072
        OnClick = CategoryFilterMenuItemClick
      end
      object AddressFilterMenuItem: TMenuItem
        Caption = #1040#1076#1088#1077#1089
        OnClick = AddressFilterMenuItemClick
      end
      object OwnerFullnameFilterMenuItem: TMenuItem
        Caption = #1060#1048#1054' '#1074#1083#1072#1076#1077#1083#1100#1094#1072
        OnClick = OwnerFullnameFilterMenuItemClick
      end
      object PriceFilterMenuItem: TMenuItem
        Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
        OnClick = PriceFilterMenuItemClick
      end
      object DescriptionFilterMenuItem: TMenuItem
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        OnClick = DescriptionFilterMenuItemClick
      end
      object CustomerFullnameFilterMenuItem: TMenuItem
        Caption = #1060#1048#1054' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
        OnClick = CustomerFullnameFilterMenuItemClick
      end
      object SaleDateFilterMenuItem: TMenuItem
        Caption = #1044#1072#1090#1072' '#1087#1088#1086#1076#1072#1078#1080
        OnClick = SaleDateFilterMenuItemClick
      end
    end
    object N11: TMenuItem
      Caption = #1060#1091#1085#1082#1094#1080#1080
      object DeleteFunction: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080' '#1086#1073' '#1086#1073#1098#1077#1082#1090#1072#1093' '#1082#1086#1085#1082#1088#1077#1090#1085#1086#1075#1086' '#1074#1080#1076#1072
        OnClick = DeleteFunctionClick
      end
      object IncreaseFunction: TMenuItem
        Caption = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1085#1072' 5% '#1076#1083#1103' '#1074#1089#1077#1093' '#1087#1088#1086#1076#1072#1078
        OnClick = IncreaseFunctionClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'dat'
    Filter = #1054#1073#1098#1077#1082#1090#1099'|*.dat'
    Left = 1024
    Top = 344
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'dat'
    Filter = #1054#1073#1098#1077#1082#1090#1099'|*.dat'
    Left = 992
    Top = 344
  end
end
