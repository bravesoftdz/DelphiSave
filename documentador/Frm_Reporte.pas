unit Frm_Reporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, ImgList, SDEngine, Menus,
  Printers;

type
  TFrm_Reportes = class(TForm)
    Panel1: TPanel;
    Ntb_Pasos: TNotebook;
    Il_ListImag: TImageList;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Panel4: TPanel;
    Cmd_Cancelar: TButton;
    Panel5: TPanel;
    Cmd_Siguiente: TButton;
    Cmd_Anterior: TButton;
    Panel6: TPanel;
    Chk_ImpDescTablas: TCheckBox;
    Chk_ListTablas: TCheckBox;
    Lv_Tablas: TListView;
    pMnu_Seleccionar: TPopupMenu;
    Mnu_Agregar: TMenuItem;
    Mnu_Quitar: TMenuItem;
    N1: TMenuItem;
    Mnu_SelTodos: TMenuItem;
    Mnu_Limpiar: TMenuItem;
    Label2: TLabel;
    Memo_Explicacion: TMemo;
    Panel7: TPanel;
    Image2: TImage;
    Label1: TLabel;
    Cmd_SeleccionarImpresora: TButton;
    Image3: TImage;
    Panel8: TPanel;
    Chk_ImpDescVistas: TCheckBox;
    Chk_ListVistas: TCheckBox;
    Lv_Vistas: TListView;
    Lv_Procedimientos: TListView;
    Panel9: TPanel;
    Chk_ImpDescProc: TCheckBox;
    Chk_ListProc: TCheckBox;
    Label3: TLabel;
    Cmb_Impresoras: TComboBox;
    DglImpresora: TPrintDialog;
    Label4: TLabel;
    Te_CopiasImpre: TEdit;
    GrpBox_Salida: TRadioGroup;
    Label5: TLabel;
    procedure Cmd_SiguienteClick(Sender: TObject);
    procedure Cmd_AnteriorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Ejecutar(Owner, Filtro: string);
    procedure Cmd_CancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Lv_TablasDblClick(Sender: TObject);
    procedure Mnu_AgregarClick(Sender: TObject);
    procedure Mnu_QuitarClick(Sender: TObject);
    procedure Mnu_SelTodosClick(Sender: TObject);
    procedure Mnu_LimpiarClick(Sender: TObject);
    procedure Ntb_PasosPageChanged(Sender: TObject);
    procedure Cmd_SeleccionarImpresoraClick(Sender: TObject);
    procedure Cmb_ImpresorasChange(Sender: TObject);
    procedure Te_CopiasImpreChange(Sender: TObject);
  private
    { Private declarations }
    sOwner: string;
    sFiltro: string;
    Lv_Activo: TListView;
    Impresora: TPrinter;
  public
    { Public declarations }
  end;

var
  Frm_Reportes: TFrm_Reportes;

implementation

uses BaseDeDatos, QRpt_RepOwner, QRpt_RepCodigo, QRpt_RepDescripciones;

{$R *.DFM}

procedure TFrm_Reportes.Cmd_SiguienteClick(Sender: TObject);
begin
  if not (ntb_pasos.PageIndex = ntb_pasos.Pages.Count) then
  begin
    ntb_pasos.PageIndex := ntb_pasos.PageIndex + 1;
  end;
end;

procedure TFrm_Reportes.Cmd_AnteriorClick(Sender: TObject);
begin
  if not (ntb_pasos.PageIndex = 0) then
  begin
    ntb_pasos.PageIndex := ntb_pasos.PageIndex - 1;
  end;
end;

procedure TFrm_Reportes.FormShow(Sender: TObject);
begin

  ntb_pasos.PageIndex := 0;

end;

procedure TFrm_Reportes.Ejecutar(Owner, Filtro: string);
var
  Cursor: TSDQuery;
  ItmNue: TListItem;            //Nuevo Item
begin
  sOwner := Owner;
  sFiltro := Filtro;
  Self.Caption := 'Asistente de Reportes (' + Owner + ')';
  Impresora := TPrinter.Create();

//Cargar Todos los Listados
  Cursor := TSDQuery.Create(Self);
  Cursor.Databasename := BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.DatabaseName;
  Cursor.Sql.Add('SELECT OBJECT_NAME, COMMENTS ');
  Cursor.SQL.Add('FROM SYS.ALL_OBJECTS, SYS.ALL_TAB_COMMENTS ');
  Cursor.SQL.Add('WHERE OBJECT_TYPE = ''TABLE'' ');
  Cursor.SQL.Add('AND OBJECT_NAME = TABLE_NAME (+)');
  Cursor.SQL.Add('AND SYS.ALL_OBJECTS.OWNER = ''' + sOwner + ''' ');
  Cursor.SQL.Add('AND SYS.ALL_TAB_COMMENTS.OWNER = ''' + sOwner + ''' ');
  Cursor.SQL.Add(sFiltro);
  Cursor.SQL.Add('ORDER BY OBJECT_NAME ');
  Cursor.Open;
  while not Cursor.EOF do
  begin
    ItmNue := Lv_Tablas.Items.Add;
    ItmNue.ImageIndex := 0;
    ItmNue.Caption := Cursor.FieldByName('OBJECT_NAME').Text;
    ItmNue.SubItems.Add(Cursor.FieldByName('COMMENTS').Text);
    Cursor.Next;
  end;
  Cursor.Close;

// Vistas
  Cursor.Sql.Clear;
  Cursor.Sql.Add('SELECT OBJECT_NAME, COMMENTS, STATUS ');
  Cursor.SQL.Add('FROM SYS.ALL_OBJECTS, SYS.ALL_TAB_COMMENTS ');
  Cursor.SQL.Add('WHERE OBJECT_TYPE = ''VIEW'' ');
  Cursor.SQL.Add('AND OBJECT_NAME = TABLE_NAME (+)');
  Cursor.SQL.Add('AND SYS.ALL_OBJECTS.OWNER = ''' + sOwner + ''' ');
  Cursor.SQL.Add('AND SYS.ALL_TAB_COMMENTS.OWNER = ''' + sOwner + ''' ');
  Cursor.SQL.Add(sFiltro);
  Cursor.SQL.Add('ORDER BY OBJECT_NAME ');

  Cursor.Open;
  while not Cursor.EOF do
  begin
    ItmNue := Lv_Vistas.Items.Add;
    ItmNue.ImageIndex := 2;
    ItmNue.Caption := Cursor.FieldByName('OBJECT_NAME').Text;
    ItmNue.SubItems.Add(Cursor.FieldByName('COMMENTS').Text);
    if (Cursor.FieldByName('STATUS').Text = 'VALID') then
      ItmNue.SubItems.Add('Válido')
    else
      ItmNue.SubItems.Add('Inválido');
    Cursor.Next;
  end;

// PROCEDURES Y FUNCTIONS
  Cursor.Sql.Clear;
  Cursor.Sql.Add('SELECT OBJECT_NAME, OBJECT_TYPE, STATUS ');
  Cursor.SQL.Add('FROM SYS.ALL_OBJECTS ');
  Cursor.SQL.Add('WHERE OBJECT_TYPE IN (''FUNCTION'', ''PROCEDURE'', ''PACKAGE BODY'', ''PACKAGE'') ');
  Cursor.SQL.Add('AND SYS.ALL_OBJECTS.OWNER = ''' + sOwner + ''' ');
  Cursor.SQL.Add(sFiltro);
  Cursor.Sql.Add('ORDER BY OBJECT_NAME, OBJECT_TYPE ');
  Cursor.Open;
  while not Cursor.EOF do
  begin
    ItmNue := Lv_Procedimientos.Items.Add;
    ItmNue.ImageIndex := 4;
    ItmNue.Caption := Cursor.FieldByName('OBJECT_NAME').Text;
    ItmNue.SubItems.Add(Cursor.FieldByName('OBJECT_TYPE').Text);
    if (Cursor.FieldByName('STATUS').Text = 'VALID') then
      ItmNue.SubItems.Add('Válido')
    else
      ItmNue.SubItems.Add('Inválido');
    Cursor.Next;
  end;
  Cursor.Close;
  Cursor.Destroy;

end;

procedure TFrm_Reportes.Cmd_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Reportes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrm_Reportes.Lv_TablasDblClick(Sender: TObject);
begin
  if Sender is TListView then
    if TListView(Sender).SelCount > 0 then
      if Int(TListView(Sender).Selected.ImageIndex / 2) =
        (TListView(Sender).selected.ImageIndex / 2) then
        Mnu_QuitarClick(Sender)
      else
        Mnu_AgregarClick(Sender);
end;

procedure TFrm_Reportes.Mnu_AgregarClick(Sender: TObject);
begin
  Lv_Activo.Selected.ImageIndex := 0 + ((Ntb_Pasos.PageIndex - 1) * 2);
end;

procedure TFrm_Reportes.Mnu_QuitarClick(Sender: TObject);
begin
  Lv_Activo.Selected.ImageIndex := 1 + ((Ntb_Pasos.PageIndex - 1) * 2);
end;

procedure TFrm_Reportes.Mnu_SelTodosClick(Sender: TObject);
var
  I: integer;
begin
  for i := 0 to Lv_Activo.Items.Count - 1 do
    Lv_Activo.Items[i].ImageIndex := 0 + ((Ntb_Pasos.PageIndex - 1) * 2);
  ;
end;

procedure TFrm_Reportes.Mnu_LimpiarClick(Sender: TObject);
var
  I: integer;
begin
  for i := 0 to Lv_Activo.Items.Count - 1 do
    Lv_Activo.Items[i].ImageIndex := 1 + ((Ntb_Pasos.PageIndex - 1) * 2);
  ;
end;

procedure TFrm_Reportes.Ntb_PasosPageChanged(Sender: TObject);
var
  I: integer;
  Salida: integer;
  sSubFiltro: string;
begin
//Guarda en el Puntero Lv_Activo el List View que esté en la Pantalla
  case Ntb_Pasos.PageIndex of
    1: Lv_Activo := Lv_Tablas;
    2: Lv_Activo := Lv_Vistas;
    3: Lv_Activo := Lv_Procedimientos;
    4:
    begin
      Cmb_Impresoras.Items := Impresora.Printers;
      Cmb_Impresoras.ItemIndex := Impresora.PrinterIndex;
//              Self.Caption := Impresora.Printers.Strings[Impresora.PrinterIndex ];
      Te_CopiasImpre.Text := IntToStr(Impresora.Copies);
    end;
    5:
    begin
      Salida := GrpBox_Salida.ItemIndex;
      if Chk_ListTablas.Checked then
      begin
{               J := 0;
               for I := 0 to Lv_Tablas.Items.Count -1 do begin
                   if  ((Lv_Tablas.Items[I].ImageIndex /2) =  Int(Lv_Tablas.Items[I].ImageIndex /2)) then begin
                       IF J >= 20 Then begin
                          sSubFiltro := sSubFiltro + ') OR OBJECT_NAME IN (';
                          J := 0;
                       end;
                       if (sSubFiltro = '') then
                          sSubFiltro := ' AND (OBJECT_NAME IN ('
                       else if (J > 0) then
                          sSubFiltro := sSubFiltro + ', ' ;
                       sSubFiltro := sSubFiltro + '''' + Lv_Tablas.Items[I].Caption + '''' ;
                       J := J + 1;
                   end
               End;
               If not (sSubFiltro = '') then
                  sSubFiltro := sSubFiltro + ') ) ';
}
        sSubFiltro := '';
        QRpt_Owner_Tablas.ImprimirReporte(sOwner, sFiltro +
          sSubFiltro, 'TABLE', Salida);
      end;



      if Chk_ImpDescTablas.Checked then
        for I := 0 to Lv_Tablas.Items.Count - 1 do
        begin
          if ((Lv_Tablas.Items[I].ImageIndex / 2) =
            Int(Lv_Tablas.Items[I].ImageIndex / 2)) then
            Qrpt_Descripciones.ImprimirTabla(sOwner,
              Lv_Tablas.Items[I].Caption, Salida);
        end;

      if Chk_ListVistas.Checked then
        QRpt_Owner_Tablas.ImprimirReporte(sOwner, sFiltro, 'VIEW', Salida);


      if Chk_ImpDescVistas.Checked then
        for I := 0 to Lv_Vistas.Items.Count - 1 do
          if ((Lv_Vistas.Items[I].ImageIndex / 2) =
            Int(Lv_Vistas.Items[I].ImageIndex / 2)) then
            Qrpt_Descripciones.ImprimirQuery(
              Lv_Vistas.Items[I].Caption, 'Código de la Vista',
              'SELECT TEXT ' +
              'FROM SYS.ALL_VIEWS ' +
              'WHERE OWNER = ''' + sOwner + ''' ' +
              'AND VIEW_NAME = ''' + Lv_Vistas.Items[I].Caption + ''' '
              , Salida);


      if Self.Chk_ListProc.Checked then
        QRpt_RepCodigos.ImprimirReporte(sOwner, sFiltro, '', Salida);

      if Chk_ImpDescProc.Checked then
        for I := 0 to Lv_Procedimientos.Items.Count - 1 do
        begin
          if ((Lv_Procedimientos.Items[I].ImageIndex / 2) =
            Int(Lv_Procedimientos.Items[I].ImageIndex / 2)) then
            Qrpt_Descripciones.ImprimirQuery(
              Lv_Procedimientos.Items[I].Caption, 'Código Fuente',
              'SELECT TEXT ' +
              'FROM SYS.ALL_SOURCE ' +
              'WHERE OWNER = ''' + sOwner + ''' ' +
              'AND NAME = ''' +
              Lv_Procedimientos.Items[I].Caption + ''' ' +
              'AND TYPE = ''' +
              Lv_Procedimientos.Items[I].SubItems[0] + ''' ' +
              'ORDER BY LINE ', Salida);
        end;
    end;
    else
      Lv_Activo := nil;
  end;
end;

procedure TFrm_Reportes.Cmd_SeleccionarImpresoraClick(Sender: TObject);
begin
  DglImpresora.Execute;
end;

procedure TFrm_Reportes.Cmb_ImpresorasChange(Sender: TObject);
begin
  Impresora.PrinterIndex := Cmb_Impresoras.ItemIndex;
     //Impresora.SetPrinter(ADevice,ADriver,APort,ADeviceMode);
end;

procedure TFrm_Reportes.Te_CopiasImpreChange(Sender: TObject);
begin
  Impresora.Copies := StrToInt(Te_CopiasImpre.Text);
end;

end.
