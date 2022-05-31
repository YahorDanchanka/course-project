object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103' '#1087#1086' '#1087#1086#1083#1102' "'#1042#1080#1076' '#1086#1073#1098#1077#1082#1090#1072'"'
  ClientHeight = 82
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 23
  object CategoryComboBox: TComboBox
    Left = 8
    Top = 8
    Width = 324
    Height = 31
    BevelKind = bkFlat
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = #1050#1086#1084#1084#1077#1088#1095#1077#1089#1082#1072#1103
    Items.Strings = (
      #1050#1086#1084#1084#1077#1088#1095#1077#1089#1082#1072#1103
      #1046#1080#1083#1072#1103
      #1044#1083#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077#1085#1085#1099#1093' '#1094#1077#1083#1077#1081
      #1044#1083#1103' '#1089#1077#1083#1100#1089#1082#1086#1075#1086' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
      #1044#1083#1103' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1099#1093' '#1094#1077#1083#1077#1081)
  end
  object AddFacilityButton: TButton
    Left = 8
    Top = 45
    Width = 324
    Height = 30
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = AddFacilityButtonClick
  end
  object SecretEdit: TEdit
    Left = 320
    Top = 56
    Width = 25
    Height = 31
    TabOrder = 2
    Text = '0'
    Visible = False
  end
end
