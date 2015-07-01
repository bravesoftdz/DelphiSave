inherited frmAdministracionConceptos: TfrmAdministracionConceptos
  Left = 124
  Top = 81
  Width = 560
  Height = 434
  Caption = 'Administraci'#243'n de Conceptos'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 552
    Height = 31
    Visible = True
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 38
      Height = 13
      AutoSize = False
      Caption = 'Sector'
    end
    object chkNoMostrarBajas: TCheckBox
      Left = 420
      Top = 6
      Width = 105
      Height = 17
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    inline fraSector: TfraCodigoDescripcion
      Left = 50
      Top = 4
      Width = 364
      Height = 23
      TabOrder = 0
      DesignSize = (
        364
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 51
        Width = 310
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 31
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
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbCuentas: TToolButton
        Left = 370
        Top = 0
        Hint = 'Cuentas (Ctrl+U)'
        ImageIndex = 29
        OnClick = tbCuentasClick
      end
      object tbSemaforos: TToolButton
        Left = 393
        Top = 0
        Hint = 'Sem'#225'foros (Ctrl+A)'
        ImageIndex = 13
        OnClick = tbSemaforosClick
      end
      object tbIndicadores: TToolButton
        Left = 416
        Top = 0
        Hint = 'Indicadores (Ctrl+D)'
        ImageIndex = 9
        OnClick = tbIndicadoresClick
      end
      object ToolButton1: TToolButton
        Left = 439
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 447
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 60
    Width = 552
    Height = 347
    Columns = <
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 233
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 185
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEN'
        Title.Alignment = taCenter
        Title.Caption = 'Orden'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIGNO'
        Title.Alignment = taCenter
        Title.Caption = 'Signo'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RUBROPADRE'
        Title.Caption = 'Rubro Padre'
        Width = 212
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 71
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 147
    Top = 105
    Width = 500
    Height = 189
    BorderStyle = bsDialog
    DesignSize = (
      500
      189)
    inherited BevelAbm: TBevel
      Top = 153
      Width = 492
    end
    object Label2: TLabel [1]
      Left = 7
      Top = 38
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Sector'
    end
    object Label3: TLabel [2]
      Left = 7
      Top = 11
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Concepto'
    end
    object Label4: TLabel [3]
      Left = 204
      Top = 92
      Width = 34
      Height = 13
      AutoSize = False
      Caption = 'Orden'
    end
    object Label5: TLabel [4]
      Left = 7
      Top = 92
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Nivel Reporte'
    end
    object Label6: TLabel [5]
      Left = 7
      Top = 65
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Rubro Padre'
    end
    inherited btnAceptar: TButton
      Left = 342
      Top = 159
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 420
      Top = 159
      TabOrder = 8
    end
    inline fraSectorAltaModif: TfraCodigoDescripcion
      Left = 78
      Top = 34
      Width = 417
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        417
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 51
        Width = 364
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
    object edConceptoAltaModif: TEdit
      Left = 79
      Top = 8
      Width = 414
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 250
      TabOrder = 0
    end
    object rgTipoAltaModif: TRadioGroup
      Left = 79
      Top = 113
      Width = 224
      Height = 36
      Caption = 'Tipo'
      Columns = 3
      Items.Strings = (
        'Calculado'
        'Ingresado'
        'Sumatoria')
      TabOrder = 5
    end
    object edOrdenAltaModif: TIntEdit
      Left = 239
      Top = 89
      Width = 64
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      MaxLength = 5
    end
    object edNivelAltaModif: TIntEdit
      Left = 79
      Top = 89
      Width = 64
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      MaxLength = 5
    end
    object rgSignoAltaModif: TRadioGroup
      Left = 306
      Top = 113
      Width = 187
      Height = 36
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Signo'
      Columns = 2
      Items.Strings = (
        'Positivo'
        'Negativo')
      TabOrder = 6
    end
    inline fraConcSumaEnAltaModif: TfraCodigoDescripcion
      Left = 78
      Top = 61
      Width = 417
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        417
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 51
        Width = 364
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT PC_DESCRIPCION CONCEPTO, SC_DESCRIPCION SECTOR, TRUNC(PC_' +
        'FECHABAJA) FECHA_BAJA,'
      '       PC_TIPO TIPO'
      '  FROM USC_SECTORES, OPC_PRESUPUESTOCONCEPTO'
      ' WHERE SC_CODIGO = PC_SECTOR'
      '   AND 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
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
        LinkControl = tbSalir2
      end
      item
        Key = 16469
        LinkControl = tbCuentas
      end
      item
        Key = 16449
        LinkControl = tbSemaforos
      end
      item
        Key = 16452
        LinkControl = tbIndicadores
      end>
    Left = 109
    Top = 200
  end
end
