{-----------------------------------------------------------------------------
 Unit Name: unFrmControlRecepcionDocumentacion
 Author:    cchiappero
 Date:      06-Abr-2006
 Purpose:   Interfaz para el control de la documentaci�n que
            se est� recepcionado.
 History:   0.0 Versi�n Inicial
-----------------------------------------------------------------------------}

unit unFrmControlRecepcionDocumentacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtFrame, unFraFiltroArchivo, StdCtrls, Mask, PatternEdit,
  IntEdit, ComCtrls, JvExComCtrls, JvListView, ExtCtrls;

type
  TFrmControlRecepcionDocumentacion = class(TForm)
    grControlCarpeta: TGroupBox;
    edCodigoArchivo: TIntEdit;
    lblCodigoArchivo: TLabel;
    gbDetalleContenido: TGroupBox;
    BevelAbm: TBevel;
    btnMailEnviar: TButton;
    btnMailOmitir: TButton;
    lvContenido: TJvListView;
    fraFiltroArchivoCapturaContenido: TfraFiltroArchivo;
  private
  public
  end;

var
  FrmControlRecepcionDocumentacion: TFrmControlRecepcionDocumentacion;

implementation

{$R *.dfm}

end.
