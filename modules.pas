unit modules;

interface

uses
  Windows, SysUtils, Variants, Classes, StdCtrls,
  AdoDb, SHFolder, dateutils, forms, controls,
  Dialogs, Menus, jpeg, graphics,EXTCTRLS, db, comctrls, winsock, bar_, shellapi, comobj;


 const
     xlEdgeBottom=9;
     xlDouble=1;
     xlEdgeTop=8;
     xlEdgeLeft=7;
     xlEdgeRight=10;

   type
    TRecID = class
     ID: integer
    end;

    {----------------------------}

   TSepArr = array of string;
   TSepRec = record
    Rec: TSepArr; // сами "записи"
    Max: integer; // количество полученных "записей"
  end;
 procedure reload();
 function Lighter(Color:TColor; Percent:Byte):TColor;
 function request(sql__:string;field:string):string;
 function ReplaceStr(const S, Srch, Replace: string): string;
 function ui_request(sql__:string):boolean;
 function GetSpecialFolderPath(folder : integer) : string;
 function GetSeparatorRec(const sRows: string;
  cSeparator: char = ','): TSepRec;
 procedure borders(sheet:Variant;cell1:string;cell2:string);
 function FindGlobalComp (const tag: integer): boolean;
 function QTrim(source:string):string;
 function FindInNodes(TNode:TTreeView;id:integer):TTreeNode;
 function CreateWord(const Visible: boolean):Variant;
 function ParceFileExt(fname:string):string;
 
 implementation
 uses unit1;


function ParceFileExt(fname:string):string;
var i:byte;
var r:string;
begin
 r:='';
 for i:=length(fname) downto 1 do
 begin
  if fname[i]<>'.' then
  r:=fname[i]+r else
  begin
   result:=r;
   break;

  end;
 end;

end;


function CreateWord(const Visible: boolean):Variant;
var v:Variant;
begin
  v:=CreateOleObject('Word.Application');
  v.Visible:=Visible;
  result:=v;
end;


function Lighter(Color:TColor; Percent:Byte):TColor;
var r, g, b: Byte;
  begin
   Color:=ColorToRGB(Color);
   r:=GetRValue(Color);
   g:=GetGValue(Color);
   b:=GetBValue(Color);
   r:=r+muldiv(255-r,Percent,100); //процент% увеличения яркости
   g:=g+muldiv(255-g,Percent,100);
   b:=b+muldiv(255-b,Percent,100);
   result:=RGB(r,g,b);
end;

function FindGlobalComp (const tag: integer): boolean;
var
  I, J, InitCount: Integer;
  Form, Comp: TComponent;
  s:TComponentStyle;
begin
//  InitCount := List.Count;
  for I := 0 to Screen.FormCount - 1 do
  begin
    Form := Screen.Forms[I];
    if tag = Form.tag then
    try
     Tform(form).Close;
     result:=true;
//     MessageDlg('')
    except
     result:= false;
    end;
    for J := 0 to Form.ComponentCount - 1 do
    begin
      Comp := Form.Components [J];
      if tag = Comp.tag then
      try
       if comp is TMenuItem then
       begin
        TMenuItem(comp).Enabled:=false;
        result:=true;
        exit;
       end else
       begin
       if TControl(comp).Enabled=true then TControl(comp).Enabled:=false;
       result:=true;
       exit;
       end;
      except
       result:= false;
      end;
    end;
 end;
end;



function GetSeparatorRec(const sRows: string;
  cSeparator: char = ','): TSepRec;
var
  cCol: array of integer;
  i, j: integer;
  bSTRING: boolean;
begin
  Result.Max := -1;

  j := 1;
  bSTRING := False;
  SetLength(cCol, j);
  cCol[0] := 0;
  for i := 1 to Length(sRows) do
  begin
    if sRows[i] = '"' then
      bSTRING := not bSTRING;
    if (sRows[i] = cSeparator) and (not bSTRING) then
    begin
      j := j + 1;
      SetLength(cCol, j);
      cCol[j - 1] := i;
    end;
  end;
  j := j + 1;
  SetLength(cCol, j);
  cCol[j - 1] := Length(sRows) + 1;

  Result.Max := High(cCol);
  if Result.Max > 0 then
  begin
    SetLength(Result.Rec, Result.Max + 1);
    Result.Rec[0] := IntToStr(Result.Max);
    for i := 1 to Result.Max do
      Result.Rec[i] := Copy(sRows, cCol[i - 1] + 1, cCol[i] - cCol[i - 1] - 1);
  end;

end;


procedure borders(sheet:Variant;cell1:string;cell2:string);
begin
     sheet.range[cell1,cell2].Borders[xlEdgeBottom].LineStyle:=xlDouble;
     sheet.range[cell1,cell2].Borders[xlEdgeTop].LineStyle:=xlDouble;
     sheet.range[cell1,cell2].Borders[xlEdgeLeft].LineStyle:=xlDouble;
     sheet.range[cell1,cell2].Borders[xlEdgeRight].LineStyle:=xlDouble;
end;



function QTrim(source:string):string;   //Возврашает обрезанную строку в кавычках
begin
 result:=quotedstr(trim(source));
end;

function request(sql__:string;field:string):string;
var q:TAdoQuery;
begin
 q:=TAdoQuery.Create(nil);
 q.ConnectionString:=conn_str;
 q.sql.Clear;
 q.SQL.Add(sql__);
 try
  q.Active:=true;
  result:=q.FieldByName(field).AsString;
 except
  result:='';
 end;
  q.Close;
  q.Free;
end;

function ReplaceStr(const S, Srch, Replace: string): string;
var
 I:Integer;
 Source:string;
begin
 Source:= S;
 Result:= '';
 repeat
  I:=Pos(Srch, Source);
  if I > 0 then begin
   Result:=Result+Copy(Source,1,I-1)+Replace;
   Source:=Copy(Source,I+Length(Srch),MaxInt);
  end else Result:=Result+Source;
 until I<=0;
end;


procedure Exec(const FileName, Parameters, Directory: string);
var
//  h:HWND;
  Operation: string;
begin
  Operation := 'open';
  ShellExecute(Windows.GetForegroundWindow,PChar(Operation), PChar(FileName), PChar(Parameters), PChar(Directory), SW_SHOWNORMAL);
end;


procedure reload();
var FExe : string;
begin
 FExe:=ParamStr(0);
// if form1<>nil then
// form1.Hide;
 Exec(FExe,'',ExtractFilePath(FExe));
 Application.Terminate;
end;


function ui_request(sql__:string):boolean;
var q:TADOQuery;
begin
 q:=TAdoQuery.Create(nil);
 q.ConnectionString:=conn_str;
 q.sql.Clear;
 q.SQL.Add(sql__);
 try
 begin
  with q do
  begin
   ExecSQL;
   Close;
   Free;
  end; 
 end
 except
  result:=false;
  exit;
 end;
 result:=true;
end;

function GetSpecialFolderPath(folder : integer) : string;
const SHGFP_TYPE_CURRENT = 0;
var path: array [0..MAX_PATH] of char;
begin
  if SUCCEEDED(SHGetFolderPath(0,folder,0,SHGFP_TYPE_CURRENT,@path[0])) then Result := path else Result:='';
end;

function FindInNodes(TNode:TTreeView;id:integer):TTreeNode;
  var node:TTreeNode;
  var searching:boolean;
  var s:string;
  var k:TRecId;
  var counter:integer;
  begin
   counter:=0;
   Node := TNode.Items[counter];
   Searching := true;
   while (Searching) and (TNode.Items.Count <> counter) do
  begin
//   s:=TrecId.Create;
   k:=TRecId(Node.Data);
   if k.ID = id then
  begin
    Searching := False;
    result:=Node;
  end
  else
  begin
    inc(counter);
    if counter = TNode.Items.Count then break;
    Node := TNode.Items[counter]
  end;
end;
end;


end.
