inherited frmManCNO_NOVEDADES: TfrmManCNO_NOVEDADES
  Left = 255
  Top = 175
  Caption = 'Mantenimiento de novedades de los sistemas'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 137
    Visible = True
    object clbEjecutables: TARTCheckListBox
      Left = 0
      Top = 0
      Width = 621
      Height = 137
      Align = alClient
      Columns = 4
      ItemHeight = 13
      PopupMenu = pmuPopUp
      TabOrder = 0
      OnClick = clbEjecutablesClick
      AutoAjustarColumnas = False
      SQL = 
        ' SELECT ej_descripcion as descripcion, ej_id AS codigo FROM comu' +
        'nes.cej_ejecutable WHERE ej_fechabaja IS NULL ORDER BY 1 '
    end
  end
  inherited CoolBar: TCoolBar
    Top = 137
    inherited ToolBar: TToolBar
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 166
    Height = 266
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'EJ_DESCRIPCION'
        Title.Caption = 'Ejecutable'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHA'
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_DESCRIPCION'
        Title.Caption = 'Texto de la novedad'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EJ_ACTIVO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_IDEJECUTABLE'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 136
    Top = 160
    Height = 201
    inherited BevelAbm: TBevel
      Top = 165
    end
    object Label1: TLabel [1]
      Left = 16
      Top = 52
      Width = 171
      Height = 13
      Caption = 'Novedad (m'#225'ximo 1000 caracteres)'
    end
    object Label2: TLabel [2]
      Left = 16
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Ejecutable'
    end
    inherited btnAceptar: TButton
      Left = 306
      Top = 171
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Top = 171
    end
    object edNO_DESCRIPCION: TMemo
      Left = 12
      Top = 68
      Width = 437
      Height = 89
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 999
      TabOrder = 2
    end
    inline fraNO_IDEJECUTABLE: TfraCodDesc
      Left = 12
      Top = 24
      Width = 440
      Height = 23
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 375
      end
      inherited Propiedades: TPropiedadesFrame
        TableName = 'COMUNES.CEJ_EJECUTABLE'
        FieldID = 'EJ_ID'
        FieldCodigo = 'EJ_ID'
        FieldDesc = 'EJ_DESCRIPCION'
        FieldBaja = 'EJ_FECHABAJA'
        OrderBy = 'EJ_DESCRIPCION'
        CodigoType = ctInteger
        IdType = ctInteger
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ej_activo, ej_descripcion, no_fecha, no_descripcion, no_i' +
        'd, no_idejecutable'
      '  FROM comunes.cej_ejecutable, comunes.cno_novedades'
      ' WHERE ej_id = no_idejecutable')
    object sdqConsultaEJ_ACTIVO: TStringField
      FieldName = 'EJ_ACTIVO'
      Size = 1
    end
    object sdqConsultaEJ_DESCRIPCION: TStringField
      FieldName = 'EJ_DESCRIPCION'
      Size = 1024
    end
    object sdqConsultaNO_FECHA: TDateTimeField
      FieldName = 'NO_FECHA'
    end
    object sdqConsultaNO_DESCRIPCION: TStringField
      FieldName = 'NO_DESCRIPCION'
      Size = 1000
    end
    object sdqConsultaNO_ID: TFloatField
      FieldName = 'NO_ID'
      Required = True
    end
    object sdqConsultaNO_IDEJECUTABLE: TFloatField
      FieldName = 'NO_IDEJECUTABLE'
      Required = True
    end
  end
  object pmuPopUp: TPopupMenu
    Left = 80
    Top = 256
    object mnuSeleccionarTodos: TMenuItem
      Caption = 'Seleccionar todos'
      OnClick = mnuSeleccionarTodosClick
    end
    object mnuNoSeleccionarNinguno: TMenuItem
      Caption = 'No seleccionar ninguno'
      OnClick = mnuNoSeleccionarNingunoClick
    end
  end
end
