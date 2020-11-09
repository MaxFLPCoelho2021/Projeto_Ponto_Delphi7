unit Calendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TfrmCalendario = class(TForm)
    Calendario: TMonthCalendar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CalendarioDblClick(Sender: TObject);
    procedure CalendarioEnter(Sender: TObject);
  private
    { Private declarations }
  public
    Data : string;
    { Public declarations }
  end;

var
  frmCalendario: TfrmCalendario;

implementation

{$R *.dfm}

procedure TfrmCalendario.FormCreate(Sender: TObject);
begin
  Data := '';
end;

procedure TfrmCalendario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Data := DateToStr(Calendario.Date);
end;

procedure TfrmCalendario.CalendarioDblClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCalendario.CalendarioEnter(Sender: TObject);
begin
  Close;
end;

end.
