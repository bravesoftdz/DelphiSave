inherited frmEventosAccidentes: TfrmEventosAccidentes
  VertScrollBar.Range = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Eventos Accidentes'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbSalir: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'TA_DESCRIPCION'
        Title.Caption = 'Evento'
        Width = 187
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_OBSERVACION'
        Title.Caption = 'Observaci'#243'n'
        Width = 208
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_TEXTOMAIL'
        Title.Caption = 'Texto Mail'
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_ENVIAMAIL'
        Title.Caption = 'Envia Mail'
        Width = 116
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 249
    inherited BevelAbm: TBevel
      Top = 213
    end
    object lbFecha: TLabel [1]
      Left = 6
      Top = 11
      Width = 33
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha:'
    end
    object lbEvento: TLabel [2]
      Left = 7
      Top = 33
      Width = 34
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Evento'
    end
    object Label1: TLabel [3]
      Left = 8
      Top = 137
      Width = 63
      Height = 13
      Caption = 'Observaci'#243'n:'
    end
    object Label2: TLabel [4]
      Left = 8
      Top = 73
      Width = 52
      Height = 13
      Caption = 'Texto Mail:'
    end
    inherited btnAceptar: TButton
      Top = 219
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Top = 219
      TabOrder = 5
    end
    object edFecha: TDateEdit
      Left = 75
      Top = 7
      Width = 99
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 0
    end
    inline fraEvento: TfraCodigoDescripcion
      Left = 74
      Top = 29
      Width = 384
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        384
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 319
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    object edObservaciones: TMemo
      Left = 75
      Top = 133
      Width = 380
      Height = 75
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
    end
    object cbEnviaMail: TCheckBox
      Left = 7
      Top = 52
      Width = 81
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Envia Mail'
      TabOrder = 2
    end
    object edTextoMail: TMemo
      Left = 75
      Top = 69
      Width = 380
      Height = 61
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 6
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ta_descripcion, ta_textomail, ta_enviomail, ae_id,'
      
        '       ae_idgestionaccidente, ae_idevento, ae_fecha, ae_observac' +
        'ion,'
      '       ae_idemailaenviar, ae_fechabaja, AE_ENVIAMAIL '
      '  FROM hys.hta_tipoeventoaccidente, hys.hae_accidenteevento'
      ' WHERE ae_idgestionaccidente = :gestion AND ae_idevento = ta_id')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'gestion'
        ParamType = ptInput
      end>
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
