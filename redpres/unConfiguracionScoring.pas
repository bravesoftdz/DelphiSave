unit unConfiguracionScoring;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ImgList, XPMenu, Placemnt, ExtCtrls, StdCtrls, FormPanel, Db, SDEngine,
  unCustomGridABM, AnsiSql, SortDlg, DBClient, Provider
  {$IFNDEF VER130}, Variants{$ENDIF};

type
  TTipoAccion = (taAsociar, taQuitar);
  
  TfrmConfiguracionScoring = class(TfrmCustomForm)
    pcPaginas: TPageControl;
    tsMSC_SCORINGCRITERIO: TTabSheet;
    ts2: TTabSheet;
    tsMSI_SCORINGINDICADOR: TTabSheet;
    ts4: TTabSheet;
    tsMSD_SCORINGDESCRIPCION: TTabSheet;
    tbCriterios: TToolBar;
    tbNuevoCriterios: TToolButton;
    tbModificarCriterios: TToolButton;
    tbOrdenarCriterios: TToolButton;
    ToolButton4: TToolButton;
    dbgCriterios: TArtDBGrid;
    dbgIndicadoresDisponibles: TArtDBGrid;
    dbgIndicadoresAsociados: TArtDBGrid;
    dbgIndicadores: TArtDBGrid;
    dbgItemsDisponibles: TArtDBGrid;
    dbgItemsAsociados: TArtDBGrid;
    dbgDescripciones: TArtDBGrid;
    pnl1: TPanel;
    fpAbm: TFormPanel;
    BevelAbm: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    edDescripcion: TMemo;
    Label1: TLabel;
    tbSubeMSC_SCORINGCRITERIO: TToolButton;
    tbBajaMSC_SCORINGCRITERIO: TToolButton;
    ToolBar1: TToolBar;
    tbNuevoIndicadores: TToolButton;
    tbModificarIndicadores: TToolButton;
    tbOrdenarIndicadores: TToolButton;
    ToolButton8: TToolButton;
    tbSubeMSI_SCORINGINDICADOR: TToolButton;
    tbBajaMSI_SCORINGINDICADOR: TToolButton;
    ToolBar2: TToolBar;
    ToolButton9: TToolButton;
    tbModificarItems: TToolButton;
    tbOrdenarDescripciones: TToolButton;
    ToolButton12: TToolButton;
    tbSubeMSD_SCORINGDESCRIPCION: TToolButton;
    tbBajaMSD_SCORINGDESCRIPCION: TToolButton;
    ToolBar3: TToolBar;
    tb2MCI_SCORINGCRITERIOINDICADOR: TToolButton;
    tb1MCI_SCORINGCRITERIOINDICADOR: TToolButton;
    pnl2: TPanel;
    pnl3: TPanel;
    ToolBar4: TToolBar;
    tb1MID_SCORINGINDICADORDESC: TToolButton;
    tb2MID_SCORINGINDICADORDESC: TToolButton;
    pnl4: TPanel;
    Panel6: TPanel;
    tbToolBarTS4: TToolBar;
    tbSubeMID_SCORINGINDICADORDESC: TToolButton;
    tbBajaMID_SCORINGINDICADORDESC: TToolButton;
    Panel5: TPanel;
    tbToolBarTS2: TToolBar;
    tbSubeMCI_SCORINGCRITERIOINDICADOR: TToolButton;
    tbBajaMCI_SCORINGCRITERIOINDICADOR: TToolButton;
    sdqMSC_SCORINGCRITERIO: TSDQuery;
    sdqMSC_SCORINGCRITERIOSC_ID: TFloatField;
    sdqMSC_SCORINGCRITERIOSC_DESCRIPCION: TStringField;
    sdqMSC_SCORINGCRITERIOSC_POSICION: TFloatField;
    dsCriterios: TDataSource;
    sdqMSI_SCORINGINDICADOR: TSDQuery;
    dsIndicadores: TDataSource;
    sdqMSI_SCORINGINDICADORSI_ID: TFloatField;
    sdqMSI_SCORINGINDICADORSI_DESCRIPCION: TStringField;
    sdqMSI_SCORINGINDICADORSI_POSICION: TFloatField;
    sdqMSD_SCORINGDESCRIPCION: TSDQuery;
    dsDescripciones: TDataSource;
    sdqMSD_SCORINGDESCRIPCIONSD_ID: TFloatField;
    sdqMSD_SCORINGDESCRIPCIONSD_DESCRIPCION: TStringField;
    sdqMSD_SCORINGDESCRIPCIONSD_POSICION: TFloatField;
    lbAsociados2: TLabel;
    lbAsociados4: TLabel;
    SortDialogMSC_SCORINGCRITERIO: TSortDialog;
    SortDialogMSI_SCORINGINDICADOR: TSortDialog;
    SortDialogMSD_SCORINGDESCRIPCION: TSortDialog;
    Panel1: TPanel;
    Label2: TLabel;
    ArtDBGrid1: TArtDBGrid;
    Panel2: TPanel;
    Label3: TLabel;
    ArtDBGrid2: TArtDBGrid;
    cdsMSC_SCORINGCRITERIO: TClientDataSet;
    cdsMSI_SCORINGINDICADOR: TClientDataSet;
    cdsMSD_SCORINGDESCRIPCION: TClientDataSet;
    dspMSC_SCORINGCRITERIO: TDataSetProvider;
    dspMSI_SCORINGINDICADOR: TDataSetProvider;
    dspMSD_SCORINGDESCRIPCION: TDataSetProvider;
    cdsMSC_SCORINGCRITERIOSC_ID: TFloatField;
    cdsMSC_SCORINGCRITERIOSC_DESCRIPCION: TStringField;
    cdsMSC_SCORINGCRITERIOSC_POSICION: TFloatField;
    cdsMSI_SCORINGINDICADORSI_ID: TFloatField;
    cdsMSI_SCORINGINDICADORSI_DESCRIPCION: TStringField;
    cdsMSI_SCORINGINDICADORSI_POSICION: TFloatField;
    cdsMSD_SCORINGDESCRIPCIONSD_ID: TFloatField;
    cdsMSD_SCORINGDESCRIPCIONSD_DESCRIPCION: TStringField;
    cdsMSD_SCORINGDESCRIPCIONSD_POSICION: TFloatField;
    sdqDispMID_SCORINGINDICADORDESC: TSDQuery;
    dsDispMID_SCORINGINDICADORDESC: TDataSource;
    sdqAsocMID_SCORINGINDICADORDESC: TSDQuery;
    dsAsocMID_SCORINGINDICADORDESC: TDataSource;
    sdqDispMCI_SCORINGCRITERIOINDICADOR: TSDQuery;
    dsDispMCI_SCORINGCRITERIOINDICADOR: TDataSource;
    sdqAsocMCI_SCORINGCRITERIOINDICADOR: TSDQuery;
    dsAsocMCI_SCORINGCRITERIOINDICADOR: TDataSource;
    sdqDispMCI_SCORINGCRITERIOINDICADORSI_ID: TFloatField;
    sdqDispMCI_SCORINGCRITERIOINDICADORSI_DESCRIPCION: TStringField;
    sdqDispMCI_SCORINGCRITERIOINDICADORSI_POSICION: TFloatField;
    sdqDispMID_SCORINGINDICADORDESCSD_ID: TFloatField;
    sdqDispMID_SCORINGINDICADORDESCSD_DESCRIPCION: TStringField;
    sdqDispMID_SCORINGINDICADORDESCSD_POSICION: TFloatField;
    sdqAsocMID_SCORINGINDICADORDESCID_IDINDICADOR: TFloatField;
    sdqAsocMID_SCORINGINDICADORDESCID_IDDESCRIPCION: TFloatField;
    sdqAsocMID_SCORINGINDICADORDESCID_POSICION: TFloatField;
    sdqAsocMID_SCORINGINDICADORDESCSD_DESCRIPCION: TStringField;
    sdqAsocMCI_SCORINGCRITERIOINDICADORSI_DESCRIPCION: TStringField;
    sdqAsocMCI_SCORINGCRITERIOINDICADORCI_IDCRITERIO: TFloatField;
    sdqAsocMCI_SCORINGCRITERIOINDICADORCI_IDINDICADOR: TFloatField;
    sdqAsocMCI_SCORINGCRITERIOINDICADORCI_POSICION: TFloatField;
    sdqDispMCI_SCORINGCRITERIOINDICADORTIPO: TStringField;
    sdqDispMID_SCORINGINDICADORDESCTIPO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure pcPaginasChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbNuevoCriteriosClick(Sender: TObject);
    procedure tbModificarCriteriosClick(Sender: TObject);
    procedure tbNuevoIndicadoresClick(Sender: TObject);
    procedure tbModificarIndicadoresClick(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure tbModificarItemsClick(Sender: TObject);
    procedure tbOrdenarCriteriosClick(Sender: TObject);
    procedure tbOrdenarIndicadoresClick(Sender: TObject);
    procedure tbOrdenarDescripcionesClick(Sender: TObject);
    procedure Ordenar(Sender: TObject);
    procedure BotonesSubeBaja(DataSet: TDataSet);
    procedure BotonesSubeBajaAsociaciones(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure ts2Resize(Sender: TObject);
    procedure ts4Resize(Sender: TObject);
    procedure Asociar(Sender: TObject);
    procedure Quitar(Sender: TObject);
    procedure OrdenarAsociacion(Sender: TObject);
    procedure PintoRenglon(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
  private
    objSQL: TSQL;

    procedure Asociacion(sTabla: String; Accion: TTipoAccion);
    procedure PrepararSubConsultas;
    procedure ProcesarABM(sTabla: String; ModoABM: TModoABM);    
  end;

var
  frmConfiguracionScoring: TfrmConfiguracionScoring;

implementation

uses
  unART, unDmPrincipal, SQLFuncs, CustomDlgs, unCustomConsulta;

{$R *.DFM}

procedure TfrmConfiguracionScoring.FormCreate(Sender: TObject);
begin
  inherited;
  
  pcPaginas.ActivePageIndex := 0;
  objSQL := TSQL.Create;

  LoadDynamicSortFields(SortDialogMSC_SCORINGCRITERIO.SortFields, dbgCriterios.Columns);
  LoadDynamicSortFields(SortDialogMSI_SCORINGINDICADOR.SortFields, dbgIndicadores.Columns);
  LoadDynamicSortFields(SortDialogMSD_SCORINGDESCRIPCION.SortFields, dbgDescripciones.Columns);
end;

procedure TfrmConfiguracionScoring.pcPaginasChange(Sender: TObject);
begin
  case pcPaginas.ActivePageIndex of
    0:  BotonesSubeBaja(cdsMSC_SCORINGCRITERIO);
    2:  BotonesSubeBaja(cdsMSI_SCORINGINDICADOR);
    4:  BotonesSubeBaja(cdsMSD_SCORINGDESCRIPCION);
  end;

  PrepararSubConsultas;

  sdqMSC_SCORINGCRITERIO.Close;
  sdqMSI_SCORINGINDICADOR.Close;
  sdqMSD_SCORINGDESCRIPCION.Close;
end;

procedure TfrmConfiguracionScoring.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  objSQL.Free;
end;

procedure TfrmConfiguracionScoring.ProcesarABM(sTabla: string; ModoABM: TModoABM);
var
  cdsConsulta: TClientDataSet;
  iIDOriginal: Integer;
  sdqConsulta: TSDQuery;
  sPrefijo: String;
begin
  sPrefijo := Copy(sTabla, 2, 3);
  sdqConsulta := TSDQuery(Self.FindComponent('sdq' + sTabla));
  cdsConsulta := TClientDataSet(Self.FindComponent('cds' + sTabla));
  iIDOriginal := sdqConsulta.FieldByName(sPrefijo + 'ID').AsInteger;

  case ModoABM of
    maAlta:
    begin
      edDescripcion.Lines.Clear;
      fpAbm.Caption := 'Alta';
    end;
    maModificacion:
    begin
      edDescripcion.Lines.Text := cdsConsulta.FieldByName(sPrefijo + 'DESCRIPCION').AsString;
      fpAbm.Caption := 'Modificación';
    end;
  end;

  if fpABM.ShowModal = mrOK then
    with objSQL do
    try
      Clear;
      TableName := sTabla;

      case ModoABM of
        maAlta:
        begin
          Fields.AddExpression(sPrefijo + 'ID', 'SEQ_' + Copy(sTabla, 1, 4) + 'ID.NextVal');
          SqlType := stInsert;
        end;
        maModificacion:
        begin
          PrimaryKey.Add(sPrefijo + 'ID', cdsConsulta.FieldByName(sPrefijo + 'ID').AsInteger);
          SqlType := stUpdate;
        end;
      end;

      Fields.Add(sPrefijo + 'DESCRIPCION', edDescripcion.Lines.Text);

      EjecutarSQL(objSQL.SQL);
    except
      MsgBox('Ha ocurrido un error al guardar los datos ingresados.');
    end;

  cdsConsulta.Refresh;
  cdsConsulta.Locate(sPrefijo + 'ID', iIDOriginal, []);
  sdqConsulta.Close;
end;

procedure TfrmConfiguracionScoring.btnAceptarClick(Sender: TObject);
begin
  Verificar(edDescripcion.Lines.Text = '', edDescripcion, 'La descripción no puede quedar vacía.');
  fpAbm.ModalResult := mrOK;
end;

procedure TfrmConfiguracionScoring.tbNuevoCriteriosClick(Sender: TObject);
begin
  ProcesarABM('MSC_SCORINGCRITERIO', maAlta);
end;

procedure TfrmConfiguracionScoring.tbModificarCriteriosClick(Sender: TObject);
begin
  ProcesarABM('MSC_SCORINGCRITERIO', maModificacion);
end;

procedure TfrmConfiguracionScoring.tbNuevoIndicadoresClick(Sender: TObject);
begin
  ProcesarABM('MSI_SCORINGINDICADOR', maAlta);
end;

procedure TfrmConfiguracionScoring.tbModificarIndicadoresClick(Sender: TObject);
begin
  ProcesarABM('MSI_SCORINGINDICADOR', maModificacion);
end;

procedure TfrmConfiguracionScoring.ToolButton9Click(Sender: TObject);
begin
  ProcesarABM('MSD_SCORINGDESCRIPCION', maAlta);
end;

procedure TfrmConfiguracionScoring.tbModificarItemsClick(Sender: TObject);
begin
  ProcesarABM('MSD_SCORINGDESCRIPCION', maModificacion);
end;

procedure TfrmConfiguracionScoring.tbOrdenarCriteriosClick(Sender: TObject);
begin
  SortDialogMSC_SCORINGCRITERIO.Execute;
end;

procedure TfrmConfiguracionScoring.tbOrdenarIndicadoresClick(Sender: TObject);
begin
  SortDialogMSI_SCORINGINDICADOR.Execute;
end;

procedure TfrmConfiguracionScoring.tbOrdenarDescripcionesClick(Sender: TObject);
begin
  SortDialogMSD_SCORINGDESCRIPCION.Execute;
end;

procedure TfrmConfiguracionScoring.Ordenar(Sender: TObject);
var
  cdsConsulta: TClientDataSet;
  iDiferencia: Integer;
  iIDOriginal: Integer;  
  iPosicionOriginal: Integer;
  sdqConsulta: TSDQuery;
  sPrefijo: String;
  sTabla: String;
begin
  sTabla := Copy(TToolButton(Sender).Name, 7, MAXINT);
  sPrefijo := Copy(sTabla, 2, 3);
  sdqConsulta := TSDQuery(Self.FindComponent('sdq' + sTabla));
  cdsConsulta := TClientDataSet(Self.FindComponent('cds' + sTabla));

  iPosicionOriginal := cdsConsulta.FieldByName(sPrefijo + 'POSICION').AsInteger;
  iIDOriginal       := cdsConsulta.FieldByName(sPrefijo + 'ID').AsInteger;

  if Copy(TToolButton(Sender).Name, 3, 4) = 'Sube' then
    iDiferencia := -1
  else
    iDiferencia := +1;

  with objSQL do
  try
    SqlType := stUpdate;

    Clear;
    TableName := sTabla;
    PrimaryKey.Add(sPrefijo + 'ID', iIDOriginal);
    Fields.Add(sPrefijo + 'POSICION', 9999);
    EjecutarSQL(objSQL.SQL);

    Clear;
    TableName := sTabla;
    PrimaryKey.Add(sPrefijo + 'POSICION', iPosicionOriginal + iDiferencia);
    Fields.Add(sPrefijo + 'POSICION', iPosicionOriginal);
    EjecutarSQL(objSQL.SQL);

    Clear;
    TableName := sTabla;
    PrimaryKey.Add(sPrefijo + 'ID', iIDOriginal);
    Fields.Add(sPrefijo + 'POSICION', iPosicionOriginal + iDiferencia);
    EjecutarSQL(objSQL.SQL);
  except
    MsgBox('Ha ocurrido un error al guardar los datos ingresados.');
  end;

  cdsConsulta.Refresh;
  cdsConsulta.Locate(sPrefijo + 'ID', iIDOriginal, []);
  sdqConsulta.Close;
end;

procedure TfrmConfiguracionScoring.BotonesSubeBaja(DataSet: TDataSet);
begin
  TToolButton(FindComponent('tbSube' + Copy(DataSet.Name, 4, MAXINT))).Enabled := (DataSet.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF}) and (DataSet.RecordCount > 1);
  TToolButton(FindComponent('tbBaja' + Copy(DataSet.Name, 4, MAXINT))).Enabled := (DataSet.RecNo < DataSet.RecordCount {$IFDEF VER150}- 1{$ENDIF}) and (DataSet.RecordCount > 1);

  PrepararSubConsultas;
end;

procedure TfrmConfiguracionScoring.BotonesSubeBajaAsociaciones(DataSet: TDataSet);
begin
  TToolButton(FindComponent('tbSube' + Copy(DataSet.Name, 8, MAXINT))).Enabled := (DataSet.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF}) and (DataSet.RecordCount > 1);
  TToolButton(FindComponent('tbBaja' + Copy(DataSet.Name, 8, MAXINT))).Enabled := (DataSet.RecNo < DataSet.RecordCount {$IFDEF VER150}- 1{$ENDIF}) and (DataSet.RecordCount > 1);
end;

procedure TfrmConfiguracionScoring.FormActivate(Sender: TObject);
begin
  inherited;
  sdqMSC_SCORINGCRITERIO.SQL.Text := 'SELECT * FROM MSC_SCORINGCRITERIO ' + SortDialogMSC_SCORINGCRITERIO.OrderBy;
  sdqMSI_SCORINGINDICADOR.SQL.Text := 'SELECT * FROM MSI_SCORINGINDICADOR ' + SortDialogMSI_SCORINGINDICADOR.OrderBy;
  sdqMSD_SCORINGDESCRIPCION.SQL.Text := 'SELECT * FROM MSD_SCORINGDESCRIPCION ' + SortDialogMSD_SCORINGDESCRIPCION.OrderBy;

  cdsMSC_SCORINGCRITERIO.Active    := True;
  cdsMSI_SCORINGINDICADOR.Active   := True;
  cdsMSD_SCORINGDESCRIPCION.Active := True;

  pcPaginasChange(nil);
end;

procedure TfrmConfiguracionScoring.ts2Resize(Sender: TObject);
begin
  dbgIndicadoresDisponibles.Width := Round(ts2.Width / 2) - Round(pnl1.Width / 2);
  tbToolBarTS2.Left := dbgIndicadoresAsociados.Left;
  lbAsociados2.Left := dbgIndicadoresAsociados.Left + tbToolBarTS2.Width + 5;
end;

procedure TfrmConfiguracionScoring.ts4Resize(Sender: TObject);
begin
  dbgItemsDisponibles.Width := Round(ts4.Width / 2) - Round(pnl3.Width / 2);
  tbToolBarTS4.Left := dbgItemsAsociados.Left;
  lbAsociados4.Left := dbgItemsAsociados.Left + tbToolBarTS4.Width + 5;
end;

procedure TfrmConfiguracionScoring.Asociar(Sender: TObject);
begin
  Asociacion(Copy(TToolButton(Sender).Name, 4, MAXINT), taAsociar);
end;

procedure TfrmConfiguracionScoring.Quitar(Sender: TObject);
begin
  Asociacion(Copy(TToolButton(Sender).Name, 4, MAXINT), taQuitar);
end;

procedure TfrmConfiguracionScoring.Asociacion(sTabla: String; Accion: TTipoAccion);
var
  cdsConsulta: TClientDataSet;
  iPosicionOriginal: Integer;
  sdqConsultaAsociados: TSDQuery;
  sdqConsultaDisponible: TSDQuery;
  sPrefijo: String;
  sSQL: String;
begin
  sPrefijo := Copy(sTabla, 2, 3);
  sdqConsultaDisponible := TSDQuery(FindComponent('sdqDisp' + sTabla));
  sdqConsultaAsociados  := TSDQuery(FindComponent('sdqAsoc' + sTabla));
  iPosicionOriginal := sdqConsultaAsociados.FieldByName(sPrefijo + 'Posicion').AsInteger;

  case pcPaginas.ActivePageIndex of
    1: cdsConsulta := cdsMSC_SCORINGCRITERIO;
    3: cdsConsulta := cdsMSI_SCORINGINDICADOR;
  else
    cdsConsulta := nil;
  end;

  case Accion of
    taAsociar : sSQL := 'INSERT INTO ' + sTabla + ' VALUES (' + cdsConsulta.Fields[0].AsString + ',' + sdqConsultaDisponible.Fields[0].AsString + ', 0)';

    taQuitar  : sSQL := 'DELETE FROM ' + sTabla + ' WHERE ' + sdqConsultaAsociados.Fields[0].FieldName + ' = ' + sdqConsultaAsociados.Fields[0].AsString +
                                                    ' AND ' + sdqConsultaAsociados.Fields[1].FieldName + ' = ' + sdqConsultaAsociados.Fields[1].AsString;
  end;
  EjecutarSQL(sSQL);

  if Accion = taQuitar then
  begin
    sSQL :=
      'UPDATE ' + sTabla +
        ' SET ' + sPrefijo + 'Posicion = ' + sPrefijo + 'Posicion - 1 ' +
      ' WHERE ' + sPrefijo + 'Posicion > ' + SQLValue(iPosicionOriginal);
    EjecutarSQL(sSQL);
  end;
  
  sdqConsultaDisponible.Refresh;
  sdqConsultaAsociados.Refresh;
  BotonesSubeBajaAsociaciones(sdqConsultaAsociados);
end;

procedure TfrmConfiguracionScoring.OrdenarAsociacion(Sender: TObject);
var
  iDiferencia: Integer;
  iIDOriginal1: Integer;
  iIDOriginal2: Integer;
  iPosicionOriginal: Integer;
  sdqConsulta: TSDQuery;
  sPrefijo: String;
  sTabla: String;
begin
  sTabla := Copy(TToolButton(Sender).Name, 7, MAXINT);
  sPrefijo := Copy(sTabla, 2, 3);
  sdqConsulta := TSDQuery(Self.FindComponent('sdqAsoc' + sTabla));

  iPosicionOriginal := sdqConsulta.FieldByName(sPrefijo + 'POSICION').AsInteger;
  iIDOriginal1      := sdqConsulta.Fields[0].AsInteger;
  iIDOriginal2      := sdqConsulta.Fields[1].AsInteger;

  if Copy(TToolButton(Sender).Name, 3, 4) = 'Sube' then
    iDiferencia := -1
  else
    iDiferencia := +1;

  with objSQL do
  try
    SqlType := stUpdate;

    Clear;
    TableName := sTabla;
    PrimaryKey.Add(sdqConsulta.Fields[0].FieldName, iIDOriginal1);
    PrimaryKey.Add(sdqConsulta.Fields[1].FieldName, iIDOriginal2);
    Fields.Add(sPrefijo + 'POSICION', 9999);
    EjecutarSQL(objSQL.SQL);

    Clear;
    TableName := sTabla;
    PrimaryKey.Add(sPrefijo + 'POSICION', iPosicionOriginal + iDiferencia);
    Fields.Add(sPrefijo + 'POSICION', iPosicionOriginal);
    EjecutarSQL(objSQL.SQL);

    Clear;
    TableName := sTabla;
    PrimaryKey.Add(sdqConsulta.Fields[0].FieldName, iIDOriginal1);
    PrimaryKey.Add(sdqConsulta.Fields[1].FieldName, iIDOriginal2);
    Fields.Add(sPrefijo + 'POSICION', iPosicionOriginal + iDiferencia);
    EjecutarSQL(objSQL.SQL);
  except
    MsgBox('Ha ocurrido un error al guardar los datos ingresados.');
  end;

  sdqConsulta.Refresh;
  sdqConsulta.Locate(sdqConsulta.Fields[0].FieldName + ';' + sdqConsulta.Fields[1].FieldName, VarArrayOf([iIDOriginal1, iIDOriginal2]), []);
end;

procedure TfrmConfiguracionScoring.PrepararSubConsultas;
  procedure Preparar(sdqConsulta: TSDQuery; cdsConsulta: TClientDataSet; Campo1, Campo2: String; Boton: TToolButton);
  begin
    with sdqConsulta do
    begin
      if ParamByName(Campo1).AsInteger <> cdsConsulta.FieldByName(Campo2).AsInteger then
      begin
        Close;
        ParamByName(Campo1).AsInteger := cdsConsulta.FieldByName(Campo2).AsInteger;
        Open;
      end
      else
        Refresh;

      Boton.Enabled := not IsEmpty;
    end;
  end;
begin
  case pcPaginas.ActivePageIndex of
    1:
    begin
      Preparar(sdqDispMCI_SCORINGCRITERIOINDICADOR, cdsMSC_SCORINGCRITERIO, 'IDCriterio', 'SC_ID', tb1MCI_SCORINGCRITERIOINDICADOR);
      Preparar(sdqAsocMCI_SCORINGCRITERIOINDICADOR, cdsMSC_SCORINGCRITERIO, 'IDCriterio', 'SC_ID', tb2MCI_SCORINGCRITERIOINDICADOR);
    end;
    3:
    begin
      Preparar(sdqDispMID_SCORINGINDICADORDESC, cdsMSI_SCORINGINDICADOR, 'IDIndicador', 'SI_ID', tb1MID_SCORINGINDICADORDESC);
      Preparar(sdqAsocMID_SCORINGINDICADORDESC, cdsMSI_SCORINGINDICADOR, 'IDIndicador', 'SI_ID', tb2MID_SCORINGINDICADORDESC);
    end;
  end;
end;

procedure TfrmConfiguracionScoring.PintoRenglon(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  if Field.DataSet.FieldByName('TIPO').AsString = '1' then
    Background := clInfoBK;

  inherited;
end;

end.
