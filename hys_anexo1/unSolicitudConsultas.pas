{-----------------------------------------------------------------------------
 Unit Name: unSolicitudConsultas
 Author:    RACastro
 Date:      06-Abr-2006
 Purpose:   Módulo para carga de pedidos de reportes
 History:
-----------------------------------------------------------------------------}
unit unSolicitudConsultas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, DB, StdCtrls, RxRichEd, 
  ComCtrls, SDEngine, DBCtrls, RxLookup, Mask, RXCtrls, StrUtils, rxStrUtils,
  ExtCtrls, unDmPrincipal, ANSISql, Placemnt, unSesion, ToolEdit,
  LookupDialog, unArtFrame, unFraCodigoDescripcion, CustomDlgs, CurrEdit,
  PeriodoPicker, unArtDBAwareFrame;

type
  TfrmSolicitudConsultas = class(TForm)
    sdqQueries: TSDQuery;
    sdqQry: TSDQuery;
    sdqParametrosTipo: TSDQuery;
    Panel1: TPanel;
    SaveDialog1: TSaveDialog;
    gbListaPedidos: TGroupBox;
    slPedidos: TStringGrid;
    sdqPreventores: TSDQuery;
    dsPreventores: TDataSource;
    Panel3: TPanel;
    gbReportes: TGroupBox;
    clbReportes: TRxCheckListBox;
    GroupBox1: TGroupBox;
    vedParametros: TStringGrid;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Label3: TLabel;
    Splitter2: TSplitter;
    Panel4: TPanel;
    fraPreventores: TfraCodigoDescripcion;
    Label1: TLabel;
    edEmail: TRxDBLookupCombo;
    btnLimpiarTodo: TButton;
    btnGuardar: TButton;
    btnAgregar: TButton;
    btnSalir: TButton;
    pnlParametros: TPanel;
    FormPlacement1: TFormPlacement;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnLimpiarTodoClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure fraPreventorescmbDescripcionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edEmailCloseUp(Sender: TObject);
    procedure clbReportesClick(Sender: TObject);
  private
    { Private declarations }
    FNroPedido: Integer;
    lstTiposParam: TStrings;
    lstReportes: TStrings;
  public
    { Public declarations }
  end;

var
  frmSolicitudConsultas: TfrmSolicitudConsultas;

implementation

uses Strfuncs;

{$R *.dfm}

procedure TfrmSolicitudConsultas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  lstTiposParam.Free;
  lstReportes.Free;

  sdqQueries.Close;
  sdqPreventores.Close
end;

procedure TfrmSolicitudConsultas.FormActivate(Sender: TObject);
begin
end;

{-----------------------------------------------------------------------------
  Procedure: btnAgregarClick
  Author:    RACastro
  Date:      06-Abr-2006
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Carga la lista de reportes de un pedido en la grilla
-----------------------------------------------------------------------------}
procedure TfrmSolicitudConsultas.btnAgregarClick(Sender: TObject);

  function ValidarDatos: boolean;
  var
    p: integer;
    SinDatos,
    SinReportes,
    Error: boolean;
  begin
    Error := false;
    SinDatos := true;

    for p := 0 to vedParametros.RowCount-1 do
    begin
      SinDatos := SinDatos and (vedParametros.Cells[2,p] = '');

      // Analiza, si el valor ingresado del parámetro es del tipo correcto
      if vedParametros.Cells[2,p] <> '' then
        case lstTiposParam.Values[vedParametros.Cells[0,p]][1] of
          'S': begin // Parámetro de tipo String
            if (Pos('/', vedParametros.Cells[2,p]) > 0) and
               (Pos('/', Copy(vedParametros.Cells[2,p], Pos('/', vedParametros.Cells[2,p]), 255)) > 0)
            then // Puede ser una fecha
              try
                StrToDate(vedParametros.Cells[2,p])
              except
                on E: Exception do begin
                  Error := true;
                  ShowMessage(vedParametros.Cells[0,p] + ' no contiene una fecha válida')
                end
              end
          end;

          'I': begin // Parámetro de tipo Integer
            try
              StrToInt (vedParametros.Cells[2,p])
            except
              on E: Exception do begin
                Error := true;
                ShowMessage(vedParametros.Cells[0,p] + ' no contiene un valor entero correcto')
              end
            end
          end;

          'D': begin // Parámetro de tipo DateTime
            try
              StrToDate(vedParametros.Cells[2,p]);
            except
              on E: Exception do begin
                Error := true;
                ShowMessage(vedParametros.Cells[0,p] + ' no contiene una fecha válida')
              end
            end
          end
        end;
    end;

    SinReportes := true;
    p := 0;
    while (p <= clbReportes.Items.Count -1) and SinReportes do
    begin
      SinReportes := not clbReportes.Checked[p];
      inc(p)
    end;

    if SinReportes then
      ShowMessage('No hay reportes seleccionados')
    else
      if SinDatos then
        ShowMessage('No hay datos ingresados')
      else
        if trim(edEmail.DisplayValue) = '' then
          ShowMessage('No hay e-mail ingresado');

    Result := not (Error or SinDatos or (trim(edEmail.DisplayValue) = ''));
  end;

var
  r,
  p: integer;
  primeralinea: boolean;
begin
  if not ValidarDatos then Exit;

  Inc(FNroPedido);
  PrimeraLinea := true;
  // No hay error, visualizo la lista de reportes a solicitar
  for r := 0 to clbReportes.Items.Count -1 do
  begin
    if clbReportes.Checked[r] then
    begin
      // Nombre del reporte
      slPedidos.Cells[1, slPedidos.RowCount-1] := clbReportes.Items[r];

      // Si es la primera línea pone todos los parámetros, así como el nro. del
      // pedido y el e-mail
      if PrimeraLinea then
      begin
        PrimeraLinea := false;

        slPedidos.Cells[0, slPedidos.RowCount-1] := IntToStr(FNroPedido);
        slPedidos.Cells[2, slPedidos.RowCount-1] := edEMail.DisplayValue;

        for p := 0 to vedParametros.RowCount-1 do
          slPedidos.Cells[p+3, slPedidos.RowCount-1] := vedParametros.Cells[2,p]
      end;

      slPedidos.RowCount :=  slPedidos.RowCount + 1;
    end
  end;
end;

procedure TfrmSolicitudConsultas.btnSalirClick(Sender: TObject);
begin
  Close;
end;

{-----------------------------------------------------------------------------
  Procedure: btnLimpiarClick
  Author:    RACastro
  Date:      06-Abr-2006
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Limpia datos de carga
-----------------------------------------------------------------------------}
procedure TfrmSolicitudConsultas.btnLimpiarTodoClick(Sender: TObject);
var
  r, c: integer;
begin
  // Checklist de reportes
  for r := 0 to clbReportes.Items.Count -1 do
    clbReportes.Checked[r] := false;

  // Parámetros
  for r := 0 to vedParametros.RowCount-1 do
  begin
    vedParametros.Cells[1,r] := '';
    vedParametros.Cells[2,r] := '';
    vedParametros.Cells[3,r] := '';
  end;

  FNroPedido := 0;
  // Grilla
  for c := 0 to slPedidos.ColCount do
    for r := 1 to slPedidos.RowCount do
      slPedidos.Cells[c, r] := '';
  slPedidos.RowCount := 2;

  edEmail.DisplayValue := '';
  fraPreventores.Codigo := ''
end;

{-----------------------------------------------------------------------------
  Procedure: btnGuardarClick
  Author:    RACastro
  Date:      06-Abr-2006
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Genera los pedidos en la BD con el contenido de la grilla
-----------------------------------------------------------------------------}
procedure TfrmSolicitudConsultas.btnGuardarClick(Sender: TObject);
var
  f,
  c: integer;
  NroPedido: LongInt;
begin
  if slPedidos.Cells[0, 1] = '' then begin
    ShowMessage('La lista de pedidos está vacía');
    exit
  end;

  try
    BeginTrans;

    // Resto de las líneas
    for f := 1 to slPedidos.RowCount-1 do
      if slPedidos.Cells[1, f] <> '' then
      begin
        // Obtengo el nro. de pedido
        if slPedidos.Cells[0, f] = '' then
          // Continuación de pedido
          NroPedido := ValorSqlInteger ('SELECT MAX(pr_id) FROM hys.hpr_pedidosreporte')
        else begin
          // Nuevo pedido
          NroPedido := ValorSqlInteger ('SELECT hys.seq_hpr_id.nextval FROM dual');

          // Inserto el nuevo pedido
          EjecutarSqlST(
            'INSERT INTO hys.hpr_pedidosreporte(PR_ID, PR_EMAILRESPUESTA, PR_FECHAALTA, PR_USUALTA, PR_ORIGENPEDIDO) ' +
            'VALUES (' + SqlValue(NroPedido) + ', ' + SqlValue(Trim(slPedidos.Cells[2, f])) +
            ', sysdate, ' + SqlValue(Sesion.LoginName) + ', ''P'')'
          )
        end;

        for c := 3 to slPedidos.ColCount-1 do
          if slPedidos.Cells[c, f] <> '' then
            // Inserto el nuevo parámetro
            if (UpperCase(slPedidos.Cells[c, 0]) = 'FECHADESDE') or (UpperCase(slPedidos.Cells[c, 0]) = 'FECHAHASTA') then
              EjecutarSqlST(
                'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE) ' +
                'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue (UpperCase(slPedidos.Cells[c, 0]) + 'FILTRO') + ', ' +
                SqlValue (FormatDateTime('DD/MM/YYYY', StrToDate (slPedidos.Cells[c, f]))) + ', ' + SqlValue(NroPedido) + ')'
              )
            else
              EjecutarSqlST(
                'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE) ' +
                'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue (UpperCase(slPedidos.Cells[c, 0]) + 'FILTRO') + ', ' +
                SqlValue (slPedidos.Cells[c, f]) + ', ' + SqlValue(NroPedido) + ')'
              );

        EjecutarSqlST(
          'INSERT INTO hys.hpw_pedidosweb(PW_ID, PW_IDREPORTE, PW_FECHAALTA, PW_USUALTA, PW_IDPEDIDO) ' +
          'VALUES (hys.seq_hpw_id.nextval, ' + SqlValue (lstReportes.Values[slPedidos.Cells[1, f]]) +
          ', sysdate, ' + SqlValue(Sesion.LoginName) + ', ' + SqlValue(NroPedido) + ')'
        )
      end;

    CommitTrans
  except
    on E: Exception do begin
       ErrorMsg(E, 'Error al guardar los pedidos');
       Rollback;
    end;
  end;

  btnLimpiarTodoClick(Sender)
end;

procedure TfrmSolicitudConsultas.FormCreate(Sender: TObject);
var
  p: integer;
  lstParametros: TStrings;
 // o : TObject;
begin
  lstTiposParam := TStringList.Create;
  lstReportes:= TStringList.Create;
  sdqPreventores.Open;

  with fraPreventores do
  begin
      TableName := 'art.pit_firmantes';
      FieldDesc := 'it_nombre';
      FieldID := 'it_id';
      FieldCodigo := 'it_codigo';
      FieldBaja := 'it_fechabaja';
      CaseSensitive := false;
      ShowBajas := false;
      ExtraCondition := ' AND (it_email IS NOT NULL) AND (it_fechabaja IS NULL)'
  end;

  // Cargo los tipos de parámetros
  with sdqParametrosTipo do begin
    Active := true;

    while not Eof do begin
      lstTiposParam.Add(ReplaceStr(AnsiUpperCase (FieldByName('Parametro').AsString), 'FILTRO', '') + '=' +
                        UpperCase(FieldByName('Tipo').AsString));
      Next
    end;

    Active := false
  end;

  lstParametros := TStringList.Create;
  try
    sdqQueries.Open;
    while not sdqQueries.Eof do begin
      if clbReportes.Items.IndexOf(sdqQueries.FieldByName('descripcion').AsString) = -1 then
      begin
        clbReportes.Items.Add(sdqQueries.FieldByName('descripcion').AsString);
        lstReportes.Add(sdqQueries.FieldByName('descripcion').AsString + '=' +
                        sdqQueries.FieldByName('rw_id').AsString);
      end;

      // Parseo Consulta
      sdqQry.SQL.Clear;
      sdqQry.SQL.Add(AnsiUpperCase (sdqQueries.FieldByName('qr_consulta').AsString));
      sdqQry.Params.Clear;
      sdqQry.Params.ParseSQL(AnsiUpperCase (sdqQueries.FieldByName('qr_consulta').AsString), True);

      for p := 0 to sdqQry.ParamCount-1 do
        if (lstParametros.IndexOfName(AnsiUpperCase(ReplaceStr(sdqQry.Params[p].Name, 'FILTRO', ''))) < 0) and
           (lstTiposParam.Values[AnsiUpperCase(ReplaceStr(sdqQry.Params[p].Name, 'FILTRO', ''))] <> '@')
        then begin
          lstParametros.Add(AnsiUpperCase(ReplaceStr(sdqQry.Params[p].Name, 'FILTRO', '')) + '=0')
        end;

      sdqQueries.Next
    end;

    vedParametros.ColWidths[1] := 20;
    vedParametros.RowCount := lstParametros.Count;
    for p := 0 to lstParametros.Count-1 do
      vedParametros.Cells[0,p] := lstParametros.Names[p];
  finally
    lstParametros.Free
  end;

  // Inicializa cabecera de la grilla
  slPedidos.ColCount := vedParametros.RowCount + 3;
  slPedidos.Cells[0,0] := AnsiProperCase('PEDIDO', []);
  slPedidos.Cells[1,0] := AnsiProperCase('REPORTE', []);
  slPedidos.Cells[2,0] := AnsiProperCase('E-MAIL', []);
  for p := 0 to vedParametros.RowCount-1 do
  begin
    slPedidos.Cells[p+3, 0] := AnsiProperCase(vedParametros.Cells[0,p], []);
(*
    // Evaluando -------------------------------------------------------------
    o := tlabel.Create(self);
    (o as TLabel).Caption := AnsiProperCase(vedParametros.Cells[0,p], []);
    (o as TLabel).Left := 5;
    (o as TLabel).Top := 24 * p + 8;
    (o as TLabel).Alignment := taRightJustify;
    (o as TLabel).AutoSize := false;
    (o as TLabel).Width := 120;
    (o as TLabel).Name := 'LBL' + UpperCase(vedParametros.Cells[0,p]);
    pnlParametros.InsertControl((o as TLabel));

    if Pos ('FECHA', UpperCase(vedParametros.Cells[0,p])) = 1 then
    begin
      o := TDateEdit.Create(self);
      (o as TDateEdit).Name := AnsiProperCase(vedParametros.Cells[0,p], []);
      (o as TDateEdit).Left := 130;
      (o as TDateEdit).Top := 24 * p + 5;
      (o as TDateEdit).Width := 99;
      (o as TDateEdit).Name := UpperCase(vedParametros.Cells[0,p]);

      pnlParametros.InsertControl((o as TDateEdit));
      (o as TDateEdit).Clear
    end;

    if Pos ('CUIT', UpperCase(vedParametros.Cells[0,p])) = 1 then
    begin
      o := TMaskEdit.Create(self);
      (o as TMaskEdit).Name := AnsiProperCase(vedParametros.Cells[0,p], []);
      (o as TMaskEdit).Left := 130;
      (o as TMaskEdit).Top := 24 * p + 5;
      (o as TMaskEdit).Width := 96;
      (o as TMaskEdit).EditMask := '99-99999999-9;0;';
      (o as TMaskEdit).Name := UpperCase(vedParametros.Cells[0,p]);

      pnlParametros.InsertControl((o as TMaskEdit));
      (o as TMaskEdit).Clear
    end;

    if (Pos ('CONTRATO', UpperCase(vedParametros.Cells[0,p])) = 1) or
       (Pos ('ESTABLECIMIENTO', UpperCase(vedParametros.Cells[0,p])) = 1) or
       (Pos ('SINIESTRO', UpperCase(vedParametros.Cells[0,p])) = 1) or
       (Pos ('ORDEN', UpperCase(vedParametros.Cells[0,p])) = 1) then
    begin
      o := TRxCalcEdit.Create(self);
      (o as TRxCalcEdit).Name := AnsiProperCase(vedParametros.Cells[0,p], []);
      (o as TRxCalcEdit).Left := 130;
      (o as TRxCalcEdit).Top := 24 * p + 5;
      (o as TRxCalcEdit).Width := 90;
      (o as TRxCalcEdit).DisplayFormat := ',0.';
      (o as TRxCalcEdit).Name := UpperCase(vedParametros.Cells[0,p]);

      pnlParametros.InsertControl((o as TRxCalcEdit));
      (o as TRxCalcEdit).ButtonWidth := 0;
      (o as TRxCalcEdit).Clear;
    end;
(*
    if Pos ('OPERATIVO', UpperCase(vedParametros.Cells[0,p])) = 1 then
    begin
      o := TPeriodoPicker.Create(self);
      (o as TPeriodoPicker).Name := AnsiProperCase(vedParametros.Cells[0,p], []);
      (o as TPeriodoPicker).Left := 130;
      (o as TPeriodoPicker).Top := 24 * p + 5;
      (o as TPeriodoPicker).Width := 60;
      (o as TPeriodoPicker).WidthMes := 23;
      (o as TPeriodoPicker).Periodo.Separador := #0;
      (o as TPeriodoPicker).Periodo.AllowNull := true;
      (o as TPeriodoPicker).Name := UpperCase(vedParametros.Cells[0,p]);

      pnlParametros.InsertControl((o as TPeriodoPicker));
      (o as TPeriodoPicker).Clear;
    end;
*)
(*
    if Pos ('OPERATIVO', UpperCase(vedParametros.Cells[0,p])) = 1 then
    begin
      o := TRxCalcEdit.Create(self);
      (o as TRxCalcEdit).Name := AnsiProperCase(vedParametros.Cells[0,p], []);
      (o as TRxCalcEdit).Left := 130;
      (o as TRxCalcEdit).Top := 24 * p + 5;
      (o as TRxCalcEdit).Width := 90;
      (o as TRxCalcEdit).DisplayFormat := ',0.';
      (o as TRxCalcEdit).Name := UpperCase(vedParametros.Cells[0,p]);

      pnlParametros.InsertControl((o as TRxCalcEdit));
      (o as TRxCalcEdit).ButtonWidth := 0;
      (o as TRxCalcEdit).Clear;
    end;
*)
    // Evaluando -------------------------------------------------------------

  end;

  btnLimpiarTodoClick(Sender);
  clbReportesClick(Sender)
end;

procedure TfrmSolicitudConsultas.fraPreventorescmbDescripcionChange(
  Sender: TObject);
begin
  edEmail.KeyValue := Trim(fraPreventores.Descripcion);
end;

procedure TfrmSolicitudConsultas.edEmailCloseUp(Sender: TObject);
begin
//  fraPreventores.Codigo := sdqPreventores.FieldByName('it_id').AsString
end;

procedure TfrmSolicitudConsultas.clbReportesClick(Sender: TObject);
var
  r,
  p: integer;
begin
  // limpio la columna de indicador de parámetros requeridos
  for r := 0 to vedParametros.RowCount-1 do
    vedParametros.Cells[1,r] := '';
(*
  for r := 0 to pnlParametros.ControlCount-1 do
    pnlParametros.Controls[r].Enabled := false;
*)
  // pongo una marca en cada parametro de la consulta del reporte
  sdqQueries.Open;
  while not sdqQueries.Eof do begin
    if clbReportes.Checked[clbReportes.ItemIndex] and
       (clbReportes.Items[clbReportes.ItemIndex] = sdqQueries.FieldByName('descripcion').AsString) then
    begin
      // Parseo Consulta
      sdqQry.SQL.Clear;
      sdqQry.SQL.Add(AnsiUpperCase (sdqQueries.FieldByName('qr_consulta').AsString));
      sdqQry.Params.Clear;
      sdqQry.Params.ParseSQL(AnsiUpperCase (sdqQueries.FieldByName('qr_consulta').AsString), True);

      for p := 0 to sdqQry.ParamCount-1 do
        for r := 0 to vedParametros.RowCount-1 do
          if vedParametros.Cells[0,r] = AnsiUpperCase(ReplaceStr(sdqQry.Params[p].Name, 'FILTRO', '')) then
            vedParametros.Cells[1,r] := '>';
(*
      for p := 0 to sdqQry.ParamCount-1 do
        for r := 0 to pnlParametros.ControlCount-1 do
          if Pos(AnsiUpperCase(ReplaceStr(sdqQry.Params[p].Name, 'FILTRO', '')), pnlParametros.Controls[r].Name) > 0 then
            pnlParametros.Controls[r].Enabled := true
*)
    end;

    sdqQueries.Next
  end;
  sdqQueries.Close;
end;

end.
