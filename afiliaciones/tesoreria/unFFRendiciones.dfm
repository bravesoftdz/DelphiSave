inherited frmFFRendiciones: TfrmFFRendiciones
  Left = 368
  Top = 179
  Caption = 'Rendiciones de Fondo Fijo'
  ClientHeight = 470
  ClientWidth = 792
  Constraints.MinHeight = 500
  Constraints.MinWidth = 800
  ExplicitLeft = 368
  ExplicitTop = 179
  ExplicitWidth = 800
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 95
    Visible = True
    ExplicitWidth = 792
    ExplicitHeight = 95
    DesignSize = (
      792
      95)
    object rgTipoBusq: TRadioGroup
      Left = 6
      Top = 2
      Width = 219
      Height = 45
      Caption = 'Tipo'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Gastos '
        'Siniestros')
      TabOrder = 0
    end
    object gbFechaEnvio: TGroupBox
      Left = 229
      Top = 47
      Width = 273
      Height = 45
      Caption = 'Fecha'
      TabOrder = 4
      object Label5: TLabel
        Left = 6
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label6: TLabel
        Left = 138
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFechaDesdeBusq: TDateComboBox
        Left = 42
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edFechaHastaBusq
        TabOrder = 0
      end
      object edFechaHastaBusq: TDateComboBox
        Left = 173
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edFechaDesdeBusq
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 506
      Top = 47
      Width = 280
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Sector'
      TabOrder = 5
      DesignSize = (
        280
        45)
      inline fraSectorBusq: TfraCodigoDescripcion
        Left = 6
        Top = 15
        Width = 267
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 15
        ExplicitWidth = 267
        DesignSize = (
          267
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 77
          Width = 190
          ExplicitLeft = 77
          ExplicitWidth = 190
        end
        inherited edCodigo: TPatternEdit
          Width = 72
          ExplicitWidth = 72
        end
      end
    end
    object rgCerradoBusq: TRadioGroup
      Left = 229
      Top = 2
      Width = 219
      Height = 45
      Caption = 'Cerrado'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'S'#237
        'No')
      TabOrder = 1
    end
    object rgRecibidoBusq: TRadioGroup
      Left = 452
      Top = 2
      Width = 219
      Height = 45
      Caption = 'Recibido'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'S'#237
        'No')
      TabOrder = 2
    end
    object rgAprobado: TRadioGroup
      Left = 6
      Top = 47
      Width = 219
      Height = 45
      Caption = 'Aprobado'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'S'#237
        'No')
      TabOrder = 3
    end
    object chkNoMostrarBajas: TCheckBox
      Left = 677
      Top = 31
      Width = 105
      Height = 17
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
  end
  inherited CoolBar: TCoolBar
    Top = 95
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 786
      end>
    ExplicitTop = 95
    ExplicitWidth = 792
    inherited ToolBar: TToolBar
      Width = 777
      ExplicitWidth = 777
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
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbDetalle: TToolButton
        Left = 370
        Top = 0
        Hint = 'Detalle'
        ImageIndex = 9
        OnClick = tbDetalleClick
      end
      object tbRecepcion: TToolButton
        Left = 393
        Top = 0
        Hint = 'Recepci'#243'n'
        ImageIndex = 27
        OnClick = tbRecepcionClick
      end
      object tbAprobar: TToolButton
        Left = 416
        Top = 0
        Hint = 'Aprobar'
        ImageIndex = 28
        OnClick = tbAprobarClick
      end
      object ToolButton2: TToolButton
        Left = 439
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 447
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 124
    Width = 792
    Height = 346
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 146
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CIERRE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Cierre'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_RECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recepci'#243'n'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_APROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobado'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BENEFICIARIO'
        Title.Caption = 'Beneficiario'
        Width = 235
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'METODO_PAGO'
        Title.Caption = 'M'#233'todo Pago'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMSUCURSAL'
        Title.Caption = 'Sucursal'
        Width = 200
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'IMPORTE_TOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Total'
        Width = 95
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'IMPORTE_APROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Aprobado'
        Width = 92
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
    Left = 158
    Top = 146
    Width = 491
    Height = 131
    BorderStyle = bsDialog
    ExplicitLeft = 158
    ExplicitTop = 146
    ExplicitWidth = 491
    ExplicitHeight = 131
    DesignSize = (
      491
      131)
    inherited BevelAbm: TBevel
      Top = 95
      Width = 483
      ExplicitTop = 95
      ExplicitWidth = 483
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 19
      Width = 54
      Height = 13
      AutoSize = False
      Caption = 'Fondo Fijo'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 45
      Width = 54
      Height = 13
      AutoSize = False
      Caption = 'N'#250'mero'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 71
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    inherited btnAceptar: TButton
      Left = 333
      Top = 101
      TabOrder = 3
      ExplicitLeft = 333
      ExplicitTop = 101
    end
    inherited btnCancelar: TButton
      Left = 411
      Top = 101
      TabOrder = 4
      ExplicitLeft = 411
      ExplicitTop = 101
    end
    inline fraFondoFijoAltaModif: TfraCodigoDescripcion
      Left = 66
      Top = 14
      Width = 416
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 66
      ExplicitTop = 14
      ExplicitWidth = 416
      DesignSize = (
        416
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 90
        Width = 325
        ExplicitLeft = 90
        ExplicitWidth = 325
      end
      inherited edCodigo: TPatternEdit
        Width = 85
        ExplicitWidth = 85
      end
    end
    object edNumeroAltaModif: TIntEdit
      Left = 66
      Top = 42
      Width = 85
      Height = 21
      TabOrder = 1
      MaxLength = 8
      MaxValue = 99999999
    end
    object edFechaAltaModif: TDateComboBox
      Left = 66
      Top = 69
      Width = 88
      Height = 21
      TabOrder = 2
    end
  end
  object fpAprobar: TFormPanel [4]
    Left = 185
    Top = 264
    Width = 443
    Height = 151
    Caption = 'Aprobar'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnEnter = fpAprobarEnter
    DesignSize = (
      443
      151)
    object Bevel1: TBevel
      Left = 4
      Top = 115
      Width = 435
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 219
    end
    object Label10: TLabel
      Left = 8
      Top = 15
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Forma Pago'
    end
    object Label11: TLabel
      Left = 8
      Top = 39
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Banco'
    end
    object Label12: TLabel
      Left = 8
      Top = 93
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Cheque Nombre'
    end
    object Label9: TLabel
      Left = 8
      Top = 67
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Sucursal'
    end
    object btnAceptarAprobar: TButton
      Left = 285
      Top = 121
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 4
      OnClick = btnAceptarAprobarClick
    end
    object btnCancelarAprobar: TButton
      Left = 363
      Top = 121
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
    end
    inline fraFormaPagoAltaModif: TfraCtbTablas
      Left = 91
      Top = 9
      Width = 342
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 91
      ExplicitTop = 9
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
      Top = 35
      Width = 342
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 91
      ExplicitTop = 35
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
      Left = 91
      Top = 90
      Width = 341
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      OEMConvert = True
      TabOrder = 3
    end
    inline fraSucursalAltaModif: TfraCodigoDescripcion
      Left = 91
      Top = 63
      Width = 342
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 91
      ExplicitTop = 63
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
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CASE FF_TIPO WHEN '#39'S'#39' THEN '#39'Siniestros'#39' WHEN '#39'G'#39' THEN '#39'Ga' +
        'stos'#39' END TIPO,'
      
        '       FF_DESCRIPCION DESCRIPCION, SC_DESCRIPCION SECTOR, FR_FEC' +
        'HA FECHA,'
      '       FR_NUMERO NUMERO, FR_FECHACIERRE FECHA_CIERRE,'
      
        '       FR_FECHARECEPCION FECHA_RECEPCION, FR_FECHAAPROBADO FECHA' +
        '_APROBADO,'
      '       NVL(AN_DESCRIPCION,FR_CHEQUENOMBRE) BENEFICIARIO,'
      '       TB_DESCRIPCION METODO_PAGO, '
      '       BA_NOMBRE BANCO, FR_FECHABAJA FECHA_BAJA'
      
        '  FROM OFR_RENDICION, OFF_FONDOFIJO, USC_SECTORES, CTB_TABLAS, C' +
        'AN_CHEQUEANOMBRE, ZBA_BANCO'
      ' WHERE SC_ID = FF_IDSECTOR'
      '   AND FF_ID = FR_IDFONDOFIJO'
      '   AND TB_CODIGO(+) = FR_METODOPAGO'
      '   AND TB_CLAVE(+) = '#39'COBRO'#39
      '   AND AN_ID(+) = FR_IDCHEQUENOMBRE'
      '   AND BA_ID(+) = FR_IDBANCO'
      '   AND 1 = 2')
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'PermitirFiltrarTodosSectores'
      end>
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
    Left = 110
    Top = 200
  end
end
