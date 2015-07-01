{ SOAP WebModule }
unit unSyncSrv;

interface

uses
  SysUtils, Classes, HTTPApp, DB, ADODB, unLogs, InvokeRegistry, WSDLIntf,
  TypInfo, WebServExp, WSDLBind, XMLSchema, WSDLPub, SOAPPasInv,
  SOAPHTTPPasInv, SOAPHTTPDisp, WebBrokerSOAP, Types, windows;



type
  TdmWebModuleSincronizacion = class(TWebModule)
    HTTPSoapDispatcher1: THTTPSoapDispatcher;
    HTTPSoapPascalInvoker1: THTTPSoapPascalInvoker;
    WSDLHTMLPublish1: TWSDLHTMLPublish;

    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
    procedure WebModuleException(Sender: TObject; E: Exception;
      var Handled: Boolean);
    procedure HTTPSoapPascalInvoker1ExceptionEvent(
      const MethodName: String; const Request, Response: TStream);
  private
    procedure LogMessage(Message: String; EventType: DWord; Category: Word; ID: DWord);
  public

  end;

var
  dmWebModuleSincronizacion: TdmWebModuleSincronizacion;

implementation

uses WebReq;

{$R *.dfm}

procedure TdmWebModuleSincronizacion.LogMessage(Message: String;
  EventType: DWord; Category: Word; ID: DWord);
var
  P: Pointer;
  FEventLog : LongWord;
begin
  P := PChar(Message);
  FEventLog := windows.RegisterEventSource(nil, PChar('Synsrv')); // <- blows up here
  if FEventLog = 0 then
  begin
    Raise exception.Create('Event logging error: ' + SysErrorMessage(getLastError));
  end;
  if not ReportEvent(FEventLog, EventType, Category, ID, nil, 1, 0, @P, nil) then
    raiseLastOSError;
end;

procedure TdmWebModuleSincronizacion.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WSDLHTMLPublish1.ServiceInfo(Sender, Request, Response, Handled);
end;

procedure TdmWebModuleSincronizacion.WebModuleCreate(Sender: TObject);
begin
// 	dmPrincipal := TdmPrincipal.Create(self);
end;

procedure TdmWebModuleSincronizacion.WebModuleDestroy(Sender: TObject);
begin
// 	dmPrincipal.Free;
end;

procedure TdmWebModuleSincronizacion.WebModuleException(Sender: TObject;
  E: Exception; var Handled: Boolean);
begin
  LogMessage('Error General - ' + E.Message, EVENTLOG_ERROR_TYPE,0,0);
end;

procedure TdmWebModuleSincronizacion.HTTPSoapPascalInvoker1ExceptionEvent(
  const MethodName: String; const Request, Response: TStream);
begin
  LogMessage('Error Event - MethodName:' + MethodName, EVENTLOG_ERROR_TYPE,0,0);
end;

initialization
  WebRequestHandler.WebModuleClass := TdmWebModuleSincronizacion;


end.
