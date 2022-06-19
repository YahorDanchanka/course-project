object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1095#1072#1097#1077#1075#1086#1089#1103
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
    Width = 127
    Height = 23
    Caption = #1060#1048#1054' '#1091#1095#1072#1097#1077#1075#1086#1089#1103
  end
  object Label2: TLabel
    Left = 8
    Top = 72
    Width = 122
    Height = 23
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
  end
  object Label3: TLabel
    Left = 8
    Top = 136
    Width = 68
    Height = 23
    Caption = #1058#1077#1083#1077#1092#1086#1085
  end
  object Label4: TLabel
    Left = 8
    Top = 200
    Width = 47
    Height = 23
    Caption = #1040#1076#1088#1077#1089
  end
  object Label5: TLabel
    Left = 8
    Top = 264
    Width = 121
    Height = 23
    Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
  end
  object Label6: TLabel
    Left = 8
    Top = 328
    Width = 115
    Height = 23
    Caption = #1053#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099
  end
  object Label7: TLabel
    Left = 8
    Top = 392
    Width = 142
    Height = 23
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
  end
  object AddStudentButton: TButton
    Left = 8
    Top = 462
    Width = 324
    Height = 30
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1095#1072#1097#1077#1075#1086#1089#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = AddStudentButtonClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 37
    Width = 324
    Height = 31
    TabOrder = 1
  end
  object Edit4: TEdit
    Left = 8
    Top = 229
    Width = 324
    Height = 31
    TabOrder = 2
  end
  object Edit6: TEdit
    Left = 8
    Top = 357
    Width = 324
    Height = 31
    NumbersOnly = True
    TabOrder = 3
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 101
    Width = 324
    Height = 31
    Date = 44693.000000000000000000
    Time = 0.825116180552868200
    TabOrder = 4
  end
  object DateTimePicker2: TDateTimePicker
    Left = 8
    Top = 421
    Width = 324
    Height = 31
    Date = 44693.000000000000000000
    Time = 0.825116180552868200
    TabOrder = 5
  end
  object MaskEdit1: TMaskEdit
    Left = 8
    Top = 165
    Width = 322
    Height = 31
    EditMask = '375-99-999-99-99;1;_'
    MaxLength = 16
    TabOrder = 6
    Text = '375-  -   -  -  '
  end
  object SpecialtyComboBox: TComboBox
    Left = 8
    Top = 293
    Width = 324
    Height = 31
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 7
    Text = #1055#1088#1086#1075#1088#1072#1084#1084#1080#1089#1090
    Items.Strings = (
      #1055#1088#1086#1075#1088#1072#1084#1084#1080#1089#1090
      #1041#1091#1093#1075#1072#1083#1090#1077#1088
      #1069#1082#1086#1085#1086#1084#1080#1089#1090)
  end
end
