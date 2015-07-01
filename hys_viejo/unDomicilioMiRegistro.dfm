inherited frmDomicilioMiRegistro: TfrmDomicilioMiRegistro
  Left = 97
  Top = 195
  Caption = 'Domicilios Mi Registro'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 55
    Visible = True
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = 'C.U.I.T.'
    end
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 30
      Height = 13
      Caption = 'Estab.'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 56
      Top = 4
      Width = 562
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DesignSize = (
        562
        23)
      inherited lbContrato: TLabel
        Left = 458
      end
      inherited edContrato: TIntEdit
        Left = 505
      end
      inherited cmbRSocial: TArtComboBox
        Width = 323
      end
    end
    object edEstablecimiento: TPatternEdit
      Left = 56
      Top = 28
      Width = 561
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Pattern = '1234567890-,'
    end
  end
  inherited CoolBar: TCoolBar
    Top = 55
    inherited ToolBar: TToolBar
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 84
    Height = 355
    Columns = <
      item
        Expanded = False
        FieldName = 'DR_CUIT'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_SUCURSAL'
        Title.Caption = 'Establecimiento'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_DESCRIPCION'
        Title.Caption = 'Tipo de Movimiento'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_CALLE'
        Title.Caption = 'Calle'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_NUMEROPUERTA'
        Title.Caption = 'N'#250'mero'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_TORRE'
        Title.Caption = 'Torre'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_BLOQUE'
        Title.Caption = 'Bloque'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_PISO'
        Title.Caption = 'Piso'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_DEPARTAMENTO'
        Title.Caption = 'Departamento'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_CODIGOPOSTAL'
        Title.Caption = 'C'#243'digo Postal'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_ACTIVIDAD'
        Title.Caption = 'Actividad'
        Width = 85
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT   dr_id, dr_cuit, dr_codigodemovimiento,'
      '         DECODE (dr_tipoexterno,'
      '                 0, '#39'Domicilio fijo de la empresa'#39','
      '                 1, '#39'Domicilio externo o ambulante'#39','
      '                 2, '#39'Domicilio en el exterior del pa'#237's'#39
      '                ) AS dr_tipoexterno,'
      
        '         dr_calle, dr_numeropuerta, dr_torre, dr_bloque, dr_piso' +
        ','
      
        '         dr_departamento, dr_codigopostal, dr_localidad, dr_prov' +
        'incia,'
      
        '         dr_sucursal, dr_actividad, dr_fechahoramovimiento, dr_a' +
        'reareservada,'
      '         dr_idcabecera, dr_horamovimiento, cm_descripcion'
      
        '    FROM emi.idr_domiciliomiregistro idr, comunes.ccm_codigomovi' +
        'miento'
      '   WHERE dr_codigodemovimiento = cm_codigo'
      '     AND dr_id ='
      '           (SELECT MAX (dr_id)'
      '              FROM emi.idr_domiciliomiregistro b'
      '             WHERE idr.dr_idempresa = b.dr_idempresa'
      '               AND idr.dr_sucursal = b.dr_sucursal)'
      '     AND 1 = 2'
      'ORDER BY dr_cuit, dr_sucursal'
      '')
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
    Left = 80
    Top = 256
  end
end
