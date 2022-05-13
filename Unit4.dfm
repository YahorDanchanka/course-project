object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103' '#1087#1086' '#1076#1072#1090#1077' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
  ClientHeight = 227
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 324
    Height = 177
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 23
    Items.Strings = (
      #1055#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
      #1042#1090#1086#1088#1085#1080#1082
      #1057#1088#1077#1076#1072
      #1063#1077#1090#1074#1077#1088#1075
      #1055#1103#1090#1085#1080#1094#1072
      #1057#1091#1073#1073#1086#1090#1072
      #1042#1086#1089#1082#1088#1077#1089#1077#1085#1100#1077)
    ParentFont = False
    TabOrder = 0
  end
  object ApplyFilterButton: TButton
    Left = 8
    Top = 191
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
