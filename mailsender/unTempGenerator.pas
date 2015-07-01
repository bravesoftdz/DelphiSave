unit unTempGenerator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TTempGenerator = class(TComponent)
  private
    { Private declarations }
    NumUsed:Word;
    FUseTempDir,FAutoDel:Boolean;
    Used:Array[1..50] Of String[255];
  protected
    { Protected declarations }
  public
    { Public declarations }
    Constructor Create(AOwner:TComponent); Override;
	 Function NewTemp:String;
    Destructor Destroy; Override;
  published
    { Published declarations }
    Property UseTempDir:Boolean Read FUseTempDir Write FUseTempDir Default True;
    Property AutoDelete:Boolean Read FAutoDel Write FAutoDel Default True;
  end;

procedure Register;

Var
	TempDir:String;

implementation

procedure Register;
begin
  RegisterComponents('Vision Logik', [TTempGenerator]);
end;

Constructor TTempGenerator.Create(AOwner:TComponent);
Begin
	Inherited Create(AOwner);
	NumUsed:=0;
   FAutoDel:=True;
   FUseTempDir:=True;
End;

Function TTempGenerator.NewTemp:String;
Var
	N:String;
   C:Word;
   F:File;
Begin
	If NumUsed=50 Then
   Begin
		NewTemp:='';
      Exit;
   End;
	If FUseTempDir Then
   	N:=TempDir
	Else
   	N:='';
	C:=0;
   Repeat
   	Inc(C);
   Until Not FileExists(N+'~TG'+IntToStr(C)+'.TMP');
   N:=N+'~TG'+IntToStr(C)+'.TMP';
   Inc(NumUsed);
	Used[NumUsed]:=N;
   NewTemp:=N;
	{$I-}
   AssignFile(F,N);
	Rewrite(F,1);
   CloseFile(F);
   {$I+}
End;

Destructor TTempGenerator.Destroy;
Var
	C:Word;
   F:File;
Begin
	If Not FAutoDel Then
   	Exit;
	For C:=1 To NumUsed Do
   Begin
      {$I-}
		AssignFile(F,Used[C]);
		Erase(F);
      If IOResult>0 Then ;
      {$I+}
   End;
   Inherited Destroy;
End;

Var
	Env:Array[0..25] Of Char;
	Tmp:Array[0..255] Of Char;
   R:Word;
Initialization
	Env:='REPOSITORIO_MAILS';
	TempDir:='';
   R:=GetEnvironmentVariable(Env,Tmp,255);
   If (R=0) Or (R>255) Then
		Exit;
   TempDir:=Tmp;
   If Copy(TempDir,Length(TempDir),1)<>'\' Then
   	TempDir:=TempDir+'\';
end.

