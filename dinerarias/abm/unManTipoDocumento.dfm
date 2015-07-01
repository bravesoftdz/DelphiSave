inherited frmManTipoDocumento: TfrmManTipoDocumento
  Left = 296
  Top = 157
  Caption = 'Mantenimiento de tipo de documentaci'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 44
    Visible = True
    object GroupBox1: TGroupBox
      Left = 2
      Top = 0
      Width = 472
      Height = 39
      TabOrder = 0
      DesignSize = (
        472
        39)
      object Label1: TLabel
        Left = 8
        Top = 15
        Width = 92
        Height = 13
        Caption = 'Tipo de documento'
      end
      inline fraTipoDocumento: TfraCodDesc
        Left = 106
        Top = 10
        Width = 362
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 297
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'oc_fechabaja'
          FieldCodigo = 'oc_codigo'
          FieldDesc = 'oc_descripcion'
          FieldID = 'oc_id'
          OrderBy = 'oc_codigo'
          TableName = 'sin.soc_origencasosdocum'
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 44
  end
  inherited Grid: TArtDBGrid
    Top = 73
    Height = 366
    Columns = <
      item
        Expanded = False
        FieldName = 'oc_descripcion'
        Title.Caption = 'Tipo documento'
        Width = 230
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'td_codigo'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'td_descripcion'
        Title.Caption = 'Descripci'#243'n'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'td_clase'
        Title.Alignment = taCenter
        Title.Caption = 'Cod. clase'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'clase'
        Title.Caption = 'Descripci'#243'n clase'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'td_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 70
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 104
    Height = 151
    inherited BevelAbm: TBevel
      Top = 115
    end
    object Label2: TLabel [1]
      Left = 5
      Top = 13
      Width = 77
      Height = 13
      Caption = 'Tipo documento'
    end
    object Label3: TLabel [2]
      Left = 49
      Top = 65
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label4: TLabel [3]
      Left = 27
      Top = 91
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label5: TLabel [4]
      Left = 56
      Top = 38
      Width = 26
      Height = 13
      Caption = 'Clase'
    end
    inherited btnAceptar: TButton
      Top = 121
    end
    inherited btnCancelar: TButton
      Top = 121
    end
    inline fraTipoDocumentoABM: TfraCodDesc
      Left = 92
      Top = 7
      Width = 365
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 300
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraFields = ', oc_manual'
        FieldBaja = 'oc_fechabaja'
        FieldCodigo = 'oc_codigo'
        FieldDesc = 'oc_descripcion'
        FieldID = 'oc_id'
        OrderBy = 'oc_codigo'
        TableName = 'sin.soc_origencasosdocum'
      end
    end
    object edClaseABM: TEdit
      Left = 92
      Top = 34
      Width = 49
      Height = 21
      MaxLength = 1
      TabOrder = 3
    end
    object edCodigoABM: TEdit
      Left = 92
      Top = 60
      Width = 49
      Height = 21
      MaxLength = 5
      TabOrder = 4
    end
    object edDescripcionABM: TEdit
      Left = 92
      Top = 86
      Width = 362
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT td_id, td_codigo, td_descripcion, td_clase, oc_descripcio' +
        'n, td_fechabaja, oc_id,'
      
        '       DECODE(td_clase, '#39'R'#39', '#39'Reintegro'#39', '#39'P'#39', '#39'Pago directo'#39', '#39 +
        'I'#39', '#39'Incapacidades'#39', '#39'M'#39', '#39'Mortales'#39', '#39'O'#39', '#39'Otros'#39') clase'
      '  FROM SIN.std_tipodocumento, SIN.soc_origencasosdocum'
      ' WHERE td_idorigen = oc_id')
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
