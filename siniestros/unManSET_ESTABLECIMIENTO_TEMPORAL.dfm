inherited frmManSET_ESTABLECIMIENTO_TEMPORAL: TfrmManSET_ESTABLECIMIENTO_TEMPORAL
  Left = 297
  Top = 165
  Caption = 'Mantenimiento de Establecimientos Temporales'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 72
  end
  inherited CoolBar: TCoolBar
    Top = 72
  end
  inherited Grid: TArtDBGrid
    Top = 101
    Height = 338
    Columns = <
      item
        Expanded = False
        FieldName = 'ET_CUIT'
        Title.Caption = 'CUIT Empresa'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEMPRESA'
        Title.Caption = 'Empresa'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_NROESTABLECI'
        Title.Caption = 'Nro. Establ.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_CUIT_TEMPORAL'
        Title.Caption = 'CUIT Establ. Temp.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_ESTABLTEMP'
        Title.Caption = 'Establ. Temporal'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_CALLE'
        Title.Caption = 'Calle'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_NUMERO'
        Title.Caption = 'Nro.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_PISO'
        Title.Caption = 'Piso'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_DEPARTAMENTO'
        Title.Caption = 'Depto'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_CPOSTAL'
        Title.Caption = 'Cod.Postal'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_TELEFONOS'
        Title.Caption = 'Tels.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 100
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 25
    Top = 136
    Width = 566
    Height = 223
    ActiveControl = fraEmpresa.mskCUIT
    inherited BevelAbm: TBevel
      Top = 189
      Width = 558
    end
    inherited btnAceptar: TButton
      Left = 408
      Top = 193
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 486
      Top = 193
      TabOrder = 3
    end
    object grpEmpresa: TGroupBox
      Left = 5
      Top = 3
      Width = 557
      Height = 50
      Caption = ' Empresa '
      TabOrder = 0
      inline fraEmpresa: TfraEmpresa
        Left = 6
        Top = 19
        Width = 546
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
        inherited lbRSocial: TLabel
          Width = 39
          Height = 17
        end
        inherited lbContrato: TLabel
          Left = 442
        end
        inherited edContrato: TIntEdit
          Left = 489
        end
        inherited cmbRSocial: TArtComboBox
          Width = 307
        end
      end
    end
    object grpEstablecimientoTemporal: TGroupBox
      Left = 6
      Top = 55
      Width = 556
      Height = 133
      Caption = ' Establecimiento Temporal '
      TabOrder = 1
      object lbValidacionCUIT: TLabel
        Left = 133
        Top = 18
        Width = 19
        Height = 24
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Wingdings'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 153
        Top = 24
        Width = 37
        Height = 13
        Caption = 'Nombre'
      end
      object Label2: TLabel
        Left = 2
        Top = 108
        Width = 47
        Height = 13
        Caption = 'Tel'#233'fonos'
      end
      object Label3: TLabel
        Left = 226
        Top = 108
        Width = 37
        Height = 13
        Caption = 'Observ.'
      end
      object CUIT: TLabel
        Left = 20
        Top = 25
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      object Label4: TLabel
        Left = 443
        Top = 24
        Width = 50
        Height = 13
        Caption = 'Nro.Estab.'
      end
      object edNombre: TEdit
        Left = 192
        Top = 20
        Width = 246
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
      inline fraDomicilio: TfraDomicilio
        Left = 4
        Top = 48
        Width = 545
        Height = 51
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        inherited lbNro: TLabel
          Left = 330
        end
        inherited lbPiso: TLabel
          Left = 402
        end
        inherited lbDto: TLabel
          Left = 478
        end
        inherited lbProvincia: TLabel
          Left = 383
        end
        inherited cmbCalle: TArtComboBox
          Width = 245
        end
        inherited edNumero: TEdit
          Left = 352
        end
        inherited edPiso: TEdit
          Left = 428
        end
        inherited edDto: TEdit
          Left = 500
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 113
        end
        inherited edProvincia: TEdit
          Left = 432
        end
        inherited btnBuscar: TButton
          Left = 295
        end
      end
      object edTelefonos: TEdit
        Left = 52
        Top = 103
        Width = 157
        Height = 21
        MaxLength = 60
        TabOrder = 4
      end
      object edObservaciones: TEdit
        Left = 268
        Top = 103
        Width = 281
        Height = 21
        MaxLength = 150
        TabOrder = 5
      end
      object mskCUIT_EstTemp: TMaskEdit
        Left = 52
        Top = 20
        Width = 81
        Height = 21
        Hint = 'CUIT del Establecimiento Temporal'
        EditMask = '99-99999999-9;0;'
        MaxLength = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = mskCUIT_EstTempExit
      end
      object mskNroEstab: TMaskEdit
        Left = 494
        Top = 20
        Width = 55
        Height = 21
        EditMask = '99999999;1;_'
        MaxLength = 8
        TabOrder = 2
        Text = '        '
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'select et_id, et_cuit, em_nombre NomEmpresa, et_nroestableci, et' +
        '_cuit_temporal, et_nombre Nombre_EstablTemp,  '
      
        '       et_calle, et_numero, et_piso, et_departamento, et_localid' +
        'ad, et_cpostal, pv_descripcion Provincia, '
      '       et_telefonos, et_observaciones, et_fechabaja, co_contrato'
      'from sin.set_establecimiento_temporal, aem_empresa,'
      '     art.cpv_provincias, aco_contrato'
      'where em_cuit = et_cuit'
      '  and pv_codigo = et_provincia'
      '  and em_id = co_idempresa'
      '  AND co_fechabaja IS NULL')
    Left = 428
    Top = 44
  end
  inherited dsConsulta: TDataSource
    Left = 456
    Top = 44
  end
  inherited SortDialog: TSortDialog
    Left = 512
    Top = 16
  end
  inherited ExportDialog: TExportDialog
    Left = 540
    Top = 16
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'CUIT Empresa'
        DataField = 'ET_CUIT'
        Width = 180
        MaxLength = 0
      end
      item
        Title = 'Empresa'
        DataField = 'NOMEMPRESA'
        Width = 500
        MaxLength = 0
      end
      item
        Title = 'Nro.Est.'
        DataField = 'ET_NROESTABLECI'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'CUIT Est.Temp.'
        DataField = 'ET_CUIT_TEMPORAL'
        Width = 180
        MaxLength = 0
      end
      item
        Title = 'Nombre Est.Temp.'
        DataField = 'NOMBRE_ESTABLTEMP'
        Width = 400
        MaxLength = 0
      end
      item
        Title = 'Calle'
        DataField = 'ET_CALLE'
        Width = 350
        MaxLength = 0
      end
      item
        Title = 'Nro.'
        DataField = 'ET_NUMERO'
        Width = 70
        MaxLength = 0
      end
      item
        Title = 'Piso'
        DataField = 'ET_PISO'
        Width = 70
        MaxLength = 0
      end
      item
        Title = 'Dpto.'
        DataField = 'ET_DEPARTAMENTO'
        Width = 70
        MaxLength = 0
      end
      item
        Title = 'Localidad'
        DataField = 'ET_LOCALIDAD'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Cod.Postal'
        DataField = 'ET_CPOSTAL'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'Provincia'
        DataField = 'PROVINCIA'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Tels.'
        DataField = 'ET_TELEFONOS'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Obs.'
        DataField = 'ET_OBSERVACIONES'
        Width = 400
        MaxLength = 0
      end>
    PageOrientation = pxLandscape
    Left = 540
    Top = 44
  end
  inherited Seguridad: TSeguridad
    Left = 428
    Top = 16
  end
  inherited FormStorage: TFormStorage
    Left = 456
    Top = 16
  end
  inherited PrintDialog: TPrintDialog
    Left = 512
    Top = 44
  end
  inherited ShortCutControl: TShortCutControl
    Left = 484
    Top = 16
  end
  inherited FieldHider: TFieldHider
    Left = 484
    Top = 44
  end
end
