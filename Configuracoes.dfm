object frmConfiguracoes: TfrmConfiguracoes
  Left = 839
  Top = 490
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es'
  ClientHeight = 136
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 24
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 7
    Top = 56
    Width = 39
    Height = 13
    Caption = 'Fun'#231#227'o:'
  end
  object edtNome: TEdit
    Left = 53
    Top = 20
    Width = 231
    Height = 21
    MaxLength = 50
    TabOrder = 0
  end
  object edtFuncao: TEdit
    Left = 53
    Top = 52
    Width = 231
    Height = 21
    MaxLength = 50
    TabOrder = 1
  end
  object btnGravar: TBitBtn
    Left = 217
    Top = 99
    Width = 67
    Height = 25
    Caption = 'Gravar'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnGravarClick
  end
end
