inherited frmActInfoDictamen: TfrmActInfoDictamen
  Left = 428
  Top = 325
  Width = 657
  Height = 504
  Caption = 'Actualizaci'#243'n Informaci'#243'n de Dictamen'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 647
    Height = 93
    Visible = True
    object gbIDdictamen: TGroupBox
      Left = 2
      Top = 0
      Width = 141
      Height = 45
      Caption = 'ID Dictamen'
      TabOrder = 0
      object ieIdDictamen: TIntEdit
        Left = 8
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
      end
    end
    object gbSiniestro: TGroupBox
      Left = 148
      Top = 0
      Width = 137
      Height = 45
      Caption = 'Siniestro'
      TabOrder = 1
      object edSiniestro: TSinEdit
        Left = 10
        Top = 17
        Width = 115
        Height = 21
        TabOrder = 0
      end
    end
    object rgOpciones: TRadioGroup
      Left = 2
      Top = 44
      Width = 283
      Height = 45
      Caption = 'Filtro'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Suspendidas'
        'No Liquidar'
        'Todas')
      TabOrder = 2
    end
    object gbFechaRecepcion: TGroupBox
      Left = 291
      Top = 0
      Width = 146
      Height = 89
      Caption = 'Fecha Recepci'#243'n'
      TabOrder = 3
      object Label3: TLabel
        Left = 6
        Top = 27
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 6
        Top = 58
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object cbFechaRecepDesde: TDateComboBox
        Left = 41
        Top = 23
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cbFechaRecepHasta: TDateComboBox
        Left = 41
        Top = 54
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 93
    Width = 647
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 643
      end>
    inherited ToolBar: TToolBar
      Width = 630
      inherited tbNuevo: TToolButton
        Enabled = False
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 122
    Width = 647
    Height = 353
    Columns = <
      item
        Expanded = False
        FieldName = 'EV_SINIESTRO'
        Title.Caption = 'SINIESTRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_ORDEN'
        Title.Caption = 'ORDEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_ID'
        Title.Caption = 'ID DICTAMEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CUIL'
        Title.Caption = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_NOMBRE'
        Title.Caption = 'NOMBRE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FECHARECEPCION'
        Title.Caption = 'FECHA RECEP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FECHAALTA'
        Title.Caption = 'FECHA ALTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_USUALTA'
        Title.Caption = 'USU ALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ID_FECHABAJA'
        Title.Caption = 'FECHA BAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ID_USUBAJA'
        Title.Caption = 'USU BAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ID_FECHACARGADICTA'
        Title.Caption = 'FEC CARGA DICT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FECHAAPRODICTA'
        Title.Caption = 'FEC APRO DICT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FECHANOAPRODICTA'
        Title.Caption = 'FEC NO APRO DICT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FECHALIQUI'
        Title.Caption = 'FECHA LIQ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FECHAAPROLIQUI'
        Title.Caption = 'FECHA APRO LIQ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FECHAMODIF'
        Title.Caption = 'FECHA MODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ID_USUMODIF'
        Title.Caption = 'USU MODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ID_IDMOTIVOBAJA'
        Title.Caption = 'ID MOT BAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ID_CORRESPONDEAPRO'
        Title.Caption = 'CORRESP APRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_LIQUIREFERENCIA'
        Title.Caption = 'LIQ REF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CORRESPONDELIQUI'
        Title.Caption = 'CORRESP LIQ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_MOTIVONOLIQUI'
        Title.Caption = 'MOTIVO NO LIQ'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FECHASUSPENDIDO'
        Title.Caption = 'FECHA SUSP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_MOTIVOSUSPENDIDO'
        Title.Caption = 'MOTIVO SUSP'
        Width = 250
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    OnShow = fpAbmShow
    object Label1: TLabel [1]
      Left = 28
      Top = 51
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object Label2: TLabel [2]
      Left = 260
      Top = 79
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object chkNoLiquidar: TCheckBox
      Left = 28
      Top = 28
      Width = 141
      Height = 17
      Caption = 'No corresponde liquidar'
      TabOrder = 2
      OnClick = chkNoLiquidarClick
    end
    object deFechaSusp: TDateEdit
      Left = 259
      Top = 48
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object chkFechaSusp: TCheckBox
      Left = 259
      Top = 28
      Width = 121
      Height = 17
      Caption = 'Fecha Suspendido'
      TabOrder = 4
      OnClick = chkFechaSuspClick
    end
    object edMotNoLiqui: TMemo
      Left = 28
      Top = 68
      Width = 185
      Height = 137
      TabOrder = 5
    end
    object edMotSusp: TMemo
      Left = 260
      Top = 96
      Width = 185
      Height = 109
      Lines.Strings = (
        '')
      TabOrder = 6
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT DISTINCT ev_siniestro, ev_orden, SIN.sid_informacion_dict' +
        'amen.*'
      '    FROM art.sev_eventosdetramite, SIN.sid_informacion_dictamen'
      ' WHERE id_id = ev_idseg_dictamen'
      '       AND id_fechabaja IS NULL'
      '       AND ev_evento > 0 ')
    object sdqConsultaEV_SINIESTRO: TFloatField
      FieldName = 'EV_SINIESTRO'
      Required = True
    end
    object sdqConsultaEV_ORDEN: TFloatField
      FieldName = 'EV_ORDEN'
      Required = True
    end
    object sdqConsultaID_ID: TFloatField
      FieldName = 'ID_ID'
      Required = True
    end
    object sdqConsultaID_CUIL: TStringField
      FieldName = 'ID_CUIL'
      Size = 11
    end
    object sdqConsultaID_NOMBRE: TStringField
      FieldName = 'ID_NOMBRE'
      Size = 60
    end
    object sdqConsultaID_FECHARECEPCION: TDateTimeField
      FieldName = 'ID_FECHARECEPCION'
    end
    object sdqConsultaID_FECHAALTA: TDateTimeField
      FieldName = 'ID_FECHAALTA'
    end
    object sdqConsultaID_USUALTA: TStringField
      FieldName = 'ID_USUALTA'
    end
    object sdqConsultaID_FECHABAJA: TDateTimeField
      FieldName = 'ID_FECHABAJA'
    end
    object sdqConsultaID_USUBAJA: TStringField
      FieldName = 'ID_USUBAJA'
    end
    object sdqConsultaID_FECHACARGADICTA: TDateTimeField
      FieldName = 'ID_FECHACARGADICTA'
    end
    object sdqConsultaID_FECHAAPRODICTA: TDateTimeField
      FieldName = 'ID_FECHAAPRODICTA'
    end
    object sdqConsultaID_FECHANOAPRODICTA: TDateTimeField
      FieldName = 'ID_FECHANOAPRODICTA'
    end
    object sdqConsultaID_FECHALIQUI: TDateTimeField
      FieldName = 'ID_FECHALIQUI'
    end
    object sdqConsultaID_FECHAAPROLIQUI: TDateTimeField
      FieldName = 'ID_FECHAAPROLIQUI'
    end
    object sdqConsultaID_FECHAMODIF: TDateTimeField
      FieldName = 'ID_FECHAMODIF'
    end
    object sdqConsultaID_USUMODIF: TStringField
      FieldName = 'ID_USUMODIF'
    end
    object sdqConsultaID_IDMOTIVOBAJA: TFloatField
      FieldName = 'ID_IDMOTIVOBAJA'
    end
    object sdqConsultaID_CORRESPONDEAPRO: TStringField
      FieldName = 'ID_CORRESPONDEAPRO'
      Size = 1
    end
    object sdqConsultaID_LIQUIREFERENCIA: TFloatField
      FieldName = 'ID_LIQUIREFERENCIA'
    end
    object sdqConsultaID_CORRESPONDELIQUI: TStringField
      FieldName = 'ID_CORRESPONDELIQUI'
      Size = 1
    end
    object sdqConsultaID_MOTIVONOLIQUI: TStringField
      FieldName = 'ID_MOTIVONOLIQUI'
      Size = 250
    end
    object sdqConsultaID_FECHASUSPENDIDO: TDateTimeField
      FieldName = 'ID_FECHASUSPENDIDO'
    end
    object sdqConsultaID_MOTIVOSUSPENDIDO: TStringField
      FieldName = 'ID_MOTIVOSUSPENDIDO'
      Size = 250
    end
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
        LinkControl = tbRefrescar
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
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
      end>
    Left = 56
    Top = 316
  end
end
