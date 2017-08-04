unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, Buttons, ADODB, Unit6;

type
  TForm3 = class(TForm)
    ds1: TDataSource;
    dbgrd1: TDBGrid;
    btn1: TBitBtn;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  F6: TForm6;

implementation
  uses Unit1, unit2;



{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
 ADOQuery1.ConnectionString := unit1.conn_str;
 ADOQuery1.SQL.Add('select * from Manager');
 ADOQuery1.Active := true;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action := caFree;
end;

procedure TForm3.btn1Click(Sender: TObject);
begin
 F6 := TForm6.Create(Application);
 F6.Show();
end;

procedure TForm3.btn2Click(Sender: TObject);
var result : Integer;
begin
 if (MessageDlg('Действительно удалить сотрудника?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
 ADOQuery2.ConnectionString := unit1.conn_str;
 ADOQuery2.SQL.Clear;
 ADOQuery2.SQL.Add('exec deleteManager @ManagerID = :ManagerID');
 with ADOQuery2.Parameters do begin
  Clear;
  addParameter.name:='ManagerID';
  ParamByName('ManagerID').DataType:=ftInteger;
  ParamByName('ManagerID').Value := trim(Adoquery1.Fields.Fields[0].asString);
 end;
  result := ADOQuery2.ExecSQL;
  if (result = 1) then begin
   with ADOQuery1 do begin
    Active := false;
    Active := true;
   end;
  end else
  ShowMessage('Ошибка при удалении сотрудника');
 end; 
end;

procedure TForm3.btn4Click(Sender: TObject);
begin
 unit2.F5.edt2.Text := Trim(ADOQuery1.Fields.Fields[1].AsString);
 unit2.manager_id := ADOQuery1.Fields.Fields[0].AsString;
 Self.Close;

 end;

procedure TForm3.btn3Click(Sender: TObject);
begin
 F6 := TForm6.Create(Application);
 F6.edt1.Text := Trim(ADOQuery1.Fields.Fields[1].AsString);
 unit2.manager_id := ADOQuery1.Fields.Fields[0].AsString;
 F6.Show();
end;

end.
