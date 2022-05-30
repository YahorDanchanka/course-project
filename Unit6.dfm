object Form6: TForm6
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103' '#1087#1086' '#1087#1086#1083#1102' "'#1044#1085#1080' '#1087#1086#1082#1072#1079#1072'"'
  ClientHeight = 227
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 23
  object DaysListBox: TListBox
    Left = 8
    Top = 8
    Width = 385
    Height = 177
    ItemHeight = 23
    Items.Strings = (
      #1055#1085
      #1042#1090
      #1057#1088
      #1063#1090
      #1055#1090
      #1057#1073
      #1042#1089)
    MultiSelect = True
    TabOrder = 0
  end
  object ApplyFilterButton: TButton
    Left = 8
    Top = 191
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
