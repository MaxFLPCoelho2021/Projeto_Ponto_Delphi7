object frmPrincipal: TfrmPrincipal
  Left = 1632
  Top = 171
  BorderStyle = bsSingle
  Caption = 'Controle de Ponto Individual'
  ClientHeight = 307
  ClientWidth = 217
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
  object btnRegistrarPonto: TButton
    Left = 24
    Top = 27
    Width = 169
    Height = 50
    Caption = 'Registrar Ponto'
    TabOrder = 0
    OnClick = btnRegistrarPontoClick
  end
  object btnConsultaHorasExtras: TButton
    Left = 24
    Top = 99
    Width = 169
    Height = 50
    Caption = 'Consulta de Horas Extras'
    TabOrder = 1
    OnClick = btnConsultaHorasExtrasClick
  end
  object btnRelatorioPonto: TButton
    Left = 24
    Top = 171
    Width = 169
    Height = 50
    Caption = 'Relat'#243'rio de Ponto'
    TabOrder = 2
    OnClick = btnRelatorioPontoClick
  end
  object btnConfiguracoes: TButton
    Left = 24
    Top = 244
    Width = 169
    Height = 50
    Caption = 'Configura'#231#245'es'
    TabOrder = 3
    OnClick = btnConfiguracoesClick
  end
  object cdsConfig: TClientDataSet
    Aggregates = <>
    FileName = 'config.xml'
    Params = <>
    Left = 6
    Top = 6
    object cdsConfignome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object cdsConfigfuncao: TStringField
      FieldName = 'funcao'
      Size = 50
    end
  end
  object cdsPonto: TClientDataSet
    Aggregates = <>
    FileName = 'ponto.xml'
    IndexFieldNames = 'data'
    Params = <>
    Left = 37
    Top = 6
    object cdsPontodata: TDateField
      FieldName = 'data'
    end
    object cdsPontoentrada: TTimeField
      FieldName = 'entrada'
    end
    object cdsPontosaidaalmoco: TTimeField
      FieldName = 'saidaalmoco'
    end
    object cdsPontoretornoalmoco: TTimeField
      FieldName = 'retornoalmoco'
    end
    object cdsPontosaida: TTimeField
      FieldName = 'saida'
    end
  end
end
