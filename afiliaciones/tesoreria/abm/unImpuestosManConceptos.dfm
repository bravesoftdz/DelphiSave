inherited frmImpuestosManConceptos: TfrmImpuestosManConceptos
  Width = 796
  Height = 500
  Caption = 'Conceptos'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 788
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
    Width = 788
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 784
      end>
    inherited ToolBar: TToolBar
      Width = 771
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 48
    Width = 788
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
        FieldName = 'IC_CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 256
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IM_DESCRIPCION'
        Title.Caption = 'Impuesto'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_DESCRIPCION'
        Title.Caption = 'Tipo'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IC_CTACONTABLE'
        Title.Caption = 'Cuenta Contable'
        Width = 149
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
    Left = 176
    Top = 97
    Width = 460
    Height = 181
    Constraints.MaxHeight = 181
    Constraints.MinHeight = 181
    Constraints.MinWidth = 460
    inherited BevelAbm: TBevel
      Top = 145
      Width = 452
    end
    object Label1: TLabel [1]
      Left = 9
      Top = 64
      Width = 57
      Height = 13
      AutoSize = False
      Caption = 'Tipo'
    end
    object Label2: TLabel [2]
      Left = 9
      Top = 37
      Width = 57
      Height = 13
      AutoSize = False
      Caption = 'Impuesto'
    end
    object Label3: TLabel [3]
      Left = 9
      Top = 10
      Width = 57
      Height = 13
      AutoSize = False
      Caption = 'Concepto'
    end
    object Label4: TLabel [4]
      Left = 9
      Top = 115
      Width = 57
      Height = 27
      AutoSize = False
      Caption = 'Cuenta Contable'
      WordWrap = True
    end
    object Label5: TLabel [5]
      Left = 9
      Top = 92
      Width = 44
      Height = 13
      Caption = 'Provincia'
    end
    inherited btnAceptar: TButton
      Left = 302
      Top = 151
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 380
      Top = 151
      TabOrder = 6
    end
    inline fraIC_IDTIPO: TfraCodigoDescripcion
      Left = 66
      Top = 60
      Width = 388
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 323
      end
    end
    inline fraIC_IDIMPUESTO: TfraCodigoDescripcion
      Left = 66
      Top = 33
      Width = 388
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 323
      end
    end
    object edIC_CONCEPTO: TEdit
      Left = 67
      Top = 7
      Width = 384
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 240
      TabOrder = 0
    end
    object edIC_CTACONTABLE: TPatternEdit
      Left = 67
      Top = 118
      Width = 384
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 4
      Pattern = '0123456789'
    end
    inline fraIC_PROVINCIA: TfraCodigoDescripcion
      Left = 66
      Top = 88
      Width = 388
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 323
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      ' SELECT IC_CONCEPTO, IM_DESCRIPCION, IT_DESCRIPCION,'
      '        TRUNC(IC_FECHABAJA) FECHABAJA, IC_ID ID'
      
        '   FROM CONT.OIT_IMPTIPO, CONT.OIM_IMPUESTO, CONT.OIC_IMPCONCEPT' +
        'O'
      '  WHERE IC_IDIMPUESTO = IM_ID'
      '    AND IC_IDTIPO = IT_ID'
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
