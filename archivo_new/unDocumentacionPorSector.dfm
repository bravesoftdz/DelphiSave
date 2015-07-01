inherited frmDocumentacionPorSector: TfrmDocumentacionPorSector
  Left = 90
  Top = 165
  Caption = 'Stock de documentaci'#243'n por sector'
  ClientHeight = 370
  ClientWidth = 692
  Constraints.MinHeight = 400
  Constraints.MinWidth = 700
  OldCreateOrder = True
  Position = poOwnerFormCenter
  ExplicitLeft = 90
  ExplicitTop = 165
  ExplicitWidth = 700
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 107
    ExplicitWidth = 692
    ExplicitHeight = 107
    DesignSize = (
      692
      107)
    object gbSectores: TGroupBox
      Left = 5
      Top = 1
      Width = 359
      Height = 43
      Caption = 'Sectores'
      TabOrder = 0
      DesignSize = (
        359
        43)
      object cmbSectores: TDBCheckCombo
        Left = 9
        Top = 15
        Width = 342
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsSectores
        KeyField = 'SC_CODIGO'
        ListField = 'SC_DESCRIPCION'
      end
    end
    object gbUsuarios: TGroupBox
      Left = 366
      Top = 1
      Width = 324
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Usuarios'
      TabOrder = 1
      DesignSize = (
        324
        43)
      object cmbUsuarios: TDBCheckCombo
        Left = 9
        Top = 15
        Width = 307
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ItemsSeparator = ';'
        DataSource = dsUsuario
        KeyField = 'SE_USUARIO'
        ListField = 'SE_NOMBRE'
      end
    end
    object gbFecha: TGroupBox
      Left = 471
      Top = 44
      Width = 220
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Fecha Recepci'#243'n'
      TabOrder = 3
      object Label9: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaRecepDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaRecepHasta
        TabOrder = 0
      end
      object edFechaRecepHasta: TDateComboBox
        Left = 121
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaRecepDesde
        TabOrder = 1
      end
    end
    object gbArchivo: TGroupBox
      Left = 5
      Top = 44
      Width = 463
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Archivo'
      TabOrder = 2
      DesignSize = (
        463
        43)
      inline fraTipoArchivo: TfraCodigoDescripcion
        Left = 9
        Top = 15
        Width = 447
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 9
        ExplicitTop = 15
        ExplicitWidth = 447
        DesignSize = (
          447
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 96
          Width = 350
          ExplicitLeft = 96
          ExplicitWidth = 350
        end
        inherited edCodigo: TPatternEdit
          Left = 2
          Width = 90
          ExplicitLeft = 2
          ExplicitWidth = 90
        end
      end
    end
    object chkExcluirArchivosSinMovimCarpetas: TCheckBox
      Left = 5
      Top = 91
      Width = 231
      Height = 11
      Caption = 'Excluir Carpetas en Permanencia del Sector'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  inherited CoolBar: TCoolBar
    Top = 107
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 686
      end>
    ExplicitTop = 94
    ExplicitWidth = 692
    inherited ToolBar: TToolBar
      Width = 677
      ExplicitWidth = 677
      DesignSize = (
        673
        23)
      inherited tbEnviarMail: TToolButton
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object pnlSeleccionados: TPanel
        Left = 378
        Top = 0
        Width = 191
        Height = 22
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = ' Cant. Seleccionados: '
        TabOrder = 0
        object edCantSelecc: TCardinalEdit
          Left = 107
          Top = 0
          Width = 82
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 136
    Width = 692
    Height = 234
    PopupMenu = pmnuSeleccionar
    OnCellClick = GridCellClick
    OnKeyUp = GridKeyUp
    MultiSelect = True
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRSECTOR'
        Title.Caption = 'Sector'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UBICACION'
        Title.Caption = 'Ubicaci'#243'n'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOARCHIVO'
        Title.Caption = 'Tipo Archivo'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLAVE'
        Title.Caption = 'Clave'
        Width = 221
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recepci'#243'n'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTUDIOLEG'
        Title.Caption = 'Estudio Legal / Abogado'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESPONDEA'
        Title.Caption = 'Receptor eMail'
        Width = 206
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACPENDIENTE'
        Title.Caption = 'Observaciones GyD por todo Concepto'
        Width = 449
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
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
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object sdqSectores: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT SC_CODIGO, SC_DESCRIPCION'
      'FROM USC_SECTORES'
      'WHERE SC_FECHABAJA IS NULL'
      'ORDER BY SC_DESCRIPCION'
      ''
      '')
    Left = 201
    Top = 13
  end
  object dsSectores: TDataSource
    DataSet = sdqSectores
    Left = 229
    Top = 13
  end
  object pmnuSeleccionar: TPopupMenu
    Left = 144
    Top = 200
    object mnuMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
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
    Left = 108
    Top = 200
  end
  object sdqUsuario: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT SE_USUARIO, SE_NOMBRE || DECODE(SE_FECHABAJA, NULL, '#39#39', '#39 +
        ' (Dado de baja)'#39') as SE_NOMBRE, SE_SECTOR, SE_PERFIL, SE_FECHABA' +
        'JA'
      '  FROM USE_USUARIOS, USC_SECTORES'
      ' WHERE SE_SECTOR=SC_CODIGO'
      '   AND SC_SISTEMAARCHIVO='#39'S'#39
      '   AND SE_USUARIOGENERICO = '#39'N'#39
      'ORDER BY SE_NOMBRE')
    Left = 459
    Top = 16
  end
  object dsUsuario: TDataSource
    DataSet = sdqUsuario
    Left = 487
    Top = 16
  end
end
