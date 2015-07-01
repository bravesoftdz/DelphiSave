unit Frm_Esrtructura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, SDEngine, Menus, UnTDbNodo, General, Placemnt, Registros;

type
  TFrm_Estructura = class(TForm)
    Tv_Arbol: TTreeView;
    ImgLs_IconosDelArbol: TImageList;
    pMnu_Tablas: TPopupMenu;
    Mnu_TablasConsultas: TMenuItem;
    Mnu_TablasConsAutom: TMenuItem;
    N1: TMenuItem;
    Mnu_TablasGenCons: TMenuItem;
    Mnu_TablasDocumentar: TMenuItem;
    N2: TMenuItem;
    Mnu_Refrescar: TMenuItem;
    pMnu_Vistas: TPopupMenu;
    Mnu_VistasConsAutom: TMenuItem;
    N3: TMenuItem;
    Mnu_Refrescar2: TMenuItem;
    pMnu_Owner: TPopupMenu;
    Mnu_OwnerGenrRep: TMenuItem;
    MenuItem6: TMenuItem;
    Mnu_OwnerRefrescar: TMenuItem;
    pMnu_General: TPopupMenu;
    Mnu_GeneralRefrescar: TMenuItem;
    pMnu_BaseDeDatos: TPopupMenu;
    Mnu_BDDFiltrar: TMenuItem;
    MenuItem2: TMenuItem;
    Mnu_BDDRefrescar: TMenuItem;
    ImgLs_IconosMenus: TImageList;
    Mnu_BDDLimpiarFiltro: TMenuItem;
    pMnu_Grupos: TPopupMenu;
    Mnu_RefrescarGrupos: TMenuItem;
    N4: TMenuItem;
    Mnu_ReporteGrupo: TMenuItem;
    pMnu_Codigos: TPopupMenu;
    Mnu_VerCodigo: TMenuItem;
    N5: TMenuItem;
    Mnu_ImprimirCodigo: TMenuItem;
    Mnu_VerGrupo: TMenuItem;
    Mnu_ImprimirGrupo: TMenuItem;
    Mnu_ReporteCodigo: TMenuItem;
    Mnu_RepVerCodigo: TMenuItem;
    N6: TMenuItem;
    Mnu_ReportesVistas: TMenuItem;
    Mnu_RepVerVistas: TMenuItem;
    Mnu_RepImprimirVista: TMenuItem;
    N7: TMenuItem;
    Mnu_ReportesTablas: TMenuItem;
    Mnu_RepVerTablas: TMenuItem;
    Mnu_RepImprimirTablas: TMenuItem;
    pMnu_Check: TPopupMenu;
    Mnu_VerCodigoCheck: TMenuItem;
    Mnu_EliminarTabla: TMenuItem;
    N8: TMenuItem;
    Mnu_RefrescarCodigo: TMenuItem;
    pMnu_Objetos: TPopupMenu;
    MenuItem1: TMenuItem;
    N9: TMenuItem;
    Mnu_ObjDocumentar: TMenuItem;
    Mnu_DocumentarVistas: TMenuItem;
    Mnu_DocumentarCodigo: TMenuItem;
    Mnu_CantReg: TMenuItem;
    N10: TMenuItem;
    Mnu_RefrescarCheck: TMenuItem;
    N11: TMenuItem;
    Mnu_PropiedadesGeneral: TMenuItem;
    Mnu_TamSegment: TMenuItem;
    Mnu_OwnerTamano: TMenuItem;
    N12: TMenuItem;
    mnuCompilarVistas: TMenuItem;
    N13: TMenuItem;
    mnuCompilarCodigos: TMenuItem;
    N14: TMenuItem;
    Mnu_BDDDependencias: TMenuItem;
    Mnu_CompilarGrupos: TMenuItem;
    mnuEditarTabla: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Mnu_TablasConsAutomClick(Sender: TObject);
    procedure Mnu_TablasDocumentarClick(Sender: TObject);
    procedure Mnu_RefrescarClick(Sender: TObject);
    procedure Tv_ArbolExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: boolean);
    procedure Tv_ArbolChange(Sender: TObject; Node: TTreeNode);
    procedure Mnu_BDDFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Mnu_BDDLimpiarFiltroClick(Sender: TObject);
    procedure Mnu_OwnerGenrRepClick(Sender: TObject);
    procedure Mnu_VerCodigoClick(Sender: TObject);
    procedure Mnu_VerGrupoClick(Sender: TObject);
    procedure Mnu_ImprimirCodigoClick(Sender: TObject);
    procedure Mnu_RepVistasClick(Sender: TObject);
    procedure Mnu_RepVerTablasClick(Sender: TObject);
    procedure Mnu_VerCodigoCheckClick(Sender: TObject);
    procedure Mnu_EliminarTablaClick(Sender: TObject);
    procedure Mnu_ObjDocumentarClick(Sender: TObject);
    procedure Mnu_CantRegClick(Sender: TObject);
    procedure Mnu_PropiedadesGeneralClick(Sender: TObject);
    procedure Tv_ArbolKeyDown(Sender: TObject; var Key: word;
      Shift: TShiftState);
    procedure Mnu_TamSegmentClick(Sender: TObject);
    procedure Mnu_OwnerTamanoClick(Sender: TObject);
    procedure mnuCompilarVistasClick(Sender: TObject);
    procedure Mnu_BDDDependenciasClick(Sender: TObject);
    procedure Mnu_CompilarGruposClick(Sender: TObject);
    procedure mnuEditarTablaClick(Sender: TObject);
  private
    function AgregarNodo(Nodo: TTreeNode; Texto: string;
      Icono: integer; NodoVirtual: boolean = false): TTreeNode;
    function AgregarNodoPadre(Nodo: TTreeNode; Texto, Sql: string;
      Icono: integer; MostrarSiempre: boolean = false): TTreeNode;
    procedure AgregarDescripcion(Nodo: TTreeNode; sTipo, sOwner: string);
    procedure AgregarNodoVirtual(Nodo: TTreeNode);
    procedure AgregarDependencias(Nodo: TTreeNode);
    procedure GuardarDescripciones(Nodo: TTreeNode; sOwner: string = '';
      sTipo: string = ''; sNombre: string = ''; sPariente: string = '';
      iImagenIndice: integer = 0; sParienteTipo: string = '');
  public
    sFiltro: string;
  end;

var
  frmEstructura: TFrm_Estructura;

implementation

uses BaseDeDatos, Frm_Consulta, Frm_DocumTabla, Frm_Filtros, QRpt_RepOwner,
  Frm_Reporte, Frm_VisCodigos, QRpt_RepCodigo, QRpt_RepDescripciones,
  Frm_DocObjetos, Frm_TabDocu, UnTamSegments, unCustomPrincipal, unDataEdit,
  unPrincipal;

{$R *.DFM}

{------------------------------------------------------------------------------}
procedure TFrm_Estructura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetRegFromValue(Self, 'Mostrar Dependencias',
    string(IIF(Mnu_BDDDependencias.Checked, REG_TRUE, REG_FALSE)));
  Action := caFree;
  if Assigned(frmPrincipal.mnuDocExploradordeDatos) then
    frmPrincipal.mnuDocExploradordeDatos.Enabled := True;
end;

{------------------------------------------------------------------------------}
procedure TFrm_Estructura.Mnu_TablasConsAutomClick(Sender: TObject);
var
  Frm_Consultas: TFrm_Consultas;
begin
  with TDbNodo(Tv_Arbol.Selected.Data) do
  begin
    Frm_Consultas := TFrm_Consultas.Create(Self.Parent);
    Frm_Consultas.GenerarSql(Nombre, Owner);
  end // With
//     Frm_Consultas.GenerarSql (Tv_Arbol.Selected.Text ,Tv_Arbol.Selected.Parent.Parent.Text );
end;

{------------------------------------------------------------------------------}
procedure TFrm_Estructura.Mnu_TablasDocumentarClick(Sender: TObject);
var
  Frm_DocTabla: TFrm_DocTabla;
begin
  with TDbNodo(Tv_Arbol.Selected.Data) do
  begin
    Frm_DocTabla := TFrm_DocTabla.Create(Self.Parent);
    Frm_DocTabla.Documentar(Nombre, Owner);
  end // With
end;

{------------------------------------------------------------------------------}
procedure TFrm_Estructura.Mnu_BDDFiltrarClick(Sender: TObject);
var
  Frm_Filtrar: TFrm_Filtrar;
begin
  Frm_Filtrar := TFrm_Filtrar.Create(Self);
  try
    Frm_Filtrar.Te_Sql.Text := sFiltro;
    if Frm_Filtrar.ShowModal = mrOk then
      Mnu_RefrescarClick(Sender);
  finally
    Frm_Filtrar.Free; {By Fede 8/10/2002}
  end;
end;

{------------------------------------------------------------------------------}
procedure TFrm_Estructura.Mnu_OwnerGenrRepClick(Sender: TObject);
var
  Frm_Reportes: TFrm_Reportes;
begin
  Frm_Reportes := TFrm_Reportes.Create(Self);
  Frm_Reportes.Ejecutar(TDbNodo(Tv_Arbol.Selected.Data).Nombre, sFiltro);
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.Mnu_BDDLimpiarFiltroClick(Sender: TObject);
begin
  if not (sFiltro = '') then
  begin
    sFiltro := '';
    Mnu_RefrescarClick(Sender);
  end;
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.Mnu_RefrescarClick(Sender: TObject);
var
  Dummy: boolean;
begin
  Tv_Arbol.Selected.DeleteChildren;
  Tv_ArbolExpanding(Sender, Tv_Arbol.Selected, Dummy);
  AgregarNodoVirtual(Tv_Arbol.Selected);
end;

{Agrega un Nodo Invisible Para que Muestre la Cruz de Expandir-----------------}
procedure TFrm_Estructura.AgregarNodoVirtual(Nodo: TTreeNode);
var
  NodoVirtual: TTreeNode;
begin
  NodoVirtual := Tv_Arbol.Items.AddChild(Nodo, '');
  NodoVirtual.ImageIndex := 32;
  NodoVirtual.SelectedIndex := 32;
end;

{Agrega un Nodo con la Centa de Registros que Dependen de El-------------------}
function TFrm_Estructura.AgregarNodoPadre(Nodo: TTreeNode; Texto, Sql: string;
  Icono: integer; MostrarSiempre: boolean = false): TTreeNode;
var
  Cantidad: integer;
begin
  Result := nil;
  Cantidad := ValorSql(Sql);
  if (Cantidad > 0) or MostrarSiempre then
  begin
    Result := AgregarNodo(Nodo, Texto + ' (' + IntToStr(Cantidad) +
      ')', Icono, true);
  end;
end;

{Agrega un Nodo al Arbol-------------------------------------------------------}
function TFrm_Estructura.AgregarNodo(Nodo: TTreeNode; Texto: string;
  Icono: integer; NodoVirtual: boolean = false): TTreeNode;
var
  NodoCreado: TTreeNode;
begin
  NodoCreado := Tv_Arbol.Items.AddChild(Nodo, Texto);
  NodoCreado.ImageIndex := Icono;
  NodoCreado.SelectedIndex := Icono;
  if NodoVirtual then
    AgregarNodoVirtual(NodoCreado);
  Result := NodoCreado;
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.Tv_ArbolExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: boolean);
var
  sTipo: string;
  sOwner: string;
  sPariente: string;
  ValorQry: string;
  Cursor: TSDQuery;
  NodoCreado: TTreeNode;
  ImgNdx: integer;
  ImgInvalido: integer;
  NoAgrNodoVirt: boolean;
begin
  NoAgrNodoVirt := false;
  ImgNdx := 0;
  ImgInvalido := 0;

  with TDbNodo(Node.Data) do
  begin
    if Node.HasChildren and (Node.GetFirstChild.ImageIndex = 32) then
    begin
      Tv_Arbol.Items.BeginUpdate;
 //*fede*/            LockWindowUpdate ( Self.Handle );
      Node.GetFirstChild.Destroy;
      Cursor := TSDQuery.Create(Self);
      Cursor.Databasename :=
        BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.DatabaseName;
      case Node.ImageIndex of
        0:
        begin //Owners
          sTipo := 'OWNER';
                      //Agrega el Owner Public para Mostrar los Sinonimos Públicos
          AgregarNodo(Node, 'PUBLIC', 7, true);

          Cursor.Sql.Add(' SELECT USERNAME NOMBRE  ' +
            ' FROM SYS.ALL_USERS ' +
            ' ORDER BY USERNAME');
          ImgNdx := 7;
        end;
        1:
        begin  //Tablas --> Tabla
          sOwner := Node.Parent.Text;
          sTipo := 'TABLE';
          Cursor.Sql.Add(
            ' SELECT OBJECT_NAME NOMBRE FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER =''' + sOwner + ''' ' +
            sFiltro +
            ' AND OBJECT_TYPE = ''TABLE'' ' +
            ' ORDER BY OBJECT_NAME ');

          ImgNdx := 3;
        end;
        3:
        begin //Tabla --> Descripcion, Campos, Trigers, Indices, Constantes y Grants
          sOwner := Owner;
          sPariente := Nombre;
                         //Descripcion
          ValorQry :=
            ValorSql(' SELECT COMMENTS FROM SYS.ALL_TAB_COMMENTS ' +
            ' WHERE TABLE_TYPE = ''TABLE'' ' +
            ' AND OWNER = ''' + sOwner + ''' ' +
            ' AND TABLE_NAME = ''' +
            Nombre + ''' ');
          if not (ValorQry = '') then
            AgregarNodo(Node, 'Descripción: ' + ValorQry, 10);

                         //Campos
          ValorQry :=
            ' SELECT COUNT(COLUMN_NAME) FROM SYS.ALL_TAB_COLUMNS ' +
            ' WHERE OWNER = ''' + sOwner + ''' ' +
            ' AND TABLE_NAME = ''' + sPariente + ''' ';
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Campos', ValorQry, 5), Owner, 'TABLE', sPariente, sPariente, 5);

                         //Indices
          ValorQry := ' SELECT COUNT(INDEX_NAME) FROM SYS.ALL_INDEXES ' +
            ' WHERE TABLE_OWNER = ''' + sOwner + ''' ' +
            ' AND TABLE_NAME = ''' + Nombre + ''' ';
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Índices', ValorQry, 11), Owner, 'TABLE',
            sPariente, sPariente, 11);

                         //Constantes
          ValorQry := ' SELECT COUNT(*) FROM SYS.ALL_CONSTRAINTS ' +
            ' WHERE OWNER = ''' + sOwner + ''' ' +
            ' AND TABLE_NAME = ''' + Nombre + ''' ';
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Constantes', ValorQry, 12), Owner, 'TABLE',
            sPariente, sPariente, 12);

          ValorQry := ' SELECT COUNT(*) FROM SYS.ALL_TRIGGERS ' +
            ' WHERE TABLE_OWNER =''' + sOwner + '''' +
            ' AND TABLE_NAME =''' + Nombre + '''';
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Triggers', ValorQry, 13), Owner, 'TABLE',
            sPariente, sPariente, 13);

          ValorQry :=
            ' SELECT COUNT(DISTINCT GRANTEE) FROM SYS.ALL_TAB_PRIVS ' +
            ' WHERE TABLE_SCHEMA = ''' + sOwner + '''' +
            ' AND TABLE_NAME = ''' + Nombre + '''';
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Grants', ValorQry, 76), Owner, 'TABLE',
            sPariente, sPariente, 76);

          AgregarDependencias(Node);
        end;
        5:
        begin //Campos
          sOwner := Owner;
          sTipo := 'FIELD';
          sPariente := Pariente;
          ImgNdx := 16;
          Cursor.Sql.Add(' SELECT COLUMN_NAME NOMBRE ' +
            ' FROM SYS.ALL_TAB_COLUMNS ' +
            ' WHERE TABLE_NAME =''' + sPariente + '''' +
            ' AND OWNER =''' + sOwner + '''' +
            ' ORDER BY COLUMN_ID ');
        end;
        6:
        begin //Codigos
          GuardarDescripciones(AgregarNodoPadre(Node, 'Funciones',
            ' SELECT COUNT(*) FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + Owner + ''' ' +
            sFiltro +
            ' AND OBJECT_TYPE = ''FUNCTION'''
            , 27), Owner, 'FUNCTION');

          GuardarDescripciones(AgregarNodoPadre(Node, 'Procedimientos',
            ' SELECT COUNT(*) FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + Owner + ''' ' +
            ' AND OBJECT_TYPE = ''PROCEDURE''' +
            sFiltro
            , 28), Owner, 'PROCEDURE');

          GuardarDescripciones(AgregarNodoPadre(Node, 'Paquetes',
            ' SELECT COUNT(*) FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + Owner + ''' ' +
            ' AND (OBJECT_TYPE = ''PACKAGE'' OR OBJECT_TYPE = ''PACKAGE BODY'') '
            + SFiltro
            , 24), Owner, 'PACKAGE');
        end;
        7:
        begin //Owner --> Tablas, Vistas, Codigos, Sinonimos y Secuencias
          sOwner := Node.Text;
          sPariente := sOwner;
          ValorQry := ' SELECT COUNT(*) FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + sOwner + ''' ' +
            ' AND OBJECT_TYPE = ''TABLE'' ' +
            sFiltro;
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Tablas', ValorQry, 1), sOwner, 'TABLE');

          ValorQry := 'SELECT COUNT(*) FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + sOwner + '''' +
            ' AND OBJECT_TYPE = ''VIEW'' ' +
            sFiltro;
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Vistas', ValorQry, 8), sOwner, 'VIEW');

          ValorQry := ' SELECT COUNT(*) FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + sOwner + ''' ' +
            ' AND OBJECT_TYPE IN (''PROCEDURE'', ''FUNCTION'', ''PACKAGE'', ''PACKAGE BODY'') '
            +
            sFiltro;
          GuardarDescripciones(AgregarNodoPadre(
            Node, 'Códigos', ValorQry, 6), sOwner);

          ValorQry := ' SELECT COUNT(*) FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + sOwner + ''' ' +
            ' AND OBJECT_TYPE = ''SYNONYM'' ' +
            sFiltro;
          GuardarDescripciones(AgregarNodoPadre(
            Node, 'Sinónimos', ValorQry, 48), sOwner, 'SYNONYM');

          ValorQry := ' SELECT COUNT(*) FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + sOwner + ''' ' +
            ' AND OBJECT_TYPE = ''SEQUENCE'' ' +
            sFiltro;
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Sequencias', ValorQry, 50), sOwner, 'SEQUENCE');
        end;
        8:
        begin //Vistas
          sOwner := Owner;
          sPariente := Owner;
          sTipo := 'VIEW';
          ImgNdx := 30;
          ImgInvalido := 31;
          Cursor.Sql.Add(
            ' SELECT OBJECT_NAME NOMBRE, STATUS ESTADO FROM SYS.ALL_OBJECTS  ' +
            ' WHERE OBJECT_TYPE =''VIEW'' ' +
            ' AND OWNER = ''' + sOwner + '''' +
            sFiltro +
            ' ORDER BY OBJECT_NAME ');
        end;
        11:
        begin //Indices
          sOwner := Owner;
          sTipo := 'INDEX';
          sPariente := Pariente;
          Cursor.Sql.Add(
            ' SELECT INDEX_NAME NOMBRE FROM SYS.ALL_INDEXES  ' +
            ' WHERE TABLE_NAME =''' + sPariente + '''' +
            ' AND TABLE_OWNER =''' + sOwner + '''' +
            ' ORDER BY INDEX_NAME ');
          ImgNdx := 15;
        end;
        12:
        begin //Constantes (Tipos)
          ValorQry := 'SELECT COUNT(*) FROM SYS.ALL_CONSTRAINTS ' +
            ' WHERE OWNER = ''' + Owner + '''' +
            ' AND TABLE_NAME = ''' + Pariente + '''' +
            ' AND CONSTRAINT_TYPE = ''C'' ';
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Check', ValorQry, 19), Owner, 'CONSTRAINT', '', Pariente);

          ValorQry := 'SELECT COUNT(*) FROM SYS.ALL_CONSTRAINTS ' +
            ' WHERE OWNER = ''' + Owner + '''' +
            ' AND TABLE_NAME = ''' + Pariente + '''' +
            ' AND CONSTRAINT_TYPE = ''R'' ';
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Foreing Key', ValorQry, 20), Owner, 'FOREING KEY',
            '', Pariente);

          ValorQry := 'SELECT COUNT(*) FROM SYS.ALL_CONSTRAINTS ' +
            ' WHERE OWNER = ''' + Owner + '''' +
            ' AND TABLE_NAME = ''' + Pariente + '''' +
            ' AND CONSTRAINT_TYPE = ''P'' ';
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Primary Key', ValorQry, 21), Owner, 'PRIMARY KEY',
            '', Pariente);

          ValorQry := 'SELECT COUNT(*) FROM SYS.ALL_CONSTRAINTS ' +
            ' WHERE OWNER = ''' + Owner + '''' +
            ' AND TABLE_NAME = ''' + Pariente + '''' +
            ' AND CONSTRAINT_TYPE = ''U'' ';
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Unique', ValorQry, 22), Owner, 'UNIQUE', '', Pariente);
        end;
        13:
        begin //Triggers
          sOwner := Owner;
          sTipo := 'TRIGGER';
          sPariente := Pariente;
          ImgNdx := 14;
          NoAgrNodoVirt := false;
          Cursor.Sql.Add(
            ' SELECT OWNER, TRIGGER_NAME NOMBRE FROM SYS.ALL_TRIGGERS ' +
            ' WHERE TABLE_NAME = ''' + sPariente + '''' +
            ' AND TABLE_OWNER  = ''' + sOwner + '''');
        end;
        14:
        begin
          AgregarDescripcion(Node, 'TRIGGER', sOwner);
          GuardarDescripciones(AgregarNodoPadre(Node, 'Columnas Dependietes',
            ' SELECT COUNT(*) FROM SYS.ALL_TRIGGER_COLS '
            +
            ' WHERE TRIGGER_OWNER = ''' +
            Owner + ''' ' +
            ' AND TRIGGER_NAME = ''' +
            Nombre + ''' '
            , 58)
            , Owner, 'TRIGGER_COLS',
            '', Nombre, 58, 'TRIGGER');
        end;
        15:
        begin //Campos de los Indices
          sOwner := Owner;
          sPariente := Pariente;
          sTipo := 'INDEX_COLUMNS';
          Cursor.Sql.Add(' SELECT COLUMN_NAME NOMBRE ' +
            ' FROM SYS.ALL_IND_COLUMNS ' +
            ' WHERE INDEX_OWNER = ''' + Owner + ''' ' +
            ' AND TABLE_NAME = ''' + Pariente + ''' ' +
            ' AND INDEX_NAME = ''' + Node.Text + ''' ');
          ImgNdx := 33;
          NoAgrNodoVirt := true;
          AgregarDescripcion(Node, 'INDEX', Owner);
        end;
        16:
        begin //Campo: Descripcion, Tipo, Tamaño, Nulo, Valor por Defcto
          sPariente := Pariente;
          sOwner := Owner;
          ValorQry :=
            ValorSql(' SELECT COMMENTS FROM SYS.ALL_COL_COMMENTS ' +
            ' WHERE TABLE_NAME =''' +
            Pariente + '''' +
            ' AND OWNER = ''' + Owner + '''' +
            ' AND COLUMN_NAME = ''' +
            Node.Text + '''');
          if not (ValorQry = '') then
          begin
            AgregarNodo(Node, 'Descripción: ' + ValorQry, 17);
          end;

          Cursor.Sql.Add(
            ' SELECT DATA_TYPE, DATA_LENGTH, DATA_PRECISION, DATA_SCALE , NULLABLE, DATA_DEFAULT ' +
            ' FROM SYS.ALL_TAB_COLUMNS ' +
            ' WHERE TABLE_NAME =''' + Pariente + '''' +
            ' AND OWNER =''' + Owner + '''' +
            ' AND COLUMN_NAME = ''' + Node.Text + '''');
                                         //' ORDER BY COLUMN_ID ' ) ;
          try
            Cursor.Open;
            NodoCreado :=
              Tv_Arbol.Items.AddChild(Node, 'Tipo: ' + Cursor.FieldByName('DATA_TYPE').Value);
            NodoCreado.ImageIndex := 18;
            NodoCreado.SelectedIndex := 18;
            if (Cursor.FieldByName('DATA_TYPE').AsString = 'NUMBER') then
              AgregarNodo(Node, 'Tamaño: ' +
                Cursor.FieldByName('DATA_PRECISION').AsString + '.' +
                Cursor.FieldByName('DATA_SCALE').AsString, 18, false)
            else
              AgregarNodo(Node, 'Tamaño: ' +
                Cursor.FieldByName('DATA_LENGTH').AsString, 18, false);
            AgregarNodo(Node, 'No Nulo: ' +
              Cursor.FieldByName('NULLABLE').Value, 18, false);
            AgregarNodo(Node, 'Valor por Defecto: ' +
              Cursor.FieldByName('DATA_DEFAULT').Value, 18, false);
          finally
            Cursor.Close;
          end;
          Cursor.Sql.Clear;
        end;
        19..22:
        begin //Contranint Check, Primary, Foreing y Uiniqe
          sOwner := Owner;
          sPariente := Pariente;
          case Node.ImageIndex of
            19: ValorQry := 'C';   // Check
            20: ValorQry := 'R';   // Foreing
            21: ValorQry := 'P';   // Primary
            22: ValorQry := 'U';   // Unique
          end;
          Cursor.Sql.Add(
            ' SELECT CONSTRAINT_NAME NOMBRE FROM SYS.ALL_CONSTRAINTS ' +
            ' WHERE TABLE_NAME =''' + sPariente + '''' +
            ' AND OWNER =''' + sOwner + '''' +
            ' AND CONSTRAINT_TYPE = ''' + ValorQry + '''' +
            ' ORDER BY CONSTRAINT_NAME ');
          ImgNdx := 34;
    //                    NoAgrNodoVirt := (ValorQry = 'C') OR (ValorQry = 'R');
        end;
        23, 29:
        begin //Funciones
          AgregarDescripcion(Node, Tipo, Owner);
          AgregarDependencias(Node);
        end;

        24:
        begin //Paquetes

          ValorQry := 'SELECT COUNT(*) FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + Owner + ''' ' +
            ' AND OBJECT_TYPE = ''PACKAGE''' +
            sFiltro;
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Packages', ValorQry, 26), Owner, 'PACKAGE');

          ValorQry := ' SELECT COUNT(*) FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + Owner + ''' ' +
            ' AND OBJECT_TYPE = ''PACKAGE BODY''' +
            sFiltro;
          GuardarDescripciones(
            AgregarNodoPadre(Node, 'Packages Body', ValorQry, 25), Owner, 'PACKAGE BODY');
        end;
        25..26:
        begin
          sOwner := Owner;
          sPariente := Pariente;
          sTipo := Tipo;
          ImgNdx := 23;
          ImgInvalido := 29;
          NoAgrNodoVirt := false;

          Cursor.Sql.Add(' SELECT OBJECT_NAME NOMBRE, STATUS ESTADO' +
            ' FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + sOwner + ''' ' +
            ' AND OBJECT_TYPE = ''' + sTipo + ''' ' +
            sFiltro);
        end;
        27..28:
        begin
          sOwner := Owner;
          sPariente := Pariente;
          sTipo := Tipo;
          ImgNdx := 23;
          ImgInvalido := 29;
          NoAgrNodoVirt := false;
          Cursor.Sql.Add(' SELECT OBJECT_NAME NOMBRE, STATUS ESTADO' +
            ' FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + sOwner + ''' ' +
            ' AND OBJECT_TYPE = ''' + sTipo + ''' ' +
            sFiltro);
        end;
               //29: LAS FUNC. DESHAB. SE ENCUENTRAN EN EL ITEM 23

        30..31:
        begin // Vista
          sOwner := Owner;
          sPariente := Nombre;
          ValorQry :=
            ValorSql(' SELECT COMMENTS FROM SYS.ALL_TAB_COMMENTS ' +
            ' WHERE TABLE_TYPE = ''VIEW'' ' +
            ' AND OWNER = ''' + sOwner + ''' ' +
            ' AND TABLE_NAME = ''' +
            sPariente + ''' ');
          if not (ValorQry = '') then
          begin
            GuardarDescripciones(
              AgregarNodo(Node, 'Descripción: ' + ValorQry, 10), Owner, '', Nombre, Tipo);
          end;

          GuardarDescripciones(AgregarNodoPadre(Node, 'Campos',
            ' SELECT COUNT(COLUMN_NAME) FROM SYS.ALL_TAB_COLUMNS '
            +
            ' WHERE OWNER = ''' + Owner + ''' ' +
            ' AND TABLE_NAME = ''' +
            sPariente + ''' ', 5)
            , Owner, 'FIELDS', '',
            sPariente, 5, Tipo);
          AgregarDependencias(Node);
        end;
        34:
        begin //Campos de las Constraints
          sOwner := Owner;
          sTipo := 'COLUMN';
          sPariente := Pariente;
          ImgNdx := 35;
          NoAgrNodoVirt := true;
          Cursor.Sql.Add(' SELECT COLUMN_NAME NOMBRE ' +
            ' FROM SYS.ALL_CONS_COLUMNS ' +
            ' WHERE OWNER = ''' + sOwner + ''' ' +
            ' AND TABLE_NAME = ''' + Pariente + ''' ' +
            ' AND CONSTRAINT_NAME = ''' +
            Node.Text + ''' ' +
            ' ORDER BY POSITION ');
        end;
        48:
        begin // Sinónimos
          sOwner := Owner;
          sTipo := 'SYNONYM';
          sPariente := Owner;
          Cursor.Sql.Add(
            ' SELECT OBJECT_NAME NOMBRE FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + sOwner + ''' ' +
            ' AND OBJECT_TYPE = ''SYNONYM'' ' +
            sFiltro +
            ' ORDER BY OBJECT_NAME ');
          ImgNdx := 49;
        end;
        49:
        begin
          sOwner := Owner;
          sPariente := Nombre;
          Cursor.Sql.Add(
            ' SELECT TABLE_OWNER || ''.'' || TABLE_NAME NOMBRE ' +
            ' FROM SYS.ALL_SYNONYMS ' +
            ' WHERE OWNER = ''' + sOwner + ''' ' +
            ' AND SYNONYM_NAME = ''' +
            sPariente + ''' ');
          ImgNdx := 52;
          NoAgrNodoVirt := true;
          AgregarDescripcion(Node, 'SYNONYM', sOwner);
          AgregarDependencias(Node);
        end;
        50:
        begin // Sequencias
          sOwner := Owner;
          sPariente := Owner;
          sTipo := 'SEQUENCE';
          ImgNdx := 51;
          Cursor.Sql.Add(
            ' SELECT OBJECT_NAME NOMBRE FROM SYS.ALL_OBJECTS ' +
            ' WHERE OWNER = ''' + sOwner + ''' ' +
            ' AND OBJECT_TYPE = ''SEQUENCE'' ' +
            sFiltro);
        end;
        51:
        begin
          sOwner := Owner;
          sPariente := Nombre;
          AgregarDescripcion(Node, 'SEQUENCE', sOwner);
          Cursor.Sql.Add(
            ' SELECT TO_CHAR(MIN_VALUE) MINIMO, TO_CHAR(MAX_VALUE) MAXIMO, INCREMENT_BY, LAST_NUMBER '
            +
            ' FROM SYS.ALL_SEQUENCES ' +
            ' WHERE SEQUENCE_NAME =''' + Nombre + '''' +
            ' AND SEQUENCE_OWNER = ''' + sOwner + '''');
          try
            Cursor.Open;
                             //AgregarNodo ( Node, 'Tamaño: ' + Cursor.FieldByName('LARGO').Value, 18, False);

            AgregarNodo(Node, 'Menor : ' +
              Cursor.FieldByName('MINIMO').AsString, 54, false);
            AgregarNodo(Node, 'Mayor : ' +
              Cursor.FieldByName('MAXIMO').AsString, 53, false);
            AgregarNodo(Node, 'Paso  : ' +
              Cursor.FieldByName('INCREMENT_BY').AsString, 57, false);
    //                         AgregarNodo ( Node, 'Comienzo : ' + Cursor.FieldByName('LAST_NUMBER').AsString, 55, False);
            AgregarNodo(Node, 'Ultimo Número : ' +
              Cursor.FieldByName('LAST_NUMBER').AsString, 55, false);
          finally
            Cursor.Close;
          end;
          Cursor.Sql.Clear;
          AgregarDependencias(Node);
        end;
        58:
        begin
          sOwner := Owner;
          sPariente := Pariente;
          Cursor.Sql.Add(' SELECT COLUMN_NAME NOMBRE ' +
            ' FROM SYS.ALL_TRIGGER_COLS ' +
            ' WHERE TRIGGER_OWNER = ''' + sOwner + ''' ' +
            ' AND TRIGGER_NAME = ''' + sPariente + ''' ');
          ImgNdx := 59;
          NoAgrNodoVirt := true;
        end;
        60:
        begin // Objetos Dependientes
          AgregarDependencias(Node);
        end;
        61..67:
        begin // Objetos Dependientes
          AgregarDependencias(Node);
        end;
        68..74: AgregarDependencias(Node);
        76:
        begin // Grants a Tablas
          sOwner := Owner;
          sPariente := Nombre;
          Cursor.Sql.Add(' SELECT DISTINCT PRIVILEGE NOMBRE ' +
            ' FROM SYS.ALL_TAB_PRIVS ' +
            ' WHERE TABLE_SCHEMA = ''' + sOwner + '''' +
            ' AND TABLE_NAME = ''' + Nombre + '''');
          ImgNdx := 77;
        end;
        77:
        begin // Grants a Tablas
          sOwner := Owner;
          sPariente := Pariente;
          Cursor.Sql.Add(' SELECT GRANTOR || '' - '' || GRANTEE NOMBRE ' +
            ' FROM SYS.ALL_TAB_PRIVS ' +
            ' WHERE TABLE_SCHEMA = ''' + sOwner + '''' +
            ' AND TABLE_NAME = ''' + Pariente + '''' +
            ' AND PRIVILEGE  = ''' + Nombre + '''');
          ImgNdx := 78;
          NoAgrNodoVirt := true;
        end;
      end;
      if not (Cursor.Sql.Text = '') then
        try
          Cursor.Open;
          while not Cursor.EOF do
          begin
            ValorQry := Cursor.FieldByName('NOMBRE').Value;
            NodoCreado := Tv_Arbol.Items.AddChild(Node, ValorQry);
            if (ImgInvalido <> 0) and
              (Cursor.FieldByName('ESTADO').Value = 'INVALID') then
            begin
              NodoCreado.ImageIndex := ImgInvalido;
              NodoCreado.SelectedIndex := ImgInvalido;
            end
            else
            begin
              NodoCreado.ImageIndex := ImgNdx;
              NodoCreado.SelectedIndex := ImgNdx;
            end;
            if Cursor.Fields[0].FieldName = 'OWNER' then
              sOwner := Cursor.Fields[0].AsString;

                     //Crea el Objeto que se Adjunta en la Propiedad Data y lo Carga
            NodoCreado.Data := TDbNodo.Create;
            GuardarDescripciones(NodoCreado, sOwner, sTipo,
              ValorQry, sPariente, ImgNdx);

            if not NoAgrNodoVirt then
              AgregarNodoVirtual(NodoCreado);
            Cursor.Next;
          end;
        finally
          Cursor.Destroy;
        end;
    end;
  end;
  AllowExpansion := Node.HasChildren;
  Tv_Arbol.Items.EndUpdate; //*fede*/  LockWindowUpdate (0);
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.Tv_ArbolChange(Sender: TObject; Node: TTreeNode);
begin
//Habilitar Menues:
  case Node.ImageIndex of
    0: Tv_Arbol.PopupMenu := pMnu_BaseDeDatos;
    3: Tv_Arbol.PopupMenu := pMnu_Tablas;
    7: Tv_Arbol.PopupMenu := pMnu_Owner;
    30:
    begin
      Tv_Arbol.PopupMenu := pMnu_Vistas;
      Mnu_VistasConsAutom.Enabled := true;
      mnuCompilarVistas.Enabled := false;
    end;
    31:
    begin
      Tv_Arbol.PopupMenu := pMnu_Vistas;
      Mnu_VistasConsAutom.Enabled := false;
      mnuCompilarVistas.Enabled := true;
    end;
    34:
    begin
      if (Node.Parent.ImageIndex = 19) then
        Tv_Arbol.PopupMenu := pMnu_Check
      else
        Tv_Arbol.PopupMenu := pMnu_General;

//             else if (Node.Parent.ImageIndex = 21) or (Node.Parent.ImageIndex = 22) then
//                 Tv_Arbol.PopupMenu := pMnu_General
//             else
//                 Tv_Arbol.PopupMenu := Nil;
    end;
    14, 15, 49, 51: Tv_Arbol.PopupMenu := pMnu_Objetos;
    1, 6, 8, 25, 26, 27, 28:
    begin
      Tv_Arbol.PopupMenu := pMnu_Grupos;
      Mnu_CompilarGrupos.Visible := Node.ImageIndex = 8;
    end;
    23, 29: Tv_Arbol.PopupMenu := pMnu_Codigos;
    10, 17, 18, 33, 35, 40..43, 52, 53, 54, 56, 57, 59: Tv_Arbol.PopupMenu := nil;
    else
      Tv_Arbol.PopupMenu := pMnu_General;
  end;
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.FormCreate(Sender: TObject);
begin
  sFiltro := ValorRegistro(HKEY_CURRENT_USER,
    'SOFTWARE\FireSoft\Aplicaciones\Documentador', 'Filtro', '');
  Mnu_BDDDependencias.Checked :=
    GetRegFromValue(Self, 'Mostrar Dependencias', REG_TRUE) = REG_TRUE;
  AgregarNodoVirtual(Tv_Arbol.Items.GetFirstNode);
end;
///------------------------------------------------------------------------------
procedure TFrm_Estructura.Mnu_VerCodigoClick(Sender: TObject);
var
  Frm_VisCodigos: TFrm_VisCodigo;
begin
  Frm_VisCodigos := TFrm_VisCodigo.Create(Self);
  with TDbNodo(Tv_Arbol.Selected.Data) do
    Frm_VisCodigos.Ejecutar(Nombre, Owner, Tipo);
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.Mnu_VerGrupoClick(Sender: TObject);
var
  AccionProc: integer;
begin
  if TMenuItem(Sender).ImageIndex = 6 then
    AccionProc := 0
  else
    AccionProc := 1;
  with TDbNodo(Tv_Arbol.Selected.Data) do
  begin
    case Tv_Arbol.Selected.ImageIndex of
      1, 8: QRpt_Owner_Tablas.ImprimirReporte(Owner, sFiltro, Tipo, AccionProc);

      6: QRpt_RepCodigos.ImprimirReporte(Owner, sFiltro, '', AccionProc);
      25..28: QRpt_RepCodigos.ImprimirReporte(Owner, sFiltro, Tipo, AccionProc);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.Mnu_ImprimirCodigoClick(Sender: TObject);
var
  sOwner: string;
  sTipo: string;
  nAccion: integer;
  sCopete: string;
begin
  if TMenuItem(Sender).ImageIndex = 6 then
    nAccion := 0
  else
    nAccion := 1;

  with TDbNodo(Tv_Arbol.Selected.Data) do
  begin
    sOwner := Owner;
    sTipo := Tipo;
  end; //With

  if Dm_BaseDeDatos.TablaComentarios = '' then
    sCopete := 'Código Fuente'
  else
    sCopete := ValorSql(' SELECT COMMENTS FROM ' + Dm_BaseDeDatos.TablaComentarios +
      ' WHERE OWNER = ''' + sOwner + ''' ' +
      ' AND OBJECT_TYPE = ''' + sTipo + ''' ' +
      ' AND OBJECT = ''' + Tv_Arbol.Selected.Text + '''');

  Qrpt_Descripciones.ImprimirQuery(Tv_Arbol.Selected.Text, sCopete,
    'SELECT TEXT ' +
    'FROM SYS.ALL_SOURCE ' +
    'WHERE OWNER = ''' + sOwner + ''' ' +
    'AND NAME = ''' + Tv_Arbol.Selected.Text + ''' ' +
    'AND TYPE = ''' + sTipo + ''' ' +
    'ORDER BY LINE ', nAccion);
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.Mnu_RepVistasClick(Sender: TObject);
var
  nAccion: integer;
begin
  if TMenuItem(Sender).ImageIndex = 6 then
    nAccion := 0
  else
    nAccion := 1;
  with TDbNodo(Tv_Arbol.Selected.Data) do
    Qrpt_Descripciones.ImprimirQuery('Vista ' + Tv_Arbol.Selected.Text,
      ValorSql(' SELECT COMMENTS FROM SYS.ALL_TAB_COMMENTS ' +
      ' WHERE TABLE_TYPE = ''VIEW'' ' +
      ' AND TABLE_NAME = ''' + Nombre + ''' ' +
      ' AND OWNER = ''' + Owner + ''' '),
      'SELECT TEXT ' +
      'FROM SYS.ALL_VIEWS ' +
      'WHERE OWNER = ''' + Owner + ''' ' +
      'AND VIEW_NAME = ''' + Nombre + ''' '
      , nAccion);

end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.Mnu_RepVerTablasClick(Sender: TObject);
var
  nAccion: integer;
begin
  if TMenuItem(Sender).ImageIndex = 6 then
    nAccion := 0
  else
    nAccion := 1;

  with TDbNodo(Tv_Arbol.Selected.Data) do
    Qrpt_Descripciones.ImprimirTabla(Owner, Nombre, nAccion);
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.Mnu_VerCodigoCheckClick(Sender: TObject);
var
  Frm_VisCodigos: TFrm_VisCodigo;
begin
  Frm_VisCodigos := TFrm_VisCodigo.Create(Self);
  with TDbNodo(Tv_Arbol.Selected.Data) do
    Frm_VisCodigos.VerMemos('SELECT SEARCH_CONDITION ' +
      ' FROM SYS.ALL_CONSTRAINTS ' +
      ' WHERE OWNER = ''' + Owner + ''' ' +
      ' AND CONSTRAINT_NAME = ''' + Nombre + ''' ' +
      ' AND CONSTRAINT_TYPE = ''C'' ' +
      ' AND TABLE_NAME = ''' + Pariente + ''' '
      , 'Código de la Constante ' + Nombre)
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.Mnu_EliminarTablaClick(Sender: TObject);
begin
  with TDbNodo(Tv_Arbol.Selected.Data) do
  begin
    if MessageDlg('Se dispone a eliminar la Tabla ' + Nombre +
      ' y no podrá recuperarla.' + chr(13) + '¿Esta Usted Seguro?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Dm_BaseDeDatos.SDQ_ValorSql.SQL.Clear;
      Dm_BaseDeDatos.SDQ_ValorSql.SQL.Add('DROP TABLE "' +
        Owner + '"."' + Nombre + '"');
      Dm_BaseDeDatos.SDQ_ValorSql.ExecSQL;
      if not (Tv_Arbol.Selected.Parent.Data = nil) then
        if TDbNodo(Tv_Arbol.Selected.Parent.Parent.Data).Tipo = 'OWNER' then
          Tv_Arbol.Selected.Parent.Text :=
            'Tablas (' + IntToStr(Tv_Arbol.Selected.Parent.Count - 1) + ') ';
      Tv_Arbol.Selected.Delete;
    end;
  end;//With
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.AgregarDescripcion(Nodo: TTreeNode; sTipo, sOwner: string);
var
  sDescripcion: string;
  NodoCreado: TTreeNode;
begin
  if not (Dm_BaseDeDatos.TablaComentarios = '') then
  begin
    sDescripcion := ValorSql(' SELECT COMMENTS FROM ' +
      Dm_BaseDeDatos.TablaComentarios +
      ' WHERE OWNER = ''' + sOwner + ''' ' +
      ' AND OBJECT_TYPE = ''' + sTipo + ''' ' +
      ' AND OBJECT = ''' + Nodo.Text + ''' ');
    if not (sDescripcion = '') then
    begin
      NodoCreado := Tv_Arbol.Items.AddChild(
        Nodo, 'Descripción: ' + sDescripcion);
      NodoCreado.ImageIndex := 10;
      NodoCreado.SelectedIndex := 10;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.Mnu_ObjDocumentarClick(Sender: TObject);
var
  Frm_DocObjetos: TFrm_DocObjects;
  Frm_TablaDocEspecial: TFrm_TablaDocEspecial;
begin
  if not (Dm_BaseDeDatos.TablaComentarios = '') then
  begin
    Frm_DocObjetos := TFrm_DocObjects.Create(Self);

    with TDbNodo(Tv_Arbol.Selected.Data) do
      Frm_DocObjetos.EditarObjeto(Tipo, Owner, Nombre)
  end
  else
  begin
    Frm_TablaDocEspecial := TFrm_TablaDocEspecial.Create(Self.Parent);
    if (Frm_TablaDocEspecial.ShowModal = mrOk) then
    begin
      Dm_BaseDeDatos.TablaComentarios := ValorRegistro(HKEY_CURRENT_USER, 'SOFTWARE\FireSoft\Aplicaciones\Documentador\' + Dm_BaseDeDatos.Usuario, 'Tabla de Descripciones de Objetos', '');
      Mnu_ObjDocumentarClick(Sender);
      GuardarRegistro(HKEY_CURRENT_USER, 'SOFTWARE\FireSoft\Aplicaciones\Documentador\' + Dm_BaseDeDatos.Usuario, 'Sin Tabla de Descripciones de Objetos', 'FALSE');
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.Mnu_CantRegClick(Sender: TObject);
var
  sTexto: string;
begin
  with TDbNodo(Tv_Arbol.Selected.Data) do
  begin
    sTexto := 'Cantidad de Registros:' +
      ValorSql(' SELECT COUNT(*) FROM ' + Owner + '."' + Nombre + '" ');
    MessageBox(Self.Handle, pchar(sTexto),
      pchar('Tabla: ' + Nombre),
      MB_ICONINFORMATION)
  end; //With
end;
//------------------------------------------------------------------------------
procedure TFrm_Estructura.Mnu_PropiedadesGeneralClick(Sender: TObject);
begin
  if not (Tv_Arbol.Selected.Data = nil) then
    with TDbNodo(Tv_Arbol.Selected.Data) do
      MessageBox(Self.Handle,
        pchar('Owner : ' + Owner + #13#10 +
        'Nombre : ' + Nombre + #13#10 +
        'Tipo : ' + Tipo + #13#10 +
        'Pariente : ' + Pariente
        ),
        pchar('Propiedades del Objeto'),
        MB_ICONINFORMATION);
end;
//------------------------------------------------------------------------------                                                                     *
procedure TFrm_Estructura.Tv_ArbolKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  if (Key = 13) and (ssCtrl in Shift) then
    Mnu_PropiedadesGeneralClick(Sender);
end;
//------------------------------------------------------------------------------                                                                     *
procedure TFrm_Estructura.GuardarDescripciones(Nodo: TTreeNode;
  sOwner: string = ''; sTipo: string = ''; sNombre: string = '';
  sPariente: string = ''; iImagenIndice: integer = 0; sParienteTipo: string = '');
begin
  if Nodo is TTreeNode then
  begin
    Nodo.Data := TDbNodo.Create;
    with TDbNodo(Nodo.Data) do
    begin
      Nombre := sNombre;
      Owner := sOwner;
      Tipo := sTipo;
      ImagenIndice := iImagenIndice;
      Pariente := sPariente;
      ParienteTipo := sParienteTipo;
    end;
  end;
end;
//----------------------------------------------------------------
procedure TFrm_Estructura.AgregarDependencias(Nodo: TTreeNode);
var
  Cursor: TSDQuery;
  NodoCreado: TTreeNode;
  sCantidad: string;
  sTipo: string;
  ImgNdx: integer;
begin
  NodoCreado := nil;
  if Mnu_BDDDependencias.Checked then
    with TDbNodo(Nodo.Data) do
    begin
//------------------------------------------------------------------------------
      if Nodo.ImageIndex = 68 then
      begin
        NodoCreado := AgregarNodoPadre(Nodo, 'Objetos Padres',
          ' SELECT COUNT(*) ' +
          ' FROM SYS.ALL_DEPENDENCIES ' +
          ' WHERE OWNER = ''' + Owner + ''' ' +
          ' AND NAME = ''' + Pariente + ''' ' +
          ' AND TYPE = ''' + Tipo + ''''
          , 69);
        GuardarDescripciones(NodoCreado, Owner, Tipo, '', Pariente, 69);

        NodoCreado := AgregarNodoPadre(Nodo, 'Objetos Hijos',
          ' SELECT COUNT(*) ' +
          ' FROM SYS.ALL_DEPENDENCIES ' +
          ' WHERE REFERENCED_OWNER = ''' + Owner + ''' ' +
          ' AND REFERENCED_NAME = ''' + Pariente + ''' ' +
          ' AND REFERENCED_TYPE = ''' + Tipo + ''''
          , 70);
        GuardarDescripciones(NodoCreado, Owner, Tipo, 'REFERENCED_', Pariente, 70);
//------------------------------------------------------------------------------
      end
      else if (Nodo.ImageIndex = 69) or (Nodo.ImageIndex = 70) then
      begin
        Cursor := TSDQuery.Create(Self);
        try
          Cursor.Databasename :=
            BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.DatabaseName;
          if (Nodo.ImageIndex = 69) then
            Cursor.SQL.Add(' SELECT REFERENCED_TYPE TIPO, COUNT(*) CANTIDAD' +
              ' FROM SYS.ALL_DEPENDENCIES ' +
              ' WHERE OWNER = ''' + Owner + ''' ' +
              ' AND NAME = ''' + Pariente + ''' ' +
              ' AND TYPE = ''' + Tipo + ''' ' +
              ' GROUP BY REFERENCED_TYPE ')
          else
            Cursor.SQL.Add(' SELECT TYPE TIPO, COUNT(*) CANTIDAD' +
              ' FROM SYS.ALL_DEPENDENCIES ' +
              ' WHERE REFERENCED_OWNER = ''' + Owner + ''' ' +
              ' AND REFERENCED_NAME = ''' + Pariente + ''' ' +
              ' AND REFERENCED_TYPE = ''' + Tipo + ''' ' +
              ' GROUP BY TYPE ');
          Cursor.Open;
          while not Cursor.EOF do
          begin
            sTipo := Cursor.FieldByName('TIPO').AsString;
            sCantidad :=
              ' (' + Cursor.FieldByName('CANTIDAD').AsString + ')';
            if (sTipo = 'TABLE') then
              NodoCreado :=
                AgregarNodo(Nodo, 'Tablas' + sCantidad, 61, true)

            else if (sTipo = 'VIEW') then
              NodoCreado :=
                AgregarNodo(Nodo, 'Vistas' + sCantidad, 62, true)

            else if (sTipo = 'FUNCTION') then
              NodoCreado :=
                AgregarNodo(Nodo, 'Funciones' + sCantidad, 71, true)

            else if (sTipo = 'PROCEDURE') then
              NodoCreado :=
                AgregarNodo(Nodo, 'Procedimientos' + sCantidad, 72, true)

            else if (sTipo = 'PACKAGE') then
              NodoCreado :=
                AgregarNodo(Nodo, 'Paquetes' + sCantidad, 73, true)

            else if (sTipo = 'PACKAGE BODY') then
              NodoCreado :=
                AgregarNodo(Nodo, 'Cuerpos de Paquetes' + sCantidad, 74, true)

{                          Else If ( sTipo = 'FUNCTION' ) Or ( sTipo = 'PROCEDURE' ) Or ( sTipo = 'PACKAGE' ) Or ( sTipo = 'PACKAGE BODY' ) Then
                           NodoCreado := AgregarNodo( Nodo, 'Fuentes' + sCantidad, 63, True)
}
            else if (sTipo = 'SEQUENCE') then
              NodoCreado :=
                AgregarNodo(Nodo, 'Secuencias' + sCantidad, 64, true)

            else if (sTipo = 'SYNONYM') then
              NodoCreado :=
                AgregarNodo(Nodo, 'Sinónimos' + sCantidad, 65, true)

            else if (sTipo = 'TRIGGER') then
              NodoCreado :=
                AgregarNodo(Nodo, 'Triggers' + sCantidad, 66, true)

            else if (sTipo = 'NON-EXISTENT') then
              NodoCreado :=
                AgregarNodo(Nodo, 'Objetos Inexistentes' + sCantidad, 67, true)

            else
              ShowMessage('Error, Tipo Inexistente :' +
                Cursor.FieldByName('TIPO').AsString);

            GuardarDescripciones(NodoCreado, Owner,
              sTipo, '', Pariente, NodoCreado.ImageIndex, Tipo);
            Cursor.Next;
          end; //While
          Cursor.Close;
        finally
          Cursor.Destroy;
        end; //Try
//------------------------------------------------------------------------------
      end
      else if (Nodo.Parent.ImageIndex = 69) or (Nodo.Parent.ImageIndex = 70) then
      begin
        Cursor := TSDQuery.Create(Self);
        try
          Cursor.Databasename := BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.DatabaseName;
          if (Nodo.Parent.ImageIndex = 69) then
            Cursor.Sql.Add(
              ' SELECT REFERENCED_OWNER USUARIO, REFERENCED_NAME NOMBRE ' +
              ' FROM SYS.ALL_DEPENDENCIES ' +
              ' WHERE NAME = ''' + Pariente + ''' ' +
              ' AND  OWNER = ''' + Owner + ''' ' +
              ' AND  TYPE  = ''' + ParienteTipo + ''' ' +
              ' AND REFERENCED_TYPE  = ''' + Tipo + ''' ')
          else if (Nodo.Parent.ImageIndex = 70) then
            Cursor.Sql.Add(' SELECT OWNER USUARIO, NAME NOMBRE ' +
              ' FROM SYS.ALL_DEPENDENCIES ' +
              ' WHERE REFERENCED_NAME = ''' + Pariente + ''' ' +
              ' AND REFERENCED_OWNER = ''' + Owner + ''' ' +
              ' AND REFERENCED_TYPE  = ''' + ParienteTipo + ''' ' +
              ' AND TYPE = ''' + Tipo + ''' ');

          if (Tipo = 'TABLE') then
            ImgNdx := 3

          else if (Tipo = 'VIEW') then
            ImgNdx := 30

          else if (Tipo = 'FUNCTION') or (Tipo = 'PROCEDURE') or
            (Tipo = 'PACKAGE') or (Tipo = 'PACKAGE BODY') then
            ImgNdx := 23

          else if (Tipo = 'SEQUENCE') then
            ImgNdx := 51

          else if (Tipo = 'SYNONYM') then
            ImgNdx := 49

          else if (Tipo = 'TRIGGER') then
            ImgNdx := 14

          else if (Tipo = 'NON-EXISTENT') then
            ImgNdx := 75

          else
            ImgNdx := -1; //End If
             { ---- Abre el Cursor ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----}
          Cursor.Open;
          while not Cursor.EOF do
          begin
            NodoCreado :=
              AgregarNodo(Nodo, Cursor.FieldByName('USUARIO').AsString + '.' +
              Cursor.FieldByName('NOMBRE').AsString, ImgNdx, true);
            GuardarDescripciones(NodoCreado,                              // Nodo
              Cursor.FieldByName('USUARIO').AsString,  // Owner
              Tipo,                                   // Tipo
              Cursor.FieldByName('NOMBRE').AsString,   // Nombre
              Nombre,
                                  // Pariente
              NodoCreado.ImageIndex,                   // Imagen
              ParienteTipo);
                          // Tipo de Pariente
            Cursor.Next;
          end; //While
          Cursor.Close;
        finally
          Cursor.Destroy;
        end; //Try
//------------------------------------------------------------------------------
      end
      else
      begin
        NodoCreado := AgregarNodoPadre(Nodo, 'Dependencias',
          ' SELECT COUNT(*) ' +
          ' FROM SYS.ALL_DEPENDENCIES ' +
          ' WHERE  ( OWNER = ''' + Owner + ''' ' +
          ' AND NAME = ''' + Nombre + ''' ' +
          ' AND TYPE = ''' + Tipo + ''' ) ' +
          ' OR ( REFERENCED_OWNER = ''' + Owner + ''' ' +
          ' AND REFERENCED_NAME = ''' + Nombre + ''' ' +
          ' AND REFERENCED_TYPE = ''' + Tipo + ''') '
          , 68);
        GuardarDescripciones(NodoCreado, Owner, Tipo, '', Nombre, 68);
      end; // If
    end; //With
end; // Procedure
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Estructura.Mnu_TamSegmentClick(Sender: TObject);
var
  sTexto: string;
begin
  with TDbNodo(Tv_Arbol.Selected.Data) do
  begin
    sTexto := 'Tamaño del Segmento:' +
      ValorSql(
      ' SELECT ROUND((BYTES / 1024 / 1024) ,2) FROM SYS.DBA_SEGMENTS ' +
      ' WHERE OWNER = ''' + Owner + ''' ' +
      ' AND SEGMENT_NAME = ''' + Nombre + '''') +
      'Mb.';
    MsgBox(sTexto, MB_ICONINFORMATION, 'Tamaño del Segmento');
  end; //With
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Estructura.Mnu_OwnerTamanoClick(Sender: TObject);
var
  Frm_TamSegment: TFrm_TamSegment;
begin
    // Tamaño de los Objetos de los Owners
  with TDbNodo(Tv_Arbol.Selected.Data) do
  begin
    Frm_TamSegment := TFrm_TamSegment.Create(Self.Parent);
    Frm_TamSegment.ShowTamanos(Nombre, 'TABLE');
         // MsgBox(Nombre, 0,Tipo);
  end // With
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Estructura.mnuCompilarVistasClick(Sender: TObject);
begin
  with TDbNodo(Tv_Arbol.Selected.Data) do
  begin
    Dm_BaseDeDatos.SDQ_ValorSql.SQL.Clear;
    Dm_BaseDeDatos.SDQ_ValorSql.SQL.Add('ALTER VIEW "' +
      Owner + '"."' + Nombre + '" COMPILE ');
    Dm_BaseDeDatos.SDQ_ValorSql.ExecSQL;
          // Verifica que halla cambiado el estado
    if (ValorSql(' SELECT STATUS ' +
      ' FROM SYS.ALL_OBJECTS ' +
      ' WHERE OWNER = ''' + Owner + ''' ' +
      ' AND OBJECT_NAME = ''' + Nombre + ''' ' +
      ' AND OBJECT_TYPE = ''' + Tipo + ''' ') = 'VALID') then
    begin

                // Marca el nodo como estado Válido:
      Tv_Arbol.Selected.ImageIndex := 30;
      Tv_Arbol.Selected.SelectedIndex := 30;
      Tv_Arbol.Refresh;
    end
    else
      MostrarEstado('ERROR - No se pudo compilar el objeto');
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Estructura.Mnu_BDDDependenciasClick(Sender: TObject);
begin
  Mnu_BDDDependencias.Checked := not Mnu_BDDDependencias.Checked;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Estructura.Mnu_CompilarGruposClick(Sender: TObject);
var
  Cursor: TSDQuery;
  sOwner: string;
begin
  Cursor := TSDQuery.Create(Self);
  try
    Cursor.Databasename := BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.DatabaseName;
    sOwner := TDbNodo(Tv_Arbol.Selected.Data).Owner;
    Cursor.SQL.Text := ' SELECT OBJECT_NAME FROM SYS.ALL_OBJECTS ' +
      ' WHERE OBJECT_TYPE =''VIEW'' ' +
      ' AND OWNER = ''' + sOwner + '''' +
      ' AND STATUS = ''INVALID'' ' +
      sFiltro;
    Cursor.Open;
    if not Cursor.EOF then
    begin
      Cursor.First;
      repeat
        EjecutarSql('ALTER VIEW "' + sOwner + '"."' +
          Cursor.FieldByName('OBJECT_NAME').AsString + '" COMPILE ', true);

        Cursor.Next;
      until Cursor.EOF;
    end;
    Cursor.Close
  finally
    Cursor.Free;
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Estructura.mnuEditarTablaClick(Sender: TObject);
begin
  with TDbNodo(Tv_Arbol.Selected.Data) do
    TfrmDataEdit.Create(Self, Owner, Nombre);

end;

{----------------------------------------------------------------------------------------------------------------------}
end.
