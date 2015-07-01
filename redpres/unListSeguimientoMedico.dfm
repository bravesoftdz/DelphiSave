inherited frmListSeguimientoMedico: TfrmListSeguimientoMedico
  Left = 632
  Top = 106
  Caption = 'Seguimiento m'#233'dico'
  ClientHeight = 517
  ClientWidth = 750
  Constraints.MinHeight = 494
  Constraints.MinWidth = 720
  ExplicitWidth = 758
  ExplicitHeight = 544
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 750
    Height = 161
    Visible = True
    ExplicitWidth = 750
    ExplicitHeight = 161
    DesignSize = (
      750
      161)
    object GroupBox3: TGroupBox
      Left = 264
      Top = 0
      Width = 202
      Height = 40
      Caption = ' Fecha de carga del siniestro'
      TabOrder = 2
      object Label8: TLabel
        Left = 95
        Top = 17
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcSinDesde: TDateComboBox
        Left = 6
        Top = 13
        Width = 88
        Height = 21
        MaxDateCombo = dcSinHasta
        TabOrder = 0
      end
      object dcSinHasta: TDateComboBox
        Left = 110
        Top = 13
        Width = 88
        Height = 21
        MinDateCombo = dcSinDesde
        TabOrder = 1
      end
    end
    object gbSiniestro: TGroupBox
      Left = 2
      Top = 0
      Width = 111
      Height = 40
      Caption = ' Siniestro '
      TabOrder = 0
      object edSiniestro: TSinEdit
        Left = 6
        Top = 15
        Width = 100
        Height = 20
        TabOrder = 0
      end
    end
    object GroupBox6: TGroupBox
      Left = 116
      Top = 0
      Width = 148
      Height = 40
      Caption = ' Estado '
      TabOrder = 1
      DesignSize = (
        148
        40)
      object cmbEstado: TComboBox
        Left = 5
        Top = 14
        Width = 139
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemIndex = 0
        TabOrder = 0
        Text = 'Todos'
        Items.Strings = (
          'Todos'
          'Siniestros a vencer'
          'Siniestros en curso normal'
          'Siniestros vencidos')
      end
    end
    object gbPrestadorCabecera: TGroupBox
      Left = 2
      Top = 79
      Width = 469
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Prestador cabecera '
      TabOrder = 5
      DesignSize = (
        469
        40)
      inline fraPrestadorCabecera: TfraPrestador
        Left = 4
        Top = 13
        Width = 460
        Height = 24
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 13
        ExplicitWidth = 460
        ExplicitHeight = 24
        DesignSize = (
          443
          24)
        inherited lbCUIT: TLabel
          Top = 5
          Width = 25
          ExplicitTop = 5
          ExplicitWidth = 25
        end
        inherited lbSec: TLabel
          Top = 5
          Width = 22
          ExplicitTop = 5
          ExplicitWidth = 22
        end
        inherited lbIdentif: TLabel
          Top = 5
          Width = 35
          ExplicitTop = 5
          ExplicitWidth = 35
        end
        inherited lbRSocial: TLabel
          Top = 5
          Width = 40
          ExplicitTop = 5
          ExplicitWidth = 40
        end
        inherited lbDomicilio: TLabel
          Width = 42
          ExplicitWidth = 42
        end
        inherited lbLocalidad: TLabel
          Width = 46
          ExplicitWidth = 46
        end
        inherited lbCPostal: TLabel
          Left = 355
          Width = 14
          ExplicitLeft = 372
          ExplicitWidth = 14
        end
        inherited lbTelefono: TLabel
          Left = 267
          ExplicitLeft = 284
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 12
          ExplicitWidth = 12
        end
        inherited mskPrestCUIT: TMaskEdit
          Top = 1
          ExplicitTop = 1
        end
        inherited cmbPrestador: TArtComboBox
          Top = 1
          Width = 97
          ExplicitTop = 1
          ExplicitWidth = 97
        end
        inherited edPresLocalidad: TEdit
          Width = 12
          ExplicitWidth = 12
        end
        inherited edPresCPostal: TEdit
          Left = 372
          ExplicitLeft = 372
        end
        inherited edPrestIdentif: TIntEdit
          Top = 1
          ExplicitTop = 1
        end
        inherited edPrestSecuencia: TIntEdit
          Left = 147
          Top = 1
          ExplicitLeft = 147
          ExplicitTop = 1
        end
        inherited edPresTelefono: TEdit
          Left = 287
          ExplicitLeft = 287
        end
      end
    end
    object gbGTrabajo: TGroupBox
      Left = 2
      Top = 40
      Width = 469
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Grupo trabajo '
      TabOrder = 3
      DesignSize = (
        469
        40)
      inline fraGrupoTrabajo: TfraGrupoTrabajo
        Left = 7
        Top = 13
        Width = 454
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 7
        ExplicitTop = 13
        ExplicitWidth = 454
        DesignSize = (
          454
          23)
        inherited lblGestor: TLabel
          Left = 283
          Width = 31
          ExplicitLeft = 283
          ExplicitWidth = 31
        end
        inherited cmbGestor: TArtComboBox
          Left = 319
          ExplicitLeft = 319
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 229
          ExplicitWidth = 229
        end
      end
    end
    object gbDelegacion: TGroupBox
      Left = 473
      Top = 40
      Width = 274
      Height = 39
      Anchors = [akTop, akRight]
      Caption = ' Delegaci'#243'n '
      TabOrder = 4
      DesignSize = (
        274
        39)
      inline fraDelegacion: TfraDelegacion
        Left = 5
        Top = 13
        Width = 266
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 13
        ExplicitWidth = 266
        DesignSize = (
          266
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 53
          Width = 211
          DataSource = nil
          ExplicitLeft = 53
          ExplicitWidth = 211
        end
        inherited edCodigo: TPatternEdit
          Width = 48
          ExplicitWidth = 48
        end
      end
    end
    object gbTipoUsuario: TGroupBox
      Left = 384
      Top = 119
      Width = 364
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Tipo de usuario '
      TabOrder = 8
      DesignSize = (
        364
        40)
      object rbMedico: TRadioButton
        Left = 5
        Top = 18
        Width = 57
        Height = 12
        Caption = 'M'#233'dico'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbMedicoClick
      end
      object rbAdministrativo: TRadioButton
        Left = 63
        Top = 17
        Width = 89
        Height = 17
        Caption = ' Administrativo'
        TabOrder = 1
        OnClick = rbAdministrativoClick
      end
      object cmbAcciones: TArtComboBox
        Left = 154
        Top = 14
        Width = 205
        Height = 21
        DirectInput = False
        Enabled = False
        GlyphKind = gkDropDown
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 1
        TabOrder = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'TA_DESCRIPCION'
            ReadOnly = True
            Title.Caption = 'Descripci'#243'n'
            Width = 150
            Visible = True
          end>
        DataSource = dsAcciones
        FieldList = 'TA_DESCRIPCION'
        FieldKey = 'TA_ID'
        ClearOnCancel = True
      end
    end
    object gbCIE10: TGroupBox
      Left = 2
      Top = 119
      Width = 379
      Height = 40
      Caption = ' CIE-10 '
      TabOrder = 7
      DesignSize = (
        379
        40)
      inline fraCIE10: TfraCodDesc
        Left = 8
        Top = 13
        Width = 367
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 13
        ExplicitWidth = 367
        DesignSize = (
          367
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 302
          ExplicitWidth = 302
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'DG_FECHABAJA'
          FieldCodigo = 'DG_CODIGO'
          FieldDesc = 'DG_DESCRIPCION'
          FieldID = 'DG_CODIGO'
          ShowBajas = True
          TableName = 'CDG_DIAGNOSTICO'
          Left = 164
          Top = 65530
        end
      end
    end
    object gbUsuarios: TGroupBox
      Left = 473
      Top = 79
      Width = 274
      Height = 40
      Anchors = [akTop, akRight]
      Caption = ' Usuarios por prestador '
      TabOrder = 6
      DesignSize = (
        274
        40)
      inline fraUsuarios: TfraCodigoDescripcion
        Left = 5
        Top = 14
        Width = 264
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 14
        ExplicitWidth = 264
        DesignSize = (
          264
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 88
          Width = 176
          ExplicitLeft = 88
          ExplicitWidth = 176
        end
        inherited edCodigo: TPatternEdit
          Width = 84
          ExplicitWidth = 84
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 467
      Top = 0
      Width = 202
      Height = 40
      Caption = ' Fecha acci'#243'n realizada'
      TabOrder = 9
      object Label2: TLabel
        Left = 95
        Top = 17
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcFRealiDesde: TDateComboBox
        Left = 6
        Top = 13
        Width = 86
        Height = 21
        MaxDateCombo = dcFRealiHasta
        TabOrder = 0
      end
      object dcFRealiHasta: TDateComboBox
        Left = 110
        Top = 13
        Width = 88
        Height = 21
        MinDateCombo = dcFRealiDesde
        TabOrder = 1
      end
    end
    object gbAccion: TGroupBox
      Left = 672
      Top = 0
      Width = 76
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Acciones'
      TabOrder = 10
      DesignSize = (
        76
        40)
      object cmbAccion: TComboBox
        Left = 5
        Top = 14
        Width = 67
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemIndex = 0
        TabOrder = 0
        Text = 'Todas'
        Items.Strings = (
          'Todas'
          'Realizadas'
          'No Realizadas'
          'De Baja')
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 161
    Width = 750
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 744
      end>
    ExplicitTop = 161
    ExplicitWidth = 750
    inherited ToolBar: TToolBar
      Width = 737
      ExplicitWidth = 737
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbAccionesSol: TToolButton
        Left = 370
        Top = 0
        Hint = 'Acciones Solicitadas'
        ImageIndex = 28
        OnClick = tbAccionesSolClick
      end
      object tbVerObservaciones: TToolButton
        Left = 393
        Top = 0
        Hint = 'Ver Observaciones del m'#233'dico'
        Caption = 'tbVerObservaciones'
        ImageIndex = 14
        OnClick = tbVerObservacionesClick
      end
      object tbAccionRealizada: TToolButton
        Left = 416
        Top = 0
        Hint = 'Acci'#243'n Realizada'
        ImageIndex = 27
        Style = tbsCheck
        OnClick = tbAccionRealizadaClick
      end
      object ToolButton1: TToolButton
        Left = 439
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 28
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 447
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 190
    Width = 750
    Height = 327
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Accid./Rec.'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIL'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_TELEFONO'
        Title.Alignment = taCenter
        Title.Caption = 'Tel. prestador'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SA_CIE10INICIAL'
        Title.Alignment = taCenter
        Title.Caption = 'CIE-10 Inicial'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PV_NROPARTE'
        Title.Alignment = taCenter
        Title.Caption = 'Ult. Evol.'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_OBSERVACIONES'
        Title.Caption = 'Observaciones ultimo evolutivo'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_DIAGNOSTICOOMS'
        Title.Alignment = taCenter
        Title.Caption = 'CIE-10'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DIAGNOSTICO'
        Title.Caption = 'Descripci'#243'n CIE-10'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'GRAVEDAD'
        Title.Caption = 'Gravedad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCINCA'
        Title.Alignment = taCenter
        Title.Caption = '% Estim.'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAESTIM'
        Title.Alignment = taCenter
        Title.Caption = 'F.Estimaci'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTRABAJO'
        Title.Caption = 'Grupo trabajo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_CANTFKT'
        Title.Alignment = taCenter
        Title.Caption = 'Cant. FKT'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SA_CIRUGIA'
        Title.Alignment = taCenter
        Title.Caption = 'Cirug'#237'a'
        Width = 42
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AS_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Acci'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AS_FECHAREALIZADA'
        Title.Caption = 'F. Realizada'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AS_USUREALIZADA'
        Title.Caption = 'Usuario Acc. Realizada'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCACCION'
        Title.Caption = 'Acci'#243'n y Observaciones'
        Width = 500
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_DESCRIPCION'
        Title.Caption = 'Motivo Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AS_OBSERVADMINISTRATIVO'
        Title.Caption = 'Observaciones Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AS_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AS_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 212
    Width = 583
    Height = 245
    OnBeforeShow = fpAbmBeforeShow
    Constraints.MinHeight = 205
    Constraints.MinWidth = 450
    ExplicitLeft = 120
    ExplicitTop = 212
    ExplicitWidth = 583
    ExplicitHeight = 245
    DesignSize = (
      583
      245)
    inherited BevelAbm: TBevel
      Top = 211
      Width = 575
      ExplicitTop = 211
      ExplicitWidth = 575
    end
    object Label3: TLabel [1]
      Left = 8
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Siniestro:'
    end
    object Bevel1: TBevel [2]
      Left = 4
      Top = 39
      Width = 575
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label4: TLabel [3]
      Left = 168
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Trabajador:'
    end
    inherited btnAceptar: TButton
      Left = 425
      Top = 217
      Height = 24
      ExplicitLeft = 425
      ExplicitTop = 217
      ExplicitHeight = 24
    end
    inherited btnCancelar: TButton
      Left = 503
      Top = 217
      Height = 24
      ExplicitLeft = 503
      ExplicitTop = 217
      ExplicitHeight = 24
    end
    object rgOpciones: TRadioGroup
      Left = 6
      Top = 31
      Width = 225
      Height = 177
      Anchors = [akLeft, akTop, akBottom]
      Caption = ' Seleccione la acci'#243'n a tomar '
      TabOrder = 2
      OnClick = rgOpcionesClick
    end
    object gbTexto: TGroupBox
      Left = 235
      Top = 31
      Width = 342
      Height = 177
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Texto '
      TabOrder = 3
      DesignSize = (
        342
        177)
      object edTextoTabla: TEdit
        Left = 5
        Top = 16
        Width = 331
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object edTexto: TMemo
        Left = 5
        Top = 40
        Width = 331
        Height = 130
        Anchors = [akLeft, akTop, akRight, akBottom]
        MaxLength = 450
        TabOrder = 1
      end
    end
    object edSiniestroABM: TSinEdit
      Left = 57
      Top = 4
      Width = 104
      Height = 21
      TabOrder = 4
      ReadOnly = True
      Color = clBtnFace
    end
    object edTrabajadorABM: TEdit
      Left = 227
      Top = 4
      Width = 348
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
  end
  object fpVerObservaciones: TFormPanel [4]
    Left = 372
    Top = 320
    Width = 349
    Height = 161
    Caption = 'Observaciones del m'#233'dico'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnBeforeShow = fpVerObservacionesBeforeShow
    Constraints.MinHeight = 150
    Constraints.MinWidth = 200
    DesignSize = (
      349
      161)
    object Bevel2: TBevel
      Left = 4
      Top = 127
      Width = 341
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Siniestro:'
    end
    object btnCerrar: TButton
      Left = 269
      Top = 133
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCerrarClick
    end
    object edVerSiniestro: TSinEdit
      Left = 57
      Top = 4
      Width = 104
      Height = 21
      TabOrder = 1
      ReadOnly = True
      Color = clBtnFace
    end
    object MemoVerObservParte: TMemo
      Left = 5
      Top = 31
      Width = 340
      Height = 94
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 450
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
  object fpBajaSeguimiento: TFormPanel [5]
    Left = 84
    Top = 288
    Width = 389
    Height = 161
    Caption = 'Observaciones del administrativo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnBeforeShow = fpVerObservacionesBeforeShow
    Constraints.MinHeight = 150
    Constraints.MinWidth = 200
    DesignSize = (
      389
      161)
    object Bevel3: TBevel
      Left = 4
      Top = 127
      Width = 381
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lblMotivo: TLabel
      Left = 9
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object btnMotivoBajaCancelar: TButton
      Left = 309
      Top = 133
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    object mObservaciones: TMemo
      Left = 5
      Top = 31
      Width = 380
      Height = 94
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 500
      ScrollBars = ssVertical
      TabOrder = 1
    end
    inline fraMotivos: TfraCodigoDescripcion
      Left = 52
      Top = 4
      Width = 334
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 52
      ExplicitTop = 4
      ExplicitWidth = 334
      DesignSize = (
        334
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 281
        ExplicitLeft = 52
        ExplicitWidth = 281
      end
      inherited edCodigo: TPatternEdit
        Left = 4
        Width = 44
        ExplicitLeft = 4
        ExplicitWidth = 44
      end
    end
    object btnMotivoBajaAceptar: TButton
      Left = 224
      Top = 133
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = btnMotivoBajaAceptarClick
    end
    object BitBtn1: TBitBtn
      Left = 68
      Top = 136
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 4
    end
  end
  object fpAccSolicitadas: TFormPanel [6]
    Left = 120
    Top = 471
    Width = 453
    Height = 250
    Caption = 'Detalle de acciones solicitadas'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnShow = fpAccSolicitadasShow
    Constraints.MinHeight = 150
    Constraints.MinWidth = 200
    DesignSize = (
      453
      250)
    object Bevel4: TBevel
      Left = 4
      Top = 216
      Width = 445
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Button1: TButton
      Left = 373
      Top = 222
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 1
    end
    object Button2: TButton
      Left = 288
      Top = 222
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Aceptar'
      TabOrder = 0
      Visible = False
    end
    object DBGrid1: TDBGrid
      Left = 11
      Top = 44
      Width = 433
      Height = 161
      DataSource = dsAccSolicitadas
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ta_descripcion'
          Title.Caption = 'Acci'#243'n'
          Width = 265
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AS_FECHAALTA'
          Title.Caption = 'F. Acci'#243'n'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AS_FECHAREALIZADA'
          Title.Caption = 'F. Realizada'
          Width = 65
          Visible = True
        end>
    end
    object GroupBox1: TGroupBox
      Left = 11
      Top = 4
      Width = 433
      Height = 40
      Caption = ' Siniestro '
      TabOrder = 3
      object seAccionesSeg: TSinEdit
        Left = 6
        Top = 14
        Width = 100
        Height = 21
        TabOrder = 0
        OnSelect = seAccionesSegSelect
      end
      object edNombreTraba: TEdit
        Left = 136
        Top = 14
        Width = 290
        Height = 21
        TabOrder = 1
      end
      object btnBuscar: TButton
        Left = 110
        Top = 14
        Width = 21
        Height = 20
        Hint = 'Buscar'
        Caption = ' . . . '
        TabOrder = 2
        OnClick = btnBuscarClick
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    OnCalcFields = sdqConsultaCalcFields
    SQL.Strings = (
      'SELECT ex_id,'
      
        '       utiles.armar_siniestro (ex_siniestro, ex_orden, ex_recaid' +
        'a) siniestro,'
      '       NVL (ex_fecharecaida, ex_fechaaccidente) fecha,'
      
        '       utiles.armar_cuit (ex_cuit) cuit, utiles.armar_cuit (ex_c' +
        'uil) cuil,'
      
        '       tj_nombre, ex_bajamedica, ex_diagnostico, ex_diagnosticoo' +
        'ms,'
      
        '       dg_descripcion diagnostico, ex_fechaalta, tc_descripcion ' +
        'gravedad,'
      '       varios.get_nombredelegacion (ex_delegacion) delegacion,'
      '       amebpba.get_nombregtrabajo (ex_gtrabajo) gtrabajo,'
      
        '       siniestro.get_usuariogestor (ex_id) usugestor, ca_identif' +
        'icador,'
      
        '       ca_descripcion, ca_codarea || '#39' '#39' || ca_telefono ca_telef' +
        'ono, pv_nroparte, pv_observaciones,'
      
        '       sa_ultimaestimacion, sa_cie10inicial, dg_id, tc_id, ex_si' +
        'niestro,'
      
        '       ex_orden, ex_recaida, sa_cantfkt, sa_cirugia, ex_delegaci' +
        'on, as_idmotivobaja, as_fechabaja,'
      
        '       as_usubaja, ms_descripcion, as_fechaalta, as_fecharealiza' +
        'da, as_usurealizada, as_id,'
      
        '       ta_descripcion || '#39': '#39' || as_observmedico descaccion, as_' +
        'observmedico, as_observadministrativo'
      '  FROM cdg_diagnostico,'
      '       ctj_trabajador,'
      '       sex_expedientes,'
      '       ssa_siniestrossinalta,'
      '       cpr_prestador,'
      '       SIN.stc_tipogravedad_cie10,'
      '       spv_parteevolutivo,'
      '       sin.sas_accionesseguimiento,'
      '       sin.sta_tipoaccionseguim,'
      '       sin.sms_motivosbajaseguimiento'
      ' WHERE sa_idexpediente = ex_id'
      '   AND ex_cuil = tj_cuil'
      '   AND ex_gravedadcie10 = tc_codigo(+)'
      '   AND ex_diagnosticooms = dg_codigo(+)'
      '   AND ex_prestador = ca_identificador(+)'
      '   AND sa_idexpediente = pv_idexpediente(+)'
      '   AND sa_ultimoevo = pv_nroparte(+)'
      
        '   AND (sa_fechaultcit IS NULL OR sa_fechaultcit < art.actualdat' +
        'e)'
      
        '   AND (sa_fechasolaudi IS NULL OR sa_fechasolaudi < art.actuald' +
        'ate - 7)'
      '   AND ex_fechaalta >= TO_DATE ('#39'01/04/2008'#39', '#39'DD/MM/YYYY'#39')'
      '   AND ex_fechaalta <= TO_DATE ('#39'01/05/2008'#39', '#39'DD/MM/YYYY'#39')'
      '   AND NOT EXISTS ('
      '          SELECT 1'
      '            FROM SIN.sas_accionesseguimiento'
      '           WHERE as_idexpediente = ex_id'
      '             AND as_fechabaja IS NULL'
      '             AND as_fechaalta > (actualdate - 7))'
      '   AND as_idexpediente = ex_id'
      '   AND as_idaccion = ta_id'
      '   AND as_idmotivobaja=ms_id(+)')
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'TJ_NOMBRE'
        Title = 'Trabajador'
      end
      item
        DataField = 'CA_DESCRIPCION'
        Title = 'Prestador'
      end
      item
        DataField = 'CA_TELEFONO'
        Title = 'Tel. Presta.'
      end
      item
        DataField = 'PV_NROPARTE'
        Title = 'Ult. Evol.'
      end
      item
        DataField = 'PV_OBSERVACIONES'
        Title = 'Observ. Ult. Evol.'
      end
      item
        DataField = 'DESCACCION'
        Title = 'Acci'#243'n y observaciones'
      end
      item
        DataField = 'GRAVEDAD'
        Title = 'Gravedad'
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'SINIESTRO'
        DataField = 'SINIESTRO'
        Width = 220
        MaxLength = 0
      end
      item
        Title = 'FECHA'
        DataField = 'FECHA'
        Width = 160
        MaxLength = 0
      end
      item
        Title = 'TRABAJADOR'
        DataField = 'TJ_NOMBRE'
        Width = 550
        MaxLength = 0
      end
      item
        Title = 'PRESTADOR'
        DataField = 'CA_DESCRIPCION'
        Width = 550
        MaxLength = 0
      end
      item
        Title = 'TEL. PRESTA.'
        DataField = 'CA_TELEFONO'
        Width = 550
        MaxLength = 0
      end
      item
        Title = 'ULT. EVOL.'
        DataField = 'PV_NROPARTE'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'OBSERVACIONES ULT. EVOL.'
        DataField = 'PV_OBSERVACIONES'
        Visible = False
        Width = 700
        MaxLength = 0
      end
      item
        Title = 'ACCION Y OBSERVACIONES'
        DataField = 'DESCACCION'
        Width = 1450
        MaxLength = 0
      end
      item
        Title = 'GRAVEDAD'
        DataField = 'GRAVEDAD'
        Width = 150
        MaxLength = 0
      end>
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  inherited FormStorage: TFormStorage
    Top = 204
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
        LinkControl = tbSalir2
      end>
  end
  object sdqAcciones: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT ta_id, ta_descripcion'
      '   FROM sin.sta_tipoaccionseguim'
      'WHERE ta_fechabaja IS NULL')
    Left = 614
    Top = 128
  end
  object dsAcciones: TDataSource
    DataSet = sdqAcciones
    Left = 588
    Top = 128
  end
  object dsAccSolicitadas: TDataSource
    DataSet = sdqAccionesSolicitadas
    Left = 500
    Top = 539
  end
  object sdqAccionesSolicitadas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'select ta_descripcion, as_fechaalta, as_fecharealizada'
      'from sin.sas_accionesseguimiento, sin.sta_tipoaccionseguim'
      'where AS_IDEXPEDIENTE = :idexp'
      'and as_idaccion = ta_id'
      'order by as_fechaalta, as_fecharealizada')
    Left = 464
    Top = 535
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idexp'
        ParamType = ptInput
      end>
  end
end
