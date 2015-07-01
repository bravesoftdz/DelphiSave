inherited frmTraspasos: TfrmTraspasos
  Left = 657
  Top = 198
  Caption = 'Traspasos Ingresos'
  ClientHeight = 506
  ClientWidth = 819
  Constraints.MinHeight = 480
  Constraints.MinWidth = 740
  OldCreateOrder = True
  OnShow = FSFormShow
  ExplicitWidth = 827
  ExplicitHeight = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid [0]
    Top = 442
    Width = 819
    Height = 64
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OnDrawColumnCell = GridDrawColumnCell
    MultiSelect = True
    OnContextPopup = GridContextPopup
    Columns = <
      item
        Expanded = False
        FieldName = 'FO_FORMULARIO'
        Title.Caption = 'Nro de Formulario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_NROINTERNO'
        Title.Caption = 'Nro. Interno'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_CUIT'
        Title.Caption = 'Cuit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_FECHAAFILIACION'
        Title.Caption = 'F. Afiliaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ART_ANTERIOR'
        Title.Caption = 'ART Anterior'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_ALICUOTAPESOS'
        Title.Caption = 'Suma Fija'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_ALICUOTAPORC'
        Title.Caption = 'Porc.Masa'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_MASATOTAL'
        Title.Caption = 'Total'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_TOTEMPLEADOS'
        Title.Caption = 'Tot.Empleados'
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'en_codbanco'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cod. Entidad'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENTIDAD'
        Title.Caption = 'Entidad'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_VENDEDOR'
        Title.Caption = 'Cod. Vendedor'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDEDOR'
        Title.Caption = 'Vendedor'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOLO_LECTURA'
        Title.Caption = 'S'#243'lo lectura'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_FECHA'
        Title.Caption = 'Fecha evento'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_CODIGO'
        Title.Caption = 'C'#243'd. evento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EVENTO'
        Title.Caption = 'Evento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_DEUDA'
        Title.Caption = 'Deuda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_NROCARTADOC'
        Title.Caption = 'Nro. Carta Doc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_NOMBRE'
        Title.Caption = 'Tipo de Carta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CORREO'
        Title.Caption = 'Correo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_RECEPCIONOK'
        Title.Caption = 'Recepci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHARECEPCION'
        Title.Caption = 'F. Recepci'#243'n'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_RECEPCION'
        Title.Caption = 'Tipo Recepci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_OBSERVACIONES'
        Title.Caption = 'Obs. Carta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UIMPRESION'
        Title.Caption = 'U. Impresi'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIMPRESION'
        Title.Caption = 'F. Impresi'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGOCANAL'
        Title.Caption = 'C'#243'digo Canal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANAL'
        Title.Caption = 'Canal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_calle_post'
        Title.Caption = 'Calle Postal'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_numero_post'
        Title.Caption = 'N'#186' Postal'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_piso_post'
        Title.Caption = 'Piso Postal'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_departamento_post'
        Title.Caption = 'Departamento Postal'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_cpostal_post'
        Title.Caption = 'C.P. Postal'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_cpostala_post'
        Title.Caption = 'C.P.A. Postal'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_localidad_post'
        Title.Caption = 'Localidad Postal'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pv_descripcion'
        Title.Caption = 'Provincia Postal'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'el_nombre'
        Title.Caption = 'Delegaci'#243'n'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'su_descripcion'
        Title.Caption = 'Sucursal'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'orsol'
        Title.Caption = 'Origen Solicitud'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'faltarenglon'
        Title.Caption = 'Doc. Faltante'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_USUREVISION'
        Title.Caption = 'Usuario Revisi'#243'n'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_FECHAREVISION'
        Title.Caption = 'Fecha Revisi'#243'n'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ec_nombre'
        Title.Caption = 'Ejecutivo Entidad'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ac_codigo'
        Title.Caption = 'C'#243'd. CIIU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ac_descripcion'
        Title.Caption = 'CIIU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_usumodif'
        Title.Caption = 'U. Modif. Solicitud'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuario_express'
        Title.Caption = '1er Receptor Express'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_usuarioasignadocarga'
        Title.Caption = 'Usuario Asignado Carga'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'express'
        Title.Caption = 'Recepci'#243'n Express'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'observacion_express'
        Title.Caption = 'Observaci'#243'n Express'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'organizador'
        Title.Caption = 'Organizador'
        Visible = True
      end>
  end
  inherited pnlFiltros: TPanel [1]
    Width = 819
    Height = 386
    ExplicitWidth = 819
    ExplicitHeight = 386
    object lbCUIT: TLabel
      Left = 63
      Top = 12
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object lbNFormulario: TLabel
      Left = 5
      Top = 36
      Width = 83
      Height = 13
      Caption = 'Nro de Formulario'
    end
    object lbRazonSocial: TLabel
      Left = 190
      Top = 12
      Width = 63
      Height = 13
      Caption = 'Raz'#243'n Social'
    end
    object lbEstado: TLabel
      Left = 351
      Top = 36
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object lbFAfiliacionDesde: TLabel
      Left = 2
      Top = 84
      Width = 88
      Height = 13
      Caption = 'F. Afiliaci'#243'n Desde'
    end
    object lbFAfiliacionHasta: TLabel
      Left = 187
      Top = 84
      Width = 85
      Height = 13
      Caption = 'F. Afiliaci'#243'n Hasta'
    end
    object lbFCargaDesde: TLabel
      Left = 478
      Top = 84
      Width = 74
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F. Carga Desde'
      ExplicitLeft = 391
    end
    object lbFCargaHasta: TLabel
      Left = 648
      Top = 84
      Width = 71
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F. Carga Hasta'
      ExplicitLeft = 561
    end
    object lbEntidad: TLabel
      Left = 51
      Top = 111
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object lbVendedor: TLabel
      Left = 41
      Top = 154
      Width = 46
      Height = 13
      Caption = 'Vendedor'
    end
    object lbARTAnterior: TLabel
      Left = 25
      Top = 60
      Width = 61
      Height = 13
      Caption = 'ART Anterior'
    end
    object Label1: TLabel
      Left = 197
      Top = 36
      Width = 56
      Height = 13
      Caption = 'Nro. Interno'
    end
    object Label13: TLabel
      Left = 416
      Top = 178
      Width = 64
      Height = 13
      Caption = 'Doc. Faltante'
    end
    object Label14: TLabel
      Left = 24
      Top = 223
      Width = 62
      Height = 13
      Caption = 'Usuario Rev.'
    end
    object Label10: TLabel
      Left = 196
      Top = 249
      Width = 12
      Height = 10
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 16
      Top = 249
      Width = 74
      Height = 13
      Caption = 'Fecha Revision'
    end
    object Label12: TLabel
      Left = 312
      Top = 249
      Width = 41
      Height = 13
      Caption = 'Revisi'#243'n'
    end
    object Label15: TLabel
      Left = 4
      Top = 178
      Width = 83
      Height = 13
      Caption = 'Ejecutivo Entidad'
    end
    object Label16: TLabel
      Left = 32
      Top = 132
      Width = 57
      Height = 13
      Caption = 'Organizador'
    end
    object Label17: TLabel
      Left = 5
      Top = 200
      Width = 79
      Height = 13
      Caption = 'Usu. Asig. Carga'
    end
    object Label18: TLabel
      Left = 706
      Top = 250
      Width = 12
      Height = 10
      Anchors = [akTop, akRight]
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 465
      Top = 249
      Width = 141
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha Recepci'#243'n Afiliaciones'
    end
    object edSA_CUIT: TMaskEdit
      Left = 96
      Top = 8
      Width = 87
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 0
      OnExit = edSA_CUITExit
      OnKeyUp = edSA_CUITKeyUp
    end
    object edFO_FORMULARIO: TEdit
      Left = 96
      Top = 32
      Width = 86
      Height = 21
      TabOrder = 2
      OnExit = edFO_FORMULARIOExit
    end
    object edSA_NOMBRE: TArtComboBox
      Left = 259
      Top = 8
      Width = 552
      Height = 21
      CharCase = ecUpperCase
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 1
      Columns = <
        item
          Expanded = False
          FieldName = 'SA_NOMBRE'
          Title.Caption = 'Nombre'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SA_CUIT'
          Title.Caption = 'Cuit'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FO_FORMULARIO'
          Title.Caption = 'Nro.Formulario'
          Width = 10
          Visible = True
        end>
      DataSource = dsBuscoNombre
      FieldList = 'SA_NOMBRE'
      FieldKey = 'SA_CUIT'
      OnCloseUp = edSA_NOMBRECloseUp
      OnDropDown = edSA_NOMBREDropDown
    end
    object edSA_ESTADO: TDBCheckCombo
      Left = 390
      Top = 32
      Width = 421
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      DataSource = dsEstado
      KeyField = 'TB_CODIGO'
      ListField = 'TB_DESCRIPCION'
    end
    object edSA_FECHAAFILIACION_DESDE: TDateComboBox
      Left = 95
      Top = 80
      Width = 88
      Height = 21
      MaxDateCombo = edSA_FECHAAFILIACION_HASTA
      TabOrder = 6
    end
    object edSA_FECHAAFILIACION_HASTA: TDateComboBox
      Left = 279
      Top = 80
      Width = 88
      Height = 21
      MinDateCombo = edSA_FECHAAFILIACION_DESDE
      TabOrder = 7
    end
    object edSA_FECHAALTA_DESDE: TDateComboBox
      Left = 555
      Top = 80
      Width = 88
      Height = 21
      MaxDateCombo = edSA_FECHAALTA_HASTA
      Anchors = [akTop, akRight]
      TabOrder = 8
    end
    object edSA_FECHAALTA_HASTA: TDateComboBox
      Left = 724
      Top = 80
      Width = 87
      Height = 21
      MinDateCombo = edSA_FECHAALTA_DESDE
      Anchors = [akTop, akRight]
      TabOrder = 9
    end
    inline fraEntidad: TfraEntidades
      Left = 94
      Top = 104
      Width = 716
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
      ExplicitLeft = 94
      ExplicitTop = 104
      ExplicitWidth = 716
      ExplicitHeight = 24
      inherited cmbDescripcion: TArtComboBox
        Left = 65
        Width = 652
        ExplicitLeft = 65
        ExplicitWidth = 652
      end
    end
    object edSA_ARTANTERIOR: TDBCheckCombo
      Left = 95
      Top = 56
      Width = 716
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      DataSource = dsARTAnt
      KeyField = 'AR_ID'
      ListField = 'AR_NOMBRE'
    end
    object gbEventos: TGroupBox
      Left = 4
      Top = 267
      Width = 605
      Height = 70
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Eventos'
      TabOrder = 19
      DesignSize = (
        605
        70)
      object lbFEventoDesde: TLabel
        Left = 22
        Top = 21
        Width = 64
        Height = 13
        Caption = 'Fecha Desde'
      end
      object lbFEventoHasta: TLabel
        Left = 184
        Top = 21
        Width = 31
        Height = 13
        Caption = ' Hasta'
      end
      object lbEventos: TLabel
        Left = 45
        Top = 45
        Width = 39
        Height = 13
        Caption = 'Eventos'
      end
      object edTI_FECHAIMPRESITUACION_DESDE: TDateComboBox
        Left = 92
        Top = 17
        Width = 88
        Height = 21
        MaxDateCombo = edTI_FECHAIMPRESITUACION_HASTA
        TabOrder = 0
      end
      object edTI_FECHAIMPRESITUACION_HASTA: TDateComboBox
        Left = 218
        Top = 17
        Width = 88
        Height = 21
        MinDateCombo = edTI_FECHAIMPRESITUACION_DESDE
        TabOrder = 1
      end
      object cbUltimoEvento: TCheckBox
        Left = 514
        Top = 19
        Width = 87
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Ultimo Evento'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      inline fraEventos: TfraCtbTablas
        Left = 91
        Top = 41
        Width = 512
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        ExplicitLeft = 91
        ExplicitTop = 41
        ExplicitWidth = 512
        inherited cmbDescripcion: TArtComboBox
          Left = 53
          Width = 455
          ExplicitLeft = 53
          ExplicitWidth = 455
        end
        inherited edCodigo: TPatternEdit
          Width = 47
          ExplicitWidth = 47
        end
      end
      object chkEventosActivos: TCheckBox
        Left = 412
        Top = 19
        Width = 98
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Eventos Activos'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
    end
    inline fraVendedor: TfraVendedores
      Left = 93
      Top = 150
      Width = 719
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 12
      ExplicitLeft = 93
      ExplicitTop = 150
      ExplicitWidth = 719
      inherited cmbDescripcion: TArtComboBox
        Left = 53
        Width = 666
        ExplicitLeft = 53
        ExplicitWidth = 666
      end
      inherited edCodigo: TPatternEdit
        Left = 2
        Width = 48
        ExplicitLeft = 2
        ExplicitWidth = 48
      end
    end
    object GroupBox1: TGroupBox
      Left = 613
      Top = 267
      Width = 198
      Height = 70
      Anchors = [akTop, akRight]
      Caption = 'Opciones'
      TabOrder = 20
      object chkPendientesImpresion: TRadioButton
        Left = 9
        Top = 33
        Width = 158
        Height = 17
        Caption = 'Ver Pendientes de Impresi'#243'n'
        TabOrder = 1
      end
      object cbVerSolicitudesEnTramite: TRadioButton
        Left = 9
        Top = 14
        Width = 158
        Height = 17
        Caption = 'Ver Solicitudes en Tr'#225'mite'
        TabOrder = 0
        OnClick = cbVerSolicitudesEnTramiteClick
      end
      object rbVerTodas: TRadioButton
        Left = 9
        Top = 51
        Width = 113
        Height = 17
        Caption = 'Ver Todas'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object edSA_NROINTERNO: TIntEdit
      Left = 259
      Top = 32
      Width = 83
      Height = 21
      TabOrder = 3
    end
    inline fraUsuarioRevision: TfraUsuarios
      Left = 94
      Top = 219
      Width = 718
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 15
      ExplicitLeft = 94
      ExplicitTop = 219
      ExplicitWidth = 718
      inherited cmbDescripcion: TArtComboBox
        Left = 93
        Width = 625
        ExplicitLeft = 93
        ExplicitWidth = 625
      end
    end
    object edSA_FECHAREVISION_DESDE: TDateComboBox
      Left = 95
      Top = 245
      Width = 97
      Height = 21
      TabOrder = 16
    end
    object edSA_FECHAREVISION_HASTA: TDateComboBox
      Left = 212
      Top = 245
      Width = 97
      Height = 21
      TabOrder = 17
    end
    object cboxRevision: TComboBox
      Left = 356
      Top = 245
      Width = 85
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 18
      Items.Strings = (
        'S'#237
        'No'
        ' ')
    end
    inline fraEjecutivoEntidad: TfraStaticCodigoDescripcion
      Left = 94
      Top = 174
      Width = 320
      Height = 23
      TabOrder = 13
      ExplicitLeft = 94
      ExplicitTop = 174
      ExplicitWidth = 320
      inherited edCodigo: TPatternEdit
        Width = 49
        ExplicitWidth = 49
      end
      inherited cmbDescripcion: TComboGrid
        Left = 53
        Width = 257
        ExplicitLeft = 53
        ExplicitWidth = 257
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
    object edDocFaltante: TCheckCombo
      Left = 484
      Top = 175
      Width = 328
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 14
      Items.Strings = (
        'DNI.'
        'DNI sin firma del titular'
        'DNI sin firma del vendedor'
        'DNI inconsistente'
        'Poder.'
        'Poder sin firma del titular'
        'Poder sin firma del vendedor'
        'Poder inconsistente'
        'Contrato Social.'
        'Contrato Social sin firma del titular'
        'Contrato Social sin firma del vendedor'
        'Contrato Social inconsistente'
        'Acta de Designaci'#243'n.'
        'Acta de Designaci'#243'n sin firma del titular'
        'Acta de Designaci'#243'n sin firma del vendedor'
        'Acta de Designaci'#243'n inconsistente'
        'Acta de Asamblea.'
        'Acta de Asamblea sin firma del titular'
        'Acta de Asamblea sin firma del vendedor'
        'Acta de Asamblea inconsistente'
        'Condiciones Particulares.'
        'Condiciones Particulares sin firma del titular'
        'Condiciones Particulares sin firma del vendedor'
        'Condiciones Particulares inconsistente'
        'Condiciones Generales.'
        'Condiciones Generales sin firma del titular'
        'Condiciones Generales sin firma del vendedor'
        'Condiciones Generales inconsistente'
        'Cl'#225'usulas Adicionales.'
        'Cl'#225'usulas Adicionales sin firma del titular'
        'Cl'#225'usulas Adicionales sin firma del vendedor'
        'Cl'#225'usulas Adicionales inconsistente'
        'Adenda Plan Comercial 2011.'
        'Adenda Plan Comercial 2011 sin firma del titular'
        'Adenda Plan Comercial 2011 sin firma del vendedor'
        'RGRL.'
        'RGRL inconsistente'
        'Ubicaci'#243'n de Riesgo.'
        'Ubicaci'#243'n de Riesgo inconsistente'
        'Responsabilidad Civil Patronal.'
        'Responsabilidad Civil Patronal sin firma del titular'
        'Responsabilidad Civil Patronal sin firma del vendedor'
        'Sin revisi'#243'n de firmante'
        'Formulario PEP'
        'PEP sin firma del titular'
        'PEP sin firma del vendedor')
    end
    object gbDirectorio: TGroupBox
      Left = 4
      Top = 337
      Width = 605
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Directorio destino e-Mail'
      TabOrder = 21
      DesignSize = (
        605
        41)
      object edDirectorio: TAdvDirectoryEdit
        Left = 92
        Top = 16
        Width = 509
        Height = 21
        Flat = False
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Anchors = [akLeft, akTop, akRight]
        Color = clWindow
        ReadOnly = False
        TabOrder = 0
        Visible = True
        Version = '1.3.3.1'
        ButtonStyle = bsButton
        ButtonWidth = 18
        EditorEnabled = False
        Etched = False
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000C0000000B0000000100
          0400000000005800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000FFF
          00000088888880FF00000B088888880F00000BB08888888000000BBB00000000
          00000BBBBBBB0B0F00000BBB00000B0F0000F000BBBBBB0F0000FF0BBBBBBB0F
          0000FF0BBB00000F0000FFF000FFFFFF0000}
        BrowseDialogText = 'Seleccione una carpeta'
      end
    end
    object GroupBox2: TGroupBox
      Left = 613
      Top = 339
      Width = 145
      Height = 38
      Anchors = [akTop, akRight]
      Caption = 'Recepci'#243'n Express'
      TabOrder = 22
      object cboxExpress: TComboBox
        Left = 8
        Top = 12
        Width = 129
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 0
        Items.Strings = (
          'S'#237
          'No'
          ' ')
      end
    end
    inline fraOrganizador: TfraCodDesc
      Tag = -956
      Left = 95
      Top = 128
      Width = 715
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 11
      ExplicitLeft = 95
      ExplicitTop = 128
      ExplicitWidth = 715
      inherited cmbDescripcion: TArtComboBox
        Width = 653
        ExplicitWidth = 653
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        ExplicitLeft = 0
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = 
          ' AND EXISTS(SELECT 1 FROM xgo_granorganizador WHERE go_identorga' +
          'nizador = en_id AND go_fechabaja IS NULL)'
        FieldBaja = 'en_fechabaja'
        FieldCodigo = 'en_codbanco'
        FieldDesc = 'en_nombre'
        FieldID = 'en_id'
        IdType = ctInteger
        OrderBy = 'en_nombre, en_fechabaja DESC'
        TableName = 'xen_entidad'
      end
    end
    inline fraUsuarioAsignadoCarga: TfraUsuarios
      Left = 94
      Top = 196
      Width = 718
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 23
      ExplicitLeft = 94
      ExplicitTop = 196
      ExplicitWidth = 718
      inherited cmbDescripcion: TArtComboBox
        Left = 93
        Width = 625
        ExplicitLeft = 93
        ExplicitWidth = 625
      end
    end
    object edSA_FECHARECEPCIONSECTORAFIDesde: TDateComboBox
      Left = 617
      Top = 246
      Width = 85
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 24
    end
    object edSA_FECHARECEPCIONSECTORAFIHasta: TDateComboBox
      Left = 724
      Top = 246
      Width = 85
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 25
    end
  end
  inherited CoolBar: TCoolBar [2]
    Top = 386
    Width = 819
    Height = 56
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 815
      end
      item
        Control = pnlRef
        ImageIndex = -1
        MinHeight = 24
        Width = 815
      end>
    ExplicitTop = 386
    ExplicitWidth = 819
    ExplicitHeight = 56
    inherited ToolBar: TToolBar
      Width = 806
      ExplicitWidth = 806
      inherited tbNuevo: TToolButton
        Hint = 'Solicitud (Ctrl-T)'
        Enabled = False
        ImageIndex = 15
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Carga Masiva Manual'
        ImageIndex = 16
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = mnuImprimir
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        Visible = False
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        ExplicitLeft = 362
      end
      object tbCargaMasivaAutomatica: TToolButton
        Left = 385
        Top = 0
        Hint = 'Carga Masiva Autom'#225'tica'
        Caption = 'tbCargaMasivaAutomatica'
        ImageIndex = 41
        OnClick = tbCargaMasivaAutomaticaClick
      end
      object tbCargaMasivaEvento: TToolButton
        Left = 408
        Top = 0
        Hint = 'Carga Masiva por Evento'
        Caption = 'tbCargaMasivaEvento'
        ImageIndex = 55
        OnClick = tbCargaMasivaEventoClick
      end
      object ToolButton1: TToolButton
        Left = 431
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbCalcularTotal: TToolButton
        Left = 439
        Top = 0
        Hint = 'Total Registros'
        Caption = 'tbCalcularTotal'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbCalcularTotalClick
      end
      object Label3: TLabel
        Left = 462
        Top = 0
        Width = 27
        Height = 22
        Caption = 'Total '
        Layout = tlCenter
      end
      object edTotal: TCardinalEdit
        Left = 489
        Top = 0
        Width = 32
        Height = 22
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
      end
      object ToolButton2: TToolButton
        Left = 521
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 49
        Style = tbsSeparator
      end
      object tbReferencias: TToolButton
        Left = 529
        Top = 0
        Caption = 'tbReferencias'
        ImageIndex = 51
        OnClick = tbReferenciasClick
      end
      object tbCorreoElectronico: TToolButton
        Left = 552
        Top = 0
        Caption = 'Correo Electronico'
        ImageIndex = 53
        OnClick = tbCorreoElectronicoClick
      end
    end
    object pnlRef: TPanel
      Left = 9
      Top = 29
      Width = 806
      Height = 24
      BevelOuter = bvNone
      TabOrder = 1
      object pnlRojo: TPanel
        Left = 121
        Top = 0
        Width = 150
        Height = 24
        Align = alLeft
        Caption = 'Faltantes de Carga'
        TabOrder = 0
        object Shape1: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = clRed
        end
      end
      object Panel2: TPanel
        Left = 271
        Top = 0
        Width = 150
        Height = 24
        Align = alLeft
        Caption = 'Sin cantidad de hojas'
        TabOrder = 1
        object Shape2: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = clBlue
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 121
        Height = 24
        Align = alLeft
        Caption = 'Completa'
        TabOrder = 2
        object Shape3: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = clBlack
        end
      end
      object Panel5: TPanel
        Left = 581
        Top = 0
        Width = 99
        Height = 24
        Align = alLeft
        Caption = 'Sin Revisi'#243'n'
        TabOrder = 3
        object Shape5: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = 7446527
        end
      end
      object Panel6: TPanel
        Left = 421
        Top = 0
        Width = 160
        Height = 24
        Align = alLeft
        Caption = 'Documentaci'#243'n Faltante '
        TabOrder = 4
        object Shape6: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = clPurple
        end
      end
    end
  end
  object fpFechaEnvio: TFormPanel [3]
    Left = 660
    Top = 54
    Width = 178
    Height = 69
    Caption = 'Elija la fecha de Env'#237'o'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsToolWindow
    Position = poScreenCenter
    Constraints.MaxHeight = 69
    Constraints.MaxWidth = 178
    Constraints.MinHeight = 69
    Constraints.MinWidth = 178
    object Label2: TLabel
      Left = 4
      Top = 7
      Width = 80
      Height = 13
      Caption = 'Fecha de Env'#237'o:'
    end
    object Bevel1: TBevel
      Left = 0
      Top = 6
      Width = 173
      Height = 28
      Shape = bsBottomLine
    end
    object cmbFechaEnvio: TDateComboBox
      Left = 86
      Top = 5
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object btnAcepatar: TButton
      Left = 19
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 1
      OnClick = btnAcepatarClick
    end
    object btnCancelar: TButton
      Left = 98
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
  object fpOpcionesImpresion: TFormPanel [4]
    Left = 679
    Top = 365
    Width = 257
    Height = 221
    Caption = 'Opciones de Impresi'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu, biMaximize]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    Constraints.MaxWidth = 257
    Constraints.MinHeight = 107
    Constraints.MinWidth = 257
    DesignSize = (
      257
      221)
    object Bevel2: TBevel
      Left = 4
      Top = 185
      Width = 249
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label7: TLabel
      Left = 30
      Top = 50
      Width = 92
      Height = 13
      Caption = 'Cantidad de Copias'
    end
    object Label8: TLabel
      Left = 12
      Top = 74
      Width = 46
      Height = 13
      Caption = 'Impresora'
    end
    object btnAceptarImpresion: TButton
      Left = 98
      Top = 191
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarImpresionClick
    end
    object btnCancelarImpresion: TButton
      Left = 177
      Top = 191
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarImpresionClick
    end
    object rbPreview: TRadioButton
      Left = 6
      Top = 6
      Width = 113
      Height = 17
      Caption = 'Mostrar el Preview'
      TabOrder = 2
    end
    object rbImprimir: TRadioButton
      Left = 6
      Top = 24
      Width = 131
      Height = 17
      Caption = 'Imprimir Directamente'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object edCantCopias: TIntEdit
      Left = 128
      Top = 46
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '1'
      MinValue = 1
      Value = 1
    end
    object btnParar: TButton
      Left = 4
      Top = 191
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Parar'
      TabOrder = 5
      OnClick = btnPararClick
    end
    object cmbImpresoras: TComboBox
      Left = 62
      Top = 70
      Width = 187
      Height = 21
      Style = csDropDownList
      TabOrder = 6
    end
    object BarProgreso: TProgressBar
      Left = 7
      Top = 164
      Width = 242
      Height = 16
      Smooth = True
      TabOrder = 7
    end
    object gbOpcionesEmail: TGroupBox
      Left = 8
      Top = 112
      Width = 241
      Height = 49
      Caption = 'Firmante del e-Mail'
      TabOrder = 8
      inline fraUsuarioFirmante: TfraUsuarios
        Left = 8
        Top = 16
        Width = 225
        Height = 23
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 225
        inherited cmbDescripcion: TArtComboBox
          Width = 132
          ExplicitWidth = 132
        end
      end
    end
    object chkEnviarEmail: TCheckBox
      Left = 8
      Top = 96
      Width = 97
      Height = 17
      Caption = 'Enviar Email'
      TabOrder = 9
      OnClick = chkEnviarEmailClick
    end
    object chkMostrarPreview: TCheckBox
      Left = 8
      Top = 8
      Width = 125
      Height = 17
      Caption = 'Mostrar el Preview'
      TabOrder = 10
      OnClick = chkEnviarEmailClick
    end
  end
  object fpCargaMasivaAutomatica: TFormPanel [5]
    Left = 776
    Top = 220
    Width = 400
    Height = 120
    Caption = 'Carga Masiva Autom'#225'tica'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpCargaMasivaAutomaticaShow
    DesignSize = (
      400
      120)
    object Label4: TLabel
      Left = 8
      Top = 20
      Width = 36
      Height = 13
      Caption = 'Archivo'
    end
    object lbVerErrores: TLabel
      Left = 320
      Top = 80
      Width = 51
      Height = 13
      Cursor = crHandPoint
      Caption = 'Ver errores'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentColor = False
      ParentFont = False
      Visible = False
      OnClick = lbVerErroresClick
    end
    object btnCancelar2: TButton
      Left = 164
      Top = 56
      Width = 72
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      Visible = False
      OnClick = btnCancelar2Click
    end
    object btnComenzar: TButton
      Left = 164
      Top = 56
      Width = 72
      Height = 25
      Caption = 'Comenzar'
      TabOrder = 1
      OnClick = btnComenzarClick
    end
    object edArchivo: TFilenameEdit
      Left = 48
      Top = 16
      Width = 320
      Height = 21
      Filter = 'Archivos de Excel (*.xls)|*.xls'
      DialogOptions = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
      DialogTitle = 'Selecci'#243'n de archivo externo'
      Color = clBtnFace
      DirectInput = False
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
    end
    object status: TStatusBar
      Left = 0
      Top = 101
      Width = 400
      Height = 19
      Panels = <
        item
          Width = 200
        end
        item
          Width = 200
        end>
    end
    object btnVerFormato: TBitBtn
      Left = 372
      Top = 16
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000525252005252
        5200525252005252520052525200525252005252520052525200525252005252
        52005252520052525200525252005252520052525200FF00FF00A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6006363FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000
        FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C6000000FF00C6C6C600C6C6C6000000
        FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C6000000FF006363FF006363FF000000
        FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600737373007373730073737300737373007373730073737300737373007373
        730073737300737373007373730073737300C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500A5A5
        A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
        A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500FF00FF00}
      TabOrder = 2
      TabStop = False
      OnClick = btnVerFormatoClick
    end
    object fpErrores: TFormPanel
      Left = 40
      Top = 56
      Width = 40
      Height = 40
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      Position = poOwnerFormCenter
      KeyPreview = True
      Constraints.MinHeight = 40
      Constraints.MinWidth = 40
      OnKeyPress = fpErroresKeyPress
      object memoErrores: TMemo
        Left = 0
        Top = 0
        Width = 40
        Height = 40
        Align = alClient
        Color = clBtnFace
        Lines.Strings = (
          'me'
          'mo'
          'Err'
          'ore'
          's')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object fpCargaMasivaEvento: TFormPanel [6]
    Left = 760
    Top = 216
    Width = 440
    Height = 168
    Caption = 'Carga Masiva por Evento'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpCargaMasivaEventoShow
    ActiveControl = edFecha
    object Label5: TLabel
      Left = 8
      Top = 36
      Width = 102
      Height = 13
      Caption = 'C'#243'digo '#218'ltimo Evento'
    end
    object Label6: TLabel
      Left = 8
      Top = 60
      Width = 105
      Height = 13
      Caption = 'C'#243'digo Nuevo Evento'
    end
    object Label9: TLabel
      Left = 8
      Top = 12
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object btnCancelar3: TButton
      Left = 184
      Top = 96
      Width = 72
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btnCancelar3Click
    end
    inline fraCodigoUltimoEvento: TfraStaticCTB_TABLAS
      Left = 120
      Top = 32
      Width = 312
      Height = 23
      TabOrder = 1
      ExplicitLeft = 120
      ExplicitTop = 32
      ExplicitWidth = 312
      inherited edCodigo: TPatternEdit
        Left = 0
        Top = 0
        ExplicitLeft = 0
        ExplicitTop = 0
      end
      inherited cmbDescripcion: TComboGrid
        Top = 0
        Width = 248
        ExplicitTop = 0
        ExplicitWidth = 248
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object edCodigoNuevoEvento: TEdit
      Left = 120
      Top = 56
      Width = 312
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
      Text = 'edCodigoNuevoEvento'
    end
    object btnComenzar2: TButton
      Left = 184
      Top = 96
      Width = 72
      Height = 25
      Caption = 'Comenzar'
      TabOrder = 3
      OnClick = btnComenzar2Click
    end
    object status2: TStatusBar
      Left = 0
      Top = 149
      Width = 440
      Height = 19
      Panels = <>
      SimplePanel = True
    end
    object edFecha: TDateComboBox
      Left = 120
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    Left = 81
    Top = 363
  end
  inherited dsConsulta: TDataSource
    AutoEdit = False
    Left = 109
    Top = 363
  end
  inherited SortDialog: TSortDialog
    Left = 81
    Top = 391
  end
  inherited ExportDialog: TExportDialog
    Left = 109
    Top = 391
  end
  inherited QueryPrint: TQueryPrint
    SubTitle.PrintOptions = poFirstPage
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 109
    Top = 419
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 81
    Top = 335
  end
  inherited FormStorage: TFormStorage
    Left = 109
    Top = 335
  end
  inherited PrintDialog: TPrintDialog
    Left = 81
    Top = 419
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16468
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
    Left = 137
    Top = 335
  end
  inherited FieldHider: TFieldHider
    Left = 137
    Top = 364
  end
  object sdqEstado: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT * FROM CTB_TABLAS '
      'WHERE TB_CLAVE = '#39'ESSOL'#39
      'AND TB_CODIGO > 0'
      'AND TB_FECHABAJA IS NULL'
      'AND SubStr( TB_ESPECIAL1, 8,1) = '#39'S'#39)
    Left = 644
    Top = 31
  end
  object dsEstado: TDataSource
    DataSet = sdqEstado
    Left = 672
    Top = 31
  end
  object sdqBuscoNombre: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT SA_ID, SA_CUIT, SA_NOMBRE, FO_FORMULARIO'
      'FROM AFO_FORMULARIO, ASA_SOLICITUDAFILIACION'
      'WHERE FO_ID = SA_IDFORMULARIO')
    Left = 644
  end
  object dsBuscoNombre: TDataSource
    DataSet = sdqBuscoNombre
    Left = 670
  end
  object sdqARTAnt: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT AR_ID, AR_NOMBRE'
      'FROM AAR_ART'
      'WHERE AR_FECHABAJA IS NULL'
      'ORDER BY AR_NOMBRE')
    Left = 104
    Top = 51
  end
  object dsARTAnt: TDataSource
    DataSet = sdqARTAnt
    Left = 132
    Top = 51
  end
  object mnuImprimir: TPopupMenu
    Left = 194
    Top = 386
    object mnuGrilla: TMenuItem
      Caption = 'Grilla'
      OnClick = mnuGrillaClick
    end
    object mnuCarta: TMenuItem
      Caption = 'Carta'
      OnClick = mnuCartaClick
    end
    object mnuCartaMail: TMenuItem
      Caption = 'Carta Mail'
      OnClick = mnuCartaClick
    end
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 184
    Top = 352
  end
  object ExcelWB: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 240
    Top = 352
  end
  object ExcelWS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 212
    Top = 352
  end
  object sdqFaltante: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT * FROM  ART.ADF_DOCUMENTOAFI '
      'WHERE  DF_FECHABAJA IS NULL'
      'ORDER BY DF_ORDEN')
    Left = 650
    Top = 151
  end
  object dsFaltante: TDataSource
    DataSet = sdqFaltante
    Left = 678
    Top = 151
  end
end
