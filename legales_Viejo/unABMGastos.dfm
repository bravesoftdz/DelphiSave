inherited frmABMGastos: TfrmABMGastos
  Left = 248
  Top = 107
  Width = 754
  Height = 477
  Caption = 'Administraci'#243'n de Gastos.'
  Constraints.MinHeight = 477
  Constraints.MinWidth = 676
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 746
    Height = 189
    object lbNroOrden: TLabel
      Left = 2
      Top = 10
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nro. de Orden:'
    end
    object lbCaratula: TLabel
      Left = 167
      Top = 10
      Width = 42
      Height = 13
      Caption = 'Car'#225'tula:'
    end
    object lbAbogado: TLabel
      Left = 2
      Top = 64
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Abogado:'
    end
    object lbFuero: TLabel
      Left = 2
      Top = 117
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fuero:'
    end
    object lbJuzgado: TLabel
      Left = 2
      Top = 140
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Juzgado Nro:'
    end
    object lbSecretaria: TLabel
      Left = 133
      Top = 140
      Width = 53
      Height = 13
      Caption = 'Secretar'#237'a:'
    end
    object lbJurisdiccion: TLabel
      Left = 2
      Top = 166
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Jurisdicci'#243'n:'
    end
    object Label1: TLabel
      Left = 2
      Top = 36
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Gestor:'
    end
    object Label2: TLabel
      Left = 2
      Top = 90
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Empresa:'
    end
    object Label3: TLabel
      Left = 649
      Top = 88
      Width = 40
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Contrato'
    end
    object Label4: TLabel
      Left = 245
      Top = 140
      Width = 37
      Height = 13
      Caption = 'Cartera:'
    end
    object Label5: TLabel
      Left = 370
      Top = 140
      Width = 87
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fecha Asignaci'#243'n:'
    end
    object edGD_NROORDEN: TIntEdit
      Left = 80
      Top = 5
      Width = 79
      Height = 21
      TabStop = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Alignment = taRightJustify
    end
    object edGD_CARATULA: TEdit
      Left = 216
      Top = 5
      Width = 526
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 1
    end
    object edGD_JUZGADO: TIntEdit
      Left = 80
      Top = 136
      Width = 44
      Height = 21
      TabStop = False
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 2
      MaxLength = 3
    end
    object edGD_SECRETARIA: TIntEdit
      Left = 193
      Top = 136
      Width = 41
      Height = 21
      TabStop = False
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 3
      Alignment = taRightJustify
      MaxLength = 3
    end
    object edGD_GESTOR: TEdit
      Left = 80
      Top = 31
      Width = 79
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edGE_NOMBRE: TEdit
      Left = 162
      Top = 31
      Width = 580
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object edGD_ABOGADO: TEdit
      Left = 80
      Top = 57
      Width = 79
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object edBO_NOMBRE: TEdit
      Left = 162
      Top = 57
      Width = 580
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object edGD_FUERO: TEdit
      Left = 80
      Top = 109
      Width = 79
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object edFUERO: TEdit
      Left = 162
      Top = 109
      Width = 580
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 9
    end
    object edGD_JURISDICCION: TEdit
      Left = 80
      Top = 163
      Width = 79
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 10
    end
    object edJURISDICCION: TEdit
      Left = 162
      Top = 163
      Width = 580
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 11
    end
    object edMP_CONTRATO: TEdit
      Left = 693
      Top = 83
      Width = 49
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 12
    end
    object edMP_NOMBRE: TEdit
      Left = 162
      Top = 83
      Width = 480
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 13
    end
    object edGD_CUIT: TMaskEdit
      Left = 80
      Top = 83
      Width = 78
      Height = 21
      TabStop = False
      Color = clBtnFace
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      ReadOnly = True
      TabOrder = 14
    end
    object edGD_FECHAASIGN: TEdit
      Left = 464
      Top = 136
      Width = 97
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 15
    end
    object edGD_CARTERA: TEdit
      Left = 289
      Top = 136
      Width = 72
      Height = 21
      TabStop = False
      Color = clInactiveCaption
      MaxLength = 10
      ReadOnly = True
      TabOrder = 16
    end
  end
  inherited CoolBar: TCoolBar
    Top = 189
    Width = 746
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 28
        Width = 742
      end>
    inherited ToolBar: TToolBar
      Width = 729
      Height = 28
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 9
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImpresion
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Left = 352
        Visible = False
      end
      inherited tbSalir: TToolButton
        Left = 360
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 218
    Width = 746
    Height = 232
    OnGetCellProps = GridGetCellProps
    Columns = <
      item
        Expanded = False
        FieldName = 'GS_NROGASTO'
        Title.Caption = 'Nro. Gasto'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_DENPAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Concepto de pago'
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GS_FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GS_MONTO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GS_BENEFICIARIO'
        Title.Caption = 'Beneficiario'
        Width = 204
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GS_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 186
        Visible = True
      end>
  end
  object frmPanelABMGastos: TFormPanel [3]
    Left = 190
    Top = 218
    Width = 447
    Height = 215
    FormWidth = 0
    FormHeigth = 0
    Position = poOwnerFormCenter
    DesignSize = (
      447
      215)
    object lbNroGasto: TLabel
      Left = 33
      Top = 10
      Width = 51
      Height = 13
      Caption = 'Nro.Gasto:'
    end
    object lbConcepto: TLabel
      Left = 36
      Top = 36
      Width = 49
      Height = 13
      Caption = 'Concepto:'
    end
    object lbFecha: TLabel
      Left = 51
      Top = 60
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object lbMonto: TLabel
      Left = 51
      Top = 86
      Width = 33
      Height = 13
      Caption = 'Monto:'
    end
    object lbBeneficiario: TLabel
      Left = 26
      Top = 110
      Width = 58
      Height = 13
      Caption = 'Beneficiario:'
    end
    object lbObservaciones: TLabel
      Left = 10
      Top = 135
      Width = 74
      Height = 13
      Caption = 'Observaciones:'
    end
    object btnAceptar: TButton
      Left = 279
      Top = 182
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 6
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 362
      Top = 183
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 7
    end
    object edGS_NROGASTO: TIntEdit
      Left = 90
      Top = 5
      Width = 75
      Height = 21
      TabStop = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Alignment = taRightJustify
    end
    object edGS_FECHA: TDateComboBox
      Left = 90
      Top = 56
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edGS_MONTO: TCurrencyEdit
      Left = 90
      Top = 84
      Width = 87
      Height = 21
      AutoSize = False
      TabOrder = 3
    end
    object edGS_BENEFICIARIO: TEdit
      Left = 90
      Top = 107
      Width = 345
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 70
      TabOrder = 4
    end
    object eGS_OBSERVACIONES: TMemo
      Left = 90
      Top = 134
      Width = 345
      Height = 44
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 250
      TabOrder = 5
    end
    object cmbConcepto: TRxDBLookupCombo
      Left = 90
      Top = 31
      Width = 347
      Height = 21
      DropDownCount = 8
      Anchors = [akLeft, akTop, akRight]
      LookupField = 'CP_CONPAGO'
      LookupDisplay = 'CP_DENPAGO'
      LookupSource = dsConcepto
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'Select gs_nrogasto, cp_denpago, gs_fecha, gs_monto,'
      'gs_beneficiario, gs_observaciones, gs_concepto,GS_FECHABAJA'
      'From Scp_Conpago, Lgs_Gastosgdeuda'
      'Where gs_concepto = cp_conpago'
      'And GS_NROORDEN = :NROORDEN')
    Left = 8
    Top = 323
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NROORDEN'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 37
    Top = 322
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Donominaci'#243'n'
        DataField = 'CP_DENPAGO'
        FieldIndex = 0
      end
      item
        Title = 'Beneficiario'
        DataField = 'GS_BENEFICIARIO'
        FieldIndex = 0
      end
      item
        Title = 'Concepto de Pago'
        DataField = 'GS_CONCEPTO'
        FieldIndex = 0
      end
      item
        Title = 'Fecha'
        DataField = 'GS_FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Monto'
        DataField = 'GS_MONTO'
        FieldIndex = 0
      end
      item
        Title = 'Nro. Gasto'
        DataField = 'GS_NROGASTO'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'GS_OBSERVACIONES'
        FieldIndex = 0
      end>
    Left = 9
    Top = 350
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'GS_NROGASTO'
        Title = 'Nro. Gasto'
      end
      item
        DataField = 'CP_DENPAGO'
        Title = 'Pago'
      end
      item
        DataField = 'GS_FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'GS_MONTO'
        Title = 'Monto'
      end
      item
        DataField = 'GS_BENEFICIARIO'
        Title = 'Beneficiario'
      end
      item
        DataField = 'GS_OBSERVACIONES'
        Title = 'Observaciones'
      end>
    Left = 37
    Top = 350
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Nro. Gasto'
        DataField = 'GS_NROGASTO'
        MaxLength = 12
      end
      item
        Title = 'Concepto de pago'
        DataField = 'CP_DENPAGO'
        MaxLength = 30
      end
      item
        Title = 'Fecha'
        DataField = 'GS_FECHA'
        MaxLength = 12
      end
      item
        Title = 'Monto'
        DataField = 'GS_MONTO'
        TotalType = ttAutoSum
        MaxLength = 12
      end
      item
        Title = 'Beneficiario'
        DataField = 'GS_BENEFICIARIO'
        MaxLength = 30
      end
      item
        Title = 'Observaciones'
        DataField = 'GS_OBSERVACIONES'
        MaxLength = 150
      end>
    Title.Text = 'Gastos'
    SubTitle.Font.Height = -11
    SubTitle.Font.Style = []
    SubTitle.Alignment = taLeftJustify
    PageOrientation = pxLandscape
    Left = 36
    Top = 377
  end
  inherited Seguridad: TSeguridad
    Left = 8
    Top = 294
  end
  inherited FormStorage: TFormStorage
    Left = 37
    Top = 294
  end
  inherited PrintDialog: TPrintDialog
    Left = 9
    Top = 378
  end
  inherited ShortCutControl: TShortCutControl
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
      end>
    Left = 65
    Top = 294
  end
  inherited FieldHider: TFieldHider
    Left = 65
    Top = 322
  end
  object sdqConcepto: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'Select cp_ConPago, cp_DenPago '
      'from Scp_ConPago'
      'where CP_TIPO='#39'L'#39)
    Left = 415
    Top = 241
  end
  object dsConcepto: TDataSource
    DataSet = sdqConcepto
    Left = 443
    Top = 241
  end
  object pmnuImpresion: TPopupMenu
    Left = 64
    Top = 352
    object mnuImprResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprResultadosClick
    end
    object mnuImprGastos: TMenuItem
      Caption = 'Imprimir Reporte de Gastos'
      OnClick = mnuImprGastosClick
    end
  end
end
