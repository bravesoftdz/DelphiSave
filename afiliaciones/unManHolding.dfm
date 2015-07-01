inherited frmManHolding: TfrmManHolding
  Left = 248
  Top = 181
  Width = 620
  Height = 440
  Caption = 'Mantenimiento de Holdings'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 604
  end
  inherited CoolBar: TCoolBar
    Width = 604
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 600
      end>
    inherited ToolBar: TToolBar
      Width = 587
      object chkVerTemporales: TCheckBox
        Left = 370
        Top = 0
        Width = 97
        Height = 22
        Caption = 'Ver Temporales'
        TabOrder = 0
        OnClick = chkVerTemporalesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 604
    Height = 328
    Columns = <
      item
        Expanded = False
        FieldName = 'GE_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_DESCRIPCION'
        Title.Caption = 'Holding'
        Width = 351
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'temp'
        Title.Caption = 'Temporal'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 128
    Width = 360
    Height = 121
    BorderStyle = bsDialog
    ActiveControl = edCodigo
    inherited BevelAbm: TBevel
      Top = 85
      Width = 352
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 36
      Width = 36
      Height = 13
      Caption = 'Holding'
    end
    inherited btnAceptar: TButton
      Left = 202
      Top = 91
      Width = 72
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 280
      Top = 91
      Width = 72
      TabOrder = 3
    end
    object edCodigo: TEdit
      Left = 56
      Top = 8
      Width = 296
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      Text = 'EDCODIGO'
    end
    object edHolding: TEdit
      Left = 56
      Top = 32
      Width = 296
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      Text = 'EDHOLDING'
    end
    object chkTemporal: TCheckBox
      Left = 12
      Top = 64
      Width = 269
      Height = 17
      Caption = 'El holding se encuentra en estado temporal'
      TabOrder = 4
    end
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
