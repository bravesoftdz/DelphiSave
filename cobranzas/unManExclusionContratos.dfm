inherited frmManExclusionContratos: TfrmManExclusionContratos
  Left = 208
  Top = 106
  Width = 583
  Height = 363
  Caption = 'Exclusi'#243'n de Contratos'
  Constraints.MinHeight = 363
  Constraints.MinWidth = 583
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 575
    Height = 34
    Visible = True
    inline fraEmpresaBusq: TfraEmpresa
      Left = 7
      Top = 7
      Width = 564
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited edContrato: TIntEdit
        Left = 507
      end
      inherited cmbRSocial: TArtComboBox
        Width = 325
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 34
    Width = 575
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 571
      end>
    inherited ToolBar: TToolBar
      Width = 558
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 63
    Width = 575
    Height = 273
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_MOTIVO'
        Title.Caption = 'Motivo'
        Width = 328
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EM_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Alta'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EM_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Baja'
        Width = 84
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 112
    Width = 488
    Height = 150
    Caption = 'Alta de Contrato Excluido'
    ActiveControl = fraEmpresaAlta.edContrato
    Constraints.MaxHeight = 150
    Constraints.MinHeight = 150
    Constraints.MinWidth = 488
    inherited BevelAbm: TBevel
      Top = 114
      Width = 480
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 41
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    inherited btnAceptar: TButton
      Left = 330
      Top = 120
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 408
      Top = 120
      TabOrder = 3
    end
    inline fraEmpresaAlta: TfraEmpresa
      Left = 7
      Top = 14
      Width = 473
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited lbContrato: TLabel
        Left = 371
      end
      inherited edContrato: TIntEdit
        Left = 416
      end
      inherited cmbRSocial: TArtComboBox
        Width = 234
      end
    end
    object edMotivo: TMemo
      Left = 7
      Top = 56
      Width = 474
      Height = 52
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 240
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT EM_ID, EM_CONTRATO, EM_FECHAALTA, EM_FECHABAJA, EM_MOTIVO'
      'FROM ZEM_EMPRESAEXCLUIDAPLAN')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcNone
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
