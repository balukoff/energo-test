unit Unit23;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Inifiles, uEncrypt, shellapi, adodb,
  DB, modules;

type
  Toptions = class(TForm)
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Edit4: TEdit;
    Label13: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label16: TLabel;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  options: Toptions;
  base:string;
implementation
    uses unit1;
{$R *.dfm}



procedure Toptions.Edit4Exit(Sender: TObject);
begin
// if trim(edit4.Text)=isvesenie.Server_p then ComboBox1Change(nil);
end;

procedure Toptions.BitBtn1Click(Sender: TObject);
var pass,filename:string;
    inifile:TInifile;
begin
  FileName:=ExtractFilePath(Application.ExeName)+'config.ini';
  try
  begin
   IniFile:=TInifile.Create(FileName);
   IniFile.WriteString('connect','basa',combobox1.Text);
   IniFile.WriteString('connect','server',edit4.Text);
   if radiobutton1.Checked=true then
   IniFile.WriteString('connect','nt_auth','1') else
   begin
    IniFile.WriteString('connect','username',edit6.Text);
    IniFile.WriteString('connect','password',edit7.Text);
    IniFile.WriteString('connect','nt_auth','0');
   end;
   iniFile.Free;
   self.FormStyle:=fsNormal;
  ShowMessage('Параметры записаны успешно!!');
  end
  except
  on E:Exception do
   begin
   //options.FormStyle:=fsNormal;
   MessageDlg('Ошибка записи параметров!',mtError,[mbOk],0);
   exit;
  end;
 end;

end;

procedure Toptions.FormCreate(Sender: TObject);
var index:word;
begin
  FileName:=ExtractFilePath(Application.ExeName)+'Baza.ini';
  IniFile:=TInifile.Create(FileName);
  edit4.Text:=IniFile.ReadString('connect','server','');
  edit6.Text:=IniFile.ReadString('connect','username','');
  edit7.Text:=IniFile.ReadString('connect','password','');
  base:=IniFile.ReadString('connect','Basa','');
  if IniFile.ReadString('connect','nt_auth','')='0' then
   radiobutton2.Checked:=true else
   begin
    radiobutton1.Checked:=true;
    edit6.Enabled:=false;
    edit7.Enabled:=false;
   end;

  if base<>'' then
   try
    ComboBox1Change(nil);
    index:=Combobox1.Items.IndexOf(base);
    combobox1.ItemIndex:=index;
   except
    MessageDlg('Ошибка подключения',mtError,[mbOk],0);
    exit;
    combobox1.Items.Add(base);
    combobox1.ItemIndex:=Combobox1.Items.IndexOf(base);
   end;

   if combobox1.Items.Count<>0 then
   begin
    ComboBox1Change(nil);
    combobox1.ItemIndex:=combobox1.Items.IndexOf(base);
   end;
   iniFile.Free;
end;


procedure Toptions.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure Toptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action:=caFree;
end;

procedure Toptions.RadioButton1Click(Sender: TObject);
begin
if radiobutton1.Enabled=true then
 begin
  edit6.Enabled:=false;
  edit7.Enabled:=false;
 end
 else
 begin
  edit6.Enabled:=true;
  edit7.Enabled:=true;
 end;

end;

procedure Toptions.RadioButton2Click(Sender: TObject);
begin
if radiobutton2.Enabled=true then
 begin
  edit6.Enabled:=true;
  edit7.Enabled:=true;
 end
 else
 begin
  edit6.Enabled:=false;
  edit7.Enabled:=false;
 end;

end;

procedure Toptions.ComboBox1Change(Sender: TObject);
var q:TADOQuery;
    conn_str:string;
begin
 q:=TADOquery.Create(nil);
  FileName:=ExtractFilePath(Application.ExeName)+'Baza.ini';

  if radiobutton1.Checked <> true then
  conn_str:='Provider=SQLOLEDB.1;Password='+edit7.Text+';Persist Security Info=True;User ID='+edit6.Text+
                              ';Data Source='+edit4.Text
  else
  conn_str:='Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Data Source='+trim(edit4.Text);
 with q do
 begin
  ConnectionString:=conn_str;
  with SQL do
  begin
   Clear;
   Add('select * from sys.databases where state_desc='+quotedstr('ONLINE'));
  end; 
  Active:=true;
 end;
 combobox1.Items.Clear;
 while not q.Eof do
 begin
  combobox1.Items.Add(q.fieldbyname('name').AsString);
  q.Next;
 end;
 q.Close;
 q.Free;
end;


procedure Toptions.SpeedButton1Click(Sender: TObject);
begin
 ComboBox1Change(nil);
end;

end.
