inherited frmABMBlockNotas: TfrmABMBlockNotas
  Left = 75
  Top = 50
  Width = 630
  Height = 480
  Caption = 'Block de Notas'
  Constraints.MinHeight = 480
  Constraints.MinWidth = 630
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 622
    Height = 62
    Visible = True
    object Label1: TLabel
      Left = 7
      Top = 37
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object Label2: TLabel
      Left = 7
      Top = 11
      Width = 28
      Height = 13
      Caption = 'CUIT:'
    end
    object cbTipoObservacionFiltro: TExComboBox
      Left = 40
      Top = 34
      Width = 217
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
      Items.Strings = (
        'N=Normal'
        'U=Urgente')
      ItemIndex = -1
      Options = [coShowValues, coGridLines]
      ValueWidth = 64
    end
    inline fraEmpresafiltro: TfraEmpresa
      Left = 41
      Top = 7
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
      TabOrder = 0
    end
  end
  inherited CoolBar: TCoolBar
    Top = 62
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
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 91
    Width = 622
    Height = 251
    Columns = <
      item
        Expanded = False
        FieldName = 'BN_ID'
        Title.Caption = 'C'#243'digo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'BN_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Nombre'
        Width = 197
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BN_TIPO'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BN_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BN_TEXTO'
        Title.Caption = 'Texto'
        Width = 749
        Visible = True
      end>
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 342
    Width = 622
    Height = 111
    Hint = 'pnlFiltros'
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      622
      111)
    object edTextoBottom: TMemo
      Left = 0
      Top = 4
      Width = 620
      Height = 103
      Anchors = [akLeft, akTop, akRight]
      Color = 16051436
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 112
    object lblTipoObservacion: TLabel [1]
      Left = 6
      Top = 61
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object Label3: TLabel [2]
      Left = 6
      Top = 11
      Width = 28
      Height = 13
      Caption = 'CUIT:'
    end
    object Label4: TLabel [3]
      Left = 6
      Top = 35
      Width = 43
      Height = 13
      Caption = 'Contrato:'
    end
    inherited btnAceptar: TButton
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      TabOrder = 4
    end
    object edTexto: TMemo
      Left = 8
      Top = 85
      Width = 445
      Height = 132
      TabOrder = 2
    end
    object cbTipoObservacion: TExComboBox
      Left = 52
      Top = 57
      Width = 405
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
      Text = 'N=Normal'
      Items.Strings = (
        'N=Normal'
        'U=Urgente')
      ItemIndex = 0
      Options = [coGridLines]
      ValueWidth = 64
    end
    inline fraEmpresa: TfraEmpresa
      Left = 52
      Top = 7
      Width = 465
      Height = 45
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DesignSize = (
        465
        45)
      inherited lbContrato: TLabel
        Left = 419
        Top = 20
        Visible = False
      end
      inherited edContrato: TIntEdit
        Left = 0
        Top = 24
      end
      inherited cmbRSocial: TArtComboBox
        Width = 275
      end
      inherited sdqDatos: TSDQuery
        Left = 272
        Top = 32
      end
      inherited dsDatos: TDataSource
        Left = 300
        Top = 32
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'select *'
      
        'from emi.ibn_blocknota ibn, afi.aem_empresa aem, afi.aco_contrat' +
        'o aco'
      'where 1=2 and em_id = co_idempresa '
      'and bn_contrato = co_contrato')
  end
end
