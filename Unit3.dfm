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
  PixelsPerInch = 96
  TextHeight = 23
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 97
    Height = 23
    Caption = #1042#1080#1076' '#1086#1073#1098#1077#1082#1090#1072
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
    Width = 47
    Height = 23
    Caption = #1040#1076#1088#1077#1089
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
    Width = 125
    Height = 23
    Caption = #1060#1048#1054' '#1074#1083#1072#1076#1077#1083#1100#1094#1072
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
  object Label5: TLabel
    Left = 8
    Top = 262
    Width = 79
    Height = 23
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
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
    Width = 132
    Height = 23
    Caption = #1060#1048#1054' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
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
    Width = 113
    Height = 23
    Caption = #1044#1072#1090#1072' '#1087#1088#1086#1076#1072#1078#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object AddressEdit: TEdit
    Left = 8
    Top = 99
    Width = 324
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object OwnerFullNameEdit: TEdit
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
    TabOrder = 2
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
    TabOrder = 3
    OnKeyPress = PriceEditKeyPress
  end
  object AddFacilityButton: TButton
    Left = 8
    Top = 462
    Width = 324
    Height = 30
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1098#1077#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = AddFacilityButtonClick
  end
  object CategoryComboBox: TComboBox
    Left = 8
    Top = 37
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
  object DescriptionEdit: TEdit
    Left = 8
    Top = 291
    Width = 324
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object CustomerFullNameEdit: TEdit
    Left = 8
    Top = 355
    Width = 324
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object SaleDateDateTimePicker: TDateTimePicker
    Left = 8
    Top = 421
    Width = 324
    Height = 31
    Date = 44712.000000000000000000
    Time = 0.825443101850396500
    TabOrder = 6
  end
end
