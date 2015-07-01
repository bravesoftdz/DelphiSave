inherited frmContratosGuarda: TfrmContratosGuarda
  Left = 252
  Top = 166
  Width = 632
  Caption = 'Contratos en Guarda'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 624
  end
  inherited CoolBar: TCoolBar
    Width = 624
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 620
      end>
    inherited ToolBar: TToolBar
      Width = 607
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 624
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ga_contrato'
        Title.Alignment = taRightJustify
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Raz'#243'n Social'
        Width = 205
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ga_fechaalta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 96
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ga_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ga_usubaja'
        Title.Caption = 'Usuario Baja'
        Width = 114
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Width = 440
    Height = 128
    Caption = 'Contrato en Guarda'
    BorderStyle = bsDialog
    ActiveControl = edContrato
    Constraints.MaxHeight = 128
    Constraints.MaxWidth = 440
    Constraints.MinHeight = 128
    Constraints.MinWidth = 440
    inherited BevelAbm: TBevel
      Top = 92
      Width = 432
    end
    object Label9: TLabel [1]
      Left = 8
      Top = 36
      Width = 63
      Height = 13
      Caption = 'Raz'#243'n Social'
    end
    object Label1: TLabel [2]
      Left = 8
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Contrato'
    end
    inherited btnAceptar: TButton
      Left = 280
      Top = 98
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 360
      Top = 98
      Width = 72
    end
    object edContrato: TIntEdit
      Left = 80
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 2
      OnChange = edContratoChange
    end
    object edRazonSocial: TEdit
      Left = 80
      Top = 32
      Width = 352
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
      Text = 'edRazonSocial'
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM art.aac_autorizacotiza')
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
      end
      item
        Key = 16449
      end
      item
        Key = 16468
      end>
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object sdqConsultaCampos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    Left = 24
    Top = 312
  end
  object dsConsultaCampos: TDataSource
    DataSet = sdqConsultaCampos
    Left = 52
    Top = 312
  end
end
