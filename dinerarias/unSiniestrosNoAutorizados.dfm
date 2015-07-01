inherited frmSiniestrosNoAutorizados: TfrmSiniestrosNoAutorizados
  Left = 506
  Top = 202
  Caption = 'Siniestros no autorizados'
  ClientHeight = 369
  ClientWidth = 723
  ExplicitLeft = 506
  ExplicitTop = 202
  ExplicitWidth = 731
  ExplicitHeight = 399
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 723
    Height = 88
    ExplicitWidth = 845
    ExplicitHeight = 88
    object gbFechaAccidente: TGroupBox
      Left = 0
      Top = 0
      Width = 204
      Height = 44
      Caption = 'Fecha de accidente'
      TabOrder = 0
      object Label1: TLabel
        Left = 96
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcFechaAccDesde: TDateComboBox
        Left = 5
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = dcFechaAccHasta
        TabOrder = 0
      end
      object dcFechaAccHasta: TDateComboBox
        Left = 112
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = dcFechaAccDesde
        TabOrder = 1
      end
    end
    object gbFechaEvento: TGroupBox
      Left = 0
      Top = 43
      Width = 204
      Height = 44
      Caption = 'Fecha de evento'
      TabOrder = 1
      object Label2: TLabel
        Left = 96
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcFechaEventoDesde: TDateComboBox
        Left = 5
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = dcFechaEventoHasta
        TabOrder = 0
      end
      object dcFechaEventoHasta: TDateComboBox
        Left = 112
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = dcFechaEventoDesde
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 206
      Top = 0
      Width = 401
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 2
      ExplicitWidth = 523
      DesignSize = (
        401
        44)
      inline fraEmpresa: TfraEmpresa
        Left = 6
        Top = 16
        Width = 388
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 16
        ExplicitWidth = 510
        inherited lbContrato: TLabel
          Left = 284
        end
        inherited edContrato: TIntEdit
          Left = 331
        end
        inherited cmbRSocial: TArtComboBox
          Width = 149
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 206
      Top = 43
      Width = 353
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Trabajador'
      TabOrder = 3
      ExplicitWidth = 477
      DesignSize = (
        353
        44)
      inline fraTrabajador: TfraTrabajador
        Left = 6
        Top = 16
        Width = 339
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 16
        inherited cmbNombre: TArtComboBox
          Width = 255
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 609
      Top = 0
      Width = 112
      Height = 44
      Anchors = [akTop, akRight]
      Caption = 'Siniestro'
      TabOrder = 4
      ExplicitLeft = 731
      object edSiniestro: TSinEdit
        Left = 7
        Top = 16
        Width = 100
        Height = 21
        Hint = 'C'#243'digo de Siniestro '
        TabOrder = 0
      end
    end
    object rgVerBajas: TRadioGroup
      Left = 561
      Top = 43
      Width = 160
      Height = 44
      Anchors = [akTop, akRight]
      Caption = 'Ver Bajas'
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 5
      ExplicitLeft = 683
    end
  end
  inherited CoolBar: TCoolBar
    Top = 88
    Width = 723
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 717
      end>
    inherited ToolBar: TToolBar
      Width = 708
      ExplicitWidth = 708
    end
  end
  inherited Grid: TArtDBGrid
    Top = 117
    Width = 723
    Height = 252
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FEVENTO'
        Title.Caption = 'F. Evento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FACCIDENTE'
        Title.Caption = 'F. Accidente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCINCA'
        Title.Caption = 'Porc. Inca.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISION'
        Title.Caption = 'Comisi'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRADO'
        Title.Caption = 'Grado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARACTER'
        Title.Caption = 'Car'#225'cter'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FBAJA'
        Title.Caption = 'F. Baja'
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT /*+rule */'
      
        '       art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_rec' +
        'aida) siniestro, '
      '       ev_fecha fevento, ex_fechaaccidente faccidente, '
      
        '       art.utiles.armar_cuit(tj_cuil) cuil, tj_nombre trabajador' +
        ', '
      
        '       ex_contrato contrato, art.utiles.armar_cuit(em_cuit) cuit' +
        ','
      
        '       em_nombre empresa, ev_porcincapacidad porcinca, cm_descri' +
        'pcion comision,'
      
        '       DECODE(ev_grado, '#39'P'#39', '#39'Parcial'#39', '#39'T'#39', '#39'Total'#39', NULL) grad' +
        'o,'
      
        '       DECODE(ev_caracter, '#39'P'#39', '#39'Provisorio'#39', '#39'D'#39', '#39'Definitivo'#39',' +
        ' NULL) caracter,'
      
        '       art.inca.get_fbajanoliquidar(ev_idevento, ev_idexpediente' +
        ') fbaja'
      '  FROM art.sev_eventosdetramite, art.sex_expedientes, '
      '       SIN.sei_eventoincapacidad, SIN.scm_comisionmedica, '
      '       ctj_trabajador, aem_empresa'
      ' WHERE ev_idexpediente = ex_id'
      '   AND ev_codigo = ei_codigo'
      '   AND ev_comision = cm_codigo(+)'
      '   AND ex_idtrabajador = tj_id'
      '   AND ex_cuit = em_cuit'
      '   AND ei_noautoriza = '#39'S'#39
      '   AND ev_evento <> 0'
      '   AND ev_fechaalta > TO_DATE('#39'01/05/2014'#39', '#39'dd/mm/yyyy'#39')')
    object sdqConsultaSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqConsultaFEVENTO: TDateTimeField
      FieldName = 'FEVENTO'
    end
    object sdqConsultaFACCIDENTE: TDateTimeField
      FieldName = 'FACCIDENTE'
    end
    object sdqConsultaCUIL: TStringField
      FieldName = 'CUIL'
      Size = 4000
    end
    object sdqConsultaTRABAJADOR: TStringField
      FieldName = 'TRABAJADOR'
      Required = True
      Size = 60
    end
    object sdqConsultaCONTRATO: TFloatField
      FieldName = 'CONTRATO'
    end
    object sdqConsultaCUIT: TStringField
      FieldName = 'CUIT'
      Size = 4000
    end
    object sdqConsultaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 200
    end
    object sdqConsultaPORCINCA: TFloatField
      FieldName = 'PORCINCA'
    end
    object sdqConsultaCOMISION: TStringField
      FieldName = 'COMISION'
      Size = 100
    end
    object sdqConsultaGRADO: TStringField
      FieldName = 'GRADO'
      Size = 7
    end
    object sdqConsultaCARACTER: TStringField
      FieldName = 'CARACTER'
      Size = 10
    end
    object sdqConsultaFBAJA: TDateTimeField
      FieldName = 'FBAJA'
    end
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
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 56
    Top = 316
  end
end
