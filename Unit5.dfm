object DateRangeInputForm: TDateRangeInputForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'DateRangeInputForm'
  ClientHeight = 185
  ClientWidth = 460
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
    Width = 24
    Height = 23
    Caption = #1054#1090':'
  end
  object Label2: TLabel
    Left = 8
    Top = 72
    Width = 26
    Height = 23
    Caption = #1044#1086':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 37
    Width = 444
    Height = 31
    Date = 44698.000000000000000000
    Time = 0.929085312498500600
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 8
    Top = 101
    Width = 444
    Height = 31
    Date = 44698.000000000000000000
    Time = 0.929085312498500600
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 138
    Width = 444
    Height = 39
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object SecretEdit: TEdit
    Left = 440
    Top = 160
    Width = 25
    Height = 31
    TabOrder = 3
    Text = '0'
    Visible = False
  end
end
