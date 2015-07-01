inherited frmHistoricoLote: TfrmHistoricoLote
  Left = 184
  Top = 207
  Caption = 'Hist'#243'rico del Lote'
  ClientHeight = 320
  ClientWidth = 663
  Constraints.MinHeight = 350
  Constraints.MinWidth = 671
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  ExplicitLeft = 184
  ExplicitTop = 207
  ExplicitWidth = 671
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 663
    Height = 2
    Visible = False
    ExplicitWidth = 470
    ExplicitHeight = 2
  end
  inherited CoolBar: TCoolBar
    Top = 2
    Width = 663
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 657
      end>
    ExplicitTop = 2
    ExplicitWidth = 470
    inherited ToolBar: TToolBar
      Width = 648
      ExplicitWidth = 648
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 31
    Width = 663
    Height = 289
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRESTADO'
        Title.Caption = 'Estado'
        Width = 225
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 144
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta'
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTAEXTRAVIADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Extraviado'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTAEXTRAVIADO'
        Title.Caption = 'Usuario Alta Extraviado'
        Width = 121
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT LH_USUALTA USUALTA, TRUNC(LH_FECHAALTA) FECHAALTA, LH_IDL' +
        'OTE LOTE, TB_DESCRIPCION DESCRESTADO,'
      
        '       LH_USUALTAEXTRAVIADO USUALTAEXTRAVIADO, TRUNC(LH_FECHAALT' +
        'AEXTRAVIADO) FECHAALTAEXTRAVIADO'
      '  FROM CTB_TABLAS, ARCHIVO.RLH_LOTE_HISTORICOESTADO'
      ' WHERE TB_CLAVE = '#39'ESLOT'#39
      '   AND TB_CODIGO = LH_ESTADO'
      '   AND LH_IDLOTE = :Lote'
      ' ORDER BY LH_ID DESC'
      '')
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Lote'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Top = 112
  end
  inherited SortDialog: TSortDialog
    Top = 140
  end
  inherited ExportDialog: TExportDialog
    Top = 140
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
    Top = 168
  end
  inherited Seguridad: TSeguridad
    Top = 84
  end
  inherited FormStorage: TFormStorage
    Top = 84
  end
  inherited PrintDialog: TPrintDialog
    Top = 168
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
    Top = 84
  end
  inherited FieldHider: TFieldHider
    Top = 112
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 108
    Top = 84
  end
end
