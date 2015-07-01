inherited frmManOCV_CONCEPTOVALOR: TfrmManOCV_CONCEPTOVALOR
  Left = 332
  Top = 104
  Caption = 'Conceptos de Valores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CV_ID'
        Title.Caption = 'C'#243'digo'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CV_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CV_IVA'
        Title.Caption = 'IVA Gravado'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CV_TESORERIA'
        Title.Caption = 'Ingresa por Tesorer'#237'a'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CV_CUENTACONTABLE'
        Title.Caption = 'Cuenta Contable'
        Width = 131
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 104
    Width = 390
    Height = 149
    Constraints.MaxHeight = 149
    Constraints.MinHeight = 149
    Constraints.MinWidth = 390
    inherited BevelAbm: TBevel
      Top = 113
      Width = 382
    end
    object Label3: TLabel [1]
      Left = 8
      Top = 12
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Descripci'#243'n'
    end
    object Label4: TLabel [2]
      Left = 8
      Top = 42
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Cuenta Contable'
    end
    inherited btnAceptar: TButton
      Left = 232
      Top = 119
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 310
      Top = 119
      TabOrder = 5
    end
    object edCV_DESCRIPCION: TEdit
      Left = 93
      Top = 8
      Width = 291
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 0
    end
    object edCV_CUENTACONTABLE: TPatternEdit
      Left = 93
      Top = 37
      Width = 157
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 25
      TabOrder = 1
      Pattern = '0123456789'
    end
    object chkCV_IVA: TCheckBox
      Left = 94
      Top = 66
      Width = 83
      Height = 17
      Caption = 'IVA Gravado'
      TabOrder = 2
    end
    object chkCV_TESORERIA: TCheckBox
      Left = 94
      Top = 90
      Width = 127
      Height = 17
      Caption = 'Ingresa por Tesorer'#237'a'
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CV_ID, CV_DESCRIPCION, CV_IVA, CV_TESORERIA, CV_CUENTACON' +
        'TABLE, CV_FECHABAJA'
      ' FROM OCV_CONCEPTOVALOR')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
