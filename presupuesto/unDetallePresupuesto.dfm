inherited frmDetallePresupuesto: TfrmDetallePresupuesto
  Left = 19
  Top = 42
  Width = 670
  Height = 450
  Caption = 'Presupuesto Contable'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 670
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 662
    Height = 28
    Visible = True
    DesignSize = (
      662
      28)
    object Label1: TLabel
      Left = 2
      Top = 7
      Width = 22
      Height = 13
      AutoSize = False
      Caption = 'A'#241'o'
    end
    object Label2: TLabel
      Left = 87
      Top = 7
      Width = 38
      Height = 13
      AutoSize = False
      Caption = 'Versi'#243'n'
    end
    object Label3: TLabel
      Left = 189
      Top = 7
      Width = 23
      Height = 13
      AutoSize = False
      Caption = 'Mes'
    end
    object Label4: TLabel
      Left = 275
      Top = 7
      Width = 49
      Height = 13
      AutoSize = False
      Caption = 'Concepto'
    end
    object edAnio: TIntEdit
      Left = 25
      Top = 3
      Width = 57
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = edAnioExit
      MaxLength = 4
    end
    object chkNoMostrarBajas: TCheckBox
      Left = 556
      Top = 5
      Width = 103
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object edVersion: TIntEdit
      Left = 127
      Top = 3
      Width = 57
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      MaxLength = 4
    end
    object edMes: TIntEdit
      Left = 214
      Top = 3
      Width = 57
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnExit = edAnioExit
      MaxLength = 0
      MaxValue = 12
    end
    inline fraConcepto: TfraCodigoDescripcion
      Left = 325
      Top = 2
      Width = 229
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        229
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 51
        Width = 176
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 28
    Width = 662
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 658
      end>
    inherited ToolBar: TToolBar
      Width = 645
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 57
    Width = 662
    Height = 366
    Columns = <
      item
        Expanded = False
        FieldName = 'A'#209'O'
        Title.Alignment = taCenter
        Title.Caption = 'A'#241'o'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VERSION'
        Title.Alignment = taCenter
        Title.Caption = 'Versi'#243'n'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MES'
        Title.Alignment = taCenter
        Title.Caption = 'Mes'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 132
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CONGELADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Congelado'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 67
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 143
    Top = 116
    Height = 146
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 110
    end
    object Label5: TLabel [1]
      Left = 7
      Top = 12
      Width = 64
      Height = 13
      AutoSize = False
      Caption = 'Presupuesto'
    end
    object Label6: TLabel [2]
      Left = 7
      Top = 38
      Width = 64
      Height = 13
      AutoSize = False
      Caption = 'Concepto'
    end
    object Label7: TLabel [3]
      Left = 7
      Top = 63
      Width = 64
      Height = 13
      AutoSize = False
      Caption = 'Mes'
    end
    object Label8: TLabel [4]
      Left = 7
      Top = 88
      Width = 64
      Height = 13
      AutoSize = False
      Caption = 'Importe'
    end
    inherited btnAceptar: TButton
      Left = 264
      Top = 116
      Width = 108
      Caption = '&Guardar'
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Top = 116
      Caption = '&Salir'
      TabOrder = 6
      OnClick = btnCancelarClick
    end
    inline fraPresupuestoAltaModif: TfraCodigoDescripcion
      Left = 74
      Top = 8
      Width = 381
      Height = 23
      TabOrder = 0
      DesignSize = (
        381
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 51
        Width = 328
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
    inline fraConceptoAltaModif: TfraCodigoDescripcion
      Left = 74
      Top = 33
      Width = 381
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        381
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 51
        Width = 328
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
    object edMesAltaModif: TIntEdit
      Left = 75
      Top = 59
      Width = 57
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnExit = edAnioExit
      MaxLength = 0
      MaxValue = 12
    end
    object edImporteAltaModif: TCurrencyEdit
      Left = 75
      Top = 84
      Width = 100
      Height = 21
      AutoSize = False
      TabOrder = 3
    end
    object btnGuardarContinuar: TButton
      Left = 153
      Top = 116
      Width = 108
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Guardar y &Continuar'
      TabOrder = 4
      OnClick = btnAceptarClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT PR_A'#209'O A'#209'O, PR_VERSION VERSION, PC_DESCRIPCION CONCEPTO, ' +
        'PD_MES MES, PD_IMPORTE IMPORTE,'
      
        '       SC_DESCRIPCION SECTOR, PR_FECHACONGELADO FECHA_CONGELADO,' +
        ' PD_FECHABAJA FECHA_BAJA'
      
        '  FROM USC_SECTORES, OPC_PRESUPUESTOCONCEPTO, OPR_PRESUPUESTO, O' +
        'PD_PRESUPUESTODETALLE'
      ' WHERE SC_CODIGO = PC_SECTOR'
      '   AND PR_ID = PD_IDPRESUPUESTO'
      '   AND PC_ID = PD_IDCONCEPTO'
      '   AND PR_FECHABAJA IS NULL'
      '   AND 1 = 2'
      '   ')
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
