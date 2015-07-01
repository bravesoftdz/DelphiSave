inherited frmConsEstabCUIT: TfrmConsEstabCUIT
  Left = 224
  Top = 275
  Width = 649
  Height = 429
  Caption = 'Consulta de Expuestos Consolidada'
  Constraints.MinHeight = 429
  Constraints.MinWidth = 646
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 641
    Height = 22
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 22
    Width = 641
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 637
      end>
    inherited ToolBar: TToolBar
      Width = 624
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
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
    Top = 51
    Width = 641
    Height = 351
    Columns = <
      item
        Expanded = False
        FieldName = 'es_nroestableci'
        Title.Caption = 'Estab.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Caption = 'Nombre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_cpostal'
        Title.Caption = 'C.Postal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_localidad'
        Title.Caption = 'Localidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'le_id'
        Title.Caption = 'Lote'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha'
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'le_idprestador'
        Title.Caption = 'Prest.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_descripcion'
        Title.Caption = 'Nombre Prestador'
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM HYS.V_RIESGOTRABAJADOR,'
      '       ART.PRG_RIESGOS'
      ' WHERE RG_CODIGO = rs_riesgo'
      ''
      ''
      ' '
      ''
      ' ')
  end
  inherited Seguridad: TSeguridad
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
end
