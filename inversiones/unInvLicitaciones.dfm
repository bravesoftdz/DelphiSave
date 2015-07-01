inherited frmInvLicitaciones: TfrmInvLicitaciones
  Left = 252
  Top = 157
  Caption = 'Licitaciones'
  ClientHeight = 520
  ClientWidth = 642
  Constraints.MinHeight = 550
  Constraints.MinWidth = 650
  FormStyle = fsNormal
  Visible = False
  ExplicitLeft = 252
  ExplicitTop = 157
  ExplicitWidth = 650
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 642
    Height = 91
    Visible = True
    ExplicitWidth = 642
    ExplicitHeight = 91
    DesignSize = (
      642
      91)
    object gbTipoInstrumento: TGroupBox
      Left = 3
      Top = 1
      Width = 633
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Instrumento'
      TabOrder = 0
      DesignSize = (
        633
        43)
      inline fraTipoInstrumento: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 618
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 618
        DesignSize = (
          618
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 553
          ExplicitWidth = 553
        end
      end
    end
    object gbDescripcion: TGroupBox
      Left = 3
      Top = 44
      Width = 633
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Denominaci'#243'n'
      TabOrder = 1
      DesignSize = (
        633
        43)
      object edDescripcion: TEdit
        Left = 9
        Top = 14
        Width = 615
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 80
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 91
    Width = 642
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 636
      end>
    ExplicitTop = 91
    ExplicitWidth = 642
    inherited ToolBar: TToolBar
      Width = 627
      ExplicitWidth = 627
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbResultado: TToolButton
        Left = 370
        Top = 0
        Hint = 'Resultado'
        ImageIndex = 52
        OnClick = tbResultadoClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
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
    Top = 120
    Width = 642
    Height = 400
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 56
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Cantidad'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TASA'
        Title.Alignment = taCenter
        Title.Caption = 'Tasa / Margen'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TASA_REFERENCIA'
        Title.Caption = 'Tasa Referencia'
        Width = 168
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_PAGO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Pago'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 322
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLAZO_LIQUIDACION'
        Title.Caption = 'Plazo de Liquidaci'#243'n'
        Width = 127
        Visible = True
      end>
  end
  object fpResultado: TFormPanel [3]
    Left = 140
    Top = 152
    Width = 220
    Height = 90
    Caption = 'Modificar Estado'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 90
    Constraints.MaxWidth = 220
    Constraints.MinHeight = 90
    Constraints.MinWidth = 220
    OnEnter = fpResultadoEnter
    DesignSize = (
      220
      90)
    object Bevel1: TBevel
      Left = 4
      Top = 54
      Width = 212
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarRes: TButton
      Left = 62
      Top = 60
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnAceptarResClick
    end
    object btnCancelarRes: TButton
      Left = 140
      Top = 60
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object rgResultadoAltaModif: TRadioGroup
      Left = 9
      Top = 5
      Width = 203
      Height = 45
      Caption = 'Resultado'
      Columns = 2
      Items.Strings = (
        'Aceptada'
        'No Aceptada')
      TabOrder = 2
    end
  end
  inherited fpAbm: TFormPanel
    Left = 156
    Top = 176
    Width = 470
    Height = 313
    Constraints.MaxHeight = 313
    Constraints.MinHeight = 313
    Constraints.MinWidth = 470
    ExplicitLeft = 156
    ExplicitTop = 176
    ExplicitWidth = 470
    ExplicitHeight = 313
    DesignSize = (
      470
      313)
    inherited BevelAbm: TBevel
      Top = 277
      Width = 462
      ExplicitTop = 277
      ExplicitWidth = 462
    end
    object Label1: TLabel [1]
      Left = 7
      Top = 10
      Width = 85
      Height = 13
      AutoSize = False
      Caption = 'Fecha'
    end
    object Label2: TLabel [2]
      Left = 7
      Top = 36
      Width = 85
      Height = 13
      AutoSize = False
      Caption = 'Cantidad'
    end
    object Label3: TLabel [3]
      Left = 7
      Top = 63
      Width = 85
      Height = 13
      AutoSize = False
      Caption = 'Tasa'
    end
    object Label4: TLabel [4]
      Left = 7
      Top = 115
      Width = 85
      Height = 13
      AutoSize = False
      Caption = 'Fecha Pago'
    end
    object Label5: TLabel [5]
      Left = 7
      Top = 168
      Width = 85
      Height = 13
      AutoSize = False
      Caption = 'Observaciones'
    end
    object Label6: TLabel [6]
      Left = 7
      Top = 88
      Width = 85
      Height = 13
      AutoSize = False
      Caption = 'Tasa Referencia'
    end
    object Label7: TLabel [7]
      Left = 7
      Top = 135
      Width = 85
      Height = 28
      AutoSize = False
      Caption = 'Plazo de Liquidaci'#243'n'
      WordWrap = True
    end
    inherited btnAceptar: TButton
      Left = 312
      Top = 283
      TabOrder = 7
      ExplicitLeft = 312
      ExplicitTop = 283
    end
    inherited btnCancelar: TButton
      Left = 390
      Top = 283
      TabOrder = 8
      ExplicitLeft = 390
      ExplicitTop = 283
    end
    object edFechaAltaModif: TDateComboBox
      Left = 91
      Top = 6
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object edCantidadAltaModif: TCurrencyEdit
      Left = 91
      Top = 33
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      MaxLength = 8
      MaxValue = 99999999.000000000000000000
      TabOrder = 1
    end
    object edTasaAltaModif: TCurrencyEdit
      Left = 91
      Top = 59
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxValue = 100.000000000000000000
      TabOrder = 2
    end
    object edFPagoAltaModif: TDateComboBox
      Left = 91
      Top = 111
      Width = 89
      Height = 21
      TabOrder = 4
    end
    object edObservacioensAltaModif: TMemo
      Left = 91
      Top = 166
      Width = 370
      Height = 107
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        '')
      MaxLength = 400
      TabOrder = 6
    end
    inline fraTasaRefAltaModif: TfraCodigoDescripcion
      Left = 90
      Top = 84
      Width = 373
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitLeft = 90
      ExplicitTop = 84
      ExplicitWidth = 373
      DesignSize = (
        373
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 308
        ExplicitWidth = 308
      end
    end
    inline fraPlazoLiqAltaModif: TfraCodigoDescripcion
      Left = 90
      Top = 137
      Width = 373
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      ExplicitLeft = 90
      ExplicitTop = 137
      ExplicitWidth = 373
      DesignSize = (
        373
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 308
        ExplicitWidth = 308
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT LI_FECHA FECHA, LI_CANTIDAD CANTIDAD, LI_TASA TASA, '
      '     '#9' TR_NOMBRE TASA_REFERENCIA, LI_FECHAPAGO FECHA_PAGO,'
      '     '#9' LI_OBSERVACIONES OBSERVACIONES,'
      
        '     '#9' DECODE(LI_ESTADO, '#39'A'#39', '#39'Aceptada'#39', '#39'N'#39', '#39'No Aceptada'#39', '#39'P' +
        'endiente'#39') ESTADO,'
      '     '#9' LI_FECHABAJA FECHA_BAJA'
      '  FROM NTR_TASAREFERENCIA, NLI_LICITACION'
      ' WHERE LI_IDTASAREFERENCIA = TR_ID(+)'
      '   AND LI_IDINSTRUMENTO = :Instrumento'
      '   AND 1 = 2')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Instrumento'
        ParamType = ptInput
      end>
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
      end>
    Left = 109
    Top = 200
  end
end
