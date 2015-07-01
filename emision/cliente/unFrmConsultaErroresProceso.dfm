inherited FrmConsultaErroresProceso: TFrmConsultaErroresProceso
  Left = 223
  Width = 689
  Caption = 'Consulta Errores de Proceso'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter1: TJvNetscapeSplitter [0]
    Left = 0
    Top = 225
    Width = 681
    Height = 10
    Cursor = crVSplit
    Align = alTop
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
  end
  inherited pnlFiltros: TPanel
    Width = 681
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Width = 681
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 677
      end>
    inherited ToolBar: TToolBar
      Width = 664
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
    end
  end
  inherited Grid: TArtDBGrid
    Width = 681
    Height = 159
    Align = alTop
    Columns = <
      item
        Expanded = False
        FieldName = 'CE_ID'
        Title.Caption = 'Nro.Sec.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_DETALLEERROR'
        Title.Caption = 'Detalle'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_REGISTROERROR'
        Title.Caption = 'Registro'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_CODIGOARCHIVO'
        Title.Caption = 'Archivo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_SUBCODIGOARCHIVO'
        Title.Caption = 'SubCodigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_FECHAPROCESO'
        Title.Caption = 'Fecha Proceso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_HORAPROCESO'
        Title.Caption = 'Hora Proceso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_IDDDJJCABECERAERRORES'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CE_IDERROR'
        Visible = False
      end>
  end
  object DBMemo1: TDBMemo [4]
    Left = 0
    Top = 235
    Width = 681
    Height = 82
    Align = alClient
    TabOrder = 3
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'select * from emi.tce_ddjjcabeceraerrores')
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
end
