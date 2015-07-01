inherited frmIIBBProvincias: TfrmIIBBProvincias
  Left = 392
  Top = 125
  Width = 817
  Height = 655
  Caption = 'Ingresos Brutos por provincias'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 809
    Visible = True
    object GroupBox3: TGroupBox
      Left = 0
      Top = 0
      Width = 541
      Height = 43
      Caption = 'Provincia'
      TabOrder = 0
      inline fraProvinciaFiltro: TfraCodigoDescripcion
        Left = 13
        Top = 14
        Width = 517
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 452
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Width = 809
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 805
      end>
    inherited ToolBar: TToolBar
      Width = 792
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 809
    Height = 554
    Columns = <
      item
        Expanded = False
        FieldName = 'provincia'
        Title.Caption = 'Provincia'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'retencion'
        Title.Caption = 'Retenci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'Tipo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'exige_numero'
        Title.Caption = 'Exige N'#176
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descripcion'
        Title.Caption = 'Descripci'#243'n'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'observaciones'
        Title.Caption = 'Observaciones'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigo_financials'
        Title.Caption = 'Cod. Financials'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fbaja'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'retfija'
        Title.Caption = 'Ret. Fija'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mni'
        Title.Caption = 'M'#237'n. No Imp.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aliret'
        Title.Caption = 'Al'#237'c. Ret.'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 96
    Top = 108
    Width = 557
    Height = 425
    BorderStyle = bsSingle
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 389
      Width = 549
    end
    object Label3: TLabel [1]
      Left = 16
      Top = 173
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label4: TLabel [2]
      Left = 16
      Top = 201
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object lblRetFija: TLabel [3]
      Left = 16
      Top = 235
      Width = 39
      Height = 13
      Caption = 'Ret. Fija'
    end
    object lblMNI: TLabel [4]
      Left = 148
      Top = 235
      Width = 100
      Height = 13
      Caption = 'M'#237'nimo No Imponible'
    end
    object lblAlicRet: TLabel [5]
      Left = 346
      Top = 235
      Width = 92
      Height = 13
      Caption = 'Al'#237'cuota Retenci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 399
      Top = 395
    end
    inherited btnCancelar: TButton
      Left = 477
      Top = 395
    end
    object gbProvincias: TGroupBox
      Left = 16
      Top = 16
      Width = 525
      Height = 43
      Caption = 'Provincia'
      TabOrder = 2
      inline fraProvincias: TfraCodigoDescripcion
        Left = 5
        Top = 14
        Width = 514
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 449
        end
        inherited edCodigo: TPatternEdit
          OnExit = fraProvinciasedCodigoExit
        end
      end
    end
    object gbRetencion: TGroupBox
      Left = 16
      Top = 64
      Width = 525
      Height = 44
      Caption = 'Retenci'#243'n'
      TabOrder = 3
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 105
        Top = 20
        Width = 56
        Height = 13
        Caption = 'Descripci'#243'n'
      end
      object ieCodRet: TIntEdit
        Left = 48
        Top = 16
        Width = 45
        Height = 21
        TabOrder = 0
        MaxLength = 3
      end
      object edDescRet: TEdit
        Left = 168
        Top = 16
        Width = 349
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
    end
    object gbTipoIIBB: TGroupBox
      Left = 16
      Top = 113
      Width = 525
      Height = 46
      Caption = 'Tipo IIBB'
      TabOrder = 4
      inline fraTipoIIBB: TfraCtbTablas
        Left = 5
        Top = 15
        Width = 513
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 68
          Width = 444
        end
        inherited edCodigo: TPatternEdit
          Width = 63
        end
      end
    end
    object rgExigeNumero: TRadioGroup
      Left = 440
      Top = 163
      Width = 101
      Height = 55
      Caption = 'Exige n'#250'mero IIBB'
      ItemIndex = 0
      Items.Strings = (
        'SI'
        'NO')
      TabOrder = 5
    end
    object edDescripcion: TEdit
      Left = 90
      Top = 169
      Width = 345
      Height = 21
      TabOrder = 6
    end
    object edObservaciones: TEdit
      Left = 90
      Top = 197
      Width = 345
      Height = 21
      TabOrder = 7
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 262
      Width = 525
      Height = 65
      Caption = 'Jurisdicci'#243'n de Retenci'#243'n de IIBB'
      TabOrder = 8
      inline fraProvinciasJur: TfraCodigoDescripcion
        Left = 4
        Top = 14
        Width = 517
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 452
        end
      end
      object chkNoRetiene: TCheckBox
        Left = 4
        Top = 42
        Width = 97
        Height = 17
        Caption = 'No Retiene'
        TabOrder = 1
        OnClick = chkNoRetieneClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 334
      Width = 525
      Height = 42
      Caption = 'Concepto de Retenci'#243'n de IIBB'
      TabOrder = 9
      object edConceptoRet: TEdit
        Left = 5
        Top = 15
        Width = 512
        Height = 21
        TabOrder = 0
      end
    end
    object ceRetFija: TCurrencyEdit
      Left = 63
      Top = 231
      Width = 69
      Height = 21
      AutoSize = False
      TabOrder = 10
    end
    object ceMNI: TCurrencyEdit
      Left = 257
      Top = 231
      Width = 69
      Height = 21
      AutoSize = False
      TabOrder = 11
    end
    object ceAlicRet: TCurrencyEdit
      Left = 448
      Top = 231
      Width = 45
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00,%'
      TabOrder = 12
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT p.pv_descripcion provincia, c.ib_codigo codigo, c.ib_rete' +
        'ncion retencion, c.ib_tipoingbrutos tipo,'
      
        '       c.ib_exigenumero exige_numero, c.ib_descripcion descripci' +
        'on, c.ib_observaciones observaciones,'
      
        '       r.ib_wh_zone_code || '#39'_'#39' || r.ib_wh_conc_code codigo_fina' +
        'ncials, c.ib_fechabaja fbaja, p.pv_codigo codprov,'
      
        '       c.ib_retfija retfija, c.ib_mni mni, c.ib_alicuotaret alir' +
        'et'
      
        '  FROM art.cpv_provincias p, art.cib_ingresosbrutos c, art.rib_r' +
        'etencioningbrutos r'
      ' WHERE c.ib_provincia = p.pv_codigo'
      '   AND c.ib_provincia = r.ib_provincia(+)'
      '   AND c.ib_codigo = r.ib_codigo(+)')
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
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 56
    Top = 316
  end
end
