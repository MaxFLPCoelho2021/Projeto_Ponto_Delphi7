unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient;

type
  TfrmPrincipal = class(TForm)
    btnRegistrarPonto: TButton;
    btnConsultaHorasExtras: TButton;
    btnRelatorioPonto: TButton;
    btnConfiguracoes: TButton;
    cdsConfig: TClientDataSet;
    cdsConfignome: TStringField;
    cdsConfigfuncao: TStringField;
    cdsPonto: TClientDataSet;
    cdsPontodata: TDateField;
    cdsPontoentrada: TTimeField;
    cdsPontosaidaalmoco: TTimeField;
    cdsPontoretornoalmoco: TTimeField;
    cdsPontosaida: TTimeField;
    procedure btnRegistrarPontoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure btnConsultaHorasExtrasClick(Sender: TObject);
    procedure btnRelatorioPontoClick(Sender: TObject);
  private
    { Private declarations }
  public
    strConfig,
    strPonto : string;
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses RegistrarPonto, Configuracoes, ConsultaHorasExtras, RelatorioPonto;

{$R *.dfm}

procedure TfrmPrincipal.btnRegistrarPontoClick(Sender: TObject);
var
  RegistrarPonto : TfrmRegistrarPonto;
begin
  RegistrarPonto := TfrmRegistrarPonto.create(self);

  RegistrarPonto.ShowModal;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsConfig.Close;
  cdsPonto.Close;

  Action := caFree;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  strConfig := 'config.xml';
  strPonto := 'ponto.xml';

  cdsConfig.CreateDataSet;
  cdsPonto.CreateDataSet;

  if (fileexists(strConfig)) then
  begin
    cdsConfig.LoadFromFile(strConfig);
    cdsConfig.Open;
  end;

  if (fileexists(strPonto)) then
  begin
    cdsPonto.LoadFromFile(strPonto);
    cdsPonto.Open;
  end;
end;

procedure TfrmPrincipal.btnConfiguracoesClick(Sender: TObject);
var
  Configuracoes : TfrmConfiguracoes;
begin
  Configuracoes := TfrmConfiguracoes.Create(self);

  Configuracoes.ShowModal;
end;

procedure TfrmPrincipal.btnConsultaHorasExtrasClick(Sender: TObject);
var
  ConsultaHorasExtras : TfrmConsultaHorasExtras;
begin
  ConsultaHorasExtras := TfrmConsultaHorasExtras.Create(self);

  ConsultaHorasExtras.ShowModal;
end;

procedure TfrmPrincipal.btnRelatorioPontoClick(Sender: TObject);
var
  RelatorioPonto : TfrmRelatorioPonto;
begin
  if (cdsConfig.FieldByName('nome').AsString <> '') and
     (cdsConfig.FieldByName('funcao').AsString <> '') then
  begin
    RelatorioPonto := TfrmRelatorioPonto.Create(Self);

    RelatorioPonto.ShowModal;
  end
  else
    showmessage('Campos de configuração incompletos. Preencha corretamente os campos antes de imprimir.');
end;

end.
