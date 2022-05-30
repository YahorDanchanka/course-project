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
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 0
  end
  object AddGroupButton: TButton
    Left = 8
    Top = 351
    Width = 185
    Height = 30
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1073#1086#1085#1077#1084#1077#1085#1090
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
        Caption = #1060#1048#1054
        object FullnameSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = FullnameSortAscMenuItemClick
        end
        object FullnameSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = FullnameSortDescMenuItemClick
        end
      end
      object N4: TMenuItem
        Caption = #1055#1072#1089#1087#1086#1088#1090
        object PassportSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = PassportSortAscMenuItemClick
        end
        object PassportSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = PassportSortDescMenuItemClick
        end
      end
      object N5: TMenuItem
        Caption = #1050#1086#1083'-'#1074#1086' '#1087#1086#1089#1077#1097#1077#1085#1080#1081
        object VisitsCountSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = VisitsCountSortAscMenuItemClick
        end
        object VisitsCountSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = VisitsCountSortDescMenuItemClick
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
        Caption = #1058#1080#1087' '#1072#1073#1086#1085#1077#1084#1077#1085#1090#1072
        object TicketTypeSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = TicketTypeSortAscMenuItemClick
        end
        object TicketTypeSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = TicketTypeSortDescMenuItemClick
        end
      end
      object N8: TMenuItem
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
        object StartedDateSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = StartedDateSortAscMenuItemClick
        end
        object StartedDateSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = StartedDateSortDescMenuItemClick
        end
      end
      object N9: TMenuItem
        Caption = #1057#1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103
        object ExpiresSortAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = ExpiresSortAscMenuItemClick
        end
        object ExpiresSortDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = ExpiresSortDescMenuItemClick
        end
      end
    end
    object N10: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088#1099
      object N11: TMenuItem
        Caption = #1060#1048#1054
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #1055#1072#1089#1087#1086#1088#1090
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = #1050#1086#1083'-'#1074#1086' '#1087#1086#1089#1077#1097#1077#1085#1080#1081
        OnClick = N13Click
      end
      object N14: TMenuItem
        Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = #1058#1080#1087' '#1072#1073#1086#1085#1077#1084#1077#1085#1090#1072
        OnClick = N15Click
      end
      object N16: TMenuItem
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
        OnClick = N16Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 848
    Top = 392
  end
end
