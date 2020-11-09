object frmConsultaHorasExtras: TfrmConsultaHorasExtras
  Left = 989
  Top = 448
  BorderStyle = bsDialog
  Caption = 'Consulta Horas Extras e Atrasos'
  ClientHeight = 288
  ClientWidth = 438
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
  object Label6: TLabel
    Left = 13
    Top = 256
    Width = 97
    Height = 13
    Caption = 'Totais na refer'#234'ncia:'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 6
    Width = 421
    Height = 54
    Caption = 'Filtro '
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label2: TLabel
      Left = 7
      Top = 32
      Width = 39
      Height = 13
      Caption = 'Fun'#231#227'o:'
    end
    object Label3: TLabel
      Left = 178
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Refer'#234'ncia:'
    end
    object btnCalendario: TSpeedButton
      Left = 246
      Top = 24
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
    object lblNome: TLabel
      Left = 42
      Top = 16
      Width = 124
      Height = 13
      AutoSize = False
      Caption = '     '
    end
    object lblFuncao: TLabel
      Left = 51
      Top = 32
      Width = 115
      Height = 13
      AutoSize = False
      Caption = '     '
    end
    object edtMesPesquisa: TMaskEdit
      Left = 174
      Top = 26
      Width = 67
      Height = 21
      EditMask = '!00/0000;1; '
      MaxLength = 7
      TabOrder = 0
      Text = '  /    '
    end
    object btnConsultar: TBitBtn
      Left = 336
      Top = 21
      Width = 67
      Height = 25
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = btnConsultarClick
    end
  end
  object grdMovimento: TStringGrid
    Left = 9
    Top = 68
    Width = 420
    Height = 181
    ColCount = 3
    Ctl3D = False
    FixedCols = 0
    RowCount = 7
    Options = [goFixedVertLine, goVertLine, goRangeSelect, goRowMoving, goRowSelect]
    ParentCtl3D = False
    ScrollBars = ssVertical
    TabOrder = 1
    ColWidths = (
      135
      133
      147)
  end
  object edtTotalHorasExtras: TEdit
    Left = 147
    Top = 253
    Width = 99
    Height = 19
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    TabOrder = 2
  end
  object edtTotalAtrasos: TEdit
    Left = 284
    Top = 253
    Width = 99
    Height = 19
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    TabOrder = 3
  end
end
