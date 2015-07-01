inherited frmGruposPrestador: TfrmGruposPrestador
  Left = 604
  Top = 155
  Caption = 'Grupos por prestador'
  ExplicitLeft = 604
  ExplicitTop = 155
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 617
      end>
    inherited ToolBar: TToolBar
      inherited tbPropiedades: TToolButton
        Hint = 'Usuarios'
        ImageIndex = 26
        Visible = True
        OnClick = tbPropiedadesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'GP_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'GP_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_DESCRIPCION'
        Title.Caption = 'Nombre'
        Width = 500
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_USUBAJA'
        Title.Caption = 'Usu Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 373
    Height = 113
    OnShow = fpAbmShow
    ExplicitWidth = 373
    ExplicitHeight = 113
    inherited BevelAbm: TBevel
      Top = 77
      Width = 365
      ExplicitTop = 77
      ExplicitWidth = 365
    end
    object Label1: TLabel [1]
      Left = 18
      Top = 20
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 18
      Top = 47
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    inherited btnAceptar: TButton
      Left = 215
      Top = 83
      ExplicitLeft = 215
      ExplicitTop = 83
    end
    inherited btnCancelar: TButton
      Left = 293
      Top = 83
      ExplicitLeft = 293
      ExplicitTop = 83
    end
    object edCodigo: TIntEdit
      Left = 69
      Top = 17
      Width = 79
      Height = 21
      TabOrder = 2
    end
    object edDescripcion: TEdit
      Left = 69
      Top = 44
      Width = 284
      Height = 21
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'select gp_id, gp_codigo, gp_descripcion, gp_usubaja, gp_fechabaj' +
        'a'
      'from SIN.sgp_gruposprestador')
    object sdqConsultaGP_ID: TFloatField
      FieldName = 'GP_ID'
      Required = True
    end
    object sdqConsultaGP_CODIGO: TStringField
      FieldName = 'GP_CODIGO'
      Size = 10
    end
    object sdqConsultaGP_DESCRIPCION: TStringField
      FieldName = 'GP_DESCRIPCION'
      Size = 200
    end
    object sdqConsultaGP_USUBAJA: TStringField
      FieldName = 'GP_USUBAJA'
    end
    object sdqConsultaGP_FECHABAJA: TDateTimeField
      FieldName = 'GP_FECHABAJA'
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
