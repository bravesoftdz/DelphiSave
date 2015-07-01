inherited frmConsultaAccMayores: TfrmConsultaAccMayores
  Left = 416
  Top = 257
  Width = 790
  Height = 590
  Caption = 'Consulta Accidentes Mayores'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 782
    Height = 112
    object CUIT: TLabel
      Left = 7
      Top = 37
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label1: TLabel
      Left = 7
      Top = 9
      Width = 58
      Height = 13
      Caption = 'Nro. Informe'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 40
      Top = 30
      Width = 729
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      inherited lbRSocial: TLabel
        Left = 97
        Top = 6
        Width = 60
        Caption = 'Raz'#243'n Social'
      end
      inherited lbContrato: TLabel
        Left = 625
        Top = 6
      end
      inherited mskCUIT: TMaskEdit
        Left = 10
        Top = 3
      end
      inherited edContrato: TIntEdit
        Left = 672
        Top = 3
        Width = 80
      end
      inherited cmbRSocial: TArtComboBox
        Left = 161
        Top = 3
        Width = 461
        DataSource = nil
      end
      inherited sdqDatos: TSDQuery
        Left = 568
        Top = 21
      end
      inherited dsDatos: TDataSource
        Left = 596
        Top = 18
      end
      inherited TimerConfidencial: TTimer
        Left = 683
        Top = 9
      end
    end
    inline fraEstablecimiento: TfraEstablecimientoDomic
      Left = 5
      Top = 58
      Width = 764
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited lbLocalidad: TLabel
        Left = 530
      end
      inherited lbEstableci: TLabel
        Left = 1
      end
      inherited lbCPostal: TLabel
        Left = 693
      end
      inherited lbDomicilio: TLabel
        Left = -1
      end
      inherited lbProvincia: TLabel
        Left = 530
      end
      inherited edCodigo: TIntEdit
        Left = 45
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 93
        Width = 427
      end
      inherited edLocalidad: TEdit
        Left = 582
        Width = 106
        TabStop = True
      end
      inherited edCPostal: TEdit
        Left = 717
        TabStop = True
      end
      inherited edDomicilio: TEdit
        Left = 45
        Width = 473
        TabStop = True
      end
      inherited edProvincia: TEdit
        Left = 582
        Width = 189
        TabStop = True
      end
      inherited sdqDatos: TSDQuery
        Left = 111
        Top = 30
      end
      inherited dsDatos: TDataSource
        Left = 154
        Top = 30
      end
    end
    object edNroInformeFiltro: TIntEdit
      Left = 73
      Top = 6
      Width = 90
      Height = 21
      TabOrder = 0
      Alignment = taRightJustify
    end
  end
  inherited CoolBar: TCoolBar
    Top = 112
    Width = 782
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 778
      end>
    inherited ToolBar: TToolBar
      Width = 765
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 141
    Width = 782
    Height = 422
    Columns = <
      item
        Expanded = False
        FieldName = 'IN_NROINFORME'
        Title.Caption = 'Nro. Informe'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_FECHAINFORME'
        Title.Caption = 'Fecha Informe'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_CUIT'
        Title.Caption = 'CUIT'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'co_contrato'
        Title.Caption = 'Contrato'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Nombre Empresa'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Caption = 'Nro. Estab.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Caption = 'Nombre Estab.'
        Width = 200
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT hin.*, aes.es_nombre, em_nombre, co_contrato, es_nroestab' +
        'leci'
      
        '  FROM afi.aem_empresa aem, afi.aes_establecimiento aes, afi.aco' +
        '_contrato aco, hys.hin_informe hin'
      ' WHERE in_tipoinforme = '#39'A'#39
      '   AND in_idestableci = es_id'
      '   AND co_contrato = es_contrato'
      '   AND em_id = co_idempresa')
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
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
    Left = 80
    Top = 260
  end
end
