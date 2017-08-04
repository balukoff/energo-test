unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm6 = class(TForm)
    edt1: TEdit;
    btn1: TBitBtn;
    ADOQuery1: TADOQuery;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;


implementation
  uses Unit1, unit3;
{$R *.dfm}

procedure TForm6.btn1Click(Sender: TObject);
var result: Integer;
begin
if (trim(edt1.Text) = '') then begin
  ShowMessage('�� ��� ������ �������');
end;
 ADOQuery1.ConnectionString := unit1.conn_str;
 ADOQuery1.SQL.Add('exec addManager @Name = :Name');
 with ADOQuery1.Parameters do begin
  Clear;
  addParameter.name:='Name';
  ParamByName('Name').DataType:=ftString;
  ParamByName('Name').Value := trim(edt1.Text);
 end;
  result := ADOQuery1.ExecSQL;
  if (result = 1) then begin
   Self.Close;
   with unit1.F3.ADOQuery1 do begin
    Active := false;
    Active := true;
   end;
  end else
  ShowMessage('������ ��� ���������� ����������');

end;

end.
