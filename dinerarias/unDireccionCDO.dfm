object frmDireccionCDO: TfrmDireccionCDO
  Left = 624
  Top = 115
  BorderStyle = bsNone
  Caption = 'Direcci'#243'n Carta Documento'
  ClientHeight = 186
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object fpCartaDocumento: TFormPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 186
    Caption = 'Datos para carta documento'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnShow = fpCartaDocumentoShow
    DesignSize = (
      622
      186)
    object BevelAbm: TBevel
      Left = 4
      Top = 145
      Width = 614
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 7
      Top = 119
      Width = 90
      Height = 13
      Caption = 'Fecha vencimiento'
    end
    object Label2: TLabel
      Left = 8
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label4: TLabel
      Left = 399
      Top = 13
      Width = 54
      Height = 13
      Caption = 'Liquidaci'#243'n'
    end
    object lblTrabajador: TLabel
      Left = 161
      Top = 12
      Width = 91
      Height = 13
      Caption = 'Nombre Trabajador'
    end
    object btnAceptar: TButton
      Left = 464
      Top = 153
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 4
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 542
      Top = 153
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 5
      OnClick = btnCancelarClick
    end
    object gbDirDestinatario: TGroupBox
      Left = 6
      Top = 36
      Width = 612
      Height = 72
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Direcci'#243'n'
      TabOrder = 2
      DesignSize = (
        612
        72)
      inline fraDirCDO: TfraDomicilio
        Left = 3
        Top = 16
        Width = 604
        Height = 51
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          604
          51)
        inherited lbNro: TLabel
          Left = 389
        end
        inherited lbPiso: TLabel
          Left = 461
        end
        inherited lbDto: TLabel
          Left = 537
        end
        inherited lbProvincia: TLabel
          Left = 442
        end
        inherited cmbCalle: TArtComboBox
          Width = 304
          DataSource = nil
        end
        inherited edNumero: TEdit
          Left = 411
        end
        inherited edPiso: TEdit
          Left = 487
        end
        inherited edDto: TEdit
          Left = 559
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 172
          DataSource = nil
        end
        inherited edProvincia: TEdit
          Left = 491
        end
        inherited btnBuscar: TButton
          Left = 354
        end
      end
    end
    object deFechaVenc: TDateEdit
      Left = 101
      Top = 115
      Width = 90
      Height = 21
      TabStop = False
      NumGlyphs = 2
      TabOrder = 3
    end
    object edSiniestro: TSinEdit
      Left = 57
      Top = 9
      Width = 100
      Height = 21
      Hint = 'C'#243'digo de Siniestro '
      Anchors = [akTop, akRight]
      OnExit = edSiniestroExit
      TabOrder = 0
    end
    object cbLiq: TArtComboBox
      Left = 460
      Top = 9
      Width = 154
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      NumGlyphs = 1
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnChange = cbLiqChange
      Columns = <
        item
          Expanded = False
          FieldName = 'nliq'
          Title.Caption = 'N. Liq.'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cp_denpago'
          Title.Caption = 'Detalle'
          Width = 160
          Visible = True
        end>
      DataSource = dsLiq
      FieldList = 'nliq'
      FieldKey = 'nliq'
      ClearOnCancel = True
    end
  end
  object dsLiq: TDataSource
    DataSet = sdqLiq
    Left = 488
    Top = 20
  end
  object sdqLiq: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'select 1 nliq, 1 cp_denpago from dual')
    Left = 516
    Top = 20
  end
end
