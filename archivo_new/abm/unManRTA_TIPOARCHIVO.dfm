inherited frmManRTA_TIPOARCHIVO: TfrmManRTA_TIPOARCHIVO
  Left = 107
  Top = 134
  Width = 630
  Height = 470
  Caption = 'Mantenimiento de Tipos de Archivos'
  Constraints.MinHeight = 470
  Constraints.MinWidth = 630
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 622
    Height = 29
    Visible = True
    DesignSize = (
      622
      29)
    object Label2: TLabel
      Left = 4
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object dbiBusqueda: TDBIncrementalSearch
      Left = 68
      Top = 4
      Width = 551
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      KeyField = 'TA_ID'
      ListField = 'TA_DESCRIPCION'
      ListSource = dsConsulta
    end
  end
  inherited CoolBar: TCoolBar
    Top = 29
    Width = 622
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 618
      end>
    inherited ToolBar: TToolBar
      Width = 605
    end
  end
  inherited Grid: TArtDBGrid
    Top = 58
    Width = 622
    Height = 384
    Columns = <
      item
        Expanded = False
        FieldName = 'TA_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 264
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_TABLA'
        Title.Caption = 'Tabla'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_CAMPOSBUSQUEDA'
        Title.Caption = 'Campos B'#250'squeda Carpeta'
        Width = 169
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 88
    Width = 460
    Height = 199
    BorderIcons = [biMinimize, biMaximize]
    ActiveControl = edTA_CODIGO
    Constraints.MaxHeight = 199
    Constraints.MinHeight = 199
    Constraints.MinWidth = 460
    OnEnter = fpAbmEnter
    DesignSize = (
      460
      199)
    inherited BevelAbm: TBevel
      Top = 163
      Width = 452
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel [2]
      Left = 8
      Top = 40
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label4: TLabel [3]
      Left = 8
      Top = 94
      Width = 27
      Height = 13
      Caption = 'Tabla'
    end
    object Label5: TLabel [4]
      Left = 8
      Top = 120
      Width = 78
      Height = 13
      Caption = 'Clave B'#250'squeda'
    end
    object Label6: TLabel [5]
      Left = 8
      Top = 67
      Width = 94
      Height = 13
      Caption = 'Descripc. Reducida'
    end
    inherited btnAceptar: TButton
      Left = 302
      Top = 169
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 380
      Top = 169
      TabOrder = 8
    end
    object edTA_CODIGO: TEdit
      Left = 109
      Top = 8
      Width = 77
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 0
    end
    object edTA_DESCRIPCION: TEdit
      Left = 109
      Top = 36
      Width = 342
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 1
    end
    object edTA_TABLA: TPatternEdit
      Left = 109
      Top = 90
      Width = 125
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 3
      Pattern = 'abcdefghijklmnopqrstuvwxyz0123456789_'
    end
    object chkCreaCarpNumerada: TCheckBox
      Left = 245
      Top = 92
      Width = 145
      Height = 17
      Caption = 'Crear Carpeta Numerada'
      TabOrder = 4
    end
    inline fraTipoClave: TfraCodigoDescripcion
      Left = 108
      Top = 116
      Width = 345
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      DesignSize = (
        345
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 280
      end
    end
    object chkTA_TIENEREPOSITORIO: TCheckBox
      Left = 8
      Top = 143
      Width = 114
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Posee Repositorio'
      TabOrder = 6
    end
    object edTA_DESCRIPCIONREDUCIDA: TEdit
      Left = 109
      Top = 63
      Width = 342
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 28
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TA_ID, TA_CODIGO, TA_DESCRIPCION, TA_DESCRIPCIONREDUCIDA,' +
        ' TA_TABLA, TA_FORMULARIO,'
      
        '       TA_CREACARPETA, TA_FECHABAJA, TA_TIENEREPOSITORIO, TC_CAM' +
        'POSBUSQUEDA'
      'FROM RTC_TIPOCLAVE, RTA_TIPOARCHIVO'
      'WHERE TA_FORMULARIO = TC_CLAVE')
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
