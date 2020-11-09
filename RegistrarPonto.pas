unit RegistrarPonto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Mask, ComCtrls;

type
  TfrmRegistrarPonto = class(TForm)
    Label1: TLabel;
    edtDataMarcacao: TMaskEdit;
    btnCalendario: TSpeedButton;
    Label2: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtEntrada: TMaskEdit;
    edtSaidaAlmoco: TMaskEdit;
    edtRetornoAlmoco: TMaskEdit;
    edtSaida: TMaskEdit;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCalendarioClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmRegistrarPonto: TfrmRegistrarPonto;

implementation

uses Principal, DB, DBClient, Calendario;

{$R *.dfm}

procedure TfrmRegistrarPonto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRegistrarPonto.LimpaCampos;
begin
  edtDataMarcacao.Text := '';
  edtEntrada.Text := '';
  edtSaidaAlmoco.text := '';
  edtRetornoAlmoco.text := '';
  edtSaida.Text := '';
end;

procedure TfrmRegistrarPonto.FormCreate(Sender: TObject);
begin
  LimpaCampos;
end;

procedure TfrmRegistrarPonto.btnGravarClick(Sender: TObject);

  function verificaHora(sHora: string) : boolean;
  begin
    if (length(trim(sHora)) < 5) or
       (strtotime(sHora) < strtotime('06:00')) or
       (strtotime(sHora) > strtotime('23:00')) then
      Result := false
    else
      Result := true;
  end;

  function verificaSequenciaHora(sHora1, SHora2: string) : boolean;
  begin
    if (strtotime(sHora1) >= strtotime(sHora2)) then
      Result := false
    else
      Result := true;
  end;

begin

  if (length(trim(edtDataMarcacao.Text)) < 10) or
     (strtoDate(edtDataMarcacao.Text) < strtodate('01/01/1900')) or
     (strtoDate(edtDataMarcacao.Text) > Date) then
  begin
    showmessage('Data de marcação incorreta. Não pode estar vazia ou posterior a data do sistema. Verifique.');

    edtDataMarcacao.SetFocus;

    exit;
  end;

  if not (frmPrincipal.cdsPonto.RecordCount = 0) then
  begin
    if (frmPrincipal.cdsPonto.locate('data',edtDataMarcacao.Text,[loCaseInsensitive])) then
    begin
      showmessage('Data de marcação já lançada. Escolha outra data ou cancele.');

      edtDataMarcacao.SetFocus;

      exit;
    end;
  end;

  if not (verificaHora(edtEntrada.text)) then
  begin
    showmessage('Hora de entrada incorreta. Não deve estar vazia ou ocorrer antes das 6 horas ou depois das 23 horas. Verifique.');

    edtEntrada.SetFocus;

    exit;
  end;

  if not (verificaHora(edtSaidaAlmoco.Text)) then
  begin
    showmessage('Hora de saída para o almoço incorreta. Não deve estar vazia ou ocorrer antes das 6 horas ou depois das 23 horas. Verifique.');

    edtSaidaAlmoco.SetFocus;

    exit;
  end;

  if not (verificaHora(edtRetornoAlmoco.Text)) then
  begin
    showmessage('Hora de retorno do almoço incorreta. Não deve estar vazia ou ocorrer antes das 6 horas ou depois das 23 horas. Verifique.');

    edtRetornoALmoco.SetFocus;

    exit;
  end;

  if not (verificaHora(edtSaida.Text)) then
  begin
    showmessage('Hora de saída incorreta. Não deve estar vazia ou ocorrer antes das 6 horas ou depois das 23 horas. Verifique.');

    edtSaida.SetFocus;

    exit;
  end;

  if not (verificaSequenciaHora(edtEntrada.Text,edtSaidaAlmoco.Text)) or
     not (verificaSequenciaHora(edtEntrada.Text,edtRetornoAlmoco.Text)) or
     not (verificaSequenciaHora(edtEntrada.Text,edtSaida.Text)) then
  begin
    showmessage('Hora de entrada incorreta. Não deve ocorrer depois dos horários de almoço e saída. Verifique.');

    edtEntrada.SetFocus;

    exit;
  end;

  if not (verificaSequenciaHora(edtSaidaAlmoco.Text,edtRetornoAlmoco.Text)) or
     not (verificaSequenciaHora(edtSaidaAlmoco.Text,edtSaida.Text)) then
  begin
    showmessage('Hora de saída para o almoço incorreta. Não deve ocorrer depois dos retorno do almoço e saída. Verifique.');

    edtSaidaAlmoco.SetFocus;

    exit;
  end;

  if not (verificaSequenciaHora(edtRetornoAlmoco.Text,edtSaida.Text)) then
  begin
    showmessage('Hora de retorno do almoço incorreta. Não deve ocorrer depois dos horário de saída. Verifique.');

    edtRetornoALmoco.SetFocus;

    exit;
  end;

  frmPrincipal.cdsPonto.Insert;

  frmPrincipal.cdsPonto.FieldByName('data').AsString := edtDataMarcacao.Text;
  frmPrincipal.cdsPonto.FieldByName('entrada').AsString := edtEntrada.Text;
  frmPrincipal.cdsPonto.FieldByName('saidaalmoco').AsString := edtSaidaAlmoco.Text;
  frmPrincipal.cdsPonto.FieldByName('retornoalmoco').AsString := edtRetornoAlmoco.Text;
  frmPrincipal.cdsPonto.FieldByName('saida').AsString := edtSaida.Text;

  frmPrincipal.cdsPonto.Post;

  frmPrincipal.cdsPonto.SaveToFile(frmPrincipal.strPonto,dfXML);

  LimpaCampos;

  edtDataMarcacao.SetFocus;
end;

procedure TfrmRegistrarPonto.btnCalendarioClick(Sender: TObject);
var
  Calendario : TfrmCalendario;
begin
  Calendario := TfrmCalendario.create(self);

  Calendario.Top := self.Top + edtDataMarcacao.Top + 42;
  Calendario.Left := Self.Left + edtDataMarcacao.Left;

  Calendario.ShowModal;

  edtDataMarcacao.Text := Calendario.Data;

  Calendario.Free;

  edtDataMarcacao.SetFocus;
end;

end.
