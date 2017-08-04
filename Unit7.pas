unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm7 = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    edt2: TEdit;
    btn1: TBitBtn;
    ADOQuery2: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation
  uses Unit1, unit4;
{$R *.dfm}

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TForm7.btn1Click(Sender: TObject);
var result: Integer;
var proc : string;
begin
 ADOQuery2.ConnectionString := unit1.conn_str;
 ADOQuery2.SQL.Clear;
 if (unit4.operation = 'add') then
  proc := 'exec addProduct @Name = :Name, @Price = :Price'
 else
  proc := 'exec editProduct @Name = :Name, @Price = :Price, @ProductID = :ProductID';

 ADOQuery2.SQL.Add(proc);
 with ADOQuery2.Parameters do begin
   Clear;
   addParameter.name:='Name';
   ParamByName('Name').DataType:=ftString;
   ParamByName('Name').Value := Trim(edt1.Text);
   addParameter.name:='Price';
   ParamByName('Price').DataType:=ftFloat;
   ParamByName('Price').Value := Trim(edt2.Text);
  if (unit4.operation = 'edit') then begin
   addParameter.name:='ProductID';
   ParamByName('ProductID').DataType:=ftInteger;
   ParamByName('ProductID').Value := unit4.product_id
  end;


 end;
 result := ADOQuery2.ExecSQL;
 if (result = 1) then begin
  Self.Close;
  unit1.F4.ADOQuery1.Active := false;
  unit1.F4.ADOQuery1.Active := true;
 end;

end;

end.
