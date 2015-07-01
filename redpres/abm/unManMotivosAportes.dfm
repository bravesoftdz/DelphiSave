inherited frmManMotivosAportes: TfrmManMotivosAportes
  Left = 332
  Top = 216
  Caption = 'Motivos de baja/modifiaci'#243'n de aportes y contribuciones'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MA_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MA_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO'
        Title.Caption = 'Motivo de'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MA_PERIODOSIGUIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'Siguiente'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MA_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. baja'
        Width = 65
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 148
    Top = 136
    Width = 410
    Height = 136
    OnBeforeShow = fpAbmBeforeShow
    inherited BevelAbm: TBevel
      Top = 100
      Width = 402
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 12
      Width = 47
      Height = 13
      Caption = 'Motivo de'
    end
    object Label2: TLabel [2]
      Left = 26
      Top = 45
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel [3]
      Left = 3
      Top = 73
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 252
      Top = 106
    end
    inherited btnCancelar: TButton
      Left = 330
      Top = 106
    end
    object gbMotivode: TGroupBox
      Left = 66
      Top = 2
      Width = 149
      Height = 29
      TabOrder = 2
      object rbBajaABM: TRadioButton
        Left = 8
        Top = 10
        Width = 45
        Height = 15
        Caption = 'Baja'
        TabOrder = 0
      end
      object rbModifABM: TRadioButton
        Left = 58
        Top = 10
        Width = 81
        Height = 15
        Caption = 'Modificaci'#243'n'
        TabOrder = 1
      end
    end
    object chkSiguienteABM: TCheckBox
      Left = 224
      Top = 11
      Width = 150
      Height = 17
      Caption = 'Incluir en per'#237'odo siguiente'
      TabOrder = 3
    end
    object edCodigoABM: TEdit
      Left = 66
      Top = 40
      Width = 54
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 4
    end
    object edDescripcionABM: TEdit
      Left = 66
      Top = 68
      Width = 339
      Height = 21
      MaxLength = 250
      TabOrder = 5
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ma_id, ma_codigo, ma_descripcion, ma_periodosiguiente, ma' +
        '_esbaja,'
      
        '       ma_fechabaja, DECODE(ma_esbaja, '#39'S'#39', '#39'Baja'#39', '#39'N'#39', '#39'Modifi' +
        'caci'#243'n'#39') motivo'
      '  FROM sin.sma_motivosaportes')
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
      end>
    Left = 80
    Top = 256
  end
end
