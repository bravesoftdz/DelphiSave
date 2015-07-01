inherited frmManRDO_DOCUMENTO: TfrmManRDO_DOCUMENTO
  Left = 95
  Top = 100
  Width = 652
  Height = 440
  Caption = 'Mantenimiento de Documentos'
  Constraints.MinHeight = 440
  Constraints.MinWidth = 652
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 644
    Height = 29
    Visible = True
    object dbisBusqueda: TDBIncrementalSearch
      Left = 8
      Top = 4
      Width = 629
      Height = 21
      Hint = 'B'#250'squeda por descripci'#243'n'
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      KeyField = 'td_ID'
      ListField = 'td_DESCRIPCION'
      ListSource = dsConsulta
    end
  end
  inherited CoolBar: TCoolBar
    Top = 29
    Width = 644
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 640
      end>
    inherited ToolBar: TToolBar
      Width = 627
    end
  end
  inherited Grid: TArtDBGrid
    Top = 58
    Width = 644
    Height = 354
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'td_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'td_DESCRIPCION'
        Title.Caption = 'Documento'
        Width = 338
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Sector'
        Width = 117
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TD_INCAPACIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Digitaliza Incap.'
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 76
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Top = 140
    Height = 137
    Constraints.MaxHeight = 137
    Constraints.MinHeight = 137
    Constraints.MinWidth = 461
    inherited BevelAbm: TBevel
      Top = 101
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 43
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 72
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object Label3: TLabel [3]
      Left = 9
      Top = 14
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    inherited btnAceptar: TButton
      Left = 306
      Top = 107
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Top = 107
      TabOrder = 4
    end
    object edDO_DESCRIPCION: TEdit
      Left = 80
      Top = 39
      Width = 373
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 1
    end
    inline fraDO_SECTOR: TfraCodigoDescripcion
      Left = 80
      Top = 67
      Width = 374
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Left = 96
        Width = 277
      end
      inherited edCodigo: TPatternEdit
        Width = 92
      end
    end
    object edDO_CODIGO: TPatternEdit
      Left = 80
      Top = 10
      Width = 93
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 5
      TabOrder = 0
      Pattern = '0123456789ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ'
    end
    object chkIncapacidad: TCheckBox
      Left = 319
      Top = 12
      Width = 134
      Height = 17
      TabStop = False
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Digitaliza Incapacidades'
      TabOrder = 5
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TD_ID, TD_CODIGO, TD_DESCRIPCION, SC_DESCRIPCION, TD_SECT' +
        'OR, TRUNC(TD_FECHABAJA) FECHABAJA, TD_INCAPACIDAD'
      'FROM RTD_TIPODOCUMENTO, USC_SECTORES'
      'WHERE TD_SECTOR = SC_CODIGO(+)'
      'ORDER BY TD_DESCRIPCION')
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
      end>
  end
end
