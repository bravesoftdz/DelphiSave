unit Frm_Filtros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Registros;

type
  TFrm_Filtrar = class(TForm)
    Pnl_Filtros: TPageControl;
    Ts_Fecha: TTabSheet;
    Ts_Personalisar: TTabSheet;
    Consulta: TLabel;
    Panel1: TPanel;
    Te_Sql: TMemo;
    Memo2: TMemo;
    Cmd_Filtrar: TButton;
    Cmd_Cancelar: TButton;
    Chk_FechaCreacion: TCheckBox;
    Chk_FechaModificacion: TCheckBox;
    Pnl_FechaCreacion: TPanel;
    Label1: TLabel;
    Dtp_FechCreaIni: TDateTimePicker;
    Label2: TLabel;
    Dtp_FechCreaFin: TDateTimePicker;
    Pnl_FechaModificacion: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Dtp_FechUltModIni: TDateTimePicker;
    Dtp_FechUltModFin: TDateTimePicker;
    Chk_Estado: TCheckBox;
    RGrp_Estado: TRadioGroup;
    chkPorDefecto: TCheckBox;
    procedure Cmd_FiltrarClick(Sender: TObject);
    procedure Chk_FechaCreacionClick(Sender: TObject);
    procedure Chk_FechaModificacionClick(Sender: TObject);
    procedure ActualizarSql(Sender: TObject);
    procedure Chk_EstadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Filtrar: TFrm_Filtrar;

implementation

uses Frm_Esrtructura;

{$R *.DFM}

procedure TFrm_Filtrar.Cmd_FiltrarClick(Sender: TObject);
begin
  TFrm_Estructura(Self.Owner).sFiltro := Te_Sql.Text;
  Self.ModalResult := idOk;
end;

procedure TFrm_Filtrar.Chk_FechaCreacionClick(Sender: TObject);
begin
  Pnl_FechaCreacion.Enabled := Chk_FechaCreacion.Checked;
  ActualizarSql(Sender);
end;

procedure TFrm_Filtrar.Chk_FechaModificacionClick(Sender: TObject);
begin
  Pnl_FechaModificacion.Enabled := Chk_FechaModificacion.Checked;
  ActualizarSql(Sender);
end;

procedure TFrm_Filtrar.Chk_EstadoClick(Sender: TObject);
begin
  RGrp_Estado.Enabled := Chk_Estado.Checked;
  ActualizarSql(Sender);
end;

procedure TFrm_Filtrar.ActualizarSql(Sender: TObject);
begin
  Te_Sql.Lines.Clear;
  if Chk_FechaCreacion.Checked then
  begin
    Te_Sql.Lines.Add(' AND CREATED > TO_DATE(''' +
      DateToStr(Dtp_FechCreaIni.Date) + ''',''DD/MM/YYYY'') ');
    Te_Sql.Lines.Add(' AND CREATED < TO_DATE(''' +
      DateToStr(Dtp_FechCreaFin.Date) + ''',''DD/MM/YYYY'') ');
  end;
  if Chk_FechaModificacion.Checked then
  begin
    Te_Sql.Lines.Add(' AND LAST_DDL_TIME > TO_DATE(''' +
      DateToStr(Dtp_FechUltModIni.Date) + ''',''DD/MM/YYYY'') ');
    Te_Sql.Lines.Add(' AND LAST_DDL_TIME < TO_DATE(''' +
      DateToStr(Dtp_FechUltModFin.Date) + ''',''DD/MM/YYYY'') ');
  end;
  if Chk_Estado.Checked then
  begin
    if RGrp_Estado.ItemIndex = 0 then
      Te_Sql.Lines.Add(' AND STATUS = ''VALID'' ')
    else
      Te_Sql.Lines.Add(' AND STATUS = ''INVALID'' ')
  end;
end;


procedure TFrm_Filtrar.FormCreate(Sender: TObject);
begin
  Dtp_FechCreaIni.DateTime := Date;
  Dtp_FechCreaFin.DateTime := Date;

  Dtp_FechUltModIni.DateTime := Date;
  Dtp_FechUltModFin.DateTime := Date;
end;

procedure TFrm_Filtrar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if chkPorDefecto.Checked then
    GuardarRegistro(HKEY_CURRENT_USER, 'SOFTWARE\FireSoft\Aplicaciones\Documentador',
      'Filtro', Te_Sql.Text);
end;

end.
