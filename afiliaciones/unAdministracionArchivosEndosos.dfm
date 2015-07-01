inherited frmAdministracionArchivosEndosos: TfrmAdministracionArchivosEndosos
  Left = 632
  Top = 272
  Caption = 'Administraci'#243'n Archivos Endosos'
  FormStyle = fsNormal
  Visible = False
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 615
      end>
    inherited ToolBar: TToolBar
      Width = 608
      ExplicitWidth = 608
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Visualizar Archivo'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'ae_nombrearchivo'
        Title.Caption = 'Archivo'
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ae_usualta'
        Title.Caption = 'Usuario Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ae_fechaalta'
        Title.Caption = 'F. Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ae_usumodif'
        Title.Caption = 'Usuario. Mod.'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ae_fechamodif'
        Title.Caption = 'Fecha Mod.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ae_usubaja'
        Title.Caption = 'Usuario Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ae_fechabaja'
        Title.Caption = 'F. Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 48
    Top = 140
    Width = 409
    Height = 93
    ExplicitLeft = 48
    ExplicitTop = 140
    ExplicitWidth = 409
    ExplicitHeight = 93
    inherited BevelAbm: TBevel
      Top = 57
      Width = 401
      ExplicitTop = 57
      ExplicitWidth = 401
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Archivo'
    end
    inherited btnAceptar: TButton
      Left = 251
      Top = 63
      ExplicitLeft = 251
      ExplicitTop = 63
    end
    inherited btnCancelar: TButton
      Left = 329
      Top = 63
      ExplicitLeft = 329
      ExplicitTop = 63
    end
    object edArchivo: TFilenameEdit
      Left = 64
      Top = 8
      Width = 320
      Height = 21
      NumGlyphs = 1
      TabOrder = 2
      Text = 'edArchivo'
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
  end
end
