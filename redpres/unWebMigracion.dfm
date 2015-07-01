inherited frmWebMigracion: TfrmWebMigracion
  Left = 416
  Top = 130
  Width = 808
  Height = 607
  Caption = 'Migraci'#243'n de datos de la Web'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 800
    Height = 81
    Visible = True
    DesignSize = (
      800
      81)
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 25
      Height = 13
      Caption = 'Parte'
    end
    object Label2: TLabel
      Left = 4
      Top = 35
      Width = 33
      Height = 13
      Caption = 'Acci'#243'n'
    end
    object Label3: TLabel
      Left = 4
      Top = 62
      Width = 52
      Height = 13
      Caption = 'Recepci'#243'n'
    end
    object Label4: TLabel
      Left = 153
      Top = 60
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object Bevel5: TBevel
      Left = 265
      Top = 55
      Width = 2
      Height = 24
    end
    object Label19: TLabel
      Left = 276
      Top = 60
      Width = 53
      Height = 13
      Caption = 'Nro. Trans.'
    end
    inline fraMW_ACCION: TfraStaticCTB_TABLAS
      Left = 61
      Top = 29
      Width = 737
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        737
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 673
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
    inline fraMW_DOCUMENTO: TfraStaticCTB_TABLAS
      Left = 61
      Top = 2
      Width = 737
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        737
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 673
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
    object edMW_FECHARECEPCIONDesde: TDateComboBox
      Left = 62
      Top = 57
      Width = 88
      Height = 21
      MaxDateCombo = edMW_FECHARECEPCIONHasta
      TabOrder = 2
    end
    object edMW_FECHARECEPCIONHasta: TDateComboBox
      Left = 168
      Top = 57
      Width = 88
      Height = 21
      MinDateCombo = edMW_FECHARECEPCIONDesde
      TabOrder = 3
    end
    object edMW_TRANSACCION: TIntEdit
      Left = 332
      Top = 56
      Width = 68
      Height = 21
      TabOrder = 4
      AutoExit = True
      MaxLength = 10
    end
  end
  inherited CoolBar: TCoolBar
    Top = 81
    Width = 800
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 796
      end>
    inherited ToolBar: TToolBar
      Width = 783
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Hint = 'Acci'#243'n'
        ImageIndex = 35
        OnClick = tbAccionClick
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Migrar'
        ImageIndex = 21
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbMigracion: TToolButton
        Left = 370
        Top = 0
        Hint = 'Migrar'
        Caption = 'tbMigracion'
        ImageIndex = 21
        OnClick = tbMigracionClick
      end
      object ToolButton7: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 8
        OnClick = tbSalir2Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 110
    Width = 800
    Height = 470
    Columns = <
      item
        Expanded = False
        FieldName = 'FEC_RECEPCION'
        Title.Caption = 'Fecha Recepci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTE'
        Title.Caption = 'Parte'
        Width = 241
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MW_TRANSACCION'
        Title.Caption = 'Nro.Trans.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'siniestro_completo'
        Title.Caption = 'Siniestro'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mw_tipo'
        Title.Caption = 'Tipo Accidente'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FEC_SINI'
        Title.Caption = 'Fecha Siniestro'
        Width = 79
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MW_GRAVEDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Gravedad'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MW_TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMTRAB'
        Title.Caption = 'Domicilio Trabajador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Id.Prestador'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOM_PRESTADOR'
        Title.Caption = 'Nom.Prestador'
        Width = 192
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CIE10'
        Title.Alignment = taCenter
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRAVCIE10'
        Title.Caption = 'Grav. CIE10'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAGNOSTICO'
        Title.Caption = 'Diagn'#243'stico'
        Width = 225
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 231
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DES_HECHO'
        Title.Caption = 'Descripci'#243'n del Hecho'
        Width = 189
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAJA_MED'
        Title.Caption = 'F.Baja M'#233'dica'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FEC_CONTROL'
        Title.Caption = 'F.Control'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALTA_MED'
        Title.Caption = 'F.Alta M'#233'dica'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FEC_RECEPCION'
        Title.Caption = 'F.Rec.Parte'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_CARGADO'
        Title.Caption = 'Existe Doc.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACCION'
        Title.Caption = 'Acci'#243'n a Tomar'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MW_FECHAACCION'
        Title.Caption = 'Fecha Acci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MW_USUACCION'
        Title.Caption = 'Usuario Acci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cargacolonia'
        Title.Caption = 'Carga Colonia Suiza'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 88
    Top = 148
    Width = 561
    Height = 409
    Caption = 'Modificar'
    OnClose = fpAbmClose
    Constraints.MinHeight = 384
    Constraints.MinWidth = 561
    inherited BevelAbm: TBevel
      Top = 373
      Width = 553
    end
    object Label5: TLabel [1]
      Left = 4
      Top = 38
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Bevel1: TBevel [2]
      Left = 4
      Top = 61
      Width = 553
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label6: TLabel [3]
      Left = 4
      Top = 100
      Width = 51
      Height = 13
      Caption = 'Trabajador'
    end
    object Bevel2: TBevel [4]
      Left = 4
      Top = 200
      Width = 553
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label7: TLabel [5]
      Left = 173
      Top = 298
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Bevel3: TBevel [6]
      Left = 4
      Top = 286
      Width = 553
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label8: TLabel [7]
      Left = 5
      Top = 298
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label9: TLabel [8]
      Left = 5
      Top = 350
      Width = 56
      Height = 13
      Caption = 'Diagn'#243'stico'
    end
    object Label10: TLabel [9]
      Left = 4
      Top = 265
      Width = 56
      Height = 13
      Caption = 'N.Prestador'
    end
    object Label12: TLabel [10]
      Left = 5
      Top = 324
      Width = 32
      Height = 13
      Caption = 'CIE 10'
    end
    object Label13: TLabel [11]
      Left = 339
      Top = 324
      Width = 58
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Grav. CIE10'
    end
    object Label14: TLabel [12]
      Left = 304
      Top = 298
      Width = 26
      Height = 13
      Caption = 'Grav.'
    end
    object Label15: TLabel [13]
      Left = 4
      Top = 126
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    object Label16: TLabel [14]
      Left = 6
      Top = 12
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label17: TLabel [15]
      Left = 6
      Top = 76
      Width = 24
      Height = 13
      Caption = 'CUIL'
    end
    object Label18: TLabel [16]
      Left = 350
      Top = 350
      Width = 46
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Tipo Acc.'
    end
    inherited btnAceptar: TButton
      Left = 403
      Top = 379
      TabOrder = 12
    end
    inherited btnCancelar: TButton
      Left = 481
      Top = 379
      TabOrder = 13
    end
    object edEMPRESA: TEdit
      Left = 67
      Top = 34
      Width = 487
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    inline fraCUIT: TfraEmpresa
      Left = 67
      Top = 8
      Width = 487
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DesignSize = (
        487
        21)
      inherited lbContrato: TLabel
        Left = 381
      end
      inherited edContrato: TIntEdit
        Left = 428
      end
      inherited cmbRSocial: TArtComboBox
        Left = 128
        Width = 249
      end
    end
    object edTRABAJADOR: TEdit
      Left = 67
      Top = 96
      Width = 487
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    inline fraCUIL: TfraTrabajador
      Left = 61
      Top = 70
      Width = 493
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        493
        22)
      inherited mskCUIL: TMaskEdit
        Left = 6
      end
      inherited cmbNombre: TArtComboBox
        Left = 88
        Width = 406
      end
    end
    inline fraPRESTADOR: TfraPrestador
      Left = 4
      Top = 205
      Width = 553
      Height = 53
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      AutoScroll = False
      TabOrder = 5
      DesignSize = (
        553
        53)
      inherited lbCUIT: TLabel
        Left = 2
        Width = 45
        Caption = 'Prestador'
      end
      inherited lbSec: TLabel
        Left = 148
      end
      inherited lbIdentif: TLabel
        Left = 220
      end
      inherited lbRSocial: TLabel
        Left = 306
      end
      inherited lbDomicilio: TLabel
        Left = 2
        Top = 34
      end
      inherited lbLocalidad: TLabel
        Left = 316
        Top = 34
      end
      inherited lbCPostal: TLabel
        Left = 474
        Top = 34
      end
      inherited lbTelefono: TLabel
        Left = 559
        Top = 30
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 302
      end
      inherited mskPrestCUIT: TMaskEdit
        Left = 64
      end
      inherited cmbPrestador: TArtComboBox
        Left = 352
        Width = 199
      end
      inherited edPresDomicilio: TEdit
        Left = 64
        Width = 241
      end
      inherited edPresLocalidad: TEdit
        Left = 368
        Width = 99
      end
      inherited edPresCPostal: TEdit
        Left = 498
      end
      inherited edPrestIdentif: TIntEdit
        Left = 256
      end
      inherited edPrestSecuencia: TIntEdit
        Left = 172
      end
      inherited edPresTelefono: TEdit
        Left = 578
        Top = 26
        Width = 60
      end
    end
    object edDIAGNOSTICO: TEdit
      Left = 66
      Top = 346
      Width = 267
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 11
    end
    object edSINIESTRO: TSinEdit
      Left = 66
      Top = 294
      Width = 100
      Height = 21
      TabOrder = 6
      Separator = '/'
    end
    object edNOM_PRESTADOR: TEdit
      Left = 68
      Top = 261
      Width = 488
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 14
    end
    inline fraDomicilioTrab: TfraDomicilio
      Left = 5
      Top = 146
      Width = 548
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      DesignSize = (
        548
        51)
      inherited lbCalle: TLabel
        Left = 0
      end
      inherited lbNro: TLabel
        Left = 333
      end
      inherited lbPiso: TLabel
        Left = 405
      end
      inherited lbDto: TLabel
        Left = 481
      end
      inherited lbCPA: TLabel
        Left = 115
        Visible = False
      end
      inherited lbProvincia: TLabel [6]
        Left = 386
      end
      inherited lbLocalidad: TLabel [7]
        Left = 116
      end
      inherited edCPA: TPatternEdit [8]
        Left = 140
        Width = 68
        Visible = False
      end
      inherited cmbCalle: TArtComboBox [9]
        Left = 62
        Width = 244
      end
      inherited edNumero: TEdit [10]
        Left = 355
      end
      inherited edPiso: TEdit [11]
        Left = 431
      end
      inherited edDto: TEdit [12]
        Left = 503
      end
      inherited edCPostal: TIntEdit [13]
        Left = 62
      end
      inherited cmbLocalidad: TArtComboBox [14]
        Left = 168
        Width = 212
      end
      inherited edProvincia: TEdit [15]
        Left = 435
      end
      inherited btnBuscar: TButton
        Left = 309
        Width = 22
      end
    end
    inline fraCIE10: TfraCodDesc
      Left = 65
      Top = 319
      Width = 271
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      DesignSize = (
        271
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 46
        Width = 223
      end
      inherited edCodigo: TPatternEdit
        Width = 41
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'DG_FECHABAJA'
        FieldCodigo = 'DG_CODIGO'
        FieldDesc = 'DG_DESCRIPCION'
        FieldID = 'DG_CODIGO'
        ShowBajas = True
        TableName = 'CDG_DIAGNOSTICO'
      end
    end
    inline fraGravedadCIE10: TfraStaticCTB_TABLAS
      Left = 401
      Top = 319
      Width = 157
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 10
      DesignSize = (
        157
        23)
      inherited edCodigo: TPatternEdit
        Width = 32
        Pattern = '1234567890'
      end
      inherited cmbDescripcion: TComboGrid
        Left = 36
        Width = 119
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
    inline fraGravedad: TfraStaticCTB_TABLAS
      Left = 333
      Top = 292
      Width = 226
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 8
      DesignSize = (
        226
        23)
      inherited edCodigo: TPatternEdit
        Width = 32
        Pattern = '1234567890'
      end
      inherited cmbDescripcion: TComboGrid
        Left = 36
        Width = 187
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
    object edTelefonoTrab: TEdit
      Left = 67
      Top = 121
      Width = 137
      Height = 21
      MaxLength = 30
      TabOrder = 4
    end
    object edFEC_SINI: TDateComboBox
      Left = 207
      Top = 294
      Width = 90
      Height = 21
      TabOrder = 7
    end
    inline fraTipoAccidente: TfraStaticCTB_TABLAS
      Left = 401
      Top = 343
      Width = 157
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 16
      inherited edCodigo: TPatternEdit
        Width = 32
      end
      inherited cmbDescripcion: TComboGrid
        Left = 36
        Width = 119
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
  end
  object fpAccion: TFormPanel [4]
    Left = 492
    Top = 299
    Width = 465
    Height = 170
    Caption = 'Acci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu, biMaximize]
    Position = poOwnerFormCenter
    Constraints.MinHeight = 73
    Constraints.MinWidth = 163
    DesignSize = (
      465
      170)
    object Bevel4: TBevel
      Left = 4
      Top = 134
      Width = 457
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label11: TLabel
      Left = 8
      Top = 14
      Width = 33
      Height = 13
      Caption = 'Acci'#243'n'
    end
    object lblObservaciones: TLabel
      Left = 8
      Top = 39
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object btnAccAceptar: TButton
      Left = 307
      Top = 140
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAccAceptarClick
    end
    object btnAccCancelar: TButton
      Left = 385
      Top = 140
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraCTB_ACWEB: TfraStaticCTB_TABLAS
      Left = 56
      Top = 8
      Width = 406
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      OnExit = fraCTB_ACWEBExit
      DesignSize = (
        406
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 342
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
    object edObservaciones: TEdit
      Left = 8
      Top = 55
      Width = 450
      Height = 76
      AutoSize = False
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT mw_documento, mw_transaccion, mw_accion, mw_tipo, mw_cie1' +
        '0, '
      
        #9#9#9' b.tb_descripcion parte, mw_cuit cuit, NVL(em_nombre, mw_empr' +
        'esa) empresa, '
      
        #9#9#9' mw_cuil cuil, NVL(tj_nombre, mw_trabajador) trabajador, mw_f' +
        'echasin fec_sini,'
      
        '       mw_prestadorid prestador, NVL(ca_descripcion, mw_prestado' +
        'rnombre) nom_prestador, '
      
        #9#9#9' mw_diagnostico diagnostico, mw_observacion observaciones, mw' +
        '_descripcion des_hecho, '
      
        #9#9#9' mw_grav_cie10 gravcie10, mw_bajamedica baja_med, mw_fechacon' +
        'trol fec_control, '
      #9#9#9' mw_altamedica alta_med, mw_fecharecepcion fec_recepcion, '
      
        #9#9#9' art.web.get_siniestro(mw_documento, mw_cuit, mw_cuil, mw_fec' +
        'hasin) siniestro,'
      
        '       art.web.is_documentocargado(mw_documento, mw_cuit, mw_cui' +
        'l, mw_fechasin, mw_prestadorid, mw_fechacontrol) doc_cargado,'
      
        '       a.tb_descripcion accion, mw_calle calletrab, mw_numero nu' +
        'merotrab, '
      
        #9#9#9' mw_piso pisotrab, mw_departamento deptotrab, mw_cpostal cpos' +
        'taltrab, '
      #9#9#9' mw_localidad localidadtrab, pv_descripcion provinciatrab,'
      
        '       art.utiles.armar_domicilio(mw_calle, mw_numero, mw_piso, ' +
        'mw_departamento, mw_localidad) domtrab, '
      
        #9#9#9' mw_siniestro, mw_orden, mw_recaida, mw_gravedad, mw_telefono' +
        ','
      
        '       DECODE(art.siniestro.is_cargaexclusivatercerizada(em_id, ' +
        'art.actualdate), NULL, '#39'N'#39', '#39'S'#39') cargacolonia,'
      
        '       art.siniestro.is_empresatercerizada(em_id, art.actualdate' +
        ') empresa_terce '
      
        '  FROM aem_empresa, ctj_trabajador, cpr_prestador, v_tmp_smw_mig' +
        'racionweb, '
      '       ctb_tablas a, ctb_tablas b, cpv_provincias'
      ' WHERE mw_cuit = em_cuit(+)'
      '   AND mw_cuil = tj_cuil(+)'
      '   AND mw_prestadorid = ca_identificador(+)'
      '   AND a.tb_clave(+) = '#39'ACWEB'#39
      '   AND a.tb_codigo(+) = mw_accion'
      '   AND b.tb_clave(+) = '#39'DOWEB'#39
      '   AND b.tb_codigo(+) = mw_documento'
      '   AND pv_codigo(+) = mw_provincia'
      ''
      ''
      ' ')
    UpdateObject = sduConsulta
    Left = 16
    Top = 152
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 152
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 180
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 180
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Parte'
        DataField = 'PARTE'
        MaxLength = 20
      end
      item
        Title = 'Trans.'
        TitleAlignment = taCenter
        DataField = 'MW_TRANSACCION'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'Siniestro'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        MaxLength = 13
      end
      item
        Title = 'Tipo accid.'
        DataField = 'MW_TIPO'
        MaxLength = 12
      end
      item
        Title = 'F. Sin.'
        TitleAlignment = taCenter
        DataField = 'FEC_SINI'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'CUIT'
        DataField = 'CUIT'
        MaxLength = 10
      end
      item
        Title = 'EMPRESA'
        DataField = 'EMPRESA'
        MaxLength = 35
      end
      item
        Title = 'CUIL'
        DataField = 'CUIL'
        MaxLength = 10
      end
      item
        Title = 'Trabajador'
        DataField = 'TRABAJADOR'
        MaxLength = 25
      end
      item
        Title = 'Prestador'
        DataField = 'NOM_PRESTADOR'
        MaxLength = 40
      end
      item
        Title = 'CIE10'
        TitleAlignment = taCenter
        DataField = 'CIE10'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'F.Recepci'#243'n'
        DataField = 'FEC_RECEPCION'
        MaxLength = 15
      end
      item
        Title = 'Acci'#243'n a tomar'
        DataField = 'ACCION'
        MaxLength = 0
      end>
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 44
    Top = 208
  end
  inherited Seguridad: TSeguridad
    Left = 16
    Top = 124
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 124
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 208
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
        LinkControl = tbEliminar
      end>
    Left = 72
    Top = 124
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 152
  end
  object sdqReporte: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT '#39'TRANSACCIONES PROCESADAS'#39' TITULO, '#39#39' SUBTITULO, COUNT(*)' +
        ' VALOR'
      '  FROM WLT_LOG_TRANSACCION_WEB, V_TMP_SMW_MIGRACIONWEB'
      ' WHERE LT_TRANSACCION = MW_TRANSACCION'
      '   AND MW_ACCION IS NOT NULL')
    Left = 16
    Top = 232
  end
  object qpReporte: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <
      item
        Title = 'TITULO'
        DataField = 'TITULO'
        Width = 1500
        MaxLength = 0
      end
      item
        Title = 'SUBTITULO'
        DataField = 'SUBTITULO'
        Width = 1500
        MaxLength = 0
      end
      item
        Title = 'VALOR'
        DataField = 'VALOR'
        Alignment = taRightJustify
        Width = 330
        MaxLength = 0
      end>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 
      'Reporte del Proceso de Migraci'#243'n de Documentaci'#243'n Ingresada a Tr' +
      'av'#233's del la Web'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Headers.Visible = False
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    OnGetCellParams = qpReporteGetCellParams
    Margins.Left = 10
    Margins.Right = 10
    PrinterOptions.PrintDialog = PrintDialog
    Left = 72
    Top = 232
  end
  object dsReporte: TDataSource
    DataSet = sdqReporte
    Left = 44
    Top = 232
  end
  object ascNovedades: TDataToAscii
    DataSet = cdReporte
    Separator = ';'
    Quote = #0
    Fields = <>
    Left = 100
    Top = 232
  end
  object cdReporte: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'provReporte'
    Left = 44
    Top = 260
  end
  object provReporte: TDataSetProvider
    DataSet = sdqReporte
    Left = 16
    Top = 260
  end
  object sduConsulta: TSDUpdateSQL
    Left = 100
    Top = 152
  end
  object Timer: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerTimer
    Left = 72
    Top = 260
  end
end
