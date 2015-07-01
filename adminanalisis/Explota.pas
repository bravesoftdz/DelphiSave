unit Explota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, Buttons, RxLookup, Grids, DBGrids, StdCtrls, ComCtrls, Mask,
  unfraPrestadorAMP, unFraEmpresa, unfraOperativo, unArtFrame, unArtDbFrame,
  unArtDBAwareFrame, unFraEmpresaAfi;

type
  TfrmExplota = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    tsPeriodo: TTabSheet;
    tsPrestador: TTabSheet;
    tsEmpresas: TTabSheet;
    Label12: TLabel;
    lblTotExpuestos: TLabel;
    lblTotEmpresa: TLabel;
    Label15: TLabel;
    lblTotHC: TLabel;
    Label17: TLabel;
    lblTotAnormales: TLabel;
    Label19: TLabel;
    lblTotNormales: TLabel;
    Label21: TLabel;
    dbgDatos: TDBGrid;
    Label1: TLabel;
    sbEmpresas: TSpeedButton;
    sbExpuestos: TSpeedButton;
    sbHC: TSpeedButton;
    dsDatos: TDataSource;
    sdqDatos: TSDQuery;
    Label3: TLabel;
    lblPreExpuestos: TLabel;
    lblPreEmpresas: TLabel;
    Label6: TLabel;
    lblPreHC: TLabel;
    Label8: TLabel;
    lblPreAnormales: TLabel;
    Label10: TLabel;
    lblPreNormales: TLabel;
    Label13: TLabel;
    sbPreEmpresas: TSpeedButton;
    sbPreExpuestos: TSpeedButton;
    sbPreHc: TSpeedButton;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    lblEmpEmpresas: TLabel;
    Label9: TLabel;
    lblEmpExpuestos: TLabel;
    Label14: TLabel;
    lblEmpHC: TLabel;
    Label18: TLabel;
    lblEmpAnormales: TLabel;
    Label22: TLabel;
    lblEmpNormales: TLabel;
    DBGrid2: TDBGrid;
    sbEmpEmpresas: TSpeedButton;
    sbEmpExpuestos: TSpeedButton;
    sbEmpHC: TSpeedButton;
    fraPrestadorAMP: TfraPrestadorAMP;
    Label2: TLabel;
    fraOperativo: TfraOperativo;
    fraEmpresa: TfraEmpresa;
    procedure OnPeriodoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbEmpresasClick(Sender: TObject);
    procedure sbExpuestosClick(Sender: TObject);
    procedure sbHCClick(Sender: TObject);
    procedure sbPreEmpresasClick(Sender: TObject);
    procedure sbPreHcClick(Sender: TObject);
    procedure sbPreExpuestosClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure OnEmpresaChange(Sender: TObject);
    procedure sbEmpEmpresasClick(Sender: TObject);
    procedure sbEmpExpuestosClick(Sender: TObject);
    procedure sbEmpHCClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdBotones( Valor: boolean );
    procedure UpdBotonesPre(Valor: boolean);
    procedure UpdBotonesEmp(Valor: boolean);
  public
    { Public declarations }
  end;

//var
//  frmExplota: TfrmExplota;

implementation

uses unDmPrincipal;

{$R *.DFM}

//---------------------------------------------------------------------------//
procedure TfrmExplota.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := tsPeriodo;
  fraOperativo.OnChange   := OnPeriodoChange;
  fraEmpresa.OnChange     := OnEmpresaChange;
  fraEmpresa.ShowBajas    := True;
end;

//---------------------------------------------------------------------------//
procedure TfrmExplota.UpdBotones(Valor: boolean);
begin
     sbEmpresas.Enabled  := Valor;
     sbEmpresas.Down     := False;
     sbExpuestos.Enabled := Valor;
     sbExpuestos.Down    := False;
     sbHC.Enabled        := Valor;
     sbHC.Down           := False;
end;

//---------------------------------------------------------------------------//
procedure TfrmExplota.UpdBotonesPre(Valor: boolean);
begin
     sbPreEmpresas.Enabled  := Valor;
     sbPreEmpresas.Down     := False;
     sbPreExpuestos.Enabled := Valor;
     sbPreExpuestos.Down    := False;
     sbPreHC.Enabled        := Valor;
     sbPreHC.Down           := False;
end;

//---------------------------------------------------------------------------//
procedure TfrmExplota.UpdBotonesEmp(Valor: boolean);
begin
     sbEmpEmpresas.Enabled  := Valor;
     sbEmpEmpresas.Down     := False;
     sbEmpExpuestos.Enabled := Valor;
     sbEmpExpuestos.Down    := False;
     sbEmpHC.Enabled        := Valor;
     sbEmpHC.Down           := False;
end;

//---------------------------------------------------------------------------//
procedure TfrmExplota.OnPeriodoChange(Sender: TObject);
var
   tmp, tmp1 : integer;
begin

     sdqDatos.Close;

     lblTotEmpresa.Caption := ValorSQL( ' SELECT count( distinct mp_cuit || mp_estableci ) ' +
                                        '   FROM amp_empresas ' +
                                        '  WHERE mp_periodo = ''' + fraOperativo.edPeriodo.Text + '''' );

     lblTotHC.Caption := ValorSQL( ' SELECT count(*) ' +
                                   '   FROM ate_exatrab, amp_empresas ' +
                                   '  WHERE mp_cuit = te_cuit ' +
                                   '    AND mp_estableci = te_estableci ' +
                                   '    AND mp_periodo = te_periodo ' +
                                   '    AND mp_periodo = ''' + fraOperativo.edPeriodo.Text + ''''  +
                                   '  GROUP by mp_periodo ' );

     tmp := ValorSQL( ' SELECT ''0'' || SUM( mr_cantidad ) ' +
                      '   FROM amr_maxriesgo ' +
                      '  WHERE mr_anexo in ( ''1'',''2'' ) ' +
                      '    and mr_peridodo = ''' + fraOperativo.edPeriodo.Text + '''' );

     tmp1 :=  ValorSQL( ' SELECT ''0'' || SUM( mr_cantidad ) ' +
                            '   FROM amr_maxriesgo aa ' +
                            '  WHERE aa.mr_peridodo = ''' + fraOperativo.edPeriodo.Text + '''' +
                            '    AND aa.mr_anexo = ''3''' +
                            '    AND rowid = ( SELECT MAX( rowid ) ' +
                            '                    FROM amr_maxriesgo bb ' +
                            '                   WHERE bb.mr_cuit = aa.mr_cuit ' +
                            '                     AND bb.mr_peridodo = aa.mr_peridodo ' +
                            '                     AND bb.mr_anexo = aa.mr_anexo ) ' );


     lblTotExpuestos.Caption := IntToStr( tmp + tmp1);

     UpdBotones( True );
end;
//---------------------------------------------------------------------------//
procedure TfrmExplota.sbEmpresasClick(Sender: TObject);
begin
     if not sbEmpresas.Down then
        exit;

     sdqDatos.Close;
     sdqDatos.Sql.Text := ' SELECT mp_cuit, mp_estableci, st_nombre, mp_ciiu, PR_NOMBRE MP_RAZON ' +
                          '   FROM amp_empresas, cst_estableci, APR_PRESTADORES ' +
                          '  WHERE mp_cuit = st_cuit ' +
                          '    AND mp_estableci = st_clave ' +
                          '    AND mp_prestador = PR_CODIGO ' +
                         '    AND mp_periodo = ''' + fraOperativo.edPeriodo.Text + '''' +
                          '  ORDER BY st_nombre ';
     sdqDatos.Open;

     dbgDatos.Columns.Items[0].Title.Caption := 'Cuit';
     dbgDatos.Columns.Items[0].Width         := 80;
     dbgDatos.Columns.Items[1].Title.Caption := 'Estab.';
     dbgDatos.Columns.Items[1].Width         := 30;
     dbgDatos.Columns.Items[2].Title.Caption := 'Razón Social';
     dbgDatos.Columns.Items[2].Width         := 250;
     dbgDatos.Columns.Items[3].Title.Caption := 'CIIU';
     dbgDatos.Columns.Items[3].Width         := 40;
     dbgDatos.Columns.Items[4].Title.Caption := 'Prestador';
     dbgDatos.Columns.Items[4].Width         := 150;
{
     dbgDatos.Columns.Items[5].Title.Caption := 'Anexo';
     dbgDatos.Columns.Items[5].Width         := 30;
}

end;

//---------------------------------------------------------------------------//
procedure TfrmExplota.sbExpuestosClick(Sender: TObject);
begin
     if not sbExpuestos.Down then
        exit;

     sdqDatos.Close;
     sdqDatos.Sql.Text := ' SELECT mr_anexo, sum( mr_cantidad ) ' +
                          '   FROM amr_maxriesgo ' +
                          '  WHERE mr_peridodo = ''' + fraOperativo.edPeriodo.Text + '''' +
                          '    AND mr_anexo in (''1'',''2'') ' +
                          '  GROUP BY mr_anexo ' +
                          'UNION ' +
                          ' SELECT ''3'', SUM( mr_cantidad ) ' +
                          '   FROM amr_maxriesgo aa ' +
                          '  WHERE aa.mr_peridodo = ''' + fraOperativo.edPeriodo.Text + '''' +
                          '    AND aa.mr_anexo = ''3''' +
                          '    AND rowid = ( SELECT MAX( rowid ) ' +
                          '                    FROM amr_maxriesgo bb ' +
                          '                   WHERE bb.mr_cuit = aa.mr_cuit ' +
                          '                     AND bb.mr_peridodo = aa.mr_peridodo ' +
                          '                     AND bb.mr_anexo = aa.mr_anexo ) ';




     sdqDatos.Open;

     dbgDatos.Columns.Items[0].Title.Caption := 'Anexo';
     dbgDatos.Columns.Items[0].Width         := 40;
     dbgDatos.Columns.Items[1].Title.Caption := 'Expuestos';
     dbgDatos.Columns.Items[1].Width         := 60;
     dbgDatos.Columns.Items[1].Alignment     := taRightJustify;


end;
//---------------------------------------------------------------------------//
procedure TfrmExplota.sbHCClick(Sender: TObject);
begin
     if not sbHc.Down then
        exit;

     sdqDatos.Close;
     sdqDatos.Sql.Text := ' SELECT PR_NOMBRE pm_razon, count(*) cant ' +
                          '   FROM ate_exatrab, amp_empresas, APR_PRESTADORES ' +
                          '  WHERE mp_cuit = te_cuit ' +
                          '    AND mp_estableci = te_estableci ' +
                          '    AND mp_periodo = te_periodo ' +
                          '    AND mp_prestador = PR_CODIGO ' +
                          '    AND te_periodo = ''' + fraOperativo.edPeriodo.Text + '''' +
                          '  GROUP BY PR_NOMBRE ';
     sdqDatos.Open;

     dbgDatos.Columns.Items[0].Title.Caption := 'Prestador';
     dbgDatos.Columns.Items[0].Width         := 200;
     dbgDatos.Columns.Items[1].Title.Caption := 'H.Clínicas';
     dbgDatos.Columns.Items[1].Width         := 60;
     dbgDatos.Columns.Items[1].Alignment     := taRightJustify;

end;

//---------------------------------------------------------------------------//

//---------------------------------------------------------------------------//
procedure TfrmExplota.sbPreEmpresasClick(Sender: TObject);
begin
     if not sbPreEmpresas.Down then
        exit;

     sdqDatos.Close;
     sdqDatos.Sql.Text := ' SELECT pe_descripcion, count(*) ' +
                          '   FROM amp_empresas, amp_periodos ' +
                          '  WHERE mp_prestador = ''' + fraPrestadorAMP.edCodigo.Text + '''' +
                          '    AND mp_periodo = pe_periodo ' +
                          '  GROUP by pe_descripcion ';

     sdqDatos.Open;

     dbgDatos.Columns.Items[0].Title.Caption := 'Período';
     dbgDatos.Columns.Items[0].Width         := 150;
     dbgDatos.Columns.Items[1].Title.Caption := 'Cantidad';
     dbgDatos.Columns.Items[1].Width         := 60;
     dbgDatos.Columns.Items[1].Alignment     := taRightJustify;


end;

//---------------------------------------------------------------------------//
procedure TfrmExplota.sbPreHcClick(Sender: TObject);
begin
     if not sbPreHc.Down then
        exit;

     sdqDatos.Close;
     sdqDatos.Sql.Text := ' SELECT pe_descripcion, count(*) ' +
                          '   FROM ate_exatrab, amp_empresas, amp_periodos ' +
                          '  WHERE te_cuit = mp_cuit ' +
                          '    AND te_estableci = mp_estableci ' +
                          '    AND mp_periodo = pe_periodo ' +
                          '    AND mp_prestador = ''' + fraPrestadorAMP.edCodigo.Text + '''' +
                          '  GROUP by pe_descripcion';
     sdqDatos.Open;

     dbgDatos.Columns.Items[0].Title.Caption := 'Período';
     dbgDatos.Columns.Items[0].Width         := 150;
     dbgDatos.Columns.Items[1].Title.Caption := 'Cantidad';
     dbgDatos.Columns.Items[1].Width         := 60;
     dbgDatos.Columns.Items[1].Alignment     := taRightJustify;

end;

//---------------------------------------------------------------------------//
procedure TfrmExplota.sbPreExpuestosClick(Sender: TObject);
begin
     if not sbPreExpuestos.Down then
        exit;

     sdqDatos.Close;
     sdqDatos.Sql.Text := ' select ap_descripcion, sum( ap_total ) cant ' +
                          '   from art.amp_anormal_periodo ' +
                          '  where ap_prestador = ''' + fraPrestadorAMP.edCodigo.Text + '''' +
                          '  group by ap_descripcion';
     sdqDatos.Open;

     dbgDatos.Columns.Items[0].Title.Caption := 'Período';
     dbgDatos.Columns.Items[0].Width         := 150;
     dbgDatos.Columns.Items[1].Title.Caption := 'Cantidad';
     dbgDatos.Columns.Items[1].Width         := 60;
     dbgDatos.Columns.Items[1].Alignment     := taRightJustify;

end;

//---------------------------------------------------------------------------//
procedure TfrmExplota.PageControl1Change(Sender: TObject);
begin
     sdqDatos.Close;

     fraPrestadorAMP.Limpiar ;
     lblPreEmpresas.Caption   := '';
     lblPreHC.Caption         := '';
     lblPreExpuestos.Caption  := '';
     lblPreAnormales.Caption  := '';
     lblPreNormales.Caption   := '';
     UpdBotones( False );

     fraOperativo.Limpiar;
     lblTotEmpresa.Caption    := '';
     lblTotHC.Caption         := '';
     lblTotExpuestos.Caption  := '';
     lblTotAnormales.Caption  := '';
     lblTotNormales.Caption   := '';
     UpdBotonesPre( False );

     fraEmpresa.Clear;
     lblEmpEmpresas.Caption   := '';
     lblEmpHC.Caption         := '';
     lblEmpExpuestos.Caption  := '';
     lblEmpAnormales.Caption  := '';
     lblEmpNormales.Caption   := '';
     UpdBotonesEmp( False );


end;

//---------------------------------------------------------------------------//
procedure TfrmExplota.OnEmpresaChange(Sender: TObject);
var
   tmp, tmp1 : integer;
begin
     sdqDatos.Close;

     lblEmpEmpresas.Caption := ValorSQL( ' SELECT count(distinct mp_estableci) ' +
                                         '   FROM amp_empresas ' +
                                         '  WHERE mp_cuit = ''' + fraEmpresa.mskCUIT.Text + '''' );


     lblEmpHC.Caption := ValorSQL( ' SELECT count(*) ' +
                                   '   FROM ate_exatrab ' +
                                   '  WHERE te_cuit = ''' + fraEmpresa.mskCUIT.Text + '''' );


     tmp := ValorSQL( ' SELECT ''0'' || SUM( mr_cantidad ) ' +
                      '   FROM amr_maxriesgo ' +
                      '  WHERE mr_anexo in (''1'',''2'') ' +
                      '    AND mr_cuit = ''' + fraEmpresa.mskCUIT.Text + '''' );

     tmp1 :=  ValorSQL( ' SELECT ''0'' || SUM( mr_cantidad ) ' +
                        '   FROM amr_maxriesgo aa ' +
                        '  WHERE mr_cuit = ''' + fraEmpresa.mskCUIT.Text + '''' +
                        '    AND aa.mr_anexo = ''3'' ' +
                        '    AND aa.rowid = ( SELECT MAX( bb.rowid ) ' +
                        '                       FROM amr_maxriesgo bb ' +
                        '                      WHERE bb.mr_cuit = aa.mr_cuit ' +
                        '                        AND bb.mr_peridodo = aa.mr_peridodo ' +
                        '                        AND bb.mr_anexo = aa.mr_anexo ) ');


     lblEmpExpuestos.Caption := IntToStr( tmp + tmp1);

     UpdBotonesEmp( True );
end;

//---------------------------------------------------------------------------//
procedure TfrmExplota.sbEmpEmpresasClick(Sender: TObject);
begin
     if not sbEmpEmpresas.Down then
        exit;

     sdqDatos.Close;
     sdqDatos.Sql.Text := ' SELECT pe_descripcion, mp_estableci' +
                          '   FROM amp_empresas amp, amp_periodos ' +
                          '  WHERE amp.mp_cuit = ''' + fraEmpresa.mskCUIT.Text + '''' +
                          '    AND amp.mp_periodo = pe_periodo';

     sdqDatos.Open;

     dbgDatos.Columns.Items[0].Title.Caption := 'Período';
     dbgDatos.Columns.Items[0].Width         := 150;
     dbgDatos.Columns.Items[1].Title.Caption := 'Estab.';
     dbgDatos.Columns.Items[1].Width         := 40;
     dbgDatos.Columns.Items[1].Alignment     := taRightJustify;

end;

//---------------------------------------------------------------------------//
procedure TfrmExplota.sbEmpExpuestosClick(Sender: TObject);
begin
     if not sbEmpExpuestos.Down then
        exit;

     sdqDatos.Close;

     sdqDatos.Sql.Text := ' SELECT pe_descripcion, mr_anexo, sum( mr_cantidad ) ' +
                          '   FROM amr_maxriesgo, amp_periodos ' +
                          '  WHERE mr_cuit = ''' + fraEmpresa.mskCUIT.Text + '''' +
                          '    AND mr_peridodo = pe_periodo ' +
                          '    AND mr_anexo in (''1'',''2'') ' +
                          '  GROUP BY pe_descripcion, mr_anexo ' +
                          'UNION ' +
                          ' SELECT pe_descripcion, ''3'', SUM( mr_cantidad ) ' +
                          '   FROM amr_maxriesgo aa, amp_periodos ' +
                          '  WHERE aa.mr_cuit = ''' + fraEmpresa.mskCUIT.Text + '''' +
                          '    AND mr_peridodo = pe_periodo ' +
                          '    AND aa.mr_anexo = ''3''' +
                          '    AND aa.rowid = ( SELECT MAX( rowid ) ' +
                          '                    FROM amr_maxriesgo bb ' +
                          '                   WHERE bb.mr_cuit = aa.mr_cuit ' +
                          '                     AND bb.mr_peridodo = aa.mr_peridodo ' +
                          '                     AND bb.mr_anexo = aa.mr_anexo ) ' +
                          '  GROUP BY pe_descripcion ';




     sdqDatos.Open;

     dbgDatos.Columns.Items[0].Title.Caption := 'Periodo';
     dbgDatos.Columns.Items[0].Width         := 150;
     dbgDatos.Columns.Items[1].Title.Caption := 'Anexo';
     dbgDatos.Columns.Items[1].Width         := 30;
     dbgDatos.Columns.Items[2].Title.Caption := 'Cantidad';
     dbgDatos.Columns.Items[2].Width         := 60;
     dbgDatos.Columns.Items[2].Alignment     := taRightJustify;
end;

//---------------------------------------------------------------------------//
procedure TfrmExplota.sbEmpHCClick(Sender: TObject);
begin
     if not sbEmpHc.Down then
        exit;

     sdqDatos.Close;
     sdqDatos.Sql.Text := ' SELECT pe_descripcion, count(*) cant ' +
                          '   FROM ate_exatrab, amp_periodos ' +
                          '  WHERE te_periodo = pe_periodo(+) ' +
                          '    AND te_cuit = ''' + fraEmpresa.mskCUIT.Text + '''' +
                          '  GROUP BY pe_descripcion ';

     sdqDatos.Open;

     dbgDatos.Columns.Items[0].Title.Caption := 'Período';
     dbgDatos.Columns.Items[0].Width         := 150;
     dbgDatos.Columns.Items[1].Title.Caption := 'H.Clínicas';
     dbgDatos.Columns.Items[1].Width         := 50;
     dbgDatos.Columns.Items[1].Alignment     := taRightJustify;
end;

//---------------------------------------------------------------------------//
end.
