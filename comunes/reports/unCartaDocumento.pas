unit unCartaDocumento;

{.$DEFINE CD_ROWING}
{.$DEFINE CD_BONAERENSE}
{$DEFINE CD_ARGENTINO}

interface

uses
  {$IFDEF CD_ROWING}
  unRptCartDocRowingHeader,
  unRptCartDocRowing
  {$ENDIF}

  {$IFDEF CD_BONAERENSE}
  unRptCartDocBonHeader,
  unRptCartDocBonaerense
  {$ENDIF}

  {$IFDEF CD_ARGENTINO}
  unRptCartDocCorreoArgentinoHeader,
  unRptCartDocCorreoArgentino
  {$ENDIF};

Type
  {$IFDEF CD_ROWING}
  TrptCartDocHeader = class(TrptCartDocRowingHeader);
  TrptCartDocumento = class(TrptCartDocRowing);
  {$ENDIF}

  {$IFDEF CD_BONAERENSE}
  TrptCartDocHeader = class(TrptCartDocBonHeader);
  TrptCartDocumento = class(TrptCartDocBonaerense);
  {$ENDIF}

  {$IFDEF CD_ARGENTINO}
  TrptCartDocHeader = class(TRptCartDocCorreoArgentinoHeader);
  TrptCartDocumento = class(TRptCartDocCorreoArgentino);
  {$ENDIF}

implementation

end.
