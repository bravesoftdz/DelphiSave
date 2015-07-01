inherited frmManEventosAccidente: TfrmManEventosAccidente
  Caption = 'Mantenimiento Eventos de Accidente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'TA_ID'
        Title.Caption = 'C'#243'digo'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_TEXTOMAIL'
        Title.Caption = 'Texto del Mail'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_ENVIOMAIL'
        Title.Caption = 'Envia Mail'
        Width = 59
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 173
    inherited BevelAbm: TBevel
      Top = 137
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 54
      Width = 69
      Height = 13
      Caption = 'Texto del Mail:'
    end
    object lbCodigo: TLabel [2]
      Left = 8
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Codigo:'
    end
    object lbDescripcion: TLabel [3]
      Left = 8
      Top = 31
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    inherited btnAceptar: TButton
      Top = 143
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Top = 143
      TabOrder = 5
    end
    object cbEnviaMail: TCheckBox
      Left = 151
      Top = 7
      Width = 81
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Envia Mail'
      TabOrder = 1
    end
    object edTextoMail: TMemo
      Left = 78
      Top = 51
      Width = 378
      Height = 83
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
    end
    object edCodigo: TEdit
      Left = 78
      Top = 5
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edDescripcion: TEdit
      Left = 78
      Top = 28
      Width = 378
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ta_id, ta_descripcion, ta_textomail, ta_enviomail, ta_fec' +
        'habaja'
      '  FROM hys.hta_tipoeventoaccidente')
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
