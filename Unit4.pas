unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids, unit7;

type
  TForm4 = class(TForm)
    ds1: TDataSource;
    dbgrd1: TDBGrid;
    btn1: TBitBtn;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    edt1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    F7: TForm7;
  end;

var
  Form4: TForm4;
  Name: String;
  id: Integer;
  operation: string;
  product_id : integer;
implementation
  uses Unit1, unit5, unit2;
{$R *.dfm}

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action := caFree;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
 ADOQuery1.ConnectionString := unit1.conn_str;
 ADOQuery1.SQL.Add('select * from Products');
 ADOQuery1.Active := true;
end;

procedure TForm4.btn4Click(Sender: TObject);
begin
 unit2.F5.edt1.Text := Trim(ADOQuery1.Fields.Fields[1].AsString);
 unit2.Product_id := ADOQuery1.Fields.Fields[0].AsString;
 unit2.F5.lbl3.Caption := 'Цена товара: '+ADOQuery1.Fields.Fields[2].AsString;
 Self.Close;
end;

procedure TForm4.btn2Click(Sender: TObject);
var result: Integer;
begin
if (MessageDlg('Действительно удалить товар?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
 ADOQuery2.ConnectionString := unit1.conn_str;
 ADOQuery2.SQL.Clear;
 ADOQuery2.SQL.Add('exec deleteProduct @ProductID = :ProductID');
 with ADOQuery2.Parameters do begin
  Clear;
  addParameter.name:='ProductID';
  ParamByName('ProductID').DataType:=ftInteger;
  ParamByName('ProductID').Value := trim(Adoquery1.Fields.Fields[0].asString);
 end;
  result := ADOQuery2.ExecSQL;
  if (result = 1) then begin
   with ADOQuery1 do begin
    Active := false;
    Active := true;
   end;
  end else
  ShowMessage('Ошибка при удалении товара');
 end;
end;

procedure TForm4.btn1Click(Sender: TObject);
begin
 F7 := TForm7.Create(Application);
 operation := 'add';
 F7.Show();
end;

procedure TForm4.btn3Click(Sender: TObject);
begin
 F7 := TForm7.Create(Application);
 operation := 'edit';
 F7.edt1.Text := ADOQuery1.Fields.Fields[1].AsString;
 F7.edt2.Text := ADOQuery1.Fields.Fields[2].AsString;
 product_id := ADOQuery1.Fields.Fields[0].AsInteger;
 F7.Show();

end;

procedure TForm4.FormShow(Sender: TObject);
begin
 edt1.SetFocus;
end;

procedure TForm4.edt1KeyPress(Sender: TObject; var Key: Char);
begin
 with ADOQuery1 do begin
  Active := false;
  Sql.Clear;
  SQL.Add('select * from Products where Name like ''%'+trim(edt1.Text)+'%''');
  Active := true;
 end;
end;

end.
