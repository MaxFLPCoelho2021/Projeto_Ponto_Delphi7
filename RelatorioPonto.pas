unit RelatorioPonto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, strUtils;

type
  TfrmRelatorioPonto = class(TForm)
    Label3: TLabel;
    edtMesPesquisa: TMaskEdit;
    btnCalendario: TSpeedButton;
    btnVisualizar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCalendarioClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioPonto: TfrmRelatorioPonto;

implementation

uses Principal, DB, DBClient, Calendario, Relatorio;

{$R *.dfm}

procedure TfrmRelatorioPonto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRelatorioPonto.btnCalendarioClick(Sender: TObject);
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

procedure TfrmRelatorioPonto.btnVisualizarClick(Sender: TObject);
var
  Relatorio : TfrmRelatorio;
begin
  Relatorio := TfrmRelatorio.Create(Self);

  Relatorio.memRelatorio.Text := '';

  Relatorio.memRelatorio.Lines.Add('Relatório de Marcações de Ponto');

  Relatorio.memRelatorio.Lines.Add('Nome: ' +
                                   LeftStr(frmPrincipal.cdsConfig.FieldByName('nome').AsString, 50));
  Relatorio.memRelatorio.Lines.Add('Função: ' +
                                   LeftStr(frmPrincipal.cdsConfig.FieldByName('funcao').AsString, 50));

  Relatorio.memRelatorio.Lines.Add('                                                                     ' +
                                   'Referência: ' +
                                   edtMesPesquisa.Text);
  Relatorio.memRelatorio.Lines.Add('                                                                     ' +
                                   'Geração: ' +
                                   FormatDateTime('dd/mm/yyyy hh:mm',now));

  Relatorio.memRelatorio.Lines.Add('');

  Relatorio.memRelatorio.Lines.Add('Dia' +
                                   '               ' +
                                   'Marcações');

  frmPrincipal.cdsPonto.First;

  While not (frmPrincipal.cdsPonto.Eof) do
  begin
    if (FormatDateTime('mm/yyyy',frmPrincipal.cdsPonto.FieldByName('data').AsDateTime) = edtMesPesquisa.Text) then
    begin
      Relatorio.memRelatorio.Lines.Add(FormatDateTime('dd/mm/yyyy',frmPrincipal.cdsPonto.FieldByName('data').AsDateTime) +
                                       '        ' +
                                       FormatDateTime('hh:mm',frmPrincipal.cdsPonto.FieldByName('entrada').AsDateTime) +
                                       '  ' +
                                       FormatDateTime('hh:mm',frmPrincipal.cdsPonto.FieldByName('saidaalmoco').AsDateTime) +
                                       '  ' +
                                       FormatDateTime('hh:mm',frmPrincipal.cdsPonto.FieldByName('retornoalmoco').AsDateTime) +
                                       '  ' +
                                       FormatDateTime('hh:mm',frmPrincipal.cdsPonto.FieldByName('saida').AsDateTime));

    end;

    frmPrincipal.cdsPonto.Next;
  end;

  Relatorio.ShowModal;
end;

end.
