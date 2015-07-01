unit utilesBDE;

interface

Uses Comctrls, DBTables;

const
     // Algunas de las rutas para configurar el BDE
     // para saber todas utilizar BDE_GetSubPath

     DATE_CONFIG         = '\SYSTEM\FORMATS\DATE';
     DATE_SEPARATOR      = 'SEPARATOR';
     DATE_MODE           = 'MODE';
     DATE_FOURDIGITYEAR  = 'FOURDIGITYEAR';
     DATE_YEARBIASED     = 'YEARBIASED';
     DATE_LEADINGZEROM   = 'LEADINGZEROM';
     DATE_LEADINGZEROD   = 'LEADINGZEROD';

     TIME_CONFIG         = '\SYSTEM\FORMATS\TIME';
     TIME_TWELVEHOUR     = 'TWELVEHOUR';
     TIME_AMSTRING       = 'AMSTRING';
     TIME_PMSTRING       = 'PMSTRING';
     TIME_SECONDS        = 'SECONDS';
     TIME_MILISECONDS    = 'MILESECONDS';

     NUMBER_CONFIG                = '\SYSTEM\FORMATS\NUMBER';
     NUMBER_DECIMALSEPARATOR      = 'DECIMALSEPARATOR';
     NUMBER_THOUSANDSEPARATOR     = 'THOUSANDSEPARATOR';
     NUMBER_DECIMALDIGITS         = 'DECIMALDIGITS';
     NUMBER_LEADINGZERON          = 'LEADINGZERON';

     PARADOX                      = '\DRIVERS\PARADOX\TABLE CREATE';
     PARADOX_LEVEL                = 'LEVEL';
     PARADOX_STRICTINTEGRTY       = 'STRICINTEGRTY';
     PARADOX_LANGDRIVER           = 'LANGDRIVER';


// Recorre la configuracion del BDE y la coloca en un TreeView
procedure BDE_GetSubPath(pth: string; node: TTreeNode);
// Devuelve el path del alias pasado
function BDE_GetAliasPath( alias: string ): string;
// modifica el path path del alias pasado
procedure BDE_SetAliasPath( alias, value: string );
// Cambia un valor de la configuracion
function BDE_ChangeValue( Pth, Nodo, valor: string ): boolean;
// Reestructura una tabla
procedure PackTable(Table: TTable);

implementation

uses SysUtils, BDE, Db;


function BuscaNodo( hCur: hDBICur; nodo: string; var Config: CFGDesc ): boolean; forward;


//---------------------------------------------------------------------------//
// Devuelve todo el arbol de cofiguracion del BDE desde el nodo que se indique
// para recorrerlo todo arrarcar por '\'
//
// EJ:
//    root := tv.items.add( nil, '\' );
//    BDE_GetSubPath( '\', root);
//---------------------------------------------------------------------------//
procedure BDE_GetSubPath(pth: string; node: TTreeNode);
var
  rslt: DBIResult;
  Config: CFGDesc;
  tti : TTreeNode;
  hCur: hDBICur;
begin

     hCur := nil;

     Check(DbiOpenCfgInfoList(nil, dbiREADONLY, cfgPERSISTENT, pChar( Pth ), hCur));

     try
        Check(DbiSetToBegin(hCur));
        repeat
              rslt := DbiGetNextRecord(hCur, dbiNOLOCK, @Config, nil);

              if (rslt = DBIERR_NONE) then begin

                 tti := TTreeView( node.TreeView ).items.AddChild( node, Config.szNodeName );

                 if Config.bHasSubnodes then begin

                    if Copy( pth, length( pth ), 1 ) <> '\' then
                       pth := pth + '\';

                    BDE_GetSubPath( Pth + Config.szNodeName, tti );
                 end;

              end else if (rslt <> DBIERR_EOF) then
                 Check(rslt);

        until (rslt <> DBIERR_NONE);

     finally
        if (hCur <> nil) then
           Check(DbiCloseCursor(hCur));
     end;

end;


//---------------------------------------------------------------------------//
// Devuelve el path del alias pasado
//---------------------------------------------------------------------------//
function BDE_GetAliasPath( alias: string ): string;
var
   hCur: hDBICur;
   pth: string;
   Config: CFGDesc;
begin
     hCur := nil;

     pth := '\DATABASES\' + alias + '\DB INFO';
     Check( DbiOpenCfgInfoList( nil, dbiREADONLY, cfgPERSISTENT, pChar( pth ), hCur));
     try
        if BuscaNodo( hCur, 'PATH', Config ) then
           Result := Config.szValue
        else
           Result := '';

     finally
        if (hCur <> nil) then
           Check(DbiCloseCursor(hCur));
     end;


end;

//---------------------------------------------------------------------------//
// Modifica el path del alias pasado
//---------------------------------------------------------------------------//
procedure BDE_SetAliasPath( alias, value: string );
var
   hCur: hDBICur;
   pth: string;
   Config: CFGDesc;
begin
     hCur := nil;

     pth := '\DATABASES\' + alias + '\DB INFO';
     Check( DbiOpenCfgInfoList( nil, dbiREADWRITE, cfgPERSISTENT, pChar( pth ), hCur));
     try
        if BuscaNodo( hCur, 'PATH', Config ) then begin

           StrPCopy( Config.szValue, pchar( value ) );
           Check( DbiModifyRecord( hCur, @Config , TRUE ) );
        end;
     finally
        if (hCur <> nil) then
           Check(DbiCloseCursor(hCur));
     end;

end;



//---------------------------------------------------------------------------//
// Busca por un nodo en la configuracion del BDE
//---------------------------------------------------------------------------//
function BuscaNodo( hCur: hDBICur; nodo: string; var Config: CFGDesc ): boolean;
var
   rslt: DBIResult;
begin
     Result := False;
     repeat
           rslt := DbiGetNextRecord( hCur, dbiNOLOCK, @Config, nil );

           if (rslt = DBIERR_NONE) then begin
              if ( Config.szNodeName = nodo ) then begin
                 Result := True;
                 break;
              end;
           end;

     until (rslt <> DBIERR_NONE);
end;



//---------------------------------------------------------------------------//
// Cambia un valor de la configuracion
//---------------------------------------------------------------------------//
function BDE_ChangeValue( Pth, Nodo, valor: string ): boolean;
var
  Config: CFGDesc;
  hCur: hDBICur;
begin
     hCur := nil;
     Check(DbiOpenCfgInfoList(nil, dbiREADWRITE, cfgPERSISTENT, pChar( Pth ), hCur));
     try
        if BuscaNodo( hCur, Nodo, Config ) then begin
           StrPCopy( Config.szValue, pchar( valor ) );
           Check( DbiModifyRecord( hCur, @Config , TRUE ) );
        end;
        Result := True;
     finally
        if (hCur <> nil) then
           Check(DbiCloseCursor(hCur));
     end;
end;



//---------------------------------------------------------------------------//
// Pack de una tabla Paradox o dBASE
// La tabla debe estar abierta en forma exclusiva
//---------------------------------------------------------------------------//
procedure PackTable(Table: TTable);
var
  Props: CURProps;
  hDb: hDBIDb;
  TableDesc: CRTblDesc;
begin
     // Make sure the table is open exclusively so we can get the db handle...
     if not Table.Active then
        raise EDatabaseError.Create('La tabla debe estar abierta para el pack');

     if not Table.Exclusive then
        raise EDatabaseError.Create('La tabla debe estar abierta en modo exclusivo');

     // Get the table properties to determine table type...
     Check( DbiGetCursorProps( Table.Handle, Props ) );

     // If the table is a Paradox table, you must call DbiDoRestructure...
     if (Props.szTableType = szPARADOX) then begin
        FillChar(TableDesc, sizeof(TableDesc), 0);                                         // Blank out the structure...
        Check( DbiGetObjFromObj( hDBIObj(Table.Handle), objDATABASE, hDBIObj(hDb) ) );     // Get the database handle from the table's cursor handle...
        StrPCopy(TableDesc.szTblName, Table.TableName);                                    // Put the table name in the table descriptor...
        StrPCopy(TableDesc.szTblType, Props.szTableType);                                  // Put the table type in the table descriptor...
        TableDesc.bPack := True;                                                           // Set the Pack option in the table descriptor to TRUE...
        Table.Close;                                                                       // Close the table so the restructure can complete...
        Check(DbiDoRestructure(hDb, 1, @TableDesc, nil, nil, nil, False));                 // Call DbiDoRestructure...

     end else begin

        if (Props.szTableType = szDBASE) then                                              // If the table is a dBASE table, simply call DbiPackTable...
           Check(DbiPackTable(Table.DBHandle, Table.Handle, nil, szDBASE, True))
        else
           raise EDatabaseError.Create('Para tabla a packear debe ser Paradox o dBASE ');  // Pack only works on PAradox or dBASE; nothing else...
     end;

     Table.Open;

end;


{ EOF BDEUtils}
end.
