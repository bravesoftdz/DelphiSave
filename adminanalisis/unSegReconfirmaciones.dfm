inherited frmSegReconfirmaciones: TfrmSegReconfirmaciones
  Left = 183
  Top = 153
  Width = 589
  Height = 424
  Caption = 'Seguimiento de Recofirmaciones'
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 214
    Width = 581
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  inherited pnlFiltros: TPanel
    Width = 581
    Height = 49
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 581
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Trabajador'
      TabOrder = 0
      DesignSize = (
        581
        45)
      inline fraTrabajador: TfraTrabajador
        Left = 9
        Top = 17
        Width = 562
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbNombre: TArtComboBox
          Width = 478
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 49
    Width = 581
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 577
      end>
    inherited ToolBar: TToolBar
      Width = 564
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 6
        Visible = False
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 0
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        ImageIndex = 1
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 2
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 16
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 5
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 7
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 27
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 9
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 18
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 20
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 10
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 78
    Width = 581
    Height = 136
    OnDblClick = tbModificarClick
    Columns = <
      item
        Expanded = False
        FieldName = 'RE_EVENTO'
        Title.Caption = 'Nro.Evento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RE_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Descrpci'#243'n'
        Width = 293
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RE_FECHA'
        Title.Caption = 'Fecha'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RE_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 158
        Visible = True
      end>
  end
  object fpAbm: TFormPanel [4]
    Left = 124
    Top = 124
    Width = 413
    Height = 237
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    Constraints.MinHeight = 161
    Constraints.MinWidth = 300
    DesignSize = (
      413
      237)
    object Label1: TLabel
      Left = 5
      Top = 12
      Width = 54
      Height = 13
      Caption = 'Evento Nro'
    end
    object Label2: TLabel
      Left = 5
      Top = 40
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel
      Left = 5
      Top = 70
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label4: TLabel
      Left = 5
      Top = 100
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 200
      Width = 405
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object edEvento: TIntEdit
      Left = 81
      Top = 8
      Width = 77
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    inline fraCodigo: TfraCtbTablas
      Left = 80
      Top = 36
      Width = 327
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 274
      end
    end
    object edFecha: TDateComboBox
      Left = 80
      Top = 66
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edObservaciones: TMemo
      Left = 80
      Top = 96
      Width = 325
      Height = 101
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 1000
      TabOrder = 3
    end
    object btnAceptar: TButton
      Left = 252
      Top = 208
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 4
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 332
      Top = 208
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
    end
  end
  object pnlSpool: TPanel [5]
    Left = 0
    Top = 217
    Width = 581
    Height = 173
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT RE_EVENTO, RE_CODIGO, TB_DESCRIPCION, RE_FECHA, RE_OBSERV' +
        'ACIONES'
      '  FROM ARE_RECONFIRMACIONEVENTOS, CTB_TABLAS'
      ' WHERE TB_CLAVE = '#39'ERECO'#39
      '   AND TB_CODIGO = RE_CODIGO'
      '   AND 1 = 2')
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Nro.Evento'
        DataField = 'RE_EVENTO'
        FieldIndex = 0
      end
      item
        Title = 'C'#243'digo'
        DataField = 'RE_CODIGO'
        FieldIndex = 0
      end
      item
        Title = 'Descrpci'#243'n'
        DataField = 'TB_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Fecha'
        DataField = 'RE_FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'RE_OBSERVACIONES'
        FieldIndex = 0
      end>
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'RE_EVENTO'
        Title = 'Nro.Evento'
      end
      item
        DataField = 'RE_CODIGO'
        Title = 'C'#243'digo'
      end
      item
        DataField = 'TB_DESCRIPCION'
        Title = 'Descrpci'#243'n'
      end
      item
        DataField = 'RE_FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'RE_OBSERVACIONES'
        Title = 'Observaciones'
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Nro.Evento'
        DataField = 'RE_EVENTO'
        MaxLength = 10
      end
      item
        Title = 'C'#243'digo'
        DataField = 'RE_CODIGO'
        MaxLength = 5
      end
      item
        Title = 'Descrpci'#243'n'
        DataField = 'TB_DESCRIPCION'
        MaxLength = 150
      end
      item
        Title = 'Fecha'
        DataField = 'RE_FECHA'
        MaxLength = 18
      end
      item
        Title = 'Observaciones'
        DataField = 'RE_OBSERVACIONES'
        MaxLength = 1000
      end>
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
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
