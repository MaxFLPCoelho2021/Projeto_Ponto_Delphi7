unit ConsultaHorasExtras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, Mask, strutils;

type
  TfrmConsultaHorasExtras = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtMesPesquisa: TMaskEdit;
    btnCalendario: TSpeedButton;
    btnConsultar: TBitBtn;
    grdMovimento: TStringGrid;
    lblNome: TLabel;
    lblFuncao: TLabel;
    Label6: TLabel;
    edtTotalHorasExtras: TEdit;
    edtTotalAtrasos: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCalendarioClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmConsultaHorasExtras: TfrmConsultaHorasExtras;

implementation

uses Principal, DB, DBClient, Calendario;

{$R *.dfm}

procedure TfrmConsultaHorasExtras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmConsultaHorasExtras.FormCreate(Sender: TObject);
begin
  lblNome.Caption := frmPrincipal.cdsConfig.FieldByName('nome').AsString;
  lblFuncao.Caption := frmPrincipal.cdsConfig.FieldByName('funcao').AsString;

  grdMovimento.Cells[0,0] := 'Data da Marcação';
  grdMovimento.Cells[1,0] := 'Horas Extras';
  grdMovimento.Cells[2,0] := 'Atrasos';
end;

procedure TfrmConsultaHorasExtras.btnCalendarioClick(Sender: TObject);
var
  Calendario : TfrmCalendario;
begin
  Calendario := TfrmCalendario.create(self);

  Calendario.Top := self.Top + edtMesPesquisa.Top + 42;
  Calendario.Left := Self.Left + edtMesPesquisa.Left;

  Calendario.ShowModal;

  edtMesPesquisa.Text := RightStr(Calendario.Data,7);

  Calendario.Free;

  edtMesPesquisa.SetFocus;
end;

procedure TfrmConsultaHorasExtras.LimpaCampos;
var
  n : integer;
begin
  for N := 1 to grdMovimento.RowCount - 1 do
  begin
    grdMovimento.Cells[0,N] := '';
    grdMovimento.Cells[1,N] := '';
    grdMovimento.Cells[2,N] := '';
  end;

  grdMovimento.RowCount := 2;
  grdMovimento.FixedRows := 1;

  edtTotalHorasExtras.Text := '';
  edtTotalAtrasos.Text := '';

end;

procedure TfrmConsultaHorasExtras.btnConsultarClick(Sender: TObject);
var
  R : integer;
  Tempo,
  TotalHorasExtras,
  TotalAtrasos : TTime;
  HorasExtras,
  Atrasos : string;

begin
  LimpaCampos;

  R := 1;

  TotalHorasExtras := StrToTime('00:00');
  TotalAtrasos  := StrToTime('00:00');

  grdMovimento.RowCount := R;

  frmPrincipal.cdsPonto.First;

  While not (frmPrincipal.cdsPonto.Eof) do
  begin
    if (FormatDateTime('mm/yyyy',frmPrincipal.cdsPonto.FieldByName('data').AsDateTime) = edtMesPesquisa.Text) then
    begin
      HorasExtras := '';
      Atrasos := '';

      Tempo := (frmPrincipal.cdsPonto.FieldByName('saida').AsDateTime - frmPrincipal.cdsPonto.FieldByName('entrada').AsDateTime) -
               (frmPrincipal.cdsPonto.FieldByName('retornoalmoco').AsDateTime - frmPrincipal.cdsPonto.FieldByName('saidaalmoco').AsDateTime);

      If (Tempo > StrToTime('08:00')) then
      begin
        Tempo := Tempo -  StrToTime('08:00');

        HorasExtras := FormatDateTime('hh:mm',Tempo);
        TotalHorasExtras := TotalHorasExtras + Tempo;

      end
      else If (Tempo < StrToTime('08:00')) then
      begin
        Tempo := StrToTime('08:00') - Tempo;

        Atrasos := FormatDateTime('hh:mm',Tempo);
        TotalAtrasos := TotalAtrasos + tempo;
      end;

      if (HorasExtras <> '') or (Atrasos <> '') then
      begin
        R := R + 1;

        grdMovimento.RowCount := R;

        grdMovimento.Cells[0,R - 1] := FormatDateTime('dd/mm/yyyy',frmPrincipal.cdsPonto.FieldByName('data').AsDateTime);
        grdMovimento.Cells[1,R - 1] := HorasExtras;
        grdMovimento.Cells[2,R - 1] := Atrasos;

        edtTotalHorasExtras.Text := FormatDateTime('hhh:mm',TotalHorasExtras);
        edtTotalAtrasos.Text := FormatDateTime('hhh:mm',TotalAtrasos);
      end;
    end;

    frmPrincipal.cdsPonto.Next;
  end;

  if (R > 1) then
    grdMovimento.FixedRows := 1
  else
    LimpaCampos;
end;

end.
