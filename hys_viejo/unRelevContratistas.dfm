inherited frmRelevContratista: TfrmRelevContratista
  Caption = 'Relevamiento Contratistas'
  FormStyle = fsNormal
  Position = poScreenCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'RC_CUIT'
        Title.Caption = 'CUIT'
        Width = 153
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 309
    Height = 77
    inherited BevelAbm: TBevel
      Top = 41
      Width = 301
    end
    object lbCuit: TLabel [1]
      Left = 12
      Top = 12
      Width = 31
      Height = 13
      Caption = 'CUIT: '
    end
    inherited btnAceptar: TButton
      Left = 151
      Top = 47
    end
    inherited btnCancelar: TButton
      Left = 229
      Top = 47
    end
    object mskCUITContratista: TMaskEdit
      Left = 69
      Top = 8
      Width = 81
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT rc_id, rc_idrelevriesgolaboral, rc_cuit, rc_usualta,'
      '       rc_fechaalta, rc_usumodif, rc_fechamodif, rc_usubaja,'
      '       rc_fechabaja'
      '  FROM hys.hrc_relevcontratista '
      '  WHERE rc_idrelevriesgolaboral = :idrelev')
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
