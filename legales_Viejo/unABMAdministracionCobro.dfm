object frmABMAdministracionCobro: TfrmABMAdministracionCobro
  Left = 382
  Top = 217
  Width = 460
  Height = 320
  Caption = 'Administraci'#243'n de Cobro'
  Color = clBtnFace
  Constraints.MinHeight = 320
  Constraints.MinWidth = 460
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    452
    293)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 15
    Top = 44
    Width = 78
    Height = 13
    Caption = 'Forma de Cobro:'
  end
  object Label2: TLabel
    Left = 27
    Top = 94
    Width = 66
    Height = 13
    Caption = 'Comprobante:'
  end
  object lbFechaVto: TLabel
    Left = 244
    Top = 94
    Width = 109
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Fecha de Vencimiento:'
  end
  object Label4: TLabel
    Left = 59
    Top = 69
    Width = 33
    Height = 13
    Caption = 'Monto:'
  end
  object Label5: TLabel
    Left = 276
    Top = 69
    Width = 76
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Fecha de Pago:'
  end
  object Label3: TLabel
    Left = 19
    Top = 118
    Width = 74
    Height = 13
    Caption = 'Observaciones:'
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 452
    Height = 31
    BorderWidth = 1
    ButtonWidth = 25
    Caption = 'ToolBar'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    TabOrder = 7
    object tbNuevo: TToolButton
      Left = 0
      Top = 2
      Hint = 'Alta'
      Caption = 'tbNuevo'
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = tbNuevoClick
    end
    object tblSeparador1: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'tblSeparador1'
      ImageIndex = 7
      Style = tbsDivider
    end
    object tbEliminar: TToolButton
      Left = 33
      Top = 2
      Hint = 'Baja'
      Caption = 'tbEliminar'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = tbEliminarClick
    end
    object tblSeparador3: TToolButton
      Left = 58
      Top = 2
      Width = 8
      Caption = 'tblSeparador3'
      ImageIndex = 9
      Style = tbsDivider
      Visible = False
    end
    object tbGrabar: TToolButton
      Left = 66
      Top = 2
      Hint = 'Grabar'
      Caption = 'tbGrabar'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = tbGrabarClick
    end
    object tblSeparador4: TToolButton
      Left = 91
      Top = 2
      Width = 9
      Caption = 'tblSeparador4'
      ImageIndex = 4
      Style = tbsDivider
      Visible = False
    end
    object tbSalir: TToolButton
      Left = 100
      Top = 2
      Hint = 'Salir'
      Caption = 'tbSalir'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = tbSalirClick
    end
  end
  object ArtDBGrid: TArtDBGrid
    Left = 6
    Top = 164
    Width = 445
    Height = 123
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsConsulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = ArtDBGridGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'RC_SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_ORDEN'
        Title.Caption = 'Orden'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_NUMERO'
        Title.Caption = 'Numero'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_TIPO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Forma de Pago'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_NROCOMPROBANTE'
        Title.Caption = 'Nro.Comprobante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_MONTO'
        Title.Caption = 'Monto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_FECHAVENCIMIENTO'
        Title.Caption = 'F.Vencimiento'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_FECHAPAGO'
        Title.Caption = 'F.Pago'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RC_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RC_USUMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RC_FECHAMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RC_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RC_FECHABAJA'
        Visible = False
      end>
  end
  object cmbFormaPago: TRxDBLookupCombo
    Left = 96
    Top = 39
    Width = 348
    Height = 21
    DropDownCount = 8
    Anchors = [akLeft, akTop, akRight]
    LookupField = 'TB_CODIGO'
    LookupDisplay = 'TB_DESCRIPCION'
    LookupSource = dsFormaPago
    TabOrder = 0
  end
  object edRC_FECHAVENCIMIENTO: TDateComboBox
    Left = 355
    Top = 90
    Width = 88
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 4
  end
  object edRC_NROCOMPROBANTE: TEdit
    Left = 96
    Top = 90
    Width = 86
    Height = 21
    MaxLength = 12
    TabOrder = 3
  end
  object edRC_MONTO: TCurrencyEdit
    Left = 97
    Top = 65
    Width = 86
    Height = 20
    AutoSize = False
    MaxLength = 10
    TabOrder = 1
  end
  object edRC_FECHAPAGO: TDateComboBox
    Left = 355
    Top = 66
    Width = 88
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 2
  end
  object edRC_OBSERVACIONES: TMemo
    Left = 96
    Top = 115
    Width = 346
    Height = 43
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      '')
    MaxLength = 250
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT L.RC_SINIESTRO, L.RC_ORDEN, L.RC_NUMERO, L.RC_TIPO, T.TB_' +
        'DESCRIPCION, L.RC_NROCOMPROBANTE, '
      
        #9'   L.RC_MONTO, L.RC_OBSERVACIONES, L.RC_FECHAVENCIMIENTO, L.RC_' +
        'FECHAPAGO, L.RC_USUALTA, '
      
        #9'   L.RC_FECHAALTA, L.RC_USUMODIF, L.RC_FECHAMODIF, L.RC_USUBAJA' +
        ', L.RC_FECHABAJA'
      '  FROM LRC_RECUPEROCOBRO L, CTB_TABLAS T'
      ' WHERE L.RC_TIPO = T.TB_CODIGO'
      '   AND T.TB_CLAVE = '#39'COBRO'#39
      ' ')
    Left = 8
    Top = 209
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 37
    Top = 209
  end
  object sdqFormaPago: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      '  FROM CTB_TABLAS '
      ' WHERE TB_CLAVE = '#39'COBRO'#39
      '   AND TB_CODIGO > '#39'0'#39)
    Left = 100
    Top = 35
  end
  object dsFormaPago: TDataSource
    DataSet = sdqFormaPago
    Left = 129
    Top = 36
  end
end
