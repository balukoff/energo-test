unit bar_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls;

type
  Tbar = class(TForm)
    Gauge1: TGauge;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bar: Tbar;

implementation

{$R *.dfm}

procedure Tbar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action:=caFree;
end;

end.
