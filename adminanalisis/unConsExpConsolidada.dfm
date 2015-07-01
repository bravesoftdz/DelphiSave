inherited frmConsExpConsolidada: TfrmConsExpConsolidada
  Left = 629
  Top = 202
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
        FieldName = 'RS_FECHA'
        Title.Caption = 'F.Relev.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_fechaalta'
        Title.Caption = 'F.Carga'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_CUIT'
        Title.Caption = 'CUIT'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_nombre_empresa'
        Title.Caption = 'Raz'#243'n Social'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_estableci'
        Title.Caption = 'Estab.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_nombre_estableci'
        Title.Caption = 'Nombre Establecimiento'
        Width = 242
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_domicilio'
        Title.Caption = 'Domicilio'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_cpostal'
        Title.Caption = 'C.Postal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_provincia'
        Title.Caption = 'Provincia'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_CUIL'
        Title.Caption = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_nombre_trabajador'
        Title.Caption = 'Apellido y Nombre'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_fechaingreso'
        Title.Caption = 'F.Ingreso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_sector'
        Title.Caption = 'Sector'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_tarea'
        Title.Caption = 'Tarea'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_CODIGO_ESTUDIO'
        Title.Caption = 'Estudio'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_descripcion_estudio'
        Title.Caption = 'Descripci'#243'n'
        Width = 197
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_fechainiexpo'
        Title.Caption = 'F.Inicio Exp.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_esop'
        Title.Caption = 'ESOP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_descripcion_riesgotrabajo'
        Title.Caption = 'Riesgo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_periodicidad'
        Title.Caption = 'Periodicidad'
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
