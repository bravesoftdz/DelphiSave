inherited frmAdministracionArchivosRecepcion: TfrmAdministracionArchivosRecepcion
  Left = 632
  Top = 272
  Caption = 'Administraci'#243'n Archivos Recepci'#243'n'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
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
        FieldName = 'ar_nombrearchivo'
        Title.Caption = 'Archivo'
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ar_usualta'
        Title.Caption = 'Usuario Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ar_fechaalta'
        Title.Caption = 'F. Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ar_usumodif'
        Title.Caption = 'Usuario. Mod.'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ar_fechamodif'
        Title.Caption = 'Fecha Mod.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ar_usubaja'
        Title.Caption = 'Usuario Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ar_fechabaja'
        Title.Caption = 'F. Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 409
    Height = 93
    inherited BevelAbm: TBevel
      Top = 57
      Width = 401
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
    end
    inherited btnCancelar: TButton
      Left = 329
      Top = 63
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
