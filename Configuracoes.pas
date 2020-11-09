unit Configuracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmConfiguracoes = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    edtFuncao: TEdit;
    btnGravar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

uses Principal, DB, DBClient;

{$R *.dfm}

procedure TfrmConfiguracoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmConfiguracoes.FormCreate(Sender: TObject);
begin
  if (frmPrincipal.cdsConfig.RecordCount = 0) then
  begin
    frmPrincipal.cdsConfig.Insert;

    frmPrincipal.cdsConfig.FieldByName('nome').AsString := '';
    frmPrincipal.cdsConfig.FieldByName('funcao').AsString := '';

    frmPrincipal.cdsConfig.Post;

    frmPrincipal.cdsConfig.SaveToFile(frmPrincipal.strConfig,dfXML);
  end
  else
  begin
    edtNome.Text := frmPrincipal.cdsConfig.FieldByName('nome').AsString;
    edtFuncao.Text := frmPrincipal.cdsConfig.FieldByName('funcao').AsString;
  end;
end;

procedure TfrmConfiguracoes.btnGravarClick(Sender: TObject);
begin
  frmPrincipal.cdsConfig.Edit;

  frmPrincipal.cdsConfig.FieldByName('nome').AsString := edtNome.Text;
  frmPrincipal.cdsConfig.FieldByName('funcao').AsString := edtFuncao.Text;

  frmPrincipal.cdsConfig.Post;

  frmPrincipal.cdsConfig.SaveToFile(frmPrincipal.strConfig,dfXML);
end;

end.
