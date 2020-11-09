object frmCalendario: TfrmCalendario
  Left = 776
  Top = 370
  BorderStyle = bsNone
  Caption = 'Calendario'
  ClientHeight = 156
  ClientWidth = 163
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Calendario: TMonthCalendar
    Left = 0
    Top = 0
    Width = 161
    Height = 154
    BorderWidth = 1
    Date = 43433.192433472220000000
    TabOrder = 0
    OnDblClick = CalendarioDblClick
    OnEnter = CalendarioEnter
  end
end
