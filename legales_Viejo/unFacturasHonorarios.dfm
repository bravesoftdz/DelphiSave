inherited frmFacturasHonorarios: TfrmFacturasHonorarios
  Left = 310
  Top = 108
  Width = 700
  Height = 450
  Caption = 'Facturas de Honorarios'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 91
    Visible = True
    DesignSize = (
      692
      91)
    object gbEstudio: TGroupBox
      Left = 217
      Top = 1
      Width = 473
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Estudio'
      TabOrder = 1
      DesignSize = (
        473
        44)
      inline fraEstudio: TfraStaticCodigoDescripcion
        Left = 8
        Top = 14
        Width = 460
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          460
          23)
        inherited edCodigo: TPatternEdit
          Left = 2
          Width = 48
        end
        inherited cmbDescripcion: TComboGrid
          Left = 52
          Width = 406
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
    end
    object gbFechaFact: TGroupBox
      Left = 2
      Top = 45
      Width = 254
      Height = 44
      Caption = 'Fecha de Factura'
      TabOrder = 2
      object Label7: TLabel
        Left = 7
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Fecha'
      end
      object Label5: TLabel
        Left = 138
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFH_FECHADesde: TDateComboBox
        Left = 41
        Top = 16
        Width = 93
        Height = 21
        MaxDateCombo = edFH_FECHAHasta
        TabOrder = 0
      end
      object edFH_FECHAHasta: TDateComboBox
        Left = 154
        Top = 16
        Width = 93
        Height = 21
        MinDateCombo = edFH_FECHADesde
        TabOrder = 1
      end
    end
    object gbFechaRecepc: TGroupBox
      Left = 259
      Top = 45
      Width = 254
      Height = 44
      Caption = 'Fecha de Recepci'#243'n'
      TabOrder = 3
      object Label1: TLabel
        Left = 7
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Fecha'
      end
      object Label2: TLabel
        Left = 138
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFH_FECHARECEPCIONDesde: TDateComboBox
        Left = 41
        Top = 16
        Width = 93
        Height = 21
        MaxDateCombo = edFH_FECHARECEPCIONHasta
        TabOrder = 0
      end
      object edFH_FECHARECEPCIONHasta: TDateComboBox
        Left = 154
        Top = 16
        Width = 93
        Height = 21
        MinDateCombo = edFH_FECHARECEPCIONDesde
        TabOrder = 1
      end
    end
    object gbFactura: TGroupBox
      Left = 2
      Top = 1
      Width = 212
      Height = 44
      Caption = 'Factura '
      TabOrder = 0
      object Label4: TLabel
        Left = 10
        Top = 18
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object chkSinAplicar: TCheckBox
        Left = 136
        Top = 17
        Width = 71
        Height = 17
        Caption = 'Sin aplicar'
        TabOrder = 1
      end
      object edFH_NUMERO: TMaskEdit
        Left = 50
        Top = 15
        Width = 82
        Height = 21
        EditMask = '9999-99999999;1;_'
        MaxLength = 13
        TabOrder = 0
        Text = '    -        '
        OnExit = CompletarFactura
      end
    end
    object rgAprobado: TRadioGroup
      Left = 516
      Top = 45
      Width = 174
      Height = 44
      Caption = 'Aprobados'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Si'
        'No')
      TabOrder = 4
    end
  end
  inherited CoolBar: TCoolBar
    Top = 91
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 688
      end>
    inherited ToolBar: TToolBar
      Width = 675
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Liquidaciones'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbAprobar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Aprobar (Ctrl+A)'
        ImageIndex = 19
        OnClick = tbAprobarClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 120
    Width = 692
    Height = 303
    Columns = <
      item
        Expanded = False
        FieldName = 'IDGESTOR'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Gestor'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMGESTOR'
        Title.Caption = 'Nombre Gestor'
        Width = 222
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 34
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUMERO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_RECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recepci'#243'n'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIN_APLICAR'
        Title.Alignment = taCenter
        Title.Caption = 'Sin Aplicar'
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAAPROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobaci'#243'n'
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPOCOMPROBANTE'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo Comprobante'
        Width = 96
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 176
    Top = 196
    Width = 460
    Height = 180
    Constraints.MaxHeight = 180
    Constraints.MaxWidth = 460
    Constraints.MinHeight = 180
    Constraints.MinWidth = 460
    OnEnter = fpAbmEnter
    DesignSize = (
      460
      180)
    inherited BevelAbm: TBevel
      Top = 144
      Width = 452
    end
    object Label3: TLabel [1]
      Left = 6
      Top = 57
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object Label6: TLabel [2]
      Left = 34
      Top = 57
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label8: TLabel [3]
      Left = 116
      Top = 57
      Width = 84
      Height = 13
      Caption = 'Fecha de Factura'
    end
    object Label9: TLabel [4]
      Left = 210
      Top = 57
      Width = 85
      Height = 13
      Caption = 'Fecha Recepci'#243'n'
    end
    object Label10: TLabel [5]
      Left = 304
      Top = 57
      Width = 35
      Height = 13
      Caption = 'Importe'
    end
    object Label11: TLabel [6]
      Left = 380
      Top = 57
      Width = 17
      Height = 13
      Caption = 'IVA'
    end
    inherited btnAceptar: TButton
      Left = 302
      Top = 150
      TabOrder = 8
    end
    inherited btnCancelar: TButton
      Left = 380
      Top = 150
      TabOrder = 9
    end
    object edfpFH_FECHA: TDateComboBox
      Left = 116
      Top = 73
      Width = 93
      Height = 21
      MinDate = 35247.000000000000000000
      MaxDateCombo = edfpFH_FECHARECEPCION
      TabOrder = 3
    end
    object edfpFH_FECHARECEPCION: TDateComboBox
      Left = 210
      Top = 73
      Width = 93
      Height = 21
      MinDate = 35247.000000000000000000
      MinDateCombo = edfpFH_FECHA
      TabOrder = 4
    end
    object edfpFH_NUMERO: TMaskEdit
      Left = 33
      Top = 73
      Width = 82
      Height = 21
      EditMask = '9999-99999999;1;_'
      MaxLength = 13
      TabOrder = 2
      Text = '    -        '
      OnExit = CompletarFactura
    end
    object edfpFH_IMPORTE: TCurrencyEdit
      Left = 304
      Top = 72
      Width = 74
      Height = 21
      AutoSize = False
      TabOrder = 5
    end
    object edfpFH_TIPO: TPatternEdit
      Left = 6
      Top = 73
      Width = 25
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 1
      TabOrder = 1
      Pattern = 'ABCM'
    end
    object gbEstudioAM: TGroupBox
      Left = 6
      Top = 5
      Width = 448
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Estudio'
      TabOrder = 0
      DesignSize = (
        448
        44)
      inline frafpEstudio: TfraStaticCodigoDescripcion
        Left = 8
        Top = 14
        Width = 435
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          435
          23)
        inherited edCodigo: TPatternEdit
          Left = 2
          Width = 48
        end
        inherited cmbDescripcion: TComboGrid
          Left = 52
          Width = 380
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
    end
    object edfpFH_IVA: TCurrencyEdit
      Left = 380
      Top = 72
      Width = 74
      Height = 21
      AutoSize = False
      TabOrder = 6
    end
    object rgTipoComprobante: TRadioGroup
      Left = 6
      Top = 96
      Width = 303
      Height = 45
      Caption = 'Tipo de Comprobante'
      Columns = 3
      Items.Strings = (
        'Factura'
        'Nota de Cr'#233'dito'
        'Nota de D'#233'bito')
      TabOrder = 7
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT GC_ID IDGESTOR, GC_NOMBRE NOMGESTOR, FH_TIPO TIPO,'
      
        '       FH_NUMERO NUMERO, FH_FECHA FECHA, FH_FECHARECEPCION FECHA' +
        '_RECEPCION, FH_IMPORTE IMPORTE,'
      '       LEGALES.GET_MONTOSINAPLICARFACTURA(FH_ID) SIN_APLICAR'
      '  FROM AGC_GESTORCUENTA, LFH_FACTURAHONORARIO'
      ' WHERE GC_ID = FH_IDGESTOR'
      '   AND 1 = 2'
      '   ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
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
        LinkControl = tbSalir2
      end
      item
        Key = 16449
        LinkControl = tbAprobar
      end>
    Left = 120
    Top = 200
  end
end
