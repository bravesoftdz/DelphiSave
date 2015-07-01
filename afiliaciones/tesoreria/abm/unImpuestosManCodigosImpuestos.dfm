inherited frmImpuestosManCodigosImpuestos: TfrmImpuestosManCodigosImpuestos
  Width = 469
  Height = 500
  Caption = 'C'#243'digos de Impuestos'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 469
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 461
    Height = 19
    Visible = True
    object chkNoMostrarBajas: TCheckBox
      Left = 6
      Top = 1
      Width = 105
      Height = 17
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
  inherited CoolBar: TCoolBar
    Top = 19
    Width = 461
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 457
      end>
    inherited ToolBar: TToolBar
      Width = 444
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 48
    Width = 461
    Height = 424
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IM_DESCRIPCION'
        Title.Caption = 'Impuesto'
        Width = 364
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 79
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 84
    Top = 96
    Width = 460
    Height = 77
    Constraints.MaxHeight = 77
    Constraints.MinHeight = 77
    Constraints.MinWidth = 460
    DesignSize = (
      460
      77)
    inherited BevelAbm: TBevel
      Top = 41
      Width = 452
    end
    object Label3: TLabel [1]
      Left = 10
      Top = 16
      Width = 47
      Height = 13
      AutoSize = False
      Caption = 'Impuesto'
    end
    inherited btnAceptar: TButton
      Left = 302
      Top = 47
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 380
      Top = 47
      TabOrder = 2
    end
    object edIM_DESCRIPCION: TEdit
      Left = 59
      Top = 13
      Width = 392
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 240
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT IM_DESCRIPCION, TRUNC(IM_FECHABAJA) FECHABAJA, IM_ID ID'
      '  FROM CONT.OIM_IMPUESTO '
      ''
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
    Left = 110
    Top = 200
  end
end
