object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1087#1088#1086#1094#1077#1085#1090' '#1089#1082#1080#1076#1082#1080
  ClientHeight = 500
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 23
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 167
    Height = 23
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1088#1077#1089#1090#1086#1088#1072#1085#1099
  end
  object ListBox1: TListBox
    Left = 8
    Top = 37
    Width = 324
    Height = 412
    ItemHeight = 23
    TabOrder = 0
  end
  object IncreasePercentButton: TButton
    Left = 8
    Top = 455
    Width = 324
    Height = 37
    Caption = #1059#1074#1077#1083#1080#1095#1080#1090#1100
    TabOrder = 1
    OnClick = IncreasePercentButtonClick
  end
end
