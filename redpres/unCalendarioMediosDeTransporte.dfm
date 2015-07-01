inherited frmCalendarioMediosDeTransporte: TfrmCalendarioMediosDeTransporte
  Left = 228
  Top = 142
  Caption = 'Calendario | Medios de transporte'
  ClientHeight = 552
  ClientWidth = 762
  Constraints.MinWidth = 770
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  ExplicitWidth = 770
  ExplicitHeight = 579
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 762
    Height = 209
    ExplicitWidth = 762
    ExplicitHeight = 209
    DesignSize = (
      762
      209)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 287
      Height = 13
      Caption = 'Prestador que realiza la pr'#225'ctica m'#233'dica (FKT, etc.)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 80
      Width = 184
      Height = 13
      Caption = 'Prestador que realiza el traslado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 12
      Top = 156
      Width = 175
      Height = 13
      Caption = 'Medio de transporte (veh'#237'culo)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 320
      Top = 156
      Width = 38
      Height = 13
      Caption = 'Estado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inline fraPRESTADOR_PRESTACION_ID: TfraPrestador
      Left = 6
      Top = 27
      Width = 574
      Height = 50
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 6
      ExplicitTop = 27
      ExplicitWidth = 574
      DesignSize = (
        574
        50)
      inherited lbCPostal: TLabel
        Left = 502
        ExplicitLeft = 502
      end
      inherited lbTelefono: TLabel
        Left = 414
        Visible = True
        ExplicitLeft = 414
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 119
        ExplicitWidth = 119
      end
      inherited cmbPrestador: TArtComboBox
        Width = 244
        ExplicitWidth = 244
      end
      inherited edPresDomicilio: TEdit
        Width = 249
        ExplicitWidth = 249
      end
      inherited edPresLocalidad: TEdit
        Width = 59
        ExplicitWidth = 59
      end
      inherited edPresCPostal: TEdit
        Left = 519
        ExplicitLeft = 519
      end
      inherited edPresTelefono: TEdit
        Left = 434
        Visible = True
        ExplicitLeft = 434
      end
      inherited sdqDatos: TSDQuery
        Top = 52
      end
      inherited dsDatos: TDataSource
        Top = 52
      end
    end
    inline fraPRESTADOR_TRASLADO_ID: TfraPrestador
      Left = 6
      Top = 99
      Width = 574
      Height = 50
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 6
      ExplicitTop = 99
      ExplicitWidth = 574
      DesignSize = (
        574
        50)
      inherited lbCPostal: TLabel
        Left = 502
        ExplicitLeft = 502
      end
      inherited lbTelefono: TLabel
        Left = 414
        Visible = True
        ExplicitLeft = 414
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 119
        ExplicitWidth = 119
      end
      inherited cmbPrestador: TArtComboBox
        Width = 244
        ExplicitWidth = 244
      end
      inherited edPresDomicilio: TEdit
        Width = 249
        ExplicitWidth = 249
      end
      inherited edPresLocalidad: TEdit
        Width = 59
        ExplicitWidth = 59
      end
      inherited edPresCPostal: TEdit
        Left = 519
        ExplicitLeft = 519
      end
      inherited edPresTelefono: TEdit
        Left = 434
        Visible = True
        ExplicitLeft = 434
      end
      inherited sdqDatos: TSDQuery
        Top = 52
      end
      inherited dsDatos: TDataSource
        Top = 52
      end
    end
    inline fraDT_ID: TfraCodDesc
      Left = 8
      Top = 172
      Width = 304
      Height = 23
      TabOrder = 3
      ExplicitLeft = 8
      ExplicitTop = 172
      inherited cmbDescripcion: TArtComboBox
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PATENTE'
            Title.Caption = 'Patente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_CANTLUGARES'
            Title.Caption = 'Lugares'
            Visible = True
          end>
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraFields = ' , DT_PATENTE, DT_CANTLUGARES '
        FieldBaja = 'DT_FECHABAJA'
        FieldCodigo = 'DT_IDPRESTADOR'
        FieldDesc = 'DT_DESCRIPCION'
        FieldID = 'DT_ID'
        IdType = ctInteger
        ShowBajas = True
        TableName = 'SIN.SDT_DETALLETRANSPORTE'
        OnChange = tbRefrescarClick
      end
    end
    object edCT_FECHAHORA: TJvMonthCalendar
      Left = 537
      Top = 0
      Width = 225
      Height = 209
      Hint = 'Haga click sobre el calendario para ver los traslados diarios'
      Align = alRight
      AutoSize = True
      Date = 39641.602693935190000000
      TabOrder = 0
      TabStop = True
      OnClick = tbRefrescarClick
      ExplicitLeft = 593
    end
    object cmbDISPONIBILIDAD: TComboBox
      Left = 316
      Top = 172
      Width = 129
      Height = 21
      Style = csDropDownList
      DropDownCount = 4
      TabOrder = 4
      OnChange = tbRefrescarClick
      Items.Strings = (
        'Disponibles'
        'Reservados'
        'Anulados')
    end
  end
  inherited CoolBar: TCoolBar
    Top = 209
    Width = 762
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 756
      end>
    ExplicitTop = 209
    ExplicitWidth = 762
    inherited ToolBar: TToolBar
      Width = 749
      ExplicitWidth = 749
      inherited tbNuevo: TToolButton
        Hint = 'Subir un paciente a la combi'
        Enabled = False
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Ajustar las columnas'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      object Panel2: TPanel
        Left = 370
        Top = 0
        Width = 10
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
      end
      object pnlReservado: TPanel
        Left = 380
        Top = 0
        Width = 69
        Height = 22
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Reservado'
        Color = 15716013
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'ta'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object pnlDisponible: TPanel
        Left = 449
        Top = 0
        Width = 69
        Height = 22
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Disponible'
        Color = 11921844
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'ta'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object pnlAnulado: TPanel
        Left = 518
        Top = 0
        Width = 69
        Height = 22
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Anulado'
        Color = 11451374
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'ta'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 587
        Top = 0
        Width = 10
        Height = 22
        BevelOuter = bvNone
        TabOrder = 5
      end
      object tbImprimirReporte: TToolButton
        Left = 597
        Top = 0
        Hint = 'Imprime el reporte para enviar al prestador del traslado'
        Caption = 'Impresi'#243'n'
        ImageIndex = 39
        OnClick = tbImprimirReporteClick
      end
      object Panel4: TPanel
        Left = 620
        Top = 0
        Width = 10
        Height = 22
        BevelOuter = bvNone
        TabOrder = 6
      end
      object Panel1: TPanel
        Left = 630
        Top = 0
        Width = 92
        Height = 22
        BevelOuter = bvNone
        TabOrder = 4
        object edCT_FECHA: TDBText
          Left = 4
          Top = 4
          Width = 70
          Height = 14
          AutoSize = True
          DataField = 'CT_FECHA'
          DataSource = dsConsulta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'ta'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 238
    Width = 762
    Height = 314
    Font.Name = 'Tahoma'
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TitleFont.Name = 'ta'
    OnGetCellProps = GridGetCellProps
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CT_FECHAHORA'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_NUMERO'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_IDPRESTADOR'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR_PRESTACION'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR_TRASLADO'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_NUMAUTO'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_USUGENERACION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CT_FECHAGENERACION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CT_USUASIGNACION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CT_FECHAASIGNACION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CT_USUANULACION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CT_FECHAANULACION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Width = 81
        Visible = True
      end>
  end
  object fpAbm: TFormPanel [3]
    Left = 60
    Top = 244
    Width = 720
    Height = 529
    Caption = 'Asignaci'#243'n manual de traslado de pacientes'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnShow = fpAbmShow
    Constraints.MinHeight = 400
    Constraints.MinWidth = 720
    DesignSize = (
      720
      529)
    object BevelAbm: TBevel
      Left = 4
      Top = 493
      Width = 712
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label4: TLabel
      Left = 16
      Top = 135
      Width = 104
      Height = 13
      Caption = 'Pacientes posibles'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Prestador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 84
      Width = 184
      Height = 13
      Caption = 'Prestador que realiza el traslado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 403
      Top = 84
      Width = 175
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Medio de transporte (veh'#237'culo)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 16
      Top = 449
      Width = 199
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Domicilio del paciente seleccionado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 371
      Top = 449
      Width = 207
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Empresa contratada para el traslado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAceptar: TButton
      Left = 565
      Top = 499
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 640
      Top = 499
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraCT_IDPRESTADOR: TfraPrestador
      Left = 12
      Top = 27
      Width = 696
      Height = 50
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 12
      ExplicitTop = 27
      ExplicitWidth = 696
      DesignSize = (
        696
        50)
      inherited lbLocalidad: TLabel
        Left = 206
        ExplicitLeft = 206
      end
      inherited lbCPostal: TLabel
        Left = 624
        ExplicitLeft = 624
      end
      inherited lbTelefono: TLabel
        Left = 536
        Visible = True
        ExplicitLeft = 536
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 102
        ExplicitWidth = 102
      end
      inherited cmbPrestador: TArtComboBox
        Width = 366
        ExplicitWidth = 366
      end
      inherited edPresDomicilio: TEdit
        Width = 153
        ExplicitWidth = 153
      end
      inherited edPresLocalidad: TEdit
        Left = 256
        Width = 270
        ExplicitLeft = 256
        ExplicitWidth = 270
      end
      inherited edPresCPostal: TEdit
        Left = 641
        ExplicitLeft = 641
      end
      inherited edPresTelefono: TEdit
        Left = 556
        Visible = True
        ExplicitLeft = 556
      end
      inherited sdqDatos: TSDQuery
        Top = 52
      end
      inherited dsDatos: TDataSource
        Top = 52
      end
    end
    object GridPacientes: TArtDBGrid
      Left = 12
      Top = 156
      Width = 696
      Height = 286
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsPacientes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = btnAceptarClick
      IniStorage = FormStorage
      OnGetCellProps = GridPacientesGetCellProps
      FooterBand = False
      TitleHeight = 34
      AutoTitleHeight = True
      Columns = <
        item
          Expanded = False
          FieldName = 'TJ_CUIL'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TJ_NOMBRE'
          Width = 221
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOMICILIO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AU_TURNOHORA'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PR_DESCRIPCION'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRANSPORTISTA'
          Title.Caption = 'Empresa contratada'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'SINIESTRO'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AU_NUMAUTO'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRASLADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Wingdings'
          Font.Style = []
          Title.Caption = #191'Traslado?'
          Visible = True
        end>
    end
    object edPRESTADOR_TRASLADO: TDBEdit
      Left = 12
      Top = 104
      Width = 384
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PRESTADOR_TRASLADO'
      DataSource = dsConsulta
      TabOrder = 4
    end
    object edDT_DESCRIPCION: TDBEdit
      Left = 399
      Top = 104
      Width = 309
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'DT_DESCRIPCION'
      DataSource = dsConsulta
      TabOrder = 5
    end
    object pnlPendientes: TPanel
      Left = 12
      Top = 500
      Width = 222
      Height = 22
      Anchors = [akLeft, akBottom]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Autorizaciones pendientes de aprobar'
      Color = 11451374
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'ta'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object pnlEnCondiciones: TPanel
      Left = 236
      Top = 500
      Width = 193
      Height = 22
      Anchors = [akLeft, akBottom]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Autorizaciones en condiciones'
      Color = 11921844
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'ta'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object edDOMICILIO: TDBEdit
      Left = 12
      Top = 465
      Width = 353
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      DataField = 'DOMICILIO'
      DataSource = dsPacientes
      TabOrder = 8
    end
    object edTRANSPORTISTA: TDBEdit
      Left = 368
      Top = 465
      Width = 341
      Height = 21
      Anchors = [akRight, akBottom]
      DataField = 'TRANSPORTISTA'
      DataSource = dsPacientes
      TabOrder = 9
    end
    object fpAnular: TFormPanel
      Left = 84
      Top = 212
      Width = 330
      Height = 80
      Caption = 'Ingrese motivo de anulaci'#243'n'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      OnShow = fpAnularShow
      Constraints.MinHeight = 80
      Constraints.MinWidth = 330
      DesignSize = (
        330
        80)
      object Bevel5: TBevel
        Left = -75
        Top = 42
        Width = 402
        Height = 3
        Anchors = [akRight, akBottom]
        Shape = bsBottomLine
      end
      object Label18: TLabel
        Left = 8
        Top = 13
        Width = 32
        Height = 13
        Caption = 'Motivo'
      end
      object btnAnuAceptar: TButton
        Left = 183
        Top = 50
        Width = 71
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnAnuAceptarClick
      end
      object btnAnuCancelar: TButton
        Left = 254
        Top = 50
        Width = 71
        Height = 24
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 2
      end
      inline fraMotivoAnulacion: TfraCodigoDescripcion
        Left = 48
        Top = 8
        Width = 277
        Height = 23
        TabOrder = 0
        ExplicitLeft = 48
        ExplicitTop = 8
        ExplicitWidth = 277
        DesignSize = (
          277
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 48
          Width = 225
          ExplicitLeft = 48
          ExplicitWidth = 225
        end
        inherited edCodigo: TPatternEdit
          Width = 44
          ExplicitWidth = 44
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterClose = sdqConsultaAfterClose
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT *'
      
        'FROM (SELECT ct_id, ct_idprestador, ct_iddetalletransporte, ct_f' +
        'echahora, TRUNC(ct_fechahora) as ct_fecha, ct_numero,'
      
        '             ct_idturnoprestacion, ct_idtraslado, ct_usugeneraci' +
        'on, ct_fechageneracion,'
      
        '             ct_usuasignacion, ct_fechaasignacion, ct_usuanulaci' +
        'on, ct_fechaanulacion,'
      
        '             cpr_prestacion.ca_descripcion AS prestador_prestaci' +
        'on,'
      
        '             cpr_prestacion.ca_identificador as prestador_presta' +
        'cion_id,'
      
        '             cpr_transportista.ca_descripcion AS prestador_trasl' +
        'ado,'
      
        '             cpr_transportista.ca_identificador as prestador_tra' +
        'slado_id,'
      '             cpr_transportista.ca_direlectronica as correo,'
      
        '             art.utiles.armar_siniestro(ex_siniestro, ex_orden, ' +
        'ex_recaida) AS siniestro, au_id, ex_id,'
      
        '             art.utiles.armar_domicilio(tj_calle, tj_numero, tj_' +
        'piso, tj_departamento, tj_localidad) as domicilio,'
      
        '             au_numauto, tj_nombre, tj_id, dt_descripcion, dt_id' +
        ','
      
        '             decode(ct_fechaanulacion, NULL, 1, 2) as disponibil' +
        'idad'
      
        '        FROM comunes.ctj_trabajador, art.sex_expedientes, art.sa' +
        'u_autorizaciones,'
      
        '             SIN.stp_turnosprestaciones, art.cpr_prestador cpr_t' +
        'ransportista,'
      
        '             art.cpr_prestador cpr_prestacion, SIN.sdt_detalletr' +
        'ansporte, SIN.sct_calendariotraslados'
      '       WHERE ct_idprestador = cpr_prestacion.ca_identificador'
      '         AND ct_iddetalletransporte = dt_id'
      '         AND dt_idprestador = cpr_transportista.ca_identificador'
      '         AND ct_idturnoprestacion = tp_id'
      '         AND tp_idautorizacion = au_id(+)'
      '         AND au_idexpediente = ex_id(+)'
      '         AND ex_cuil = tj_cuil(+)'
      '      UNION ALL'
      
        '      SELECT ct_id, ct_idprestador, ct_iddetalletransporte, ct_f' +
        'echahora, TRUNC(ct_fechahora) as ct_fecha, ct_numero,'
      
        '             ct_idturnoprestacion, ct_idtraslado, ct_usugeneraci' +
        'on, ct_fechageneracion,'
      
        '             ct_usuasignacion, ct_fechaasignacion, ct_usuanulaci' +
        'on, ct_fechaanulacion,'
      
        '             cpr_prestacion.ca_descripcion AS prestador_prestaci' +
        'on,'
      
        '             cpr_prestacion.ca_identificador as prestador_presta' +
        'cion_id,'
      
        '             cpr_transportista.ca_descripcion AS prestador_trasl' +
        'ado,'
      
        '             cpr_transportista.ca_identificador as prestador_tra' +
        'slado_id,'
      '             cpr_transportista.ca_direlectronica as correo,'
      
        '             art.utiles.armar_siniestro(ex_siniestro, ex_orden, ' +
        'ex_recaida) AS siniestro, au_id, ex_id,'
      
        '             art.utiles.armar_domicilio(tj_calle, tj_numero, tj_' +
        'piso, tj_departamento, tj_localidad) as domicilio,'
      
        '             au_numauto, tj_nombre, tj_id, dt_descripcion, dt_id' +
        ','
      
        '             decode(ct_fechaanulacion, NULL, 1, 2) as disponibil' +
        'idad'
      
        '        FROM comunes.ctj_trabajador, art.sex_expedientes, art.sa' +
        'u_autorizaciones,'
      
        '             art.str_traslados, art.cpr_prestador cpr_transporti' +
        'sta,'
      
        '             art.cpr_prestador cpr_prestacion, SIN.sdt_detalletr' +
        'ansporte, SIN.sct_calendariotraslados'
      '       WHERE ct_idprestador = cpr_prestacion.ca_identificador'
      '         AND ct_iddetalletransporte = dt_id'
      '         AND dt_idprestador = cpr_transportista.ca_identificador'
      '         AND ct_idtraslado = tr_id'
      '         AND tr_idauto = au_id(+)'
      '         AND au_idexpediente = ex_id(+)'
      '         AND ex_cuil = tj_cuil(+)'
      '         AND ct_idturnoprestacion IS NULL'
      '      UNION ALL'
      
        '      SELECT ct_id, ct_idprestador, ct_iddetalletransporte, ct_f' +
        'echahora, TRUNC(ct_fechahora) as ct_fecha, ct_numero,'
      
        '             ct_idturnoprestacion, ct_idtraslado, ct_usugeneraci' +
        'on, ct_fechageneracion,'
      
        '             ct_usuasignacion, ct_fechaasignacion, ct_usuanulaci' +
        'on, ct_fechaanulacion,'
      
        '             cpr_prestacion.ca_descripcion AS prestador_prestaci' +
        'on,'
      
        '             cpr_prestacion.ca_identificador as prestador_presta' +
        'cion_id,'
      
        '             cpr_transportista.ca_descripcion AS prestador_trasl' +
        'ado,'
      
        '             cpr_transportista.ca_identificador as prestador_tra' +
        'slado_id,'
      '             to_char(NULL) as correo,'
      '             NULL as siniestro, NULL as au_id, NULL as ex_id,'
      '             TO_CHAR(NULL) as domicilio,'
      
        '             NULL as au_numauto, NULL as tj_nombre, NULL as tj_i' +
        'd, dt_descripcion, dt_id,'
      
        '             decode(ct_fechaanulacion, NULL, 0, 2) as disponibil' +
        'idad             '
      
        '        FROM art.cpr_prestador cpr_transportista, art.cpr_presta' +
        'dor cpr_prestacion,'
      
        '             SIN.sdt_detalletransporte, SIN.sct_calendariotrasla' +
        'dos'
      '       WHERE ct_idprestador = cpr_prestacion.ca_identificador'
      '         AND ct_iddetalletransporte = dt_id'
      '         AND dt_idprestador = cpr_transportista.ca_identificador'
      '         AND ct_idtraslado IS NULL'
      '         AND ct_idturnoprestacion IS NULL)'
      'WHERE 1=1')
    Left = 20
    Top = 340
    object sdqConsultaCT_ID: TFloatField
      FieldName = 'CT_ID'
      Required = True
    end
    object sdqConsultaCT_FECHAHORA: TDateTimeField
      DisplayLabel = 'Hora'
      FieldName = 'CT_FECHAHORA'
      Required = True
      DisplayFormat = 'hh:nn'
    end
    object sdqConsultaCT_NUMERO: TFloatField
      DisplayLabel = 'Asiento'
      FieldName = 'CT_NUMERO'
      Required = True
    end
    object sdqConsultaCT_IDPRESTADOR: TFloatField
      DisplayLabel = 'Prestador'
      FieldName = 'CT_IDPRESTADOR'
      Required = True
    end
    object sdqConsultaCT_IDDETALLETRANSPORTE: TFloatField
      FieldName = 'CT_IDDETALLETRANSPORTE'
      Required = True
    end
    object sdqConsultaCT_IDTURNOPRESTACION: TFloatField
      FieldName = 'CT_IDTURNOPRESTACION'
    end
    object sdqConsultaCT_IDTRASLADO: TFloatField
      FieldName = 'CT_IDTRASLADO'
    end
    object sdqConsultaCT_USUGENERACION: TStringField
      DisplayLabel = 'Generaci'#243'n'
      FieldName = 'CT_USUGENERACION'
      Required = True
    end
    object sdqConsultaCT_FECHAGENERACION: TDateTimeField
      DisplayLabel = 'Fecha de generaci'#243'n'
      FieldName = 'CT_FECHAGENERACION'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sdqConsultaCT_USUASIGNACION: TStringField
      DisplayLabel = 'Asignaci'#243'n'
      FieldName = 'CT_USUASIGNACION'
    end
    object sdqConsultaCT_FECHAASIGNACION: TDateTimeField
      DisplayLabel = 'Fecha de asignaci'#243'n'
      FieldName = 'CT_FECHAASIGNACION'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sdqConsultaPRESTADOR_PRESTACION: TStringField
      DisplayLabel = 'Prestador'
      FieldName = 'PRESTADOR_PRESTACION'
      Size = 150
    end
    object sdqConsultaPRESTADOR_TRASLADO: TStringField
      DisplayLabel = 'Transportista'
      FieldName = 'PRESTADOR_TRASLADO'
      Size = 150
    end
    object sdqConsultaEX_ID: TFloatField
      FieldName = 'EX_ID'
    end
    object sdqConsultaSINIESTRO: TStringField
      DisplayLabel = 'Siniestro'
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqConsultaAU_ID: TFloatField
      FieldName = 'AU_ID'
    end
    object sdqConsultaAU_NUMAUTO: TFloatField
      DisplayLabel = 'N'#176' Auto'
      FieldName = 'AU_NUMAUTO'
    end
    object sdqConsultaTJ_NOMBRE: TStringField
      DisplayLabel = 'Paciente'
      FieldName = 'TJ_NOMBRE'
      Size = 60
    end
    object sdqConsultaTJ_ID: TFloatField
      FieldName = 'TJ_ID'
    end
    object sdqConsultaCT_FECHA: TDateTimeField
      FieldName = 'CT_FECHA'
    end
    object sdqConsultaCT_USUANULACION: TStringField
      DisplayLabel = 'Anulaci'#243'n'
      FieldName = 'CT_USUANULACION'
    end
    object sdqConsultaCT_FECHAANULACION: TDateTimeField
      DisplayLabel = 'Fecha de anulaci'#243'n'
      FieldName = 'CT_FECHAANULACION'
    end
    object sdqConsultaDT_DESCRIPCION: TStringField
      FieldName = 'DT_DESCRIPCION'
      Size = 250
    end
    object sdqConsultaPRESTADOR_TRASLADO_ID: TFloatField
      FieldName = 'PRESTADOR_TRASLADO_ID'
      Required = True
    end
    object sdqConsultaPRESTADOR_PRESTACION_ID: TFloatField
      FieldName = 'PRESTADOR_PRESTACION_ID'
      Required = True
    end
    object sdqConsultaDISPONIBILIDAD: TFloatField
      FieldName = 'DISPONIBILIDAD'
    end
    object sdqConsultaCORREO: TStringField
      FieldName = 'CORREO'
      Size = 150
    end
    object sdqConsultaDT_ID: TFloatField
      FieldName = 'DT_ID'
    end
    object sdqConsultaDOMICILIO: TStringField
      DisplayLabel = 'Domicilio'
      FieldName = 'DOMICILIO'
      Size = 4000
    end
  end
  inherited dsConsulta: TDataSource
    Left = 48
    Top = 340
  end
  inherited SortDialog: TSortDialog
    Left = 20
    Top = 368
  end
  inherited ExportDialog: TExportDialog
    Left = 48
    Top = 368
  end
  inherited QueryPrint: TQueryPrint
    Left = 48
    Top = 396
  end
  inherited Seguridad: TSeguridad
    Left = 20
    Top = 312
  end
  inherited FormStorage: TFormStorage
    Left = 48
    Top = 312
  end
  inherited PrintDialog: TPrintDialog
    Left = 20
    Top = 396
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
    Left = 76
    Top = 312
  end
  inherited FieldHider: TFieldHider
    Left = 76
    Top = 340
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
    Left = 76
    Top = 368
  end
  object sdqPacientes: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPacientesAfterOpen
    SQL.Strings = (
      
        'SELECT   tj_cuil, tj_nombre, ex_id, ex_siniestro, ex_orden, ex_r' +
        'ecaida,'
      
        '         art.utiles.armar_domicilio(tj_calle, tj_numero, tj_piso' +
        ', tj_departamento,'
      '                                    tj_localidad) AS domicilio,'
      
        '         tj_calle, tj_numero, tj_piso, tj_departamento, tj_cpost' +
        'al, tj_localidad, tj_provincia,'
      
        '         au_turnohora, pr_descripcion, ca_calle, ca_numero, ca_p' +
        'iso, ca_departamento,'
      
        '         ca_codpostal, ca_localidad, ca_provincia, ca_identifica' +
        'dor,'
      
        '         art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_r' +
        'ecaida) AS siniestro,'
      
        '         au_numauto, au_estado, ex_gtrabajo, au_id, au_aval, au_' +
        'observaciones,'
      '         TO_CHAR(NULL) AS transportista, '#39#251#39' AS traslado,'
      
        '         TO_CHAR(au_turno, '#39'dd/mm/yyyy'#39') AS fecha, au_turnohora ' +
        'AS hora'
      
        '    FROM comunes.ctj_trabajador, art.sex_expedientes, art.cpr_pr' +
        'estador, art.mpr_prestaciones,'
      '         art.sau_autorizaciones sau1'
      '   WHERE au_idexpediente = ex_id'
      '     AND ex_cuil = tj_cuil'
      '     AND au_turno = :fecha'
      '     AND au_identifprestador = :prestador'
      '     AND au_identifprestador = ca_identificador'
      '     AND au_estado IN('#39'A'#39', '#39'E'#39', '#39'C'#39', '#39'P'#39')'
      '     AND NVL(au_presapro, au_pressol) = pr_codigo'
      '     AND NOT EXISTS(SELECT 1'
      
        '                      FROM SIN.sct_calendariotraslados, art.str_' +
        'traslados,'
      '                           art.sau_autorizaciones sau2'
      '                     WHERE ct_idtraslado = tr_id'
      '                       AND tr_idauto = sau2.au_id'
      '                       AND tr_fecha = TRUNC(ct_fechahora)'
      
        '                       AND sau2.au_idautorizacionorigen = sau1.a' +
        'u_id'
      '                    UNION ALL'
      '                    SELECT 1'
      
        '                      FROM SIN.sct_calendariotraslados, SIN.stp_' +
        'turnosprestaciones,'
      '                           art.sau_autorizaciones sau2'
      '                     WHERE ct_idtraslado = tp_id'
      '                       AND tp_idautorizacion = sau2.au_id'
      '                       AND tp_fechaturno = TRUNC(ct_fechahora)'
      
        '                       AND sau2.au_idautorizacionorigen = sau1.a' +
        'u_id)'
      '     AND NOT EXISTS(SELECT 1'
      
        '                      FROM SIN.sct_calendariotraslados, art.str_' +
        'traslados,'
      '                           art.sau_autorizaciones sau2'
      '                     WHERE ct_idtraslado = tr_id'
      '                       AND tr_idauto = sau2.au_id'
      '                       AND tr_fecha = TRUNC(ct_fechahora)'
      '                       AND sau2.au_id = sau1.au_id'
      '                    UNION ALL'
      '                    SELECT 1'
      
        '                      FROM SIN.sct_calendariotraslados, SIN.stp_' +
        'turnosprestaciones,'
      '                           art.sau_autorizaciones sau2'
      '                     WHERE ct_idtraslado = tp_id'
      '                       AND tp_idautorizacion = sau2.au_id'
      '                       AND tp_fechaturno = TRUNC(ct_fechahora)'
      '                       AND sau2.au_id = sau1.au_id)'
      'UNION ALL'
      
        'SELECT   tj_cuil, tj_nombre, ex_id, ex_siniestro, ex_orden, ex_r' +
        'ecaida,'
      
        '         art.utiles.armar_domicilio(tj_calle, tj_numero, tj_piso' +
        ', tj_departamento,'
      '                                    tj_localidad) AS domicilio,'
      
        '         tj_calle, tj_numero, tj_piso, tj_departamento, tj_cpost' +
        'al, tj_localidad, tj_provincia,'
      
        '         tr_hora, pr_descripcion, prestador.ca_calle, prestador.' +
        'ca_numero, prestador.ca_piso,'
      
        '         prestador.ca_departamento, prestador.ca_codpostal, pres' +
        'tador.ca_localidad,'
      '         prestador.ca_provincia, prestador.ca_identificador,'
      
        '         art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_r' +
        'ecaida) AS siniestro,'
      
        '         au_numauto, au_estado, ex_gtrabajo, au_id, au_aval, au_' +
        'observaciones,'
      
        '         transporte.ca_descripcion AS transportista, '#39#252#39' AS tras' +
        'lado,'
      
        '         TO_CHAR(tr_fecha, '#39'dd/mm/yyyy'#39') AS fecha, tr_hora AS ho' +
        'ra'
      
        '    FROM comunes.ctj_trabajador, art.sau_autorizaciones sau1, ar' +
        't.str_traslados str1,'
      
        '         art.cpr_prestador prestador, art.cpr_prestador transpor' +
        'te, art.sex_expedientes,'
      '         art.mpr_prestaciones'
      '   WHERE au_idexpediente = ex_id'
      '     AND au_id = tr_idauto'
      '     AND ex_cuil = tj_cuil'
      '     AND NVL(au_presapro, au_pressol) = pr_codigo'
      '     AND au_presthasta = prestador.ca_identificador'
      '     AND au_presthasta = :prestador'
      
        '     AND NVL(au_identifapro, au_identifprestador) = transporte.c' +
        'a_identificador'
      '     AND tr_fecha = :fecha'
      '     AND au_estado IN('#39'A'#39', '#39'E'#39', '#39'C'#39', '#39'P'#39')'
      '     AND NOT EXISTS(SELECT 1'
      
        '                      FROM SIN.sct_calendariotraslados, art.str_' +
        'traslados str2,'
      '                           art.sau_autorizaciones sau2'
      '                     WHERE ct_idtraslado = str2.tr_id'
      '                       AND str2.tr_idauto = sau2.au_id'
      '                       AND str2.tr_fecha = TRUNC(ct_fechahora)'
      
        '                       AND sau2.au_idautorizacionorigen = sau1.a' +
        'u_id'
      '                       AND str2.tr_fecha = str1.tr_fecha'
      '                    UNION ALL'
      '                    SELECT 1'
      
        '                      FROM SIN.sct_calendariotraslados, SIN.stp_' +
        'turnosprestaciones,'
      '                           art.sau_autorizaciones sau2'
      '                     WHERE ct_idtraslado = tp_id'
      '                       AND tp_idautorizacion = sau2.au_id'
      '                       AND tp_fechaturno = TRUNC(ct_fechahora)'
      
        '                       AND sau2.au_idautorizacionorigen = sau1.a' +
        'u_id'
      '                       AND tp_fechaturno = str1.tr_fecha)'
      '     AND NOT EXISTS(SELECT 1'
      
        '                      FROM SIN.sct_calendariotraslados, art.str_' +
        'traslados str2,'
      '                           art.sau_autorizaciones sau2'
      '                     WHERE ct_idtraslado = str2.tr_id'
      '                       AND str2.tr_idauto = sau2.au_id'
      '                       AND str2.tr_fecha = TRUNC(ct_fechahora)'
      '                       AND sau2.au_id = sau1.au_id'
      '                       AND str2.tr_fecha = str1.tr_fecha'
      '                    UNION ALL'
      '                    SELECT 1'
      
        '                      FROM SIN.sct_calendariotraslados, SIN.stp_' +
        'turnosprestaciones,'
      '                           art.sau_autorizaciones sau2'
      '                     WHERE ct_idtraslado = tp_id'
      '                       AND tp_idautorizacion = sau2.au_id'
      '                       AND tp_fechaturno = TRUNC(ct_fechahora)'
      '                       AND sau2.au_id = sau1.au_id'
      '                       AND tp_fechaturno = str1.tr_fecha)'
      'ORDER BY au_turnohora')
    Left = 260
    Top = 404
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'prestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'prestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end>
    object sdqPacientesTJ_CUIL: TStringField
      DisplayLabel = 'CUIL'
      FieldName = 'TJ_CUIL'
      Required = True
      Size = 11
    end
    object sdqPacientesTJ_NOMBRE: TStringField
      DisplayLabel = 'Paciente'
      FieldName = 'TJ_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqPacientesDOMICILIO: TStringField
      DisplayLabel = 'Domicilio'
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqPacientesAU_TURNOHORA: TStringField
      DisplayLabel = 'Turno'
      FieldName = 'AU_TURNOHORA'
      Size = 5
    end
    object sdqPacientesPR_DESCRIPCION: TStringField
      DisplayLabel = 'Prestaci'#243'n'
      FieldName = 'PR_DESCRIPCION'
      Size = 50
    end
    object sdqPacientesSINIESTRO: TStringField
      DisplayLabel = 'Siniestro'
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqPacientesAU_NUMAUTO: TFloatField
      DisplayLabel = 'N'#176' Auto'
      FieldName = 'AU_NUMAUTO'
      Required = True
    end
    object sdqPacientesAU_ESTADO: TStringField
      FieldName = 'AU_ESTADO'
      Size = 1
    end
    object sdqPacientesEX_ID: TFloatField
      FieldName = 'EX_ID'
    end
    object sdqPacientesTJ_CALLE: TStringField
      FieldName = 'TJ_CALLE'
      Size = 60
    end
    object sdqPacientesTJ_NUMERO: TStringField
      FieldName = 'TJ_NUMERO'
      Size = 6
    end
    object sdqPacientesTJ_PISO: TStringField
      FieldName = 'TJ_PISO'
      Size = 6
    end
    object sdqPacientesTJ_DEPARTAMENTO: TStringField
      FieldName = 'TJ_DEPARTAMENTO'
      Size = 6
    end
    object sdqPacientesTJ_LOCALIDAD: TStringField
      FieldName = 'TJ_LOCALIDAD'
      Size = 85
    end
    object sdqPacientesTJ_PROVINCIA: TStringField
      FieldName = 'TJ_PROVINCIA'
      Size = 2
    end
    object sdqPacientesCA_CALLE: TStringField
      FieldName = 'CA_CALLE'
      Size = 60
    end
    object sdqPacientesCA_NUMERO: TStringField
      FieldName = 'CA_NUMERO'
    end
    object sdqPacientesCA_PISO: TFloatField
      FieldName = 'CA_PISO'
    end
    object sdqPacientesCA_DEPARTAMENTO: TStringField
      FieldName = 'CA_DEPARTAMENTO'
    end
    object sdqPacientesCA_LOCALIDAD: TStringField
      FieldName = 'CA_LOCALIDAD'
      Size = 85
    end
    object sdqPacientesCA_PROVINCIA: TStringField
      FieldName = 'CA_PROVINCIA'
      Size = 2
    end
    object sdqPacientesEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqPacientesEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object sdqPacientesEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object sdqPacientesTJ_CPOSTAL: TStringField
      FieldName = 'TJ_CPOSTAL'
      Size = 5
    end
    object sdqPacientesCA_CODPOSTAL: TStringField
      FieldName = 'CA_CODPOSTAL'
      Size = 5
    end
    object sdqPacientesEX_GTRABAJO: TStringField
      FieldName = 'EX_GTRABAJO'
      Size = 2
    end
    object sdqPacientesAU_ID: TFloatField
      FieldName = 'AU_ID'
      Required = True
    end
    object sdqPacientesAU_OBSERVACIONES: TStringField
      FieldName = 'AU_OBSERVACIONES'
      Size = 250
    end
    object sdqPacientesTRANSPORTISTA: TStringField
      FieldName = 'TRANSPORTISTA'
      Size = 150
    end
    object sdqPacientesTRASLADO: TStringField
      FieldName = 'TRASLADO'
      Size = 1
    end
    object sdqPacientesFECHA: TStringField
      FieldName = 'FECHA'
      Size = 10
    end
    object sdqPacientesHORA: TStringField
      FieldName = 'HORA'
      Size = 5
    end
    object sdqPacientesCA_IDENTIFICADOR: TFloatField
      FieldName = 'CA_IDENTIFICADOR'
    end
    object sdqPacientesAU_AVAL: TFloatField
      FieldName = 'AU_AVAL'
    end
  end
  object dsPacientes: TDataSource
    DataSet = sdqPacientes
    Left = 288
    Top = 404
  end
end
