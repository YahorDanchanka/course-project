object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1092#1086#1088#1084#1072
  ClientHeight = 440
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
    Top = 10
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
    Top = 48
    Width = 904
    Height = 337
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
    OnContextPopup = StringGrid1ContextPopup
  end
  object AddGroupButton: TButton
    Left = 8
    Top = 400
    Width = 185
    Height = 30
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1095#1072#1097#1077#1075#1086#1089#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = AddGroupButtonClick
  end
  object SearchEdit: TEdit
    Left = 72
    Top = 8
    Width = 840
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
        Caption = #1060#1048#1054' '#1091#1095#1072#1097#1077#1075#1086#1089#1103
        object FullnameAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = FullnameAscMenuItemClick
        end
        object FullnameDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = FullnameDescMenuItemClick
        end
      end
      object N4: TMenuItem
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        object BirthdayAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = BirthdayAscMenuItemClick
        end
        object BirthdayDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = BirthdayDescMenuItemClick
        end
      end
      object N5: TMenuItem
        Caption = #1040#1076#1088#1077#1089
        object AddressAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = AddressAscMenuItemClick
        end
        object AddressDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = AddressDescMenuItemClick
        end
      end
      object N6: TMenuItem
        Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
        object SpecialtyAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = SpecialtyAscMenuItemClick
        end
        object SpecialtyDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = SpecialtyDescMenuItemClick
        end
      end
      object N7: TMenuItem
        Caption = #1053#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099
        object GroupNumberAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = GroupNumberAscMenuItemClick
        end
        object GroupNumberDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = GroupNumberDescMenuItemClick
        end
      end
      object N8: TMenuItem
        Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
        object ReceiptDateAscMenuItem: TMenuItem
          Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
          OnClick = ReceiptDateAscMenuItemClick
        end
        object ReceiptDateDescMenuItem: TMenuItem
          Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
          OnClick = ReceiptDateDescMenuItemClick
        end
      end
    end
    object N9: TMenuItem
      Caption = #1060#1091#1085#1082#1094#1080#1080
      object DeleteRecordsByGroupNumberMenuItem: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080' '#1086#1073' '#1091#1095#1072#1097#1080#1093#1089#1103' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1085#1086#1081' '#1075#1088#1091#1087#1087#1099
        OnClick = DeleteRecordsByGroupNumberMenuItemClick
      end
      object IncreaseCourseMenuItem: TMenuItem
        Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1091#1095#1072#1097#1080#1093#1089#1103' '#1085#1072' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1082#1091#1088#1089
        OnClick = IncreaseCourseMenuItemClick
      end
      object DumpCurrentYearStudentsMenuItem: TMenuItem
        Caption = #1042#1099#1074#1077#1089#1090#1080' '#1074#1089#1077' '#1089#1074#1077#1076#1077#1085#1080#1103' '#1086#1073' '#1091#1095#1072#1097#1080#1093#1089#1103', '#1087#1086#1089#1090#1091#1087#1080#1074#1096#1080#1093' '#1074' '#1101#1090#1086#1084' '#1075#1086#1076#1091
        OnClick = DumpCurrentYearStudentsMenuItemClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 848
    Top = 392
  end
end
