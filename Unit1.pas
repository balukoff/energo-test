unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, iniFiles, Unit2, Unit3, Unit4;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FileName,UserName_p,UserName,Server_p,Server, Password_p,Password, Basa_p,Basa, conn_str, path:string;
  IniFile:TIniFile;
  F3:TForm3;
  F4:TForm4;
  F2: TForm2;
  
implementation
   uses Unit23;
{$R *.dfm}

procedure TForm1.N3Click(Sender: TObject);
begin
 Toptions.Create(Application);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 F2 := TForm2.Create(Application);
 F2.Show();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  path:=ExtractFilePath(Application.ExeName)+'img\';
  decimalseparator:=',';
  FileName:=ExtractFilePath(Application.ExeName)+'Baza.ini';
  IniFile:=TInifile.Create(FileName);
  UserName_p:=IniFile.ReadString('Connect','UserName',UserName);
  Server_p:=IniFile.ReadString('Connect','Server',Server);
  Password_p:=IniFile.ReadString('Connect','Password',Password);
  Basa_p:=IniFile.ReadString('Connect','Basa',Basa);
  if IniFile.ReadString('connect','nt_auth','')='0' then
  conn_str:='Provider=SQLOLEDB.1;Password='+Password_p+';Persist Security Info=True;User ID='+UserName_p+
                              ';Initial Catalog='+Basa_p+';Data Source='+Server_p
  else
  conn_str:='Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog='+
            Basa_p+';Data Source='+Server_p;
  iniFile.Free;

end;

procedure TForm1.N4Click(Sender: TObject);
begin
 F3:= TForm3.Create(Application);
 F3.Show();
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  F4:=TForm4.Create(Application);
  F4.Show();
end;

end.
