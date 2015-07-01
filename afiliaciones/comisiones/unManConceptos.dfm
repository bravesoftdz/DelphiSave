inherited frmManConceptos: TfrmManConceptos
  Left = 244
  Top = 255
  Width = 1013
  Height = 450
  Caption = 'Mantenimiento de Conceptos'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 499
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 1005
    Height = 8
  end
  inherited CoolBar: TCoolBar
    Top = 8
    Width = 1005
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1001
      end>
    inherited ToolBar: TToolBar
      Width = 988
      inherited tbModificar: TToolButton
        Hint = 'Modificar Datos Contables (Ctrl+M)'
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbExenciones: TToolButton
        Left = 370
        Top = 0
        Hint = 'Exenciones'
        ImageIndex = 15
        OnClick = tbExencionesClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlBusqueda: TPanel
        Left = 424
        Top = 0
        Width = 91
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object chkSoloActivos: TCheckBox
          Left = 4
          Top = 2
          Width = 83
          Height = 17
          Caption = 'Solo Activos'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 37
    Width = 1005
    Height = 385
    Columns = <
      item
        Expanded = False
        FieldName = 'CO_ID'
        Title.Caption = 'C'#243'digo'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_DESCRIPCION'
        Title.Caption = 'Concepto'
        Width = 285
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CO_ASIGNABLEVENDEDOR'
        Title.Alignment = taCenter
        Title.Caption = 'Asignable Entidad'
        Width = 103
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CO_ASIGNABLECONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Asignable Contrato'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CO_REQUIERECONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Requiere Contrato'
        Width = 97
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CUENTACONTABLE'
        Title.Caption = 'Cuenta Contable'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 335
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 160
    Top = 86
    Width = 480
    Height = 302
    BorderStyle = bsDialog
    ActiveControl = edConcepto
    OnEnter = fpAbmEnter
    DesignSize = (
      480
      302)
    inherited BevelAbm: TBevel
      Top = 266
      Width = 472
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 49
      Height = 13
      Caption = 'Concepto:'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 184
      Width = 79
      Height = 13
      AutoSize = False
      Caption = 'Observaciones'
    end
    inherited btnAceptar: TButton
      Left = 322
      Top = 272
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 400
      Top = 272
      TabOrder = 8
    end
    object edConcepto: TEdit
      Left = 61
      Top = 9
      Width = 411
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 0
    end
    object rgSigno: TRadioGroup
      Left = 60
      Top = 127
      Width = 109
      Height = 53
      Caption = 'Signo'
      Items.Strings = (
        '&D'#233'bito'
        '&Cr'#233'dito')
      TabOrder = 2
      TabStop = True
    end
    object chkAsignableVendedor: TCheckBox
      Left = 179
      Top = 131
      Width = 122
      Height = 17
      Hint = 
        'Conceptos propios y relacionados a un Comercializador/Intermedia' +
        'rio'
      Caption = 'Asignable Entidad'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object chkAsignableContrato: TCheckBox
      Left = 179
      Top = 148
      Width = 122
      Height = 17
      Hint = 
        'Para conceptos variables (%) aplicados sobre el pago, relacionad' +
        'os a uno o varios contratos (Ej. Comisiones, Incentivo sobre pri' +
        'ma)'
      Caption = 'Asignable Contrato'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object chkRequiereContrato: TCheckBox
      Left = 179
      Top = 165
      Width = 122
      Height = 17
      Hint = 
        'Para conceptos fijos ($) relacionados a un contrato (Ej. Ayuda d' +
        'e Gastos, Honorarios de suma fija)'
      Caption = 'Requiere Contrato'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object gbCuenta: TGroupBox
      Left = 60
      Top = 34
      Width = 412
      Height = 91
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Cuenta'
      TabOrder = 1
      TabStop = True
      object rbOtrosGstosProd: TRadioButton
        Left = 8
        Top = 14
        Width = 401
        Height = 17
        Hint = 
          'Corresponde a la aplicaci'#243'n de ayuda de gastos e incentivos de l' +
          'os productores e institorios'
        Caption = 'Otros Gastos Producci'#243'n (0141509926000000000000000)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object rbComisionesPorPrimas: TRadioButton
        Left = 8
        Top = 33
        Width = 401
        Height = 17
        Hint = 
          'Corresponde a la imputaci'#243'n de las comisiones y mantenimientos d' +
          'e los productores e institorios'
        Caption = 'Comisiones por Primas (0124200100000000000000000)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object rbDGIGcias: TRadioButton
        Left = 8
        Top = 51
        Width = 401
        Height = 17
        Caption = 
          'D.G.I. - Retenci'#243'n Impuesto a las Ganancias (0125110300000000000' +
          '000000)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object rbHonorariosProf: TRadioButton
        Left = 8
        Top = 70
        Width = 401
        Height = 17
        Caption = 
          'Honorarios Profesionales - Gerencia Comercial (01419004260000000' +
          '00000000)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
    end
    object edObservaciones: TMemo
      Left = 8
      Top = 199
      Width = 463
      Height = 63
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 255
      TabOrder = 6
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CO_ID, CO_DESCRIPCION, CO_ASIGNABLEVENDEDOR, CO_ASIGNABLE' +
        'CONTRATO,'
      
        '       TRUNC(CO_FECHABAJA) FECHABAJA, CO_SIGNO, CO_CUENTACONTABL' +
        'E,'
      '       CO_REQUIERECONTRATO'
      '  FROM XCO_CONCEPTO')
    Top = 133
  end
  inherited dsConsulta: TDataSource
    Top = 133
  end
  inherited SortDialog: TSortDialog
    Top = 161
  end
  inherited ExportDialog: TExportDialog
    Top = 161
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
    Top = 189
  end
  inherited Seguridad: TSeguridad
    Top = 105
  end
  inherited FormStorage: TFormStorage
    Top = 105
  end
  inherited PrintDialog: TPrintDialog
    Top = 189
  end
  inherited ShortCutControl: TShortCutControl
    Top = 105
  end
  inherited FieldHider: TFieldHider
    Top = 133
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
      end>
    Left = 112
    Top = 105
  end
end
