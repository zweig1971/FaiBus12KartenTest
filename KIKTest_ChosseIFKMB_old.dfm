object KickerChooseIFKMBK: TKickerChooseIFKMBK
  Left = -741
  Top = 77
  Width = 570
  Height = 331
  AutoSize = True
  Caption = 'IFK / MBK Auswählen'
  Color = clBtnFace
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
  object Button1: TButton
    Left = 488
    Top = 266
    Width = 74
    Height = 31
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 562
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
      Left = 177
      Top = 18
      Width = 117
      Height = 16
      Caption = 'IFKs Found (hex) :'
    end
    object Label3: TLabel
      Left = 390
      Top = 18
      Width = 108
      Height = 16
      Caption = 'IFK Select (hex) :'
    end
    object IFKCount_Panel: TPanel
      Left = 91
      Top = 18
      Width = 56
      Height = 25
      BevelInner = bvLowered
      Caption = '1'
      TabOrder = 0
    end
    object IFKFound_ListBox: TListBox
      Left = 299
      Top = 18
      Width = 55
      Height = 50
      ItemHeight = 16
      TabOrder = 1
    end
    object IFKSelect_ComboBox: TComboBox
      Left = 500
      Top = 18
      Width = 55
      Height = 24
      ItemHeight = 16
      TabOrder = 2
      OnChange = IFKSelect_ComboBoxChange
    end
    object Update_Button: TButton
      Left = 193
      Top = 85
      Width = 178
      Height = 19
      Caption = 'U P D A T E'
      TabOrder = 3
      OnClick = Update_ButtonClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 112
    Width = 562
    Height = 145
    BevelInner = bvLowered
    TabOrder = 2
    object Label5: TLabel
      Left = 17
      Top = 20
      Width = 105
      Height = 16
      Caption = 'Slave Adr (hex) :'
    end
    object SubAdr: TLabel
      Left = 17
      Top = 52
      Width = 95
      Height = 16
      Caption = 'Sub Adr (hex) :'
    end
    object SlaveAdr_TEdit: TEdit
      Left = 128
      Top = 16
      Width = 41
      Height = 24
      TabOrder = 0
      Text = '1'
    end
    object SubAdr_TEdit: TEdit
      Left = 128
      Top = 48
      Width = 41
      Height = 24
      TabOrder = 1
      Text = '1'
    end
  end
end
