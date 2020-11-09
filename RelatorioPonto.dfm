object frmRelatorioPonto: TfrmRelatorioPonto
  Left = 996
  Top = 535
  Width = 264
  Height = 150
  Caption = 'Relat'#243'rio do Ponto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 19
    Top = 12
    Width = 55
    Height = 13
    Caption = 'Refer'#234'ncia:'
  end
  object btnCalendario: TSpeedButton
    Left = 222
    Top = 9
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
  object edtMesPesquisa: TMaskEdit
    Left = 147
    Top = 10
    Width = 68
    Height = 21
    EditMask = '!00/0000;1; '
    MaxLength = 7
    TabOrder = 0
    Text = '  /    '
  end
  object btnVisualizar: TBitBtn
    Left = 160
    Top = 85
    Width = 85
    Height = 25
    Caption = 'Visualizar'
    TabOrder = 1
    OnClick = btnVisualizarClick
  end
end
