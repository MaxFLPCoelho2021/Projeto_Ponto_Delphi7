program Ponto;

uses
  Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  RegistrarPonto in 'RegistrarPonto.pas' {frmRegistrarPonto},
  ConsultaHorasExtras in 'ConsultaHorasExtras.pas' {frmConsultaHorasExtras},
  RelatorioPonto in 'RelatorioPonto.pas' {frmRelatorioPonto},
  Relatorio in 'Relatorio.pas' {frmRelatorio},
  Configuracoes in 'Configuracoes.pas' {frmConfiguracoes},
  Calendario in 'Calendario.pas' {frmCalendario};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Marcação individual de ponto';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
