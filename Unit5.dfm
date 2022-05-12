object Form5: TForm5
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1079#1072#1085#1103#1090#1080#1081
  ClientHeight = 235
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 151
    Height = 23
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1091#1088#1086#1074#1077#1085#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ListBox1: TListBox
    Left = 8
    Top = 37
    Width = 324
    Height = 155
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 23
    ParentFont = False
    TabOrder = 0
  end
  object ApplyFilterButton: TButton
    Left = 8
    Top = 198
    Width = 324
    Height = 30
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
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
