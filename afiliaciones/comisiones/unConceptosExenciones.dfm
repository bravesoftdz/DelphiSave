inherited frmConceptosExenciones: TfrmConceptosExenciones
  Width = 630
  Height = 450
  Caption = 'Exenciones de Conceptos'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 630
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 622
    Height = 9
  end
  inherited CoolBar: TCoolBar
    Top = 9
    Width = 622
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 618
      end>
    inherited ToolBar: TToolBar
      Width = 605
    end
  end
  inherited Grid: TArtDBGrid
    Top = 38
    Width = 622
    Height = 384
    Columns = <
      item
        Expanded = False
        FieldName = 'IMPUESTO'
        Title.Caption = 'Impuesto'
        Width = 345
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_DESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Desde'
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_HASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Hasta'
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 69
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 152
    Top = 104
    Width = 450
    Height = 125
    Constraints.MaxHeight = 125
    Constraints.MinHeight = 125
    Constraints.MinWidth = 450
    DesignSize = (
      450
      125)
    inherited BevelAbm: TBevel
      Top = 89
      Width = 442
    end
    object Label1: TLabel [1]
      Left = 6
      Top = 38
      Width = 71
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fecha Desde'
    end
    object Label2: TLabel [2]
      Left = 5
      Top = 66
      Width = 71
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fecha Hasta'
    end
    object Label3: TLabel [3]
      Left = 6
      Top = 12
      Width = 71
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Impuesto'
    end
    inherited btnAceptar: TButton
      Left = 292
      Top = 95
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 370
      Top = 95
      TabOrder = 4
    end
    inline fraEC_IMPUESTO: TfraStaticCTB_TABLAS
      Left = 84
      Top = 7
      Width = 358
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        358
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 294
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object edEC_FECHADESDE: TDateComboBox
      Left = 85
      Top = 35
      Width = 88
      Height = 21
      MaxDateCombo = edEC_FECHAHASTA
      TabOrder = 1
    end
    object edEC_FECHAHASTA: TDateComboBox
      Left = 85
      Top = 63
      Width = 88
      Height = 21
      MinDateCombo = edEC_FECHADESDE
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT TB_DESCRIPCION IMPUESTO, EC_FECHADESDE FECHA_DESDE, '
      '       EC_FECHAHASTA FECHA_HASTA, EC_FECHABAJA FECHA_BAJA'
      '  FROM CTB_TABLAS, XEC_EXENCIONCONCEPTO'
      ' WHERE TB_CODIGO = EC_IMPUESTO'
      '   AND TB_CLAVE = '#39'RETEN'#39
      '   AND 1 = 2')
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
    Top = 201
  end
end
