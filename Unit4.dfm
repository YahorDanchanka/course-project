object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103' '#1087#1086' '#1087#1086#1083#1102' "'#1046#1072#1085#1088'"'
  ClientHeight = 87
  ClientWidth = 401
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
    Width = 385
    Height = 31
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = #1044#1088#1072#1084#1072
    Items.Strings = (
      #1044#1088#1072#1084#1072
      #1052#1077#1083#1086#1076#1088#1072#1084#1072
      #1050#1086#1084#1077#1076#1080#1103)
  end
  object ApplyFilterButton: TButton
    Left = 8
    Top = 45
    Width = 385
    Height = 30
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ApplyFilterButtonClick
  end
end
