inherited frmRelevGremialista: TfrmRelevGremialista
  Caption = 'Relevamiento Gremialista'
  FormStyle = fsNormal
  Position = poScreenCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'RG_NROLEGAJO'
        Title.Caption = 'Nro. Legajo'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG_NOMBREGREMIO'
        Title.Caption = 'Nombre Gremio'
        Width = 277
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 97
    inherited BevelAbm: TBevel
      Top = 61
    end
    object lbLegajo: TLabel [1]
      Left = 8
      Top = 11
      Width = 75
      Height = 13
      Caption = 'N'#250'mero Legajo:'
    end
    object lbNombreGremio: TLabel [2]
      Left = 8
      Top = 39
      Width = 91
      Height = 13
      Caption = 'Nombre de Gremio:'
    end
    inherited btnAceptar: TButton
      Top = 67
    end
    inherited btnCancelar: TButton
      Top = 67
    end
    object edNroLegajo: TEdit
      Left = 108
      Top = 8
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 5
      TabOrder = 2
    end
    object edNombreGremio: TEdit
      Left = 108
      Top = 36
      Width = 343
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT rg_id, rg_idrelevriesgolaboral, rg_nrolegajo, rg_nombregr' +
        'emio,'
      
        '       rg_usualta, rg_fechaalta, rg_usumodif, rg_fechamodif, rg_' +
        'usubaja,'
      '       rg_fechabaja'
      '  FROM hys.hrg_relevgremialista'
      ' WHERE rg_idrelevriesgolaboral = :idrelev'
      ' ')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idrelev'
        ParamType = ptInput
      end>
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
