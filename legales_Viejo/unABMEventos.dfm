inherited frmABMEventos: TfrmABMEventos
  Left = 32
  Top = 53
  Caption = 'Administraci'#243'n de Eventos.'
  ClientHeight = 474
  ClientWidth = 747
  Constraints.MinHeight = 477
  Constraints.MinWidth = 676
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  OnActivate = FSFormActivate
  ExplicitWidth = 755
  ExplicitHeight = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 747
    Height = 189
    ExplicitWidth = 747
    ExplicitHeight = 189
    DesignSize = (
      747
      189)
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
      Width = 81
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
      TabOrder = 16
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
      TabOrder = 15
    end
  end
  inherited CoolBar: TCoolBar
    Top = 189
    Width = 747
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 28
        Width = 741
      end>
    ExplicitTop = 189
    ExplicitWidth = 747
    inherited ToolBar: TToolBar
      Width = 734
      Height = 28
      ExplicitWidth = 734
      ExplicitHeight = 28
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
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
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 218
    Width = 747
    Height = 256
    Columns = <
      item
        Expanded = False
        FieldName = 'GE_NROEVENTO'
        Title.Caption = 'Nro. Evento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 198
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_FECHA'
        Title.Caption = 'Fecha'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 330
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEADJUNTO'
        Title.Caption = 'Tiene Adjunto'
        Width = 72
        Visible = True
      end>
  end
  object frmPanelABMEventos: TFormPanel [3]
    Left = 193
    Top = 221
    Width = 446
    Height = 269
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      446
      269)
    object lbNroGasto: TLabel
      Left = 29
      Top = 11
      Width = 57
      Height = 13
      Caption = 'Nro.Evento:'
      Visible = False
    end
    object lbConcepto: TLabel
      Left = 47
      Top = 35
      Width = 37
      Height = 13
      Caption = 'Evento:'
    end
    object lbFecha: TLabel
      Left = 51
      Top = 61
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object lbObservaciones: TLabel
      Left = 10
      Top = 83
      Width = 74
      Height = 13
      Caption = 'Observaciones:'
    end
    object lblArchivosAsociados: TLabel
      Left = 13
      Top = 213
      Width = 64
      Height = 13
      Caption = 'Asociar Doc.:'
    end
    object lblEventoRE: TLabel
      Left = 91
      Top = 35
      Width = 71
      Height = 13
      Caption = 'lblEventoRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAceptar: TButton
      Left = 279
      Top = 238
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 5
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 361
      Top = 238
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
    object edGE_NROEVENTO: TIntEdit
      Left = 90
      Top = 7
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
      Visible = False
      Alignment = taRightJustify
    end
    object edGE_FECHA: TDateComboBox
      Left = 90
      Top = 57
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object eGE_OBSERVACIONES: TMemo
      Left = 90
      Top = 84
      Width = 344
      Height = 120
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 2048
      ScrollBars = ssVertical
      TabOrder = 3
    end
    inline fraEvento: TfraCtbTablas
      Left = 90
      Top = 31
      Width = 346
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 90
      ExplicitTop = 31
      ExplicitWidth = 346
      DesignSize = (
        346
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 294
        ExplicitWidth = 294
      end
    end
    object tbrVerArchivosAsociados: TToolBar
      Left = 381
      Top = 209
      Width = 55
      Height = 27
      Align = alNone
      Anchors = [akRight, akBottom]
      BorderWidth = 1
      ButtonWidth = 25
      HotImages = dmLegales.ilColor
      Images = dmLegales.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      object tbSeleccionArchivosAsociar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Seleccionar Archivos'
        ImageIndex = 26
        OnClick = tbSeleccionArchivosAsociarClick
      end
      object tbAsociarDoc: TToolButton
        Left = 25
        Top = 0
        Hint = 'Asociar Doc.'
        Caption = 'tbAsociarDoc'
        ImageIndex = 23
        OnClick = tbAsociarDocClick
      end
    end
    object edtArchivosAsociados: TEdit
      Left = 90
      Top = 211
      Width = 289
      Height = 21
      Anchors = [akLeft, akRight]
      Color = 16776176
      ReadOnly = True
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ge_nroevento, tb_descripcion, ge_fecha, ge_observaciones,' +
        ' ge_codigo, ge_id,'
      '       NVL((SELECT DISTINCT '#39'S'#39
      '                       FROM legales.leg_eventoarchivogd'
      '                      WHERE eg_ideventogd = ge_id'
      
        '                        AND eg_fechabaja IS NULL), '#39'N'#39') tieneadj' +
        'unto'
      '  FROM ctb_tablas, lge_eventosgdeuda'
      ' WHERE tb_codigo = ge_codigo'
      '   AND tb_clave = '#39'EVEGD'#39
      '   AND ge_nroorden = :nroorden'
      '   AND ge_nroevento > 0')
    Left = 8
    Top = 322
    ParamData = <
      item
        DataType = ftInteger
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
        Title = 'Nro. Evento'
        DataField = 'GE_NROEVENTO'
        FieldIndex = 0
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'TB_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Fecha'
        DataField = 'GE_FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'GE_OBSERVACIONES'
        FieldIndex = 0
      end
      item
        Title = 'GE_CODIGO'
        DataField = 'GE_CODIGO'
        FieldIndex = 0
      end>
    Left = 9
    Top = 350
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'GE_NROEVENTO'
        Title = 'Nro. Evento'
      end
      item
        DataField = 'TB_DESCRIPCION'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'GE_FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'GE_OBSERVACIONES'
        Title = 'Observaciones'
      end
      item
        DataField = 'GE_CODIGO'
        Title = 'GE_CODIGO'
        Save = False
      end>
    Left = 37
    Top = 350
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Nro. Evento'
        DataField = 'GE_NROEVENTO'
        MaxLength = 10
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'TB_DESCRIPCION'
        MaxLength = 50
      end
      item
        Title = 'Fecha'
        DataField = 'GE_FECHA'
        MaxLength = 12
      end
      item
        Title = 'Observaciones'
        DataField = 'GE_OBSERVACIONES'
        MaxLength = 50
      end
      item
        Title = 'GE_CODIGO'
        DataField = 'GE_CODIGO'
        Visible = False
        MaxLength = 0
      end>
    Title.Text = 'Eventos'
    SubTitle.Font.Height = -11
    SubTitle.Font.Style = []
    SubTitle.Alignment = taLeftJustify
    PageOrientation = pxLandscape
    Left = 34
    Top = 378
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
    Top = 294
  end
  inherited FieldHider: TFieldHider
    Left = 65
    Top = 322
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
    Left = 96
    Top = 296
  end
  object sdqArchivosAsociados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT eg_descripcion, eg_patharchivo, eg_id'
      '  FROM legales.leg_eventoarchivogd'
      ' WHERE eg_ideventogd = :ideventogd'
      '   AND eg_fechabaja IS NULL')
    Left = 175
    Top = 391
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ideventogd'
        ParamType = ptInput
      end>
  end
  object cdsArchivosAsociados: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PATHARCHIVO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'STATE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 147
    Top = 391
    Data = {
      7F0000009619E0BD0100000018000000040000000000030000007F000B444553
      4352495043494F4E01004900000001000557494454480200020064000B504154
      484152434849564F010049000000010005574944544802000200640002494404
      0001000000000005535441544501004900000001000557494454480200020001
      000000}
  end
end
