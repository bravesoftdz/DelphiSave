inherited frmCartaRechPr: TfrmCartaRechPr
  Left = 277
  Top = 109
  Width = 714
  Height = 504
  Caption = 'Cartas de rechazo al prestador'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 714
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid [0]
    Top = 199
    Width = 706
    Height = 275
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEN'
        Title.Caption = 'Orden'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECAIDA'
        Title.Caption = 'Recaida'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODULO'
        Title.Caption = 'M'#243'dulo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACCION'
        Title.Caption = 'Acci'#243'n'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_RECHAZO'
        Title.Caption = 'F. Rechazo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_SUSPENSI'#211'N'
        Title.Caption = 'F. Suspensi'#243'n'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_IMPRESION'
        Title.Caption = 'F. Impresi'#243'n'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'G_TRABAJO'
        Title.Caption = 'G. Trabajo'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Deleg.'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOSALIDADESCR'
        Title.Caption = 'Tipo de Salida'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REGSANITPREST'
        Title.Caption = 'Region Sanit. Prest.'
        Width = 180
        Visible = True
      end>
  end
  inherited pnlFiltros: TPanel [1]
    Width = 706
    Height = 170
    DesignSize = (
      706
      170)
    object pnlGTrabajo: TCheckPanel
      Left = 0
      Top = 128
      Width = 437
      Height = 42
      Caption = '&Grupo de trabajo '
      TabOrder = 6
      Checked = False
      OnChange = pnlGTrabajoChange
      AutoFocus = False
      inline fraGrupoTrabajo: TfraGrupoTrabajo
        Left = 7
        Top = 15
        Width = 424
        Height = 23
        TabOrder = 0
        DesignSize = (
          424
          23)
        inherited lblGestor: TLabel
          Left = 253
          Width = 32
        end
        inherited cmbGestor: TArtComboBox
          Left = 289
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 199
        end
      end
    end
    object pnlDelegacion: TCheckPanel
      Left = 440
      Top = 128
      Width = 265
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Delegaci'#243'n '
      TabOrder = 7
      Checked = False
      OnChange = pnlDelegacionChange
      AutoFocus = False
      DesignSize = (
        265
        42)
      inline fraDelegacion: TfraDelegacion
        Left = 6
        Top = 15
        Width = 254
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 48
          Width = 205
        end
        inherited edCodigo: TPatternEdit
          Width = 44
        end
      end
    end
    object pnlSiniestro: TCheckPanel
      Left = 1
      Top = 2
      Width = 151
      Height = 42
      Caption = '&Siniestro '
      TabOrder = 0
      TabStop = True
      Checked = False
      OnChange = pnlSiniestroChange
      object Label1: TLabel
        Left = 68
        Top = 20
        Width = 15
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edSiniDesde: TIntEdit
        Left = 4
        Top = 16
        Width = 63
        Height = 21
        TabOrder = 0
        MaxLength = 8
      end
      object edSiniHasta: TIntEdit
        Left = 83
        Top = 16
        Width = 63
        Height = 21
        TabOrder = 1
        MaxLength = 8
      end
    end
    object pnlPrestador: TCheckPanel
      Left = 153
      Top = 46
      Width = 552
      Height = 81
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Prestador '
      TabOrder = 5
      TabStop = True
      Checked = False
      OnChange = pnlPrestadorChange
      DesignSize = (
        552
        81)
      inline fraPrestador: TfraPrestador
        Left = 4
        Top = 22
        Width = 544
        Height = 54
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCUIT: TLabel
          Width = 24
        end
        inherited lbSec: TLabel
          Width = 21
        end
        inherited lbIdentif: TLabel
          Width = 40
        end
        inherited lbRSocial: TLabel
          Width = 38
        end
        inherited lbDomicilio: TLabel
          Width = 40
        end
        inherited lbLocalidad: TLabel
          Width = 44
        end
        inherited lbCPostal: TLabel
          Left = 472
          Width = 13
        end
        inherited lbTelefono: TLabel
          Left = 384
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 89
        end
        inherited cmbPrestador: TArtComboBox
          Width = 214
        end
        inherited edPresLocalidad: TEdit
          Width = 118
        end
        inherited edPresCPostal: TEdit
          Left = 489
        end
        inherited edPresTelefono: TEdit
          Left = 404
        end
      end
    end
    object pnlFechaRechazo: TCheckPanel
      Left = 154
      Top = 2
      Width = 204
      Height = 42
      Caption = '&Fecha de rechazo'
      TabOrder = 1
      TabStop = True
      Checked = False
      OnChange = pnlFechaRechazoChange
      object Label2: TLabel
        Left = 95
        Top = 20
        Width = 15
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edFechaDesde: TDateComboBox
        Left = 7
        Top = 16
        Width = 88
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = edFechaHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object edFechaHasta: TDateComboBox
        Left = 110
        Top = 16
        Width = 89
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = edFechaDesde
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object pnlEstado: TCheckPanel
      Left = 2
      Top = 87
      Width = 148
      Height = 40
      Caption = 'Estado'
      TabOrder = 4
      TabStop = True
      Checked = False
      OnChange = pnlEstadoChange
      DesignSize = (
        148
        40)
      object cmbEstado: TComboBox
        Left = 6
        Top = 15
        Width = 138
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Pend. de impresi'#243'n'
          'Enviadas'
          'Suspendidas'
          'Todas')
      end
    end
    object pnlAccion: TCheckPanel
      Left = 1
      Top = 46
      Width = 150
      Height = 40
      Caption = 'Acci'#243'n'
      TabOrder = 3
      TabStop = True
      Checked = False
      OnChange = pnlAccionChange
      DesignSize = (
        150
        40)
      object cmbAccion: TComboBox
        Left = 4
        Top = 15
        Width = 142
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'R - Rechazo'
          'C - Reversi'#243'n'
          'A - Acept/Rech.'
          'T - Todos')
      end
    end
    object chkRegionSanitPrest: TCheckPanel
      Left = 360
      Top = 1
      Width = 344
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Region Sanitaria Prestador'
      TabOrder = 2
      Checked = False
      OnChange = chkRegionSanitPrestChange
      DesignSize = (
        344
        43)
      inline fraRegionSanitaria: TfraCtbTablas
        Left = 6
        Top = 16
        Width = 334
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          334
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 30
          Width = 303
          DataSource = nil
        end
        inherited edCodigo: TPatternEdit
          Width = 28
        end
      end
    end
  end
  inherited CoolBar: TCoolBar [2]
    Top = 170
    Width = 706
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 702
      end>
    inherited ToolBar: TToolBar
      Width = 689
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 4
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 23
      end
      inherited tbModificar: TToolButton
        ImageIndex = 24
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 25
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 15
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 3
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 5
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 15
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = MnuPrint
        ImageIndex = 7
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 254
        ImageIndex = 1
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ImageIndex = 17
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        ImageIndex = 19
      end
      inherited ToolButton11: TToolButton
        Left = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        ImageIndex = 8
      end
    end
  end
  object FPBaja: TFormPanel [3]
    Left = 72
    Top = 262
    Width = 536
    Height = 213
    Caption = 'Baja de Carta de Rechazo para el Prestador'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    object Label9: TLabel
      Left = 8
      Top = 38
      Width = 75
      Height = 13
      Caption = 'Observaciones:'
    end
    object Label10: TLabel
      Left = 8
      Top = 12
      Width = 279
      Height = 13
      Caption = #191'Confirma que desea dar de baja el registro seleccionado?'
    end
    object Observac: TMemo
      Left = 9
      Top = 51
      Width = 520
      Height = 120
      TabOrder = 0
    end
    object btnSiBaja: TButton
      Left = 179
      Top = 179
      Width = 75
      Height = 25
      Caption = '&Si'
      ModalResult = 1
      TabOrder = 1
      OnClick = btnSiBajaClick
    end
    object btnNoBaja: TButton
      Left = 263
      Top = 179
      Width = 72
      Height = 25
      Caption = '&No'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object fpWait: TFormPanel [4]
    Left = 312
    Top = 224
    Width = 293
    Height = 81
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poScreenCenter
    object lbProcesando: TLabel
      Left = 14
      Top = 14
      Width = 118
      Height = 13
      Caption = 'Procesando Prestador...'
    end
    object edPrestador: TEdit
      Left = 20
      Top = 40
      Width = 249
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
  end
  object fpEmisionCarta: TFormPanel [5]
    Left = 112
    Top = 256
    Width = 536
    Height = 227
    Caption = 'Emisi'#243'n de Carta de Rechazo para el prestador'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      536
      227)
    object LblTitulo: TLabel
      Left = 8
      Top = 5
      Width = 519
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 48
      Top = 78
      Width = 49
      Height = 13
      Caption = 'Contenido'
    end
    object Label6: TLabel
      Left = 55
      Top = 55
      Width = 42
      Height = 13
      Caption = 'Firmante'
    end
    object Label7: TLabel
      Left = 12
      Top = 32
      Width = 82
      Height = 13
      Caption = 'E-mail de Destino'
    end
    object TxtCarta: TMemo
      Left = 99
      Top = 75
      Width = 433
      Height = 120
      Lines.Strings = (
        'TxtCarta')
      TabOrder = 2
    end
    object btnImprimir: TButton
      Left = 187
      Top = 199
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 3
      OnClick = btnImprimirClick
    end
    object btnEnviarMail: TButton
      Left = 265
      Top = 199
      Width = 82
      Height = 25
      Caption = '&Enviar por Mail'
      TabOrder = 4
      OnClick = btnEnviarMailClick
    end
    object btnEnviarFax: TButton
      Left = 351
      Top = 199
      Width = 82
      Height = 25
      Caption = '&Enviar por FAX'
      TabOrder = 5
      Visible = False
      OnClick = btnEnviarFaxClick
    end
    object TxtEmail: TEdit
      Left = 99
      Top = 29
      Width = 432
      Height = 21
      TabOrder = 0
    end
    inline fraFirmantes: TfraFirmantes
      Left = 99
      Top = 52
      Width = 433
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        433
        21)
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 381
      end
      inherited edCodigo: TIntEdit
        Width = 49
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'Select cp_siniestro Siniestro,cp_orden Orden, cp_recaida recaida' +
        ', DECODE(cp_origen,'#39'C'#39','#39'Cierre Multiple'#39','#39'S'#39','#39'Siniestros'#39', '#39'M'#39','#39 +
        'M'#233'dica'#39') Modulo,DECODE(cp_accion,'#39'R'#39','#39'Rechazo'#39','#39'A'#39','#39'Acep/Rech'#39','#39 +
        'C'#39','#39'Reversi'#243'n Rechazo'#39') Accion,cp_fechaalta F_Rechazo,ca_descrip' +
        'cion Prestador,cp_fechabaja F_Suspensi'#243'n, cp_fechaimpresion F_Im' +
        'presion, cp_observaciones Observaciones,art.amebpba.get_nombregt' +
        'rabajo(ex_gtrabajo) G_Trabajo,art.amebpba.get_nombredelegacion(e' +
        'x_siniestro,ex_orden,ex_recaida) , siniestro.get_usuariogestor(e' +
        'x_id) USUGESTOR'
      
        'from art.sex_expedientes,art.ctj_trabajadores, art.cpr_prestador' +
        ', art.cmp_empresas, art.mcp_cartarechazoprestador '
      'where ex_siniestro=cp_siniestro '
      'and ex_orden=cp_orden '
      'and ex_recaida=cp_recaida '
      'and ca_identificador=cp_prestador '
      'and ex_cuil=tj_cuil '
      'and ex_cuit=mp_cuit')
    Left = 9
    Top = 304
  end
  inherited dsConsulta: TDataSource
    Left = 37
    Top = 304
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'Orden'
        DataField = 'ORDEN'
        FieldIndex = 0
      end
      item
        Title = 'Recaida'
        DataField = 'RECAIDA'
        FieldIndex = 0
      end
      item
        Title = 'M'#243'dulo'
        DataField = 'MODULO'
        FieldIndex = 0
      end
      item
        Title = 'Acci'#243'n'
        DataField = 'ACCION'
        FieldIndex = 0
      end
      item
        Title = 'F. Rechazo'
        DataField = 'F_RECHAZO'
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'PRESTADOR'
        FieldIndex = 0
      end
      item
        Title = 'F. Suspensi'#243'n'
        DataField = 'F_SUSPENSI'#211'N'
        FieldIndex = 0
      end
      item
        Title = 'F. Impresi'#243'n'
        DataField = 'F_IMPRESION'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'OBSERVACIONES'
        FieldIndex = 0
      end
      item
        Title = 'G. Trabajo'
        DataField = 'G_TRABAJO'
        FieldIndex = 0
      end
      item
        Title = 'Usuario Gestor'
        DataField = 'USUGESTOR'
        FieldIndex = 0
      end
      item
        Title = 'Deleg.'
        DataField = 'ART.AMEBPBA.GET_NOMBREDELEGACION(EX_SINIESTRO,EX_O'
        FieldIndex = 0
      end
      item
        Title = 'Tipo de Salida'
        DataField = 'TIPOSALIDADESCR'
        FieldIndex = 0
      end>
    Left = 9
    Top = 332
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'ORDEN'
        Title = 'Orden'
      end
      item
        DataField = 'RECAIDA'
        Title = 'Recaida'
      end
      item
        DataField = 'MODULO'
        Title = 'M'#243'dulo'
      end
      item
        DataField = 'ACCION'
        Title = 'Acci'#243'n'
      end
      item
        DataField = 'F_RECHAZO'
        Title = 'F. Rechazo'
      end
      item
        DataField = 'PRESTADOR'
        Title = 'Prestador'
      end
      item
        DataField = 'F_SUSPENSI'#211'N'
        Title = 'F. Suspensi'#243'n'
      end
      item
        DataField = 'F_IMPRESION'
        Title = 'F. Impresi'#243'n'
      end
      item
        DataField = 'OBSERVACIONES'
        Title = 'Observaciones'
      end
      item
        DataField = 'G_TRABAJO'
        Title = 'G. Trabajo'
      end
      item
        DataField = 'USUGESTOR'
        Title = 'Usuario Gestor'
      end
      item
        DataField = 'DELEGACION'
        Title = 'Deleg.'
      end
      item
        DataField = 'TIPOSALIDADESCR'
        Title = 'Tipo de Salida'
      end
      item
        DataField = 'REGSANITPREST'
        Title = 'Region Sanit.Prest.'
      end>
    Left = 37
    Top = 332
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        Alignment = taRightJustify
        Width = 400
        MaxLength = 0
      end
      item
        Title = 'Orden'
        DataField = 'ORDEN'
        Alignment = taRightJustify
        Width = 350
        MaxLength = 0
      end
      item
        Title = 'recaida'
        DataField = 'RECAIDA'
        Alignment = taRightJustify
        Width = 350
        MaxLength = 0
      end
      item
        Title = 'M'#243'dulo'
        DataField = 'MODULO'
        Width = 350
        MaxLength = 0
      end
      item
        Title = 'Acci'#243'n'
        DataField = 'ACCION'
        Width = 450
        MaxLength = 0
      end
      item
        Title = 'F. Rechazo'
        DataField = 'F_RECHAZO'
        Width = 450
        MaxLength = 0
      end
      item
        Title = 'Prestador'
        DataField = 'PRESTADOR'
        Width = 750
        MaxLength = 0
      end
      item
        Title = 'F. Suspensi'#243'n'
        DataField = 'F_SUSPENSI'#211'N'
        Width = 450
        MaxLength = 0
      end
      item
        Title = 'F. Impresi'#243'n'
        DataField = 'F_IMPRESION'
        Width = 450
        MaxLength = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'OBSERVACIONES'
        Width = 1200
        MaxLength = 0
      end
      item
        Title = 'G. Trabajo'
        DataField = 'G_TRABAJO'
        Width = 500
        MaxLength = 0
      end
      item
        Title = 'Usuario Gestor'
        DataField = 'USUGESTOR'
        Width = 500
        MaxLength = 0
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'DELEGACION'
        Width = 1000
        MaxLength = 0
      end
      item
        Title = 'Tipo de Salida'
        DataField = 'TIPOSALIDADESCR'
        Width = 600
        MaxLength = 0
      end
      item
        Title = 'Reg.Sanit.Prest'
        DataField = 'REGSANITPREST'
        MaxLength = 0
      end>
    DataSource = nil
    Headers.Color = 11184810
    Totals.Color = 14079702
    SubTotals.Color = 12961221
    PageOrientation = pxLandscape
    PageSize = psLegal
    Margins.Left = 10
    Margins.Right = 10
    Left = 37
    Top = 360
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 8
    Top = 276
  end
  inherited FormStorage: TFormStorage
    Left = 37
    Top = 276
  end
  inherited PrintDialog: TPrintDialog
    Left = 9
    Top = 360
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
    Left = 65
    Top = 276
  end
  inherited FieldHider: TFieldHider
    Left = 65
    Top = 304
  end
  object MnuPrint: TPopupMenu
    Left = 65
    Top = 332
    object mnuImprimirCartaSel: TMenuItem
      Caption = 'Imprimir &carta del reg. seleccionado'
      OnClick = mnuImprimirCartaSelClick
    end
    object ImprimirCartaTodosRegistrosGrupo: TMenuItem
      Caption = 'Imprimir carta del &grupo del reg. seleccionado'
      OnClick = mnuImprimirCartaSelClick
    end
    object mnuImprimirCartaTodosRegistros: TMenuItem
      Caption = 'Imprimir carta de todos los registros'
      OnClick = mnuImprimirCartaSelClick
    end
    object mnuImprimirgrilla: TMenuItem
      Caption = '&Imprimir grilla'
      OnClick = mnuImprimirgrillaClick
    end
  end
  object ShortCutControlHijo: TShortCutControl
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
    Left = 68
    Top = 276
  end
end
