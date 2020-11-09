object frmRegistrarPonto: TfrmRegistrarPonto
  Left = 672
  Top = 621
  BorderStyle = bsDialog
  Caption = 'Registro de ponto'
  ClientHeight = 211
  ClientWidth = 352
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
    Left = 8
    Top = 24
    Width = 92
    Height = 13
    Caption = 'Data da Marca'#231#227'o:'
  end
  object btnCalendario: TSpeedButton
    Left = 186
    Top = 22
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
      7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
      777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
      79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
      7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
      777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
      79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
      CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
    NumGlyphs = 2
    OnClick = btnCalendarioClick
  end
  object Label2: TLabel
    Left = 9
    Top = 57
    Width = 53
    Height = 13
    Caption = 'Marca'#231#245'es'
  end
  object Shape1: TShape
    Left = 72
    Top = 64
    Width = 271
    Height = 1
    Pen.Mode = pmBlack
  end
  object Label3: TLabel
    Left = 9
    Top = 86
    Width = 37
    Height = 13
    Caption = 'Entrada'
  end
  object Label4: TLabel
    Left = 88
    Top = 86
    Width = 67
    Height = 13
    Caption = 'Sa'#237'da Almo'#231'o'
  end
  object Label5: TLabel
    Left = 188
    Top = 86
    Width = 76
    Height = 13
    Caption = 'Retorno Almo'#231'o'
  end
  object Label6: TLabel
    Left = 304
    Top = 86
    Width = 29
    Height = 13
    Caption = 'Sa'#237'da'
  end
  object edtDataMarcacao: TMaskEdit
    Left = 108
    Top = 22
    Width = 71
    Height = 21
    EditMask = '!00/00/0000;1; '
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object edtEntrada: TMaskEdit
    Left = 9
    Top = 112
    Width = 45
    Height = 21
    EditMask = '!00:00;1; '
    MaxLength = 5
    TabOrder = 1
    Text = '  :  '
  end
  object edtSaidaAlmoco: TMaskEdit
    Left = 88
    Top = 112
    Width = 45
    Height = 21
    EditMask = '!00:00;1; '
    MaxLength = 5
    TabOrder = 2
    Text = '  :  '
  end
  object edtRetornoAlmoco: TMaskEdit
    Left = 188
    Top = 112
    Width = 45
    Height = 21
    EditMask = '!00:00;1; '
    MaxLength = 5
    TabOrder = 3
    Text = '  :  '
  end
  object edtSaida: TMaskEdit
    Left = 296
    Top = 112
    Width = 45
    Height = 21
    EditMask = '!00:00;1; '
    MaxLength = 5
    TabOrder = 4
    Text = '  :  '
  end
  object btnGravar: TBitBtn
    Left = 190
    Top = 176
    Width = 67
    Height = 25
    Caption = 'Gravar'
    TabOrder = 5
    OnClick = btnGravarClick
  end
  object btnCancelar: TBitBtn
    Left = 274
    Top = 176
    Width = 67
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 6
    NumGlyphs = 2
  end
end
