inherited frmManCGI_GIS: TfrmManCGI_GIS
  Left = 175
  Top = 168
  Width = 534
  Caption = 'Mantenimiento de Excepciones del GIS'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 526
    Height = 57
    Visible = True
    object Label2: TLabel
      Left = 12
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Provincia'
    end
    inline fraGI_PROVINCIA: TfraCodDesc
      Left = 8
      Top = 22
      Width = 280
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 215
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'NULL'
        FieldCodigo = 'PV_CODIGO'
        FieldDesc = 'PV_DESCRIPCION'
        FieldID = 'PV_CODIGO'
        OrderBy = 'PV_DESCRIPCION'
        ShowBajas = True
        TableName = 'CPV_PROVINCIAS'
        OnChange = tbRefrescarClick
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 57
    Width = 526
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 522
      end>
    inherited ToolBar: TToolBar
      Width = 509
    end
  end
  inherited Grid: TArtDBGrid
    Top = 86
    Width = 526
    Height = 353
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'GI_LOCALIDAD'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GI_SIN_CALLES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GI_REEMPLAZAR_POR'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GI_PROVINCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GI_DEFAULT'
        Width = 152
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 152
    Width = 349
    Height = 225
    inherited BevelAbm: TBevel
      Top = 189
      Width = 341
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 100
      Width = 43
      Height = 13
      Caption = 'Provincia'
    end
    object Label3: TLabel [2]
      Left = 12
      Top = 12
      Width = 44
      Height = 13
      Caption = 'Localidad'
    end
    object Label4: TLabel [3]
      Left = 12
      Top = 56
      Width = 87
      Height = 13
      Caption = 'Reemplazar por...'
    end
    object Label5: TLabel [4]
      Left = 12
      Top = 144
      Width = 122
      Height = 13
      Caption = 'Direcci'#243'n predeterminada'
    end
    inherited btnAceptar: TButton
      Left = 194
      Top = 195
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 269
      Top = 195
      TabOrder = 6
    end
    inline fraProvincia: TfraCodDesc
      Left = 8
      Top = 116
      Width = 333
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 268
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 63
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'NULL'
        FieldCodigo = 'PV_CODIGO'
        FieldDesc = 'PV_DESCRIPCION'
        FieldID = 'PV_CODIGO'
        OrderBy = 'PV_DESCRIPCION'
        ShowBajas = True
        TableName = 'CPV_PROVINCIAS'
      end
    end
    object edLocalidad: TEdit
      Left = 8
      Top = 32
      Width = 329
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object chkSinCalles: TCheckBox
      Left = 220
      Top = 12
      Width = 117
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Sin trazado de calles'
      TabOrder = 0
    end
    object edReemplazarPor: TEdit
      Left = 8
      Top = 76
      Width = 329
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edDireccionPredeterminada: TEdit
      Left = 8
      Top = 164
      Width = 329
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM COMUNES.CGI_GIS'
      'WHERE 1=1')
    object sdqConsultaGI_LOCALIDAD: TStringField
      DisplayLabel = 'Localidad'
      FieldName = 'GI_LOCALIDAD'
      Required = True
      Size = 100
    end
    object sdqConsultaGI_SIN_CALLES: TStringField
      DisplayLabel = 'Sin calles'
      FieldName = 'GI_SIN_CALLES'
      Size = 1
    end
    object sdqConsultaGI_REEMPLAZAR_POR: TStringField
      DisplayLabel = 'Reemplazar por'
      FieldName = 'GI_REEMPLAZAR_POR'
      Size = 100
    end
    object sdqConsultaGI_PROVINCIA: TStringField
      DisplayLabel = 'Provincia'
      FieldName = 'GI_PROVINCIA'
      Required = True
      Size = 2
    end
    object sdqConsultaGI_DEFAULT: TStringField
      DisplayLabel = 'Direcci'#243'n predeterminada'
      FieldName = 'GI_DEFAULT'
      Size = 100
    end
    object sdqConsultaGI_ID: TFloatField
      FieldName = 'GI_ID'
    end
    object sdqConsultaGI_USUALTA: TStringField
      FieldName = 'GI_USUALTA'
    end
    object sdqConsultaGI_FECHAALTA: TDateTimeField
      FieldName = 'GI_FECHAALTA'
    end
    object sdqConsultaGI_USUMODIF: TStringField
      FieldName = 'GI_USUMODIF'
    end
    object sdqConsultaGI_FECHAMODIF: TDateTimeField
      FieldName = 'GI_FECHAMODIF'
    end
    object sdqConsultaGI_USUBAJA: TStringField
      FieldName = 'GI_USUBAJA'
    end
    object sdqConsultaGI_FECHABAJA: TDateTimeField
      FieldName = 'GI_FECHABAJA'
    end
  end
end
