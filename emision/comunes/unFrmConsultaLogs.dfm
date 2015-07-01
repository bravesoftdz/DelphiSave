inherited FrmConsultaLogs: TFrmConsultaLogs
  Width = 724
  Height = 346
  Caption = 'Consulta de Traza de Proceso'
  FormStyle = fsNormal
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 716
    Height = 0
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 716
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 712
      end>
    inherited ToolBar: TToolBar
      Width = 699
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      inherited tbEliminar: TToolButton
        Enabled = True
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbImprimir: TToolButton
        Enabled = True
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 29
    Width = 716
    Height = 290
    Columns = <
      item
        Expanded = False
        FieldName = 'LP_ID'
        Title.Caption = 'Nro.Sec.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LP_LINEA'
        Title.Caption = 'Linea'
        Width = 552
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LP_FECHA'
        Title.Caption = 'Fecha'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LP_NIVEL'
        Title.Caption = 'Nivel'
        Visible = False
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'select lp_id, decode(lp_nivel, 1, '#39'   '#39','
      '1, '#39' '#39','
      '2, '#39'     '#39','
      '3, '#39'        '#39','
      '4, '#39'           '#39','
      '5, '#39'              '#39','
      '6, '#39'                 '#39','
      '7, '#39'                    '#39','
      '8, '#39'                      '#39
      
        ' ) || lp_linea as lp_linea, lp_fecha from emi.tlp_logproceso ord' +
        'er by lp_id ')
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Nro.Sec.'
        DataField = 'LP_ID'
        FieldIndex = 0
      end
      item
        Title = 'Linea'
        DataField = 'LP_LINEA'
        FieldIndex = 1
      end
      item
        Title = 'Fecha'
        DataField = 'LP_FECHA'
        FieldIndex = 2
      end
      item
        Title = 'Nivel'
        DataField = 'LP_NIVEL'
        FieldIndex = 3
      end>
  end
  inherited QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Headers.Color = 11184810
    Headers.Font.Color = clWhite
    Detail.Color = 14737632
    Detail.GridLines = []
    Totals.Color = 14079702
    SubTotals.Color = 12961221
  end
  inherited Seguridad: TSeguridad
    DBLogin = DmEmision.DBLogin
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
      end
      item
        Key = 16461
      end
      item
        Key = 46
      end
      item
        Key = 16463
      end
      item
        Key = 16453
      end
      item
        Key = 16457
      end
      item
        Key = 16449
      end>
  end
end
