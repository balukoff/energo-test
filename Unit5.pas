unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, unit4, unit3, DB, ADODB;

type
  TForm5 = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    btn1: TSpeedButton;
    edt2: TEdit;
    btn2: TSpeedButton;
    lbl3: TLabel;
    btn3: TBitBtn;
    ADOQuery2: TADOQuery;
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    F4: TForm4;
    F3: TForm3;
  end;

var
  Form5: TForm5;

  implementation
  uses unit1, unit2;
{$R *.dfm}


procedure TForm5.btn1Click(Sender: TObject);
begin
 F4 := TForm4.Create(Application);
 F4.btn1.Visible := False;
 F4.btn2.Visible := False;
 F4.btn3.Visible := False;
 F4.btn4.Visible := true;
 F4.Show();
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action := caFree;
end;

procedure TForm5.btn2Click(Sender: TObject);
begin
 F3 := TForm3.Create(Application);
 F3.btn1.Visible := False;
 F3.btn2.Visible := False;
 F3.btn3.Visible := False;
 F3.btn4.Visible := true;
 F3.Show();
end;

procedure TForm5.btn3Click(Sender: TObject);
var result: Integer;
begin
 if ((Trim(edt1.Text) = '') or (Trim(edt2.text) = '')) then
 begin
   ShowMessage('Ошибка ввода данных');
   Exit;
 end;
 ADOQuery2.ConnectionString := unit1.conn_str;
 ADOQuery2.SQL.Clear;
 ADOQuery2.SQL.Add('exec SaleInsert @ManagerId = :ManagerID, @ProductId = :ProductID');
 with ADOQuery2.Parameters do begin
  Clear;
  addParameter.name:='ManagerID';
  ParamByName('ManagerID').DataType:=ftInteger;
  ParamByName('ManagerID').Value := trim(unit2.manager_id);
  addParameter.name:='ProductID';
  ParamByName('ProductID').DataType:=ftInteger;
  ParamByName('ProductID').Value := trim(unit2.product_id);
 end;
  ShowMessage('manager_id = '+unit2.manager_id+' product_id = '+unit2.product_id);
  result := ADOQuery2.ExecSQL;
 // ShowMessage(IntToStr(result));
  if (result = 1) then begin
   Self.close;
   with unit1.F2.ADOQuery1 do
   begin
    Active := false;
    Active := true;
   end;
  end; 
end;

end.
