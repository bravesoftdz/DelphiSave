Unit undmWebService;

interface

uses SysUtils, Classes, InvokeRegistry, Midas, SOAPMidas, SOAPDm;

type
  IWebService = interface(IAppServerSOAP)
    ['{EB56BD7A-DF2D-43D9-8FEC-AC73E9FBAC09}']
  end;

  TWebService = class(TSoapDataModule, IWebService, IAppServerSOAP, IAppServer)
  private
  
  public
  
  end;

implementation

{$R *.DFM}

procedure TWebServiceCreateInstance(out obj: TObject);
begin
 obj := TWebService.Create(nil);
end;

initialization
   InvRegistry.RegisterInvokableClass(TWebService, TWebServiceCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IWebService));
end.
