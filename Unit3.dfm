object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
  ClientHeight = 500
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 23
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 115
    Height = 23
    Caption = #1053#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099
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
    Width = 67
    Height = 23
    Caption = #1059#1088#1086#1074#1077#1085#1100
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
    Width = 162
    Height = 23
    Caption = #1060#1048#1054' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103
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
    Width = 173
    Height = 23
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1079#1072' '#1079#1072#1085#1103#1090#1080#1077
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
    Width = 140
    Height = 23
    Caption = #1044#1077#1085#1100' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
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
    Width = 150
    Height = 23
    Caption = #1042#1088#1077#1084#1103' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
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
    Width = 173
    Height = 23
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1091#1095#1072#1097#1080#1093#1089#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object FullnameEdit: TEdit
    Left = 8
    Top = 165
    Width = 324
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = FullnameEditKeyPress
  end
  object PriceEdit: TEdit
    Left = 8
    Top = 229
    Width = 324
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyPress = PriceEditKeyPress
  end
  object CountEdit: TEdit
    Left = 8
    Top = 421
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
  object AddGroupButton: TButton
    Left = 8
    Top = 462
    Width = 324
    Height = 30
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = AddGroupButtonClick
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 291
    Width = 324
    Height = 31
    Date = 44691.000000000000000000
    Time = 0.779382233798969500
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DateTimePicker2: TDateTimePicker
    Left = 8
    Top = 357
    Width = 324
    Height = 31
    Date = 44691.000000000000000000
    Time = 0.779382233798969500
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Kind = dtkTime
    ParentFont = False
    TabOrder = 5
  end
  object NumberComboBox: TComboBox
    Left = 8
    Top = 37
    Width = 324
    Height = 31
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 6
    Text = #1055#1054'-11'
    Items.Strings = (
      #1055#1054'-11'
      #1055#1054'-12'
      #1055#1054'-13'
      #1055#1054'-21'
      #1055#1054'-22'
      #1055#1054'-23'
      #1055#1054'-31'
      #1055#1054'-32'
      #1055#1054'-33'
      #1055#1054'-41'
      #1055#1054'-42'
      #1055#1054'-43'
      #1041#1041'-11'
      #1041#1041'-12'
      #1041#1041'-13'
      #1041#1041'-21'
      #1041#1041'-22'
      #1041#1041'-23'
      #1041#1041'-31'
      #1041#1041'-32'
      #1041#1041'-33')
  end
  object LevelComboBox: TComboBox
    Left = 8
    Top = 99
    Width = 324
    Height = 31
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 7
    Text = 'A1'
    Items.Strings = (
      'A1'
      'A2'
      'B1'
      'B2'
      'C1'
      'C2')
  end
end
