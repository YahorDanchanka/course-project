object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1087#1077#1082#1090#1072#1082#1083#1100
  ClientHeight = 602
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 158
    Height = 23
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1087#1077#1082#1090#1072#1082#1083#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 72
    Width = 202
    Height = 23
    Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' ('#1074' '#1084#1080#1085#1091#1090#1072#1093')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 136
    Width = 200
    Height = 23
    Caption = #1042#1086#1079#1088#1072#1089#1090#1085#1086#1077' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 200
    Width = 44
    Height = 23
    Caption = #1046#1072#1085#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 264
    Width = 84
    Height = 23
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 328
    Width = 123
    Height = 23
    Caption = #1044#1072#1090#1072' '#1087#1088#1077#1084#1100#1077#1088#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 392
    Width = 91
    Height = 23
    Caption = #1044#1085#1080' '#1087#1086#1082#1072#1079#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object TitleEdit: TEdit
    Left = 8
    Top = 37
    Width = 324
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DurationEdit: TEdit
    Left = 8
    Top = 99
    Width = 324
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 1
  end
  object AgeLimitEdit: TEdit
    Left = 8
    Top = 165
    Width = 324
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 2
  end
  object AddPerfomanceButton: TButton
    Left = 8
    Top = 564
    Width = 324
    Height = 30
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1087#1077#1082#1090#1072#1082#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = AddPerfomanceButtonClick
  end
  object PriceEdit: TEdit
    Left = 8
    Top = 293
    Width = 324
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnKeyPress = PriceEditKeyPress
  end
  object PremiereDateDateTimePicker: TDateTimePicker
    Left = 8
    Top = 357
    Width = 324
    Height = 31
    Date = 44711.000000000000000000
    Time = 0.850182245369069300
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Nirmala UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object DaysListBox: TListBox
    Left = 8
    Top = 421
    Width = 324
    Height = 137
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
    TabOrder = 6
  end
  object CategoryComboBox: TComboBox
    Left = 8
    Top = 229
    Width = 324
    Height = 31
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 7
    Text = #1044#1088#1072#1084#1072
    Items.Strings = (
      #1044#1088#1072#1084#1072
      #1052#1077#1083#1086#1076#1088#1072#1084#1072
      #1050#1086#1084#1077#1076#1080#1103)
  end
end
