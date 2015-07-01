unit unComisionGestor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, Db, SDEngine, unArt, ComCtrls, ToolWin, ShortCutControl, PeriodoPicker, StdCtrls, ExtCtrls, FormPanel, Mask,
  ToolEdit, DateComboBox, CurrEdit;

type
  TfrmComisionGestor = class(TForm)
    sdqComisionGestor: TSDQuery;
    GridComisionGestor: TArtDBGrid;
    tlbControl: TToolBar;
    tbNuevo: TToolButton;
    tblSeparador1: TToolButton;
    tbCerrarVigencia: TToolButton;
    tbBaja: TToolButton;
    ToolButton1: TToolButton;
    tbSalir: TToolButton;
    dsComisionGestor: TDataSource;
    ShortCutControl: TShortCutControl;
    fpCierreVigencia: TFormPanel;
    BevelAbm: TBevel;
    Label6: TLabel;
    btnAceptarCierreVigencia: TButton;
    btnCancelarCierreVigencia: TButton;
    edGC_VIGENCIAHASTA: TDateComboBox;
    fpNuevaComision: TFormPanel;
    Bevel1: TBevel;
    btnAceptarNuevo: TButton;
    btnCancelarNuevo: TButton;
    edGC_COMISION: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    edGC_VIGENCIAHASTA2: TDateComboBox;
    procedure sdqComisionGestorAfterOpen(DataSet: TDataSet);
    procedure tbSalirClick(Sender: TObject);
    procedure tbBajaClick(Sender: TObject);
    procedure GridComisionGestorGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                              Highlight: Boolean);
    procedure tbCerrarVigenciaClick(Sender: TObject);
    procedure btnCancelarCierreVigenciaClick(Sender: TObject);
    procedure btnAceptarCierreVigenciaClick(Sender: TObject);
    procedure fpCierreVigenciaEnter(Sender: TObject);
    procedure btnAceptarNuevoClick(Sender: TObject);
    procedure btnCancelarNuevoClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure fpNuevaComisionEnter(Sender: TObject);
  private
    FIdGestor: TTableId;

    function ValidarAlta: Boolean;
    function ValidarCierreVigencia: Boolean;

    procedure SetIdGestor(const Value: TTableId);
  public
    property IdGestor: TTableId read FIdGestor write SetIdGestor;
  end;

implementation

{$R *.DFM}

uses
  unPrincipal, AnsiSql, unDmPrincipal, General, CustomDlgs, SqlFuncs, DateTimeFuncs;

procedure TfrmComisionGestor.SetIdGestor(const Value: TTableId);
begin
  if FIdGestor <> Value then
  begin
    FIdGestor := Value;

    sdqComisionGestor.ParamByName('idgestor').AsInteger := FIdGestor;
    OpenQuery(sdqComisionGestor);
  end;
end;

procedure TfrmComisionGestor.sdqComisionGestorAfterOpen(DataSet: TDataSet);
begin
  if sdqComisionGestor.FieldByName('comision') is TFloatField then
    TFloatField(sdqComisionGestor.FieldByName('comision')).DisplayFormat := '% 0.00;-% 0.00';
end;

procedure TfrmComisionGestor.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmComisionGestor.tbBajaClick(Sender: TObject);
var
  sSql: String;
begin
  if sdqComisionGestor.Active and (not sdqComisionGestor.IsEmpty) and
     sdqComisionGestor.FieldByName('fechabaja').IsNull and (MsgBox('¿ Desea dar de baja el registro seleccionado ?',
     MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    sSql :=
      'UPDATE lgc_gestorcomision' +
        ' SET gc_usubaja = :usubaja,' +
            ' gc_fechabaja = SYSDATE' +
      ' WHERE gc_id = :id';
    EjecutarSqlEx(sSql, [frmPrincipal.DBLogin.UserId, sdqComisionGestor.FieldByName('idgestorcomision').AsInteger]);

    sdqComisionGestor.Refresh;
  end;
end;

procedure TfrmComisionGestor.GridComisionGestorGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                             var Background: TColor; Highlight: Boolean);
begin
  if not sdqComisionGestor.FieldByName('fechabaja').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clRed)
  else if not sdqComisionGestor.FieldByName('fechacierre').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clBlue);
end;

procedure TfrmComisionGestor.tbCerrarVigenciaClick(Sender: TObject);
var
  sSql: String;
begin
  if (sdqComisionGestor.Active) and (not sdqComisionGestor.IsEmpty) then
  begin
    if ValidarCierreVigencia then
      if fpCierreVigencia.ShowModal = mrOk then
      begin
        sSql :=
          'UPDATE lgc_gestorcomision' +
            ' SET gc_vigenciahasta = :vigenciahasta,' +
                ' gc_usucierre = :usucierre,' +
                ' gc_fechacierre = SYSDATE' +
          ' WHERE gc_id = :id';
        EjecutarSqlEx(sSql, [TDateTimeEx.Create(edGC_VIGENCIAHASTA.Date), frmPrincipal.DBLogin.UserId,
                             sdqComisionGestor.FieldByName('idgestorcomision').AsInteger]);

        sdqComisionGestor.Refresh;
      end;
  end;
end;

procedure TfrmComisionGestor.btnCancelarCierreVigenciaClick(Sender: TObject);
begin
  fpCierreVigencia.ModalResult := mrCancel;
end;

procedure TfrmComisionGestor.btnAceptarCierreVigenciaClick(Sender: TObject);
begin
  if edGC_VIGENCIAHASTA.IsEmpty then
    InvalidMsg(edGC_VIGENCIAHASTA, 'La vigencia hasta es obligatoria.')
  else
    fpCierreVigencia.ModalResult := mrOk;
end;

function TfrmComisionGestor.ValidarCierreVigencia: Boolean;
begin
  Result := False;

  if not sdqComisionGestor.FieldByName('fechabaja').IsNull then
    InvalidMsg(GridComisionGestor, 'Este registro se encuentra dado de baja.')
  else if not sdqComisionGestor.FieldByName('vigenciahasta').IsNull then
    InvalidMsg(GridComisionGestor, 'Este registro ya tiene vigencia hasta cargada.')
  else
    Result := True;
end;

procedure TfrmComisionGestor.fpCierreVigenciaEnter(Sender: TObject);
begin
  edGC_VIGENCIAHASTA.Clear;
end;

procedure TfrmComisionGestor.btnAceptarNuevoClick(Sender: TObject);
begin
  if edGC_COMISION.Value <= 0 then
    InvalidMsg(edGC_COMISION, 'El porcentaje de comisión debe ser mayor a 0.')
  else
    fpNuevaComision.ModalResult := mrOk;
end;

procedure TfrmComisionGestor.btnCancelarNuevoClick(Sender: TObject);
begin
  fpNuevaComision.ModalResult := mrCancel;
end;

procedure TfrmComisionGestor.tbNuevoClick(Sender: TObject);
begin
  if ValidarAlta then
    if fpNuevaComision.ShowModal = mrOk then
    begin
      with TSql.Create('lgc_gestorcomision') do
      try
        PrimaryKey.Add('gc_id',        GetSecNextVal('SEQ_LGC_ID'), False);
        Fields.Add('gc_idgestor',      IdGestor);
        Fields.Add('gc_comision',      edGC_COMISION.Value);
        Fields.Add('gc_vigenciahasta', edGC_VIGENCIAHASTA2.Date);
        if not edGC_VIGENCIAHASTA2.IsEmpty then
        begin
          Fields.Add('gc_usucierre',   frmPrincipal.DBLogin.UserId);
          Fields.Add('gc_fechacierre', exDateTime);
        end;
        Fields.Add('gc_fechaalta', exDateTime);
        Fields.Add('gc_usualta',   frmPrincipal.DBLogin.UserId);
        SqlType := stInsert;

        EjecutarSql(Sql);

        sdqComisionGestor.Refresh;
      finally
        Free;
      end;
    end;
end;

procedure TfrmComisionGestor.fpNuevaComisionEnter(Sender: TObject);
begin
  edGC_COMISION.Clear;
  edGC_VIGENCIAHASTA2.Clear;
end;

function TfrmComisionGestor.ValidarAlta: Boolean;
var
  sSql: String;
begin
  Result := False;

  sSql :=
    'SELECT 1' +
     ' FROM lgc_gestorcomision' +
    ' WHERE gc_fechabaja IS NULL' +
      ' AND (   gc_vigenciahasta IS NULL' +
           ' OR gc_vigenciahasta > actualdate)' +
      ' AND gc_idgestor = :idgestor';

  if ExisteSqlEx(sSql, [IdGestor]) then
    InvalidMsg(GridComisionGestor, 'No puede dar de alta una nueva vigencia si ya existen vigencias activas.')
  else
    Result := True;
end;

end.
