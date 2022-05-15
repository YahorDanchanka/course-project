object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1091#1095#1072#1097#1080#1093#1089#1103' '#1085#1072' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1082#1091#1088#1089
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
    Width = 162
    Height = 23
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1091#1095#1072#1097#1080#1093#1089#1103':'
  end
  object ListBox1: TListBox
    Left = 8
    Top = 37
    Width = 324
    Height = 412
    ItemHeight = 23
    MultiSelect = True
    TabOrder = 0
  end
  object IncreaseCourseButton: TButton
    Left = 8
    Top = 462
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
    OnClick = IncreaseCourseButtonClick
  end
end
