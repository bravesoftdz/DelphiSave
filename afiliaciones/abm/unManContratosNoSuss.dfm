inherited frmManContratosNoSuss: TfrmManContratosNoSuss
  Caption = 'Mantenimiento de Contratos No SUSS'
  ClientWidth = 758
  ExplicitWidth = 766
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 758
    ExplicitWidth = 758
  end
  inherited CoolBar: TCoolBar
    Width = 758
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 752
      end>
    ExplicitWidth = 758
    inherited ToolBar: TToolBar
      Left = 11
      Width = 743
      ExplicitLeft = 11
      ExplicitWidth = 743
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 758
    Columns = <
      item
        Expanded = False
        FieldName = 'cn_contrato'
        Title.Caption = 'Contrato'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Raz'#243'n Social'
        Width = 201
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_cuit'
        Title.Caption = 'CUIT'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cn_usualta'
        Title.Caption = 'Usu. Alta'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cn_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cn_usubaja'
        Title.Caption = 'Usu. Baja'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cn_fechabaja'
        Title.Caption = 'Fecha Baja'
        Width = 86
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Top = 192
    Width = 613
    Height = 81
    ExplicitTop = 192
    ExplicitWidth = 613
    ExplicitHeight = 81
    inherited BevelAbm: TBevel
      Top = 45
      Width = 605
      ExplicitTop = 45
      ExplicitWidth = 605
    end
    object Label1: TLabel [1]
      Left = 16
      Top = 20
      Width = 18
      Height = 13
      Caption = 'Cuit'
    end
    inherited btnAceptar: TButton
      Left = 455
      Top = 51
      ExplicitLeft = 455
      ExplicitTop = 51
    end
    inherited btnCancelar: TButton
      Left = 533
      Top = 51
      ExplicitLeft = 533
      ExplicitTop = 51
    end
    inline fraEmpresa: TfraEmpresa
      Left = 43
      Top = 16
      Width = 566
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnExit = fraEmpresaExit
      ExplicitLeft = 43
      ExplicitTop = 16
      ExplicitWidth = 566
      ExplicitHeight = 21
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT 1 FROM DUAL')
  end
end
