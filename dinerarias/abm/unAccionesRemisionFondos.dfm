inherited frmAccionesRemisionFondos: TfrmAccionesRemisionFondos
  Left = 442
  Top = 173
  Caption = 'Acciones para remisi'#243'n de fondos'
  ExplicitLeft = 442
  ExplicitTop = 173
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 49
    Visible = True
    ExplicitHeight = 49
    object rgVerBajas: TRadioGroup
      Left = 0
      Top = 0
      Width = 181
      Height = 48
      Caption = 'Ver Bajas'
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 0
    end
  end
  inherited CoolBar: TCoolBar
    Top = 49
  end
  inherited Grid: TArtDBGrid
    Top = 78
    Height = 358
    Columns = <
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'Cod. Acci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_USUALTA'
        Title.Caption = 'Usu. Alta'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 421
    Height = 113
    ExplicitWidth = 421
    ExplicitHeight = 113
    inherited BevelAbm: TBevel
      Top = 77
      Width = 413
    end
    object Label1: TLabel [1]
      Left = 15
      Top = 19
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 15
      Top = 44
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 263
      Top = 83
    end
    inherited btnCancelar: TButton
      Left = 341
      Top = 83
    end
    object edCodigo: TEdit
      Left = 83
      Top = 13
      Width = 71
      Height = 21
      TabOrder = 2
    end
    object edDescripcion: TEdit
      Left = 83
      Top = 39
      Width = 324
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'select ac_codigo, ac_descripcion, ac_fechaalta, ac_usualta, ac_i' +
        'd, ac_fechabaja from din.dac_accionescasosrf')
    object sdqConsultaAC_CODIGO: TStringField
      FieldName = 'AC_CODIGO'
      Required = True
      Size = 2
    end
    object sdqConsultaAC_DESCRIPCION: TStringField
      FieldName = 'AC_DESCRIPCION'
      Required = True
      Size = 100
    end
    object sdqConsultaAC_FECHAALTA: TDateTimeField
      FieldName = 'AC_FECHAALTA'
    end
    object sdqConsultaAC_USUALTA: TStringField
      FieldName = 'AC_USUALTA'
    end
    object sdqConsultaAC_ID: TFloatField
      FieldName = 'AC_ID'
      Required = True
    end
    object sdqConsultaAC_FECHABAJA: TDateTimeField
      FieldName = 'AC_FECHABAJA'
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
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 56
    Top = 316
  end
end
