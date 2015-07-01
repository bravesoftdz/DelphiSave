inherited FrmSeteos: TFrmSeteos
  Left = 410
  Top = 266
  Caption = 'Seteo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 2
  end
  inherited CoolBar: TCoolBar
    Top = 2
    inherited ToolBar: TToolBar
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 31
    Height = 286
    Columns = <
      item
        Expanded = False
        FieldName = 'SE_ID'
        Title.Caption = 'C'#243'd.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_FECHAVIGENCIADESDE'
        Title.Caption = 'F.Vigencia Desde'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_FECHAVIGENCIAHASTA'
        Title.Caption = 'F.Vigencia Hasta'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 279
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ise.se_id, ise.se_fechavigenciadesde, ise.se_fechavigenci' +
        'ahasta, ise.se_observaciones, ise.se_fechabaja, ise.se_usubaja'
      '  FROM emi.ise_seteo ise order by se_id desc')
  end
  inherited Seguridad: TSeguridad
    AutoEjecutar = True
    DBLogin = frmPrincipal.DBLogin
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
  object ShortCutControlSinHerenciaDelOrto: TShortCutControl
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
    Left = 80
    Top = 256
  end
end
