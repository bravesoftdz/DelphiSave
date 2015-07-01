object frmReasignacionAbogado: TfrmReasignacionAbogado
  Left = 203
  Top = 107
  Caption = 'Reasiganci'#243'n de Abogados'
  ClientHeight = 292
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    753
    292)
  PixelsPerInch = 96
  TextHeight = 13
  object cbAbogados: TCoolBar
    Left = 0
    Top = 0
    Width = 753
    Height = 29
    Bands = <
      item
        Control = tbrAbogados
        ImageIndex = -1
        MinHeight = 27
        Width = 747
      end>
    object tbrAbogados: TToolBar
      Left = 9
      Top = 0
      Width = 740
      Height = 27
      BorderWidth = 1
      ButtonWidth = 26
      Caption = 'ToolBar'
      HotImages = dmLegales.ilByN
      Images = dmLegales.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Transparent = True
      object tbCambioAbogado: TToolButton
        Tag = 1
        Left = 0
        Top = 0
        Hint = 'Cambio Juzgado'
        ImageIndex = 24
        OnClick = tbCambioAbogadoClick
      end
      object tbEditarCambioAbogado: TToolButton
        Left = 26
        Top = 0
        Caption = 'tbEditarCambioAbogado'
        ImageIndex = 7
        OnClick = tbEditarCambioAbogadoClick
      end
      object tbEliminarCambioAbogado: TToolButton
        Left = 52
        Top = 0
        Hint = 'Eliminar Cambio de Instancia'
        Caption = 'tbEliminarCambioAbogado'
        ImageIndex = 8
        OnClick = tbEliminarCambioAbogadoClick
      end
      object tbSinAsignar: TToolButton
        Left = 78
        Top = 0
        Caption = 'Sin Asignar'
        ImageIndex = 30
        OnClick = tbSinAsignarClick
      end
      object tbSeparador2: TToolButton
        Left = 104
        Top = 0
        Width = 8
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbImprimirAsignacionAbogados: TToolButton
        Left = 112
        Top = 0
        Hint = 'Imprimir Instancias de Juicio'
        ImageIndex = 4
      end
      object tbSeparador3: TToolButton
        Left = 138
        Top = 0
        Width = 7
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalirAbogadosAsignados: TToolButton
        Left = 145
        Top = 0
        Caption = 'tbSalirAbogadosAsignados'
        ImageIndex = 5
        OnClick = tbSalirAbogadosAsignadosClick
      end
    end
  end
  object dbGridAbogadosJuicio: TDBGrid
    Left = 6
    Top = 33
    Width = 737
    Height = 256
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsAbogadosJuicioEnTramite
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'AA_FECHAINICIOASIGNACION'
        Title.Caption = 'F.Inicio Asign.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AA_FECHAFINASIGNACION'
        Title.Caption = 'F.Fin Asign.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_NOMBRE'
        Title.Caption = 'Abogado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MA_DESCRIPCION'
        Title.Caption = 'Motivo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_DIRECCION'
        Title.Caption = 'Direcci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_CODAREATELEFONO'
        Title.Caption = 'Cod.Area'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_PREFIJOTELEFONO'
        Title.Caption = 'Prefijo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AA_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AA_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AA_IDABOGADO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AA_IDJUICIOENTRAMITE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AA_IDMOTIVOREASIGNACION'
        Visible = False
      end>
  end
  object fpCambioAbogadoJuicio: TFormPanel
    Left = 136
    Top = 65
    Width = 465
    Height = 167
    HelpContext = 7
    Caption = 'Instancias de la Causa'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poScreenCenter
    DesignSize = (
      465
      167)
    object bvSeparadorBotones: TBevel
      Left = 7
      Top = 130
      Width = 450
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lblDetalle: TLabel
      Left = 11
      Top = 85
      Width = 74
      Height = 13
      Caption = 'Observaciones:'
    end
    object lblMotivo: TLabel
      Left = 11
      Top = 18
      Width = 74
      Height = 13
      Caption = 'Motivo Reasig.:'
    end
    object lbAbogado: TLabel
      Left = 11
      Top = 42
      Width = 81
      Height = 13
      Caption = 'Nuevo Abogado:'
    end
    object lblFechaEvento: TLabel
      Left = 11
      Top = 66
      Width = 61
      Height = 13
      Caption = 'Fecha Inicio:'
    end
    object lblVencimientoEvento: TLabel
      Left = 239
      Top = 66
      Width = 105
      Height = 13
      Caption = 'Fecha Fin Asignaci'#243'n:'
    end
    object btnAceptar: TButton
      Left = 292
      Top = 136
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 374
      Top = 136
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object mObservacionesReasignacionAbogado: TMemo
      Left = 105
      Top = 86
      Width = 347
      Height = 33
      MaxLength = 2048
      TabOrder = 2
    end
    inline fraMotivoCambioAbogado: TfraCodigoDescripcionExt
      Left = 105
      Top = 13
      Width = 235
      Height = 23
      TabOrder = 3
      ExplicitLeft = 105
      ExplicitTop = 13
      ExplicitWidth = 235
      inherited cmbDescripcion: TArtComboBox
        Left = 53
        Width = 170
        ExplicitLeft = 53
        ExplicitWidth = 170
      end
      inherited edCodigo: TPatternEdit
        Width = 50
        ExplicitWidth = 50
      end
    end
    inline fraAbogadosPropios: TfraAbogadosLegales
      Left = 105
      Top = 38
      Width = 235
      Height = 23
      TabOrder = 4
      ExplicitLeft = 105
      ExplicitTop = 38
      ExplicitWidth = 235
      inherited cmbDescripcion: TArtComboBox
        Left = 53
        Width = 171
        ExplicitLeft = 53
        ExplicitWidth = 171
      end
      inherited edCodigo: TPatternEdit
        Width = 50
        ExplicitWidth = 50
      end
    end
    object edFechaInicioAsignacion: TDateComboBox
      Left = 106
      Top = 61
      Width = 101
      Height = 21
      MinDate = 37257.000000000000000000
      MaxDateCombo = edFechaFinAsignacion
      TabOrder = 5
    end
    object edFechaFinAsignacion: TDateComboBox
      Left = 352
      Top = 62
      Width = 101
      Height = 21
      MinDate = 37257.000000000000000000
      MinDateCombo = edFechaInicioAsignacion
      TabOrder = 6
    end
  end
  object dsAbogadosJuicioEnTramite: TDataSource
    DataSet = sdqAbogadosJuicioEnTramite
    Left = 63
    Top = 216
  end
  object sdqAbogadosJuicioEnTramite: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqAbogadosJuicioEnTramiteAfterScroll
    SQL.Strings = (
      'SELECT '
      '       lbo.bo_nombre, lbo.bo_direccion, lbo.bo_telefono,'
      
        '       lbo.bo_codareatelefono, lbo.bo_prefijotelefono, laa.aa_id' +
        ','
      '       laa.aa_idabogado, laa.aa_fechainicioasignacion,'
      '       laa.aa_fechafinasignacion, laa.aa_idmotivoreasignacion,'
      '       lma.ma_descripcion, laa.aa_idjuicioentramite,'
      '       laa.aa_observaciones'
      '  FROM legales.laa_abogadoasignado laa,'
      '       legales.lbo_abogado lbo,'
      '       legales.lma_motivoasignacion lma'
      ' WHERE      lbo.bo_id = laa.aa_idabogado'
      '        AND lma.ma_id = laa.aa_idmotivoreasignacion'
      '        AND laa.aa_fechabaja is null'
      '        AND LAA.AA_IDJUICIOENTRAMITE = :IDJUICIOENTRAMITE '
      'ORDER BY  laa.aa_id asc')
    Left = 35
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idjuicioentramite'
        ParamType = ptInput
        Value = '4442'
      end>
  end
end
