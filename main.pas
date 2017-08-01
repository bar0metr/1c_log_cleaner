unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Process;

type

  { Tmainform }

  Tmainform = class(TForm)
    logoff_cb: TCheckBox;
    clean1c_btn: TButton;
    users: TComboBox;
    Label1: TLabel;
    PageControl1: TPageControl;
    Status: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure clean1c_btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure usersChange(Sender: TObject);
  private

  public
    Function Clean1C(logoff: boolean):integer;
    Function Log_Off(user: string):integer;
  end;

var
  mainform: Tmainform;
  SR: TSearchRec;
  FindRes: Integer;
  patch: string;
  selected: boolean=false;
implementation

{$R *.frm}

{
var
   AProcess: TProcess;
   params: TStrings;
begin
  AProcess:= TProcess.Create(nil);
  AProcess.Executable := '"'+includetrailingbackslash(extractfilepath(application.ExeName))+'log_off.bat" '+users.text;
  AProcess.Options := AProcess.Options + [poWaitOnExit, poUsePipes];
  AProcess.Options := AProcess.Options + [poNoConsole];
  AProcess.Execute;
  AProcess.Free;

}

{ Tmainform }
function Tmainform.Log_Off(user: string):integer;
var
   AProcess: TProcess;
begin
  AProcess:= TProcess.Create(nil);
  AProcess.Executable := '"'+includetrailingbackslash(extractfilepath(application.ExeName))+'log_off.bat" '+user;
  AProcess.Options := AProcess.Options + [poWaitOnExit, poUsePipes];
  AProcess.Options := AProcess.Options + [poNoConsole];
  result:= AProcess.ExitStatus;
  AProcess.Execute;
  AProcess.Free;
end;

function Tmainform.Clean1C(logoff:boolean):integer;
var
  a,b,c: boolean;
begin
   patch:= 'C:\Users\'+users.Items[users.ItemIndex]+'\AppData\';
   status.Panels[1].Text:='Local\1c\1cv8...';
   a:= Deletedirectory(patch+'Local\1c\1cv8',false);
   status.Panels[1].Text:='Local\Temp...';
   b:= Deletedirectory(patch+'Local\Temp',true);
   status.Panels[1].Text:='Roaming\1c\1cv8...';
   c:= Deletedirectory(patch+'Roaming\1c\1cv8',false);

   if (a=true) and (b=true) and (c=true) then
   begin
      status.Panels[1].Text:='Чистка закончена!';
      result:= 0
   end
   else
   begin
      status.Panels[1].Text:='Ошибка при чистке одного из каталогов!';
      result:= 1;
   end;

   users.Text:='';
   selected:= false;
end;


procedure Tmainform.clean1c_btnClick(Sender: TObject);
begin
  if not selected then
  begin
    status.Panels[1].Text:='Не выбран пользователь!';
    exit;
  end;

  if logoff_cb.Checked then
  log_off(users.text);

  status.Panels[1].Text:='Начинаю чистку...';
  mainform.Clean1C(false);



end;

procedure Tmainform.Button1Click(Sender: TObject);
begin

end;

procedure Tmainform.Button2Click(Sender: TObject);
begin
end;

procedure Tmainform.FormCreate(Sender: TObject);
begin
  users.Clear;
  FindRes := FindFirst('c:\\users\\*.*', faDirectory, SR);

  while FindRes = 0 do
  begin
    users.Items.Add(SR.Name);
    FindRes := FindNext(SR);
  end;
  sysutils.FindClose(SR);
end;

procedure Tmainform.usersChange(Sender: TObject);
begin
  selected:= true;
end;

end.

