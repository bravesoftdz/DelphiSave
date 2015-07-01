inherited frmManOEP_EXCEPCIONPREVISION: TfrmManOEP_EXCEPCIONPREVISION
  Left = 44
  Top = 98
  Width = 728
  Height = 450
  Caption = 'Excepciones de Previsi'#243'n Incobrables'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 660
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 720
    Height = 48
    Visible = True
    DesignSize = (
      720
      48)
    object GroupBox1: TGroupBox
      Left = 2
      Top = -1
      Width = 628
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 0
      DesignSize = (
        628
        44)
      inline fraEmpresaExc: TfraEmpresa
        Left = 8
        Top = 15
        Width = 610
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        DesignSize = (
          610
          21)
        inherited lbContrato: TLabel
          Left = 506
        end
        inherited edContrato: TIntEdit
          Left = 553
        end
        inherited cmbRSocial: TArtComboBox
          Width = 371
        end
      end
    end
    object chkSoloActivasExc: TCheckBox
      Left = 635
      Top = 5
      Width = 82
      Height = 16
      Anchors = [akTop, akRight]
      Caption = 'Solo Activas'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Top = 48
    Width = 720
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 716
      end>
    inherited ToolBar: TToolBar
      Width = 703
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 77
    Width = 720
    Height = 346
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 218
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_MONTORESERVA'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Reserva'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_PORCSUJPREV'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. Sujeto Prev.'
        Width = 93
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EP_FECHADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Desde'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EP_FECHAHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Hasta'
        Width = 69
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 144
    Top = 132
    Width = 560
    Height = 163
    Constraints.MaxHeight = 163
    Constraints.MinHeight = 163
    Constraints.MinWidth = 560
    OnEnter = fpAbmEnter
    DesignSize = (
      560
      163)
    inherited BevelAbm: TBevel
      Top = 127
      Width = 552
    end
    object lbRSocial: TLabel [1]
      Left = 43
      Top = 11
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'CUIT'
      FocusControl = fraEP_IDEMPRESA.cmbRSocial
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 6
      Top = 104
      Width = 64
      Height = 13
      Caption = 'Fecha Desde'
    end
    object Label2: TLabel [3]
      Left = 173
      Top = 104
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label1: TLabel [4]
      Left = 6
      Top = 37
      Width = 40
      Height = 26
      Caption = 'Monto Reserva'
      FocusControl = fraEP_IDEMPRESA.cmbRSocial
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label4: TLabel [5]
      Left = 6
      Top = 67
      Width = 59
      Height = 26
      Caption = 'Porc. Sujeto Previsi'#243'n'
      FocusControl = fraEP_IDEMPRESA.cmbRSocial
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    inherited btnAceptar: TButton
      Left = 402
      Top = 135
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 480
      Top = 135
      TabOrder = 8
    end
    inline fraEP_IDEMPRESA: TfraEmpresa
      Left = 74
      Top = 7
      Width = 480
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DesignSize = (
        480
        21)
      inherited lbContrato: TLabel
        Left = 376
      end
      inherited edContrato: TIntEdit
        Left = 423
      end
      inherited cmbRSocial: TArtComboBox
        Width = 241
      end
    end
    object edEP_PORCSUJPREV: TCurrencyEdit
      Left = 89
      Top = 70
      Width = 66
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 4
    end
    object edEP_MONTORESERVA: TCurrencyEdit
      Left = 89
      Top = 38
      Width = 66
      Height = 21
      AutoSize = False
      MaxLength = 15
      MaxValue = 99999999999.000000000000000000
      TabOrder = 2
    end
    object edEP_FECHADESDE: TDateComboBox
      Left = 74
      Top = 101
      Width = 88
      Height = 21
      MaxDateCombo = edEP_FECHAHASTA
      TabOrder = 5
    end
    object edEP_FECHAHASTA: TDateComboBox
      Left = 206
      Top = 101
      Width = 88
      Height = 21
      MinDateCombo = edEP_FECHADESDE
      TabOrder = 6
    end
    object chkEP_MONTORESERVA: TCheckBox
      Left = 73
      Top = 38
      Width = 14
      Height = 23
      Alignment = taLeftJustify
      TabOrder = 1
      WordWrap = True
      OnClick = chkEP_MONTORESERVAClick
    end
    object chkEP_PORCSUJPREV: TCheckBox
      Left = 73
      Top = 66
      Width = 14
      Height = 27
      Alignment = taLeftJustify
      TabOrder = 3
      WordWrap = True
      OnClick = chkEP_PORCSUJPREVClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT EP_ID, EP_MONTORESERVA, EP_PORCSUJPREV, EP_FECHADESDE, EP' +
        '_FECHAHASTA,'
      '       EM_CUIT, EM_NOMBRE'
      '  FROM AEM_EMPRESA, CONT.OEP_EXCEPCIONPREVISION'
      ' WHERE EP_IDEMPRESA = EM_ID '
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
    Left = 112
    Top = 200
  end
end
