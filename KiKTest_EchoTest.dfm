object KickerEchoTest: TKickerEchoTest
  Left = -1029
  Top = 403
  Width = 689
  Height = 287
  AutoSize = True
  Caption = '-= Fairbus Card Test =-'
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenue
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Loop_SpeedButton: TSpeedButton
    Left = 0
    Top = 192
    Width = 89
    Height = 41
    AllowAllUp = True
    GroupIndex = 1
    Caption = 'LOOP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Loop_SpeedButtonClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 185
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 18
      Width = 67
      Height = 18
      Caption = 'Send Off '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 62
      Width = 103
      Height = 18
      Caption = 'Error Counter '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 304
      Top = 16
      Width = 127
      Height = 18
      Caption = 'System Messages'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LoopCounter_Panel: TPanel
      Left = 121
      Top = 14
      Width = 161
      Height = 25
      BevelInner = bvLowered
      Caption = '0'
      TabOrder = 0
    end
    object ErrorCounter_Panel: TPanel
      Left = 121
      Top = 58
      Width = 161
      Height = 25
      BevelInner = bvLowered
      Caption = '0'
      TabOrder = 1
    end
    object SystemMess_ListBox: TListBox
      Left = 304
      Top = 40
      Width = 369
      Height = 129
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
    end
    object Clear_Button: TButton
      Left = 168
      Top = 144
      Width = 105
      Height = 25
      Caption = 'Clear'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Clear_ButtonClick
    end
    object ErrorStop_CheckBox: TCheckBox
      Left = 194
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Error Stop'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object ChooseIFKFB: TButton
      Left = 16
      Top = 144
      Width = 105
      Height = 25
      Caption = 'IFK / FB'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = ChooseIFKFBClick
    end
  end
  object Close_Button: TButton
    Left = 592
    Top = 192
    Width = 89
    Height = 41
    Caption = 'CLOSE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Close_ButtonClick
  end
  object Step_Button: TButton
    Left = 112
    Top = 192
    Width = 89
    Height = 41
    Caption = 'STEP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Step_ButtonClick
  end
  object MainMenue: TMainMenu
    Left = 8
    object Optionen1: TMenuItem
      Caption = 'Optionen'
      Enabled = False
    end
    object About1: TMenuItem
      Caption = 'About'
      Enabled = False
    end
  end
end
