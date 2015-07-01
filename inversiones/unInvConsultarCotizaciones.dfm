inherited frmInvConsultarCotizaciones: TfrmInvConsultarCotizaciones
  Left = 230
  Top = 66
  Caption = 'Consultar Cotizaciones'
  ClientHeight = 627
  ClientWidth = 754
  Constraints.MinHeight = 480
  Constraints.MinWidth = 535
  ExplicitLeft = 230
  ExplicitTop = 66
  ExplicitWidth = 762
  ExplicitHeight = 657
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 754
    Height = 133
    Visible = True
    ExplicitWidth = 754
    ExplicitHeight = 133
    DesignSize = (
      754
      133)
    object gbTipoInstrumento: TGroupBox
      Left = 3
      Top = 1
      Width = 527
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Instrumento'
      TabOrder = 0
      DesignSize = (
        527
        43)
      inline fraTipoInstrumento: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 512
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 512
        DesignSize = (
          512
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 447
          ExplicitWidth = 447
        end
      end
    end
    object gbDenominacion: TGroupBox
      Left = 3
      Top = 87
      Width = 750
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Denominaci'#243'n'
      TabOrder = 4
      DesignSize = (
        750
        43)
      inline fraDenominacion: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 734
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 734
        DesignSize = (
          734
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 670
          ExplicitWidth = 670
        end
      end
    end
    object gbVencimiento: TGroupBox
      Left = 533
      Top = 1
      Width = 220
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Fecha'
      TabOrder = 1
      object Label1: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaHasta
        TabOrder = 0
      end
      object edFechaHasta: TDateComboBox
        Left = 121
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaDesde
        TabOrder = 1
      end
    end
    object gbTasaReferencia: TGroupBox
      Left = 306
      Top = 44
      Width = 447
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tasa de Referencia'
      TabOrder = 3
      DesignSize = (
        447
        43)
      inline fraTasaRef: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 432
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 432
        DesignSize = (
          432
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 367
          ExplicitWidth = 367
        end
      end
    end
    object gbMoneda: TGroupBox
      Left = 3
      Top = 44
      Width = 300
      Height = 43
      Caption = 'Moneda'
      TabOrder = 2
      DesignSize = (
        300
        43)
      inline fraMoneda: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 285
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 285
        DesignSize = (
          285
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 220
          ExplicitWidth = 220
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 133
    Width = 754
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 748
      end>
    ExplicitTop = 133
    ExplicitWidth = 754
    inherited ToolBar: TToolBar
      Width = 739
      ExplicitWidth = 739
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
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
      object pnlBajas: TPanel
        Left = 424
        Top = 0
        Width = 111
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkNoMostrarBajas: TCheckBox
          Left = 4
          Top = 3
          Width = 105
          Height = 17
          Caption = 'No Mostrar Bajas'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 162
    Width = 754
    Height = 465
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO_INSTRUMENTO'
        Title.Caption = 'Tipo Instrumento'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DENOMINACION'
        Title.Caption = 'Denominaci'#243'n'
        Width = 220
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDA'
        Title.Caption = 'Moneda'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TASA_REFERENCIA'
        Title.Caption = 'Tasa Referencia'
        Width = 215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TASA'
        Title.Alignment = taCenter
        Title.Caption = 'Tasa'
        Width = 68
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 248
    Width = 597
    Height = 262
    BorderStyle = bsDialog
    Constraints.MaxHeight = 262
    Constraints.MinHeight = 262
    Constraints.MinWidth = 546
    ExplicitLeft = 124
    ExplicitTop = 248
    ExplicitWidth = 597
    ExplicitHeight = 262
    DesignSize = (
      597
      262)
    inherited BevelAbm: TBevel
      Top = 226
      Width = 589
      ExplicitTop = 226
      ExplicitWidth = 589
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 50
      Width = 99
      Height = 13
      AutoSize = False
      Caption = 'Tipo Instrumento'
    end
    object Label3: TLabel [2]
      Left = 8
      Top = 77
      Width = 99
      Height = 13
      AutoSize = False
      Caption = 'Denominaci'#243'n'
    end
    object Label4: TLabel [3]
      Left = 8
      Top = 154
      Width = 99
      Height = 13
      AutoSize = False
      Caption = 'Fecha'
    end
    object Label5: TLabel [4]
      Left = 8
      Top = 180
      Width = 99
      Height = 13
      AutoSize = False
      Caption = 'Importe'
    end
    object Label6: TLabel [5]
      Left = 8
      Top = 102
      Width = 99
      Height = 13
      AutoSize = False
      Caption = 'Moneda'
    end
    object Label7: TLabel [6]
      Left = 8
      Top = 128
      Width = 99
      Height = 13
      AutoSize = False
      Caption = 'Tasa de Referencia'
    end
    object Label8: TLabel [7]
      Left = 8
      Top = 204
      Width = 99
      Height = 13
      AutoSize = False
      Caption = 'Tasa'
    end
    inherited btnAceptar: TButton
      Left = 439
      Top = 232
      TabOrder = 8
      ExplicitLeft = 439
      ExplicitTop = 232
    end
    inherited btnCancelar: TButton
      Left = 517
      Top = 232
      TabOrder = 9
      ExplicitLeft = 517
      ExplicitTop = 232
    end
    inline fraTipoInstrAltaModif: TfraCodigoDescripcion
      Left = 107
      Top = 46
      Width = 483
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 107
      ExplicitTop = 46
      ExplicitWidth = 483
      ExplicitHeight = 24
      DesignSize = (
        483
        24)
      inherited cmbDescripcion: TArtComboBox
        Width = 418
        ExplicitWidth = 418
      end
    end
    inline fraDenominacionAltaModif: TfraCodigoDescripcion
      Left = 107
      Top = 72
      Width = 483
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 107
      ExplicitTop = 72
      ExplicitWidth = 483
      DesignSize = (
        483
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 418
        ExplicitWidth = 418
      end
    end
    object edFechaAltaModif: TDateComboBox
      Left = 107
      Top = 150
      Width = 90
      Height = 21
      MaxDateCombo = edFechaHasta
      TabOrder = 5
    end
    object edImporteAltaModif: TCurrencyEdit
      Left = 107
      Top = 176
      Width = 124
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = '$ ,0.000000;-$ ,0.000000'
      MaxLength = 16
      MaxValue = 999999999.000000000000000000
      TabOrder = 6
    end
    inline fraMonedaAltaModif: TfraCodigoDescripcion
      Left = 107
      Top = 97
      Width = 483
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitLeft = 107
      ExplicitTop = 97
      ExplicitWidth = 483
      DesignSize = (
        483
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 418
        ExplicitWidth = 418
      end
    end
    inline fraTasaRefAltaModif: TfraCodigoDescripcion
      Left = 107
      Top = 123
      Width = 483
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      ExplicitLeft = 107
      ExplicitTop = 123
      ExplicitWidth = 483
      DesignSize = (
        483
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 418
        ExplicitWidth = 418
      end
    end
    object rgTipoCotizacion: TRadioGroup
      Left = 9
      Top = 4
      Width = 359
      Height = 37
      Caption = 'Tipo'
      Columns = 3
      Items.Strings = (
        'Instrumento'
        'Moneda'
        'Tasa de Referencia')
      TabOrder = 0
      OnClick = rgTipoCotizacionClick
    end
    object edTasaAltaModif: TCurrencyEdit
      Left = 107
      Top = 201
      Width = 90
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = '% ,0.000000;-% ,0.000000'
      MaxValue = 100.000000000000000000
      TabOrder = 7
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT TI_ID CODIGO, TI_DESCRIPCION TIPO_INSTRUMENTO, '
      
        '       IN_DESCRIPCION DENOMINACION, CO_FECHA, CO_IMPORTE, CO_FEC' +
        'HABAJA'
      '  FROM NTI_TIPOINSTRUMENTO, NIN_INSTRUMENTO, NCO_COTIZACION'
      'WHERE TI_ID = IN_IDTIPOINSTRUMENTO'
      '  AND IN_ID = CO_IDINSTRUMENTO'
      '  AND IN_FECHABAJA IS NULL'
      '  AND 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
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
      end>
    Left = 108
    Top = 200
  end
end
