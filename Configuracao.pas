unit Configuracao;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.dfm}

end.
