unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, Buttons, Unit5;

type
  TForm2 = class(TForm)
    ADOQuery1: TADOQuery;
    dbgrd1: TDBGrid;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    ds1: TDataSource;
    ADOQuery2: TADOQuery;
    btn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  F5: TForm5;
  Product_id, manager_id: string;

implementation
  uses Unit1;
  
{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action := caFree;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 ADOQuery1.ConnectionString := unit1.conn_str;
 ADOQuery1.SQL.Add('select * from GetSales()');
 ADOQuery1.Active := True;
end;

procedure TForm2.btn3Click(Sender: TObject);
var result:Integer;
begin
if (MessageDlg('Удалить продажу?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
begin
 ADOQuery2.ConnectionString := unit1.conn_str;
 ADOQuery2.SQL.Clear;
 ADOQuery2.SQL.Add('exec deleteSale @SaleId = :saleId');
 with ADOQuery2.Parameters do begin
  Clear;
  addParameter.name:='saleId';
  ParamByName('saleId').DataType:=ftInteger;
  ParamByName('saleId').Value := Adoquery1.Fields.Fields[0].asString;
 end;
 result := ADOQuery2.ExecSQL;
 if (result = 1) then
 begin
   ADOQuery1.Active := false;
   ADOQuery1.Active := true;
   ADOQuery2.Close;
  end;
end;

end;

procedure TForm2.btn1Click(Sender: TObject);
begin
 F5 := TForm5.Create(Application);
 F5.Show();
end;

end.
