unit CodeCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls,ShellAPI, ExtCtrls, Grids, ValEdit,StrUtils;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    Button1: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    beginTime: TDateTimePicker;
    endTime: TDateTimePicker;
    Label3: TLabel;
    Panel1: TPanel;
    isCheckOutCode: TCheckBox;
    svnProjectList: TMemo;
    GitProjectList: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure checkEnvironment();
  private
    function checkToolsArg(var svnLines:TStringList;var gitLines:TStringList):Boolean;
    function exeMain(var svnLines:TStringList;var gitLines:TStringList):Boolean;
    function ReversePos(SubStr, S: String): Integer;
    //function updateCode(var svnLines:TStringList;var gitLines:TStringList):Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{messageDlg ctrl+d}
procedure TForm1.checkEnvironment();
begin
// showMessage('��黷��');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  svnLines,gitLines:TStringList;
  svnCodeList,gitCodeList:string;
  //svnCodeArr,gitCodeArr:TStringDynArray;
  i:Integer;
  checkToolsArgResult:Boolean;
begin
   //���������л���
   checkEnvironment();

   svnCodeList:=svnProjectList.Lines.DelimitedText;
   svnLines := TStringList.Create;
   svnLines.CommaText := svnCodeList;

   gitCodeList:=GitProjectList.Lines.DelimitedText;
   gitLines := TStringList.Create;
   gitLines.CommaText := gitCodeList;
   checkToolsArgResult := False;
   
   //������
   checkToolsArgResult := checkToolsArg(svnLines,gitLines);

   if checkToolsArgResult then
   begin
      //ͳ�ƴ���
      exeMain(svnLines,gitLines);
   end;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
    svnProjectList.Clear;
    GitProjectList.Clear;
end;

function TForm1.checkToolsArg(var svnLines:TStringList;var gitLines:TStringList): Boolean;
var
  sinceTime,untilTime:TDateTime;
begin
   sinceTime:= beginTime.Date;
   untilTime:= endTime.Date;
   if sinceTime >= untilTime then
   begin
      MessageDlg('��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡', mtWarning, [mbOK], 0);
   end;
   if((svnLines.Count = 0) and (gitLines.Count = 0)) then
   begin
    MessageDlg('ͳ����Ŀ�����б�Ϊ�գ����飡', mtWarning, [mbOK], 0);
   end;
   Result:=True;
end;

function TForm1.exeMain(var svnLines, gitLines: TStringList): Boolean;
var
  flag,i,index:Integer;
  projectName,parame,codeFlag:string;
var
  sinceTime,untilTime:TDateTime;

begin
   codeFlag := '0';
   sinceTime:= beginTime.Date;
   untilTime:= endTime.Date;

   //SVN
   for i := 0 to svnLines.Count - 1 do
   begin
     //�ҳ����һ�γ���\��λ��
    index:=ReversePos('\',svnLines[i]);
    projectName:=Copy(svnLines[i],index+1,Length(svnLines[i]));
    //�Ƿ���´���
    if isCheckOutCode.Checked then
    begin
      codeFlag:='1';
    end;
    parame:=svnLines[i]+' '+projectName+' '+FormatDateTime('yyyy-MM-dd',sinceTime)+' '+FormatDateTime('yyyy-MM-dd',untilTime)+' '+ExtractFilePath(Application.Exename)+'result\' +' '+codeFlag;
    flag:=Shellexecute(handle,nil,pchar(ExtractFilePath(Application.Exename)+'bat\svnCodeCount.sh'),pchar(parame),nil,SW_HIDE);// sw_normal  SW_HIDE
    if flag < 32 then
    begin
     MessageDlg('ִ��SVNͳ�ƽű�ʧ�ܣ�', mtWarning, [mbOK], 0);
    end;
   end;

   //GIT
   for i := 0 to gitLines.Count - 1 do
   begin
    //�ҳ����һ�γ���\��λ��
    index:=ReversePos('\',gitLines[i]);
    projectName:=Copy(gitLines[i],index+1,Length(gitLines[i]));
    //�Ƿ���´���
    if isCheckOutCode.Checked then
    begin
      codeFlag:='1';
    end;
    parame:=gitLines[i]+' '+projectName+' '+FormatDateTime('yyyy-MM-dd',sinceTime)+' '+FormatDateTime('yyyy-MM-dd',untilTime)+' '+ExtractFilePath(Application.Exename)+'result\' +' '+codeFlag;
    flag:=Shellexecute(handle,nil,pchar(ExtractFilePath(Application.Exename)+'bat\gitCodeCount.sh'),pchar(parame),nil,SW_HIDE);// sw_normal  SW_HIDE
    if flag < 32 then
    begin
     MessageDlg('ִ��Gitͳ�ƽű�ʧ�ܣ�', mtWarning, [mbOK], 0);
    end;

   end;
end;
//�ַ����ֵ��±�
function TForm1.ReversePos(SubStr, S: String): Integer;
var
  i : Integer;
begin
  i := Pos(ReverseString(SubStr), ReverseString(S));
  if i > 0 then i := Length(S) - i - Length(SubStr) + 2;
  Result := i;
end;
end.
