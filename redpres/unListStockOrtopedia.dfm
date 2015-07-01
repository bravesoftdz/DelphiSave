inherited frmListStockOrtopedia: TfrmListStockOrtopedia
  Left = 255
  Top = 204
  Width = 600
  Height = 393
  Caption = 'Materiales de ortopedia en stock'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 600
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Height = 49
    object GroupBox3: TGroupBox
      Left = 166
      Top = 2
      Width = 207
      Height = 43
      Caption = ' Fecha de alta '
      TabOrder = 1
      object Label4: TLabel
        Left = 97
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object dcHastaAlta: TDateComboBox
        Left = 113
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeAlta
        TabOrder = 1
      end
      object dcDesdeAlta: TDateComboBox
        Left = 6
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaAlta
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 379
      Top = 2
      Width = 207
      Height = 43
      Caption = ' Fecha de modificaci'#243'n '
      TabOrder = 2
      object Label1: TLabel
        Left = 97
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object dcHastaModif: TDateComboBox
        Left = 113
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeModif
        TabOrder = 1
      end
      object dcDesdeModif: TDateComboBox
        Left = 6
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaModif
        TabOrder = 0
      end
    end
    object gbEstado: TGroupBox
      Left = 3
      Top = 2
      Width = 158
      Height = 43
      Caption = ' Estado '
      TabOrder = 0
      DesignSize = (
        158
        43)
      object cmbEstado: TComboBox
        Left = 7
        Top = 15
        Width = 144
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Todos'
          'Activos'
          'Baja'
          'Entregados')
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 49
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited ToolButton5: TToolButton
        Visible = True
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
      inherited tbPropiedades: TToolButton
        Hint = 'Baja por desgaste (Ctrl+D)'
        Enabled = False
        ImageIndex = 45
        Visible = True
        OnClick = tbPropiedadesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 78
    Width = 592
    Height = 288
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SO_ID'
        Title.Alignment = taCenter
        Title.Caption = 'Id. Mat.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_DESCRIPCION'
        Title.Caption = 'Material'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIGEN'
        Title.Caption = 'Origen'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SO_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SO_FECHAMODIF'
        Title.Alignment = taCenter
        Title.Caption = 'F. Modificaci'#243'n'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 250
        Visible = True
      end>
  end
  object fpDetalle: TFormPanel [3]
    Left = 96
    Top = 112
    Width = 457
    Height = 217
    Caption = 'Detalle de movimientos'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      457
      217)
    object Bevel2: TBevel
      Left = 3
      Top = 184
      Width = 451
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object btnCancelarDetalle: TButton
      Left = 384
      Top = 189
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 0
    end
    object dgDetalle: TArtDBGrid
      Left = 0
      Top = 0
      Width = 457
      Height = 181
      Align = alTop
      DataSource = dsDetalle
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SINIESTRO'
          Title.Alignment = taCenter
          Title.Caption = 'Siniestro'
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'AU_NUMAUTO'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Aut.'
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MS_FECHAENTREGA'
          Title.Alignment = taCenter
          Title.Caption = 'F. Entrega'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MS_FECHADEVOLUCION'
          Title.Alignment = taCenter
          Title.Caption = 'F. Devoluci'#243'n'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MS_OBSERVACION'
          Title.Caption = 'Observaciones'
          Width = 200
          Visible = True
        end>
    end
  end
  object fpAlta: TFormPanel [4]
    Left = 168
    Top = 104
    Width = 321
    Height = 162
    Caption = 'Alta de material'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      321
      162)
    object Label2: TLabel
      Left = 14
      Top = 7
      Width = 37
      Height = 13
      Caption = 'Material'
    end
    object Label3: TLabel
      Left = 5
      Top = 69
      Width = 49
      Height = 13
      Caption = 'Observac.'
    end
    object Bevel1: TBevel
      Left = 3
      Top = 129
      Width = 315
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object edMaterialAlta: TMemo
      Left = 56
      Top = 5
      Width = 259
      Height = 59
      MaxLength = 250
      TabOrder = 0
    end
    object edObservAlta: TMemo
      Left = 56
      Top = 67
      Width = 259
      Height = 59
      MaxLength = 250
      TabOrder = 1
    end
    object btnCancelarAlta: TButton
      Left = 247
      Top = 134
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object btnAceptarAlta: TButton
      Left = 172
      Top = 134
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnAceptarAltaClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT so_id, so_descripcion, '
      '       DECODE(so_origen, '#39'R'#39', '#39'Recupero'#39', '#39'C'#39', '#39'Compra'#39') origen,'
      
        '       DECODE(so_estado, '#39'A'#39', '#39'Activo'#39', '#39'B'#39', '#39'Baja'#39', '#39'E'#39', '#39'Entre' +
        'gado'#39') estado, '
      
        '       so_observaciones, so_fechaalta, so_fechamodif, so_fechaba' +
        'ja'
      '  FROM amed.mso_stock_ortopedia')
    Left = 32
    Top = 180
  end
  inherited dsConsulta: TDataSource
    Left = 60
    Top = 180
  end
  inherited SortDialog: TSortDialog
    Left = 32
    Top = 208
  end
  inherited ExportDialog: TExportDialog
    Left = 60
    Top = 208
  end
  inherited QueryPrint: TQueryPrint
    Left = 60
    Top = 124
  end
  inherited Seguridad: TSeguridad
    Left = 32
    Top = 152
  end
  inherited FormStorage: TFormStorage
    Left = 60
    Top = 152
  end
  inherited PrintDialog: TPrintDialog
    Left = 32
    Top = 124
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
        LinkControl = tbSalir
      end
      item
        Key = 16452
        LinkControl = tbPropiedades
      end>
    Left = 88
    Top = 152
  end
  inherited FieldHider: TFieldHider
    Left = 88
    Top = 180
  end
  object sdqDetalle: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ms_id, ms_fechaentrega, ms_fechadevolucion, ms_observacio' +
        'n, au_numauto,'
      
        '               utiles.armar_siniestro(au_siniestro, au_orden, au' +
        '_recaida) siniestro'
      '   FROM amed.mms_movim_stock, sau_autorizaciones'
      'WHERE ms_idautorizacion = au_id'
      '      AND ms_fechabaja IS NULL '
      '      AND ms_idstock = :pIdStock')
    Left = 32
    Top = 236
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIdStock'
        ParamType = ptInput
      end>
  end
  object dsDetalle: TDataSource
    DataSet = sdqDetalle
    Left = 60
    Top = 236
  end
end
