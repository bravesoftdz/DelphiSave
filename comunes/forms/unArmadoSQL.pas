unit unArmadoSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomForm, Vcl.ImgList, XPMenu,
  RxPlacemnt, Vcl.StdCtrls, Vcl.CheckLst, Vcl.Menus;

type
  TTipoSql = (tsUpdateNull);

  TDatosSql = Class(TObject)
    NombreCampo, DescripcionCampo: String;
  end;

  aDatosSql = array of TDatosSql;

  TfrmArmadoSQL = class(TfrmCustomForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    clbCampos: TCheckListBox;
    procedure btnAceptarClick(Sender: TObject);
  private
    function IsItemsSeleccionados: Boolean;
    function GetSqlUpdateNull(Tabla: String): String;
    function DoCargarLista(DatosSql: aDatosSql): Boolean;
  public
  end;

  function GetSqlArmado(TipoSql: TTipoSql; Tabla: String; DatosSql: aDatosSql): String;

var
  frmArmadoSQL: TfrmArmadoSQL;

implementation

uses
  CustomDlgs, StrFuncs;

{$R *.dfm}

function GetSqlArmado(TipoSql: TTipoSql; Tabla: String; DatosSql: aDatosSql): String;
var
  sSql: String;
begin
  sSql := '';

  with TfrmArmadoSQL.Create(nil) do
    try
      if DoCargarLista(DatosSql) then
        begin
          if ShowModal = mrOk then
            begin
              case TipoSql of
                tsUpdateNull:
                  sSql := GetSqlUpdateNull(Tabla);
              end;
            end;
        end;

      Result := sSql + ' ';
      Close;
    finally
      Free;
    end;
end;

function TfrmArmadoSQL.GetSqlUpdateNull(Tabla: String): String;
var
  i: Integer;
  sSql: String;
begin
  sSql := 'UPDATE ' + Tabla + ' ' +
             'SET ';

  for i := 0 to clbCampos.Items.Count - 1 do
    if clbCampos.Checked[i] then
      sSql := sSql + TDatosSql(clbCampos.Items.Objects[i]).NombreCampo + ' = NULL, ';

  Result := CutRight(sSql, 2);
end;

function TfrmArmadoSQL.IsItemsSeleccionados: Boolean;
var
  i: Integer;
begin
  Result := False;

  for i := 0 to clbCampos.Items.Count - 1 do
    if clbCampos.Checked[i] then
      begin
        Result := True;
        Break;
      end;
end;

function TfrmArmadoSQL.DoCargarLista(DatosSql: aDatosSql): Boolean;
var
  iHasta, i: Integer;
begin
  iHasta := High(DatosSql);

  for i := 0 to iHasta do
    clbCampos.AddItem(DatosSql[i].DescripcionCampo, DatosSql[i]);

  Result := (iHasta >= 0);
end;

procedure TfrmArmadoSQL.btnAceptarClick(Sender: TObject);
begin
  Verificar(not IsItemsSeleccionados(), clbCampos, 'Debe seleccionar al menos un campo.');

  ModalResult := mrOk;
end;

end.

