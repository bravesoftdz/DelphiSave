inherited frmFFManMontos: TfrmFFManMontos
  Left = 345
  Top = 198
  Caption = 'Mantenimiento de Montos de Fondo Fijo '
  ClientHeight = 420
  ClientWidth = 681
  Constraints.MinHeight = 450
  Constraints.MinWidth = 556
  FormStyle = fsNormal
  Visible = False
  ExplicitLeft = 345
  ExplicitTop = 198
  ExplicitWidth = 689
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 681
    Height = 21
    Visible = True
    ExplicitWidth = 681
    ExplicitHeight = 21
    object chkNoMostrarBajas: TCheckBox
      Left = 5
      Top = 4
      Width = 105
      Height = 17
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
  inherited CoolBar: TCoolBar
    Top = 21
    Width = 681
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 675
      end>
    ExplicitTop = 21
    ExplicitWidth = 681
    inherited ToolBar: TToolBar
      Width = 666
      ExplicitWidth = 666
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Cierre'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 50
    Width = 681
    Height = 370
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_DESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Desde'
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_HASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Hasta'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_LIMITE'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. L'#237'mite'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAS_LIMITE'
        Title.Alignment = taCenter
        Title.Caption = 'D'#237'as L'#237'mite'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRMETODOPAGO'
        Title.Caption = 'Forma Pago'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMSUCURSAL'
        Title.Caption = 'Sucursal'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUENOMBRE'
        Title.Caption = 'Cheque Nombre'
        Width = 118
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CIERRE'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Cierre'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 69
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 211
    Top = 102
    Width = 443
    Height = 285
    BorderStyle = bsDialog
    ExplicitLeft = 211
    ExplicitTop = 102
    ExplicitWidth = 443
    ExplicitHeight = 285
    DesignSize = (
      443
      285)
    inherited BevelAbm: TBevel
      Top = 249
      Width = 435
      ExplicitTop = 219
      ExplicitWidth = 435
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Fecha Desde'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 39
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Fecha Hasta'
    end
    object Label19: TLabel [3]
      Left = 8
      Top = 66
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Monto'
    end
    object Label3: TLabel [4]
      Left = 8
      Top = 93
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Porc. L'#237'mite'
    end
    object Label5: TLabel [5]
      Left = 8
      Top = 119
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'D'#237'as L'#237'mite'
    end
    object Label6: TLabel [6]
      Left = 8
      Top = 147
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Forma Pago'
    end
    object Label7: TLabel [7]
      Left = 8
      Top = 171
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Banco'
    end
    object Label8: TLabel [8]
      Left = 8
      Top = 226
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Cheque Nombre'
    end
    object Label9: TLabel [9]
      Left = 8
      Top = 199
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Sucursal'
    end
    inherited btnAceptar: TButton
      Left = 285
      Top = 255
      TabOrder = 9
      ExplicitLeft = 285
      ExplicitTop = 225
    end
    inherited btnCancelar: TButton
      Left = 363
      Top = 255
      TabOrder = 10
      ExplicitLeft = 363
      ExplicitTop = 225
    end
    object edFechaDesdeAltaModif: TDateComboBox
      Left = 92
      Top = 9
      Width = 88
      Height = 21
      MaxDateCombo = edFechaHastaAltaModif
      TabOrder = 0
    end
    object edFechaHastaAltaModif: TDateComboBox
      Left = 92
      Top = 36
      Width = 88
      Height = 21
      MinDateCombo = edFechaDesdeAltaModif
      TabOrder = 1
    end
    object edMontoAltaModif: TCurrencyEdit
      Left = 92
      Top = 63
      Width = 88
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 12
      TabOrder = 2
    end
    object edPorcLimAltaModif: TCurrencyEdit
      Left = 92
      Top = 90
      Width = 85
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 3
    end
    object edDiasLimAltaModif: TIntEdit
      Left = 92
      Top = 116
      Width = 85
      Height = 21
      TabOrder = 4
      MaxLength = 8
    end
    inline fraFormaPagoAltaModif: TfraCtbTablas
      Left = 91
      Top = 141
      Width = 342
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      ExplicitLeft = 91
      ExplicitTop = 141
      ExplicitWidth = 342
      DesignSize = (
        342
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 64
        Width = 277
        ExplicitLeft = 64
        ExplicitWidth = 277
      end
      inherited edCodigo: TPatternEdit
        Width = 60
        ExplicitWidth = 60
      end
    end
    inline fraBancoAltaModif: TfraCodigoDescripcion
      Left = 91
      Top = 167
      Width = 342
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      ExplicitLeft = 91
      ExplicitTop = 167
      ExplicitWidth = 342
      DesignSize = (
        342
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 277
        ExplicitWidth = 277
      end
    end
    object edChequeNombreAltaModif: TEdit
      Left = 92
      Top = 223
      Width = 340
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 8
    end
    inline fraSucursalAltaModif: TfraCodigoDescripcion
      Left = 91
      Top = 195
      Width = 342
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      ExplicitLeft = 91
      ExplicitTop = 195
      ExplicitWidth = 342
      DesignSize = (
        342
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 277
        ExplicitWidth = 277
      end
    end
  end
  object fpCerrar: TFormPanel [4]
    Left = 15
    Top = 241
    Width = 180
    Height = 71
    Caption = 'Cierre'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnEnter = fpCerrarEnter
    DesignSize = (
      180
      71)
    object Bevel1: TBevel
      Left = 4
      Top = 35
      Width = 172
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 225
      ExplicitWidth = 453
    end
    object Label4: TLabel
      Left = 8
      Top = 12
      Width = 66
      Height = 13
      AutoSize = False
      Caption = 'Fecha Hasta'
    end
    object btnAceptarCerrar: TButton
      Left = 19
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarCerrarClick
    end
    object btnCancelarCerrar: TButton
      Left = 100
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object edFechaHastaCierreAltaModif: TDateComboBox
      Left = 81
      Top = 9
      Width = 88
      Height = 21
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT FM_FECHADESDE FECHA_DESDE, FM_FECHAHASTA FECHA_HASTA, FM_' +
        'MONTO MONTO,'
      '       FM_PORCLIMITE PORC_LIMITE, FM_DIASLIMITE DIAS_LIMITE,'
      '       FM_FECHACIERRE FECHA_CIERRE, FM_FECHABAJA FECHA_BAJA'
      '  FROM OFM_FFMONTO'
      ' WHERE FM_IDFONDOFIJO = :IdFondoFijo'
      '   AND 1 = 2'
      ''
      '')
    Top = 127
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdFondoFijo'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Top = 127
  end
  inherited SortDialog: TSortDialog
    Top = 155
  end
  inherited ExportDialog: TExportDialog
    Top = 155
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
    Top = 183
  end
  inherited Seguridad: TSeguridad
    Top = 99
  end
  inherited FormStorage: TFormStorage
    Top = 99
  end
  inherited PrintDialog: TPrintDialog
    Top = 183
  end
  inherited ShortCutControl: TShortCutControl
    Top = 99
  end
  inherited FieldHider: TFieldHider
    Top = 127
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
    Left = 113
    Top = 99
  end
end
