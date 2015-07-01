inherited frmDlgBusInforme: TfrmDlgBusInforme
  Top = 163
  Width = 698
  Height = 455
  BorderIcons = [biSystemMenu]
  Caption = 'Buscar Informe'
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 690
    Height = 104
    object GroupBox2: TGroupBox
      Left = 1
      Top = 54
      Width = 476
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Responsable'
      TabOrder = 1
      DesignSize = (
        476
        45)
      object Label1: TLabel
        Left = 6
        Top = 20
        Width = 57
        Height = 13
        Caption = 'CUIT/ CUIL'
      end
      object Label5: TLabel
        Left = 164
        Top = 20
        Width = 37
        Height = 13
        Caption = 'Nombre'
      end
      object edCI_RESP_CUILCUIT: TMaskEdit
        Left = 68
        Top = 16
        Width = 88
        Height = 21
        EditMask = '99-########-c;0; '
        MaxLength = 13
        TabOrder = 0
      end
      object edCI_RESP_NOMBRE: TEdit
        Left = 208
        Top = 16
        Width = 261
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 6
      Width = 688
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        688
        47)
      inline fraCE_CUIT: TfraEmpresa
        Left = 12
        Top = 18
        Width = 667
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
          Left = 563
        end
        inherited edContrato: TIntEdit
          Left = 608
        end
        inherited cmbRSocial: TArtComboBox
          Width = 427
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 480
      Top = 54
      Width = 209
      Height = 45
      Anchors = [akTop, akRight]
      Caption = 'Fecha'
      TabOrder = 2
      object Label3: TLabel
        Left = 100
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edCI_FECHADesde: TDateComboBox
        Left = 8
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edCI_FECHAHasta
        TabOrder = 0
      end
      object edCI_FECHAHasta: TDateComboBox
        Left = 115
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edCI_FECHADesde
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 104
    Width = 690
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 686
      end>
    inherited ToolBar: TToolBar
      Width = 673
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 133
    Width = 690
    Height = 266
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OnGetCellParams = GridGetCellParams
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CI_ID'
        Title.Caption = 'Informe'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CI_FECHA'
        Title.Caption = 'Fecha'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CI_RESP_CUILCUIT'
        Title.Caption = 'Resp.CUIT/CUIL'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CI_RESP_NOMBRE'
        Title.Caption = 'Resp.Nombre'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nroestableci'
        Title.Caption = 'Est.N'#250'mero'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Caption = 'Est.Nombre'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Est.Domicilio'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALIDAD'
        Title.Caption = 'Est.Localidad'
        Width = 79
        Visible = True
      end>
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 399
    Width = 690
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      690
      29)
    object btnAceptar: TButton
      Left = 537
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Enabled = False
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 615
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ci_id, ci_fecha, ci_resp_cuilcuit, ci_resp_nombre, es_nro' +
        'estableci,'
      '       es_nombre,'
      '       utiles.armar_domicilio(es_calle, es_numero, es_piso,'
      '                              es_departamento) AS "DOMICILIO",'
      '       utiles.armar_localidad(NULL, es_cpostala, es_localidad,'
      '                              es_provincia) AS "LOCALIDAD"'
      '  FROM hys.pci_caninforme, afi.aes_establecimiento'
      ' WHERE es_id = ci_idestableci')
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
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
        Key = 114
        LinkControl = tbRefrescar
      end>
  end
end
