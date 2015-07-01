inherited frmManRetencionIngrBrutos: TfrmManRetencionIngrBrutos
  Left = 8
  Top = 101
  Width = 780
  Height = 450
  Caption = 'Mantenimiento de Retenciones de Ingresos Brutos'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 780
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 772
    Height = 6
  end
  inherited CoolBar: TCoolBar
    Top = 6
    Width = 772
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 768
      end>
    inherited ToolBar: TToolBar
      Width = 755
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 35
    Width = 772
    Height = 388
    Columns = <
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRORRATEO_CM'
        Title.Alignment = taCenter
        Title.Caption = 'Prorrateo Conv. Mult.'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RET_FIJA'
        Title.Alignment = taCenter
        Title.Caption = 'Retenci'#243'n Fija'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXENTO'
        Title.Alignment = taCenter
        Title.Caption = 'M'#237'n. No Imponible'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALICUOTA'
        Title.Alignment = taCenter
        Title.Caption = 'Al'#237'cuota Retenci'#243'n'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSCRIPCION'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Inscripci'#243'n'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTIMO_COMPROBANTE'
        Title.Alignment = taCenter
        Title.Caption = 'Ult. Comprobante'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 334
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 192
    Top = 88
    Width = 480
    Height = 275
    BorderStyle = bsSingle
    DesignSize = (
      480
      275)
    inherited BevelAbm: TBevel
      Top = 239
      Width = 472
    end
    object Label1: TLabel [1]
      Left = 6
      Top = 11
      Width = 110
      Height = 13
      AutoSize = False
      Caption = 'Provincia'
    end
    object Label2: TLabel [2]
      Left = 6
      Top = 34
      Width = 110
      Height = 25
      AutoSize = False
      Caption = 'Prorrateo Convenio Multilateral'
      WordWrap = True
    end
    object Label3: TLabel [3]
      Left = 6
      Top = 67
      Width = 110
      Height = 13
      AutoSize = False
      Caption = 'Retenci'#243'n Fija'
    end
    object Label4: TLabel [4]
      Left = 6
      Top = 96
      Width = 110
      Height = 13
      AutoSize = False
      Caption = 'M'#237'nimo No Imponible'
    end
    object Label5: TLabel [5]
      Left = 6
      Top = 124
      Width = 110
      Height = 13
      AutoSize = False
      Caption = 'Al'#237'cuota de Retenci'#243'n'
    end
    object Label6: TLabel [6]
      Left = 6
      Top = 153
      Width = 110
      Height = 13
      AutoSize = False
      Caption = 'Nro. de Inscripci'#243'n'
    end
    object Label7: TLabel [7]
      Left = 6
      Top = 183
      Width = 110
      Height = 13
      AutoSize = False
      Caption = 'Observaciones'
    end
    inherited btnAceptar: TButton
      Left = 322
      Top = 245
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 400
      Top = 245
      TabOrder = 8
    end
    inline frafpProvincia: TfraCodigoDescripcion
      Left = 115
      Top = 7
      Width = 358
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        358
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 293
      end
    end
    object edfpIB_PORCCONVENIO: TCurrencyEdit
      Left = 116
      Top = 35
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '% 0.00;% -0.00'
      MaxLength = 10
      TabOrder = 1
      ZeroEmpty = False
    end
    object edfpIB_RETENCION: TCurrencyEdit
      Left = 116
      Top = 63
      Width = 100
      Height = 21
      AutoSize = False
      MaxLength = 13
      MaxValue = 9999999999.000000000000000000
      TabOrder = 2
    end
    object edfpIB_EXENTO: TCurrencyEdit
      Left = 116
      Top = 92
      Width = 100
      Height = 21
      AutoSize = False
      MaxLength = 13
      MaxValue = 9999999999.000000000000000000
      TabOrder = 3
    end
    object edfpIB_TASA: TCurrencyEdit
      Left = 116
      Top = 121
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '% 0.00;% -0.00'
      MaxLength = 10
      TabOrder = 4
      ZeroEmpty = False
    end
    object edfpIB_INSCRIPCION: TEdit
      Left = 116
      Top = 150
      Width = 156
      Height = 21
      MaxLength = 15
      TabOrder = 5
    end
    object edfpIB_OBSERVACIONES: TMemo
      Left = 116
      Top = 180
      Width = 355
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 480
      TabOrder = 6
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT PV_DESCRIPCION PROVINCIA, IB_PORCCONVENIO PRORRATEO_CM, I' +
        'B_RETENCION RET_FIJA,'
      
        '  '#9'   IB_EXENTO EXENTO, IB_TASA ALICUOTA, IB_INSCRIPCION INSCRIP' +
        'CION, IB_ULTIMOCOMP ULTIMO_COMPROBANTE,'
      
        #9'     IB_OBSERVACIONES OBSERVACIONES, IB_PROVINCIA CODPROVINCIA,' +
        ' IB_ID OIBID'
      '  FROM CPV_PROVINCIAS, OIB_INGRESOSBRUTOS'
      ' WHERE PV_CODIGO = IB_PROVINCIA')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
    Zoom = 90
    Options = [qoZoomPrint, qoZoomCalcFontSize]
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
    Left = 110
    Top = 200
  end
end
