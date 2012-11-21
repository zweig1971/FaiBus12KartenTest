object KickerChooseIFKMBK: TKickerChooseIFKMBK
  Left = -990
  Top = 110
  Width = 546
  Height = 340
  AutoSize = True
  Caption = 'IFK / MBK Auswählen'
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object OKButton: TButton
    Left = 464
    Top = 275
    Width = 74
    Height = 31
    Caption = 'OK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = OKButtonClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 110
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 18
      Width = 78
      Height = 16
      Caption = 'IFKs Count :'
    end
    object Label2: TLabel
      Left = 163
      Top = 19
      Width = 117
      Height = 16
      Caption = 'IFKs Found (hex) :'
    end
    object Label3: TLabel
      Left = 360
      Top = 19
      Width = 108
      Height = 16
      Caption = 'IFK Select (hex) :'
    end
    object IFKCount_Panel: TPanel
      Left = 86
      Top = 17
      Width = 56
      Height = 20
      BevelInner = bvLowered
      Caption = '1'
      TabOrder = 0
    end
    object IFKFound_ListBox: TListBox
      Left = 284
      Top = 21
      Width = 55
      Height = 50
      ItemHeight = 16
      TabOrder = 1
    end
    object IFKSelect_ComboBox: TComboBox
      Left = 471
      Top = 17
      Width = 55
      Height = 24
      ItemHeight = 16
      TabOrder = 2
      OnChange = IFKSelect_ComboBoxChange
    end
    object Update_Button: TButton
      Left = 201
      Top = 85
      Width = 178
      Height = 19
      Caption = 'U P D A T E'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Update_ButtonClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 109
    Width = 537
    Height = 157
    BevelInner = bvLowered
    TabOrder = 2
    object SubAdr: TLabel
      Left = 9
      Top = 35
      Width = 95
      Height = 16
      Caption = 'Sub Adr (hex) :'
    end
    object Label4: TLabel
      Left = 192
      Top = 14
      Width = 35
      Height = 16
      Caption = 'Slave'
    end
    object Label7: TLabel
      Left = 320
      Top = 14
      Width = 35
      Height = 16
      Caption = 'Slave'
    end
    object SubAdr_TEdit: TEdit
      Left = 106
      Top = 32
      Width = 27
      Height = 24
      TabOrder = 0
      Text = '10'
    end
    object SlaveAdr4CheckBox: TCheckBox
      Left = 200
      Top = 93
      Width = 49
      Height = 16
      Caption = ' 4'
      TabOrder = 1
    end
    object SlaveAdr1CheckBox: TCheckBox
      Left = 200
      Top = 32
      Width = 41
      Height = 17
      Caption = ' 1'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object SlaveAdr2CheckBox: TCheckBox
      Left = 200
      Top = 52
      Width = 39
      Height = 17
      Caption = ' 2'
      TabOrder = 3
    end
    object SlaveAdr3CheckBox: TCheckBox
      Left = 200
      Top = 72
      Width = 41
      Height = 17
      Caption = ' 3'
      TabOrder = 4
    end
    object SlaveAdr5CheckBox: TCheckBox
      Left = 200
      Top = 111
      Width = 41
      Height = 17
      Caption = ' 5'
      TabOrder = 5
    end
    object SlaveAdr6CheckBox: TCheckBox
      Left = 200
      Top = 128
      Width = 40
      Height = 17
      Caption = ' 6'
      TabOrder = 6
    end
    object SlaveAdr7CheckBox: TCheckBox
      Left = 328
      Top = 32
      Width = 41
      Height = 17
      Caption = ' 7'
      TabOrder = 7
    end
    object SlaveAdr8CheckBox: TCheckBox
      Left = 328
      Top = 52
      Width = 41
      Height = 17
      Caption = ' 8'
      TabOrder = 8
    end
    object SlaveAdr9CheckBox: TCheckBox
      Left = 328
      Top = 71
      Width = 41
      Height = 17
      Caption = ' 9'
      TabOrder = 9
    end
    object SlaveAdr10CheckBox: TCheckBox
      Left = 328
      Top = 91
      Width = 49
      Height = 17
      Caption = ' 10'
      TabOrder = 10
    end
    object SlaveAdr11CheckBox: TCheckBox
      Left = 328
      Top = 109
      Width = 49
      Height = 17
      Caption = ' 11'
      TabOrder = 11
    end
    object SlaveAdr12CheckBox: TCheckBox
      Left = 329
      Top = 128
      Width = 49
      Height = 17
      Caption = ' 12'
      TabOrder = 12
    end
  end
end
