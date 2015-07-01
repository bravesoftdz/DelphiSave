inherited frmAvisoDeObraWeb: TfrmAvisoDeObraWeb
  Left = 944
  Top = 415
  Caption = 'Avisos de Obra Web'
  ClientHeight = 515
  ClientWidth = 968
  OldCreateOrder = True
  ExplicitWidth = 976
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 968
    Height = 58
    ExplicitWidth = 968
    ExplicitHeight = 58
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label2: TLabel
      Left = 6
      Top = 34
      Width = 53
      Height = 13
      Caption = 'Fecha alta '
    end
    object Label3: TLabel
      Left = 75
      Top = 34
      Width = 34
      Height = 13
      Caption = 'Desde:'
    end
    object Label4: TLabel
      Left = 208
      Top = 33
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 73
      Top = 3
      Width = 890
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
      ExplicitLeft = 73
      ExplicitTop = 3
      ExplicitWidth = 890
      ExplicitHeight = 21
      DesignSize = (
        890
        21)
      inherited lbContrato: TLabel
        Left = 786
        ExplicitLeft = 786
      end
      inherited edContrato: TIntEdit
        Left = 833
        ExplicitLeft = 833
      end
      inherited cmbRSocial: TArtComboBox
        Width = 651
        ExplicitWidth = 651
      end
    end
    object cbPendienteFiltro: TCheckBox
      Left = 359
      Top = 32
      Width = 83
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Pendiente '
      TabOrder = 1
    end
    object cbProcesadoFiltro: TCheckBox
      Left = 456
      Top = 32
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Terminado'
      TabOrder = 2
    end
    object edFechaAltaDesde: TDateComboBox
      Left = 114
      Top = 30
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object edFechaAltaHasta: TDateComboBox
      Left = 241
      Top = 30
      Width = 88
      Height = 21
      TabOrder = 4
    end
    object cbRechazado: TCheckBox
      Left = 576
      Top = 32
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Rechazado'
      TabOrder = 5
    end
  end
  inherited CoolBar: TCoolBar
    Top = 58
    Width = 968
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 962
      end>
    ExplicitTop = 58
    ExplicitWidth = 968
    inherited ToolBar: TToolBar
      Left = 9
      Width = 955
      ExplicitLeft = 9
      ExplicitWidth = 955
      object btnProcesar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Procesar Aviso de obra'
        Caption = 'btnProcesar'
        ImageIndex = 13
        OnClick = btnProcesarClick
      end
      object tbRechazo: TToolButton
        Left = 393
        Top = 0
        Caption = 'tbRechazo'
        ImageIndex = 39
        OnClick = tbRechazoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 87
    Width = 968
    Height = 428
    Columns = <
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_ESTABLECI'
        Title.Caption = 'Establecimiento'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_TIPO'
        Title.Caption = 'Tipo'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESOLUCION'
        Title.Caption = 'Resoluci'#243'n'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_CALLE'
        Title.Caption = 'Calle'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_CPOSTAL'
        Title.Caption = 'C'#243'digo Postal'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_CPA'
        Title.Caption = 'C'#243'digo Postal Argentino'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_SUPERFICIE'
        Title.Caption = 'Superficie'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_PLANTAS'
        Title.Caption = 'Plantas'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_DESCRIPCIONOBRA'
        Title.Caption = 'Descripci'#243'n de Obra'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHAINICIO'
        Title.Caption = 'Fecha de Inicio'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHAFINDEOBRA'
        Title.Caption = 'Fecha Fin de Obra'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHAEXTENSION'
        Title.Caption = 'Fecha Extensi'#243'n'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHASUSPENSION'
        Title.Caption = 'Fecha de Suspensi'#243'n'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHAREINICIO'
        Title.Caption = 'Fecha de Reinicio'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHAEXCAVACION'
        Title.Caption = 'Fecha de Excavaci'#243'n'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHAEXCAVACIONHASTA'
        Title.Caption = 'Fecha Excavaci'#243'n Hasta'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHADEMOLICION'
        Title.Caption = 'Fecha de Demolici'#243'n'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHADEMOLICIONHASTA'
        Title.Caption = 'Fecha de Demolici'#243'n Hasta'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHADESDEEXCAVACION503'
        Title.Caption = 'Fecha desde de Excavaci'#243'n 503'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHAHASTAEXCAVACION503'
        Title.Caption = 'Fecha hasta de Excavaci'#243'n 503'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_DETALLEEXCAVACION503'
        Title.Caption = 'Detalle excavaci'#243'n 503'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTRECHAZO'
        Title.Caption = 'Motivo de Rechazo'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_USUALTA'
        Title.Caption = 'Usuario de Alta'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_USUMODIF'
        Title.Caption = 'Usuario de Modificacion'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHAMODIF'
        Title.Caption = 'Fecha de Modificaci'#243'n'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_USUBAJA'
        Title.Caption = 'Usuario de Baja'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_FECHABAJA'
        Title.Caption = 'Fecha de Baja'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEPROGSEG'
        Title.Caption = 'Tiene Programa de Seguridad'
        Width = 150
        Visible = True
      end>
  end
  object fpMotivoRechazo: TFormPanel [3]
    Left = 230
    Top = 241
    Width = 443
    Height = 75
    Hint = 'Motivo Rechazo'
    Caption = 'Motivo Rechazo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      443
      75)
    object Bevel5: TBevel
      Left = 4
      Top = 39
      Width = 435
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label49: TLabel
      Left = 9
      Top = 15
      Width = 81
      Height = 13
      Caption = 'Motivo Rechazo:'
    end
    object btnAceptarCambioTipoPrev: TButton
      Left = 281
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptarCambioTipoPrevClick
    end
    object btnCancelarCambioTipoPrev: TButton
      Left = 361
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraMotivoRechazo: TfraCodigoDescripcion
      Left = 96
      Top = 9
      Width = 341
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 96
      ExplicitTop = 9
      ExplicitWidth = 341
      DesignSize = (
        341
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 276
        ExplicitWidth = 276
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        ExplicitWidth = 59
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT co_contrato, em_cuit, em_nombre, aw_estableci, aw_fechain' +
        'icio, aw_fechafindeobra, aw_fechaextension, aw_fechasuspension,'
      
        '       aw_fechareinicio, aw_fechaexcavacion, aw_fechaexcavacionh' +
        'asta, aw_fechademolicion, aw_fechademolicionhasta,'
      
        '       aw_superficie, aw_plantas, aw_calle, aw_numero, aw_locali' +
        'dad, aw_provincia, aw_cpostal, aw_cpa, aw_descripcionobra,'
      '       or_descripcion resolucion,'
      '       DECODE(aw_tipo,'
      '              '#39'AO'#39', '#39'Aviso de Obra'#39','
      '              '#39'E'#39', '#39'Extensi'#243'n'#39','
      '              '#39'S'#39', '#39'Suspensi'#243'n'#39','
      '              '#39'SD'#39', '#39'Suspensi'#243'n Definitiva'#39','
      '              '#39'R'#39', '#39'Reinicio'#39','
      '              '#39'M'#39', '#39'Modificaci'#243'n'#39') aw_tipo,'
      
        '       aw_fechadesdeexcavacion503, aw_fechahastaexcavacion503, a' +
        'w_detalleexcavacion503, aw_id, aw_arquitectura,'
      
        '       aw_ingenieriacivil, aw_montajeindustrial, aw_ductos, aw_r' +
        'edes, aw_otras, aw_actividad, aw_contactoaoweb,'
      
        '       aw_submuraciones, aw_subsuelos, aw_total, aw_parcial, aw_' +
        'actividadotros, aw_fechaalta, aw_usualta, aw_fechamodif,'
      
        '       aw_usumodif, aw_fechabaja, aw_usubaja, aw_comitente, aw_c' +
        'uitcomitente, aw_razonsocialcomitente, aw_contratista,'
      
        '       aw_cuitcontratista, aw_razonsocialcontratista, aw_subcont' +
        'ratista, aw_cuitsubcontratista, aw_razonsocialsubcontratista,'
      
        '       aw_idavisoobra, aw_nombreresp, aw_apellidoresp, aw_codare' +
        'aresp, aw_telefonoresp, aw_tipotelefonoresp, aw_emailresp,'
      
        '       aw_tipodocumentoresp, aw_numerodocumentoresp, aw_sexoresp' +
        ', aw_resolucion, aw_idestab319, aw_excavacion503, aw_estado,'
      
        '        (SELECT pv_descripcion FROM art.cpv_provincias WHERE pv_' +
        'codigo = aw_provincia) provincia, (SELECT am_descripcion '
      
        '         FROM hys.ham_avisoobramotivorechazo  WHERE am_id = aw_i' +
        'dmotivorechazado) motrechazo, '
      
        '          NVL2(art.hys.get_idprogramaseguridad(em_cuit, (SELECT ' +
        'es_nroestableci FROM afi.aes_establecimiento '
      '          WHERE es_id = aw_idestab319)), '#39'S'#39', '#39'N'#39') tieneprogseg '
      
        '  FROM hys.haw_avisoobraweb a, afi.aco_contrato, afi.aem_empresa' +
        ', hys.hor_obrasresolucion'
      ' WHERE aw_contrato = co_contrato'
      '   AND co_idempresa = em_id'
      '   AND aw_resolucion = or_id(+)'
      '   AND 1 = 2 ')
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
    Left = 80
    Top = 256
  end
end
