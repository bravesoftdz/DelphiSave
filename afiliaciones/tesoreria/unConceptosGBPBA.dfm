inherited frmConceptosGBPBA: TfrmConceptosGBPBA
  Width = 560
  Height = 450
  Caption = 'Conceptos GPBA'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 552
    Height = 21
    Visible = True
    object chkNoMostrarBajas: TCheckBox
      Left = 6
      Top = 3
      Width = 105
      Height = 17
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
  inherited CoolBar: TCoolBar
    Top = 21
    Width = 552
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 548
      end>
    inherited ToolBar: TToolBar
      Width = 535
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 50
    Width = 552
    Height = 373
    Columns = <
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 421
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SIGNO'
        Title.Alignment = taCenter
        Title.Caption = 'Signo'
        Width = 52
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 79
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 147
    Top = 92
    Width = 355
    Height = 128
    Constraints.MaxHeight = 128
    Constraints.MinHeight = 128
    Constraints.MinWidth = 355
    DesignSize = (
      355
      128)
    inherited BevelAbm: TBevel
      Top = 92
      Width = 347
    end
    object Label1: TLabel [1]
      Left = 9
      Top = 13
      Width = 52
      Height = 13
      AutoSize = False
      Caption = 'Concepto'
    end
    inherited btnAceptar: TButton
      Left = 197
      Top = 98
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 275
      Top = 98
      TabOrder = 3
    end
    object edConceptoCarga: TEdit
      Left = 64
      Top = 9
      Width = 283
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 120
      TabOrder = 0
    end
    object rgSignoCarga: TRadioGroup
      Left = 64
      Top = 32
      Width = 110
      Height = 56
      Caption = 'Signo'
      Items.Strings = (
        'D'#233'bito (-1)'
        'Cr'#233'dito (+1)')
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT GC_DESCRIPCION CONCEPTO, DECODE(GC_SIGNO, -1, '#39'(-)'#39', '#39'(+)' +
        #39') SIGNO, GC_FECHABAJA FECHA_BAJA'
      '  FROM OGC_GPBACONCEPTO'
      ' WHERE 1 = 2'
      ' ')
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
    Left = 109
    Top = 200
  end
end
