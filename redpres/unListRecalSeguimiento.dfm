inherited frmListRecalSeguimiento: TfrmListRecalSeguimiento
  Left = 255
  Top = 173
  Width = 671
  Height = 396
  Caption = 'Listado Seguimientos de Recalificaci'#243'n'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 663
    Height = 96
    object chkFechaAmerita: TCheckPanel
      Left = 1
      Top = 1
      Width = 227
      Height = 45
      Caption = '&Fecha de Evento Amerita '
      TabOrder = 0
      Checked = False
      OnChange = chkFechaAmeritaChange
      object Label1: TLabel
        Left = 107
        Top = 22
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object deFechaDesde: TDateComboBox
        Left = 6
        Top = 18
        Width = 97
        Height = 21
        MaxDateCombo = deFechaHasta
        TabOrder = 0
      end
      object deFechaHasta: TDateComboBox
        Left = 124
        Top = 18
        Width = 97
        Height = 21
        MinDateCombo = deFechaDesde
        TabOrder = 1
      end
    end
    object chkResponsable: TCheckPanel
      Left = 230
      Top = 1
      Width = 431
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Responsable '
      TabOrder = 1
      Checked = False
      OnChange = chkResponsableChange
      DesignSize = (
        431
        45)
      object cmbResponsable: TDBCheckCombo
        Left = 8
        Top = 18
        Width = 418
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsResponsables
        KeyField = 'RE_RESPONSABLE'
        ListField = 'RE_NOMBRE'
      end
    end
    object chkEmpresa: TCheckPanel
      Left = 2
      Top = 48
      Width = 658
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Empresa '
      TabOrder = 2
      Checked = False
      OnChange = chkEmpresaChange
      DesignSize = (
        658
        46)
      inline fraEmpresa: TfraEmpresa
        Left = 5
        Top = 18
        Width = 648
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
          Left = 544
        end
        inherited edContrato: TIntEdit
          Left = 591
        end
        inherited cmbRSocial: TArtComboBox
          Width = 409
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 96
    Width = 663
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 659
      end>
    inherited ToolBar: TToolBar
      Width = 646
      inherited tbNuevo: TToolButton
        Enabled = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 125
    Width = 663
    Height = 241
    Columns = <
      item
        Expanded = False
        FieldName = 'ER_SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ER_ORDEN'
        Title.Caption = 'Orden'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'recaida'
        Title.Caption = 'Reca'#237'da'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRETRAB'
        Title.Caption = 'Trabajador'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALIDADTRAB'
        Title.Caption = 'Localidad Trabajador'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Title.Caption = 'Nro CUIT'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBREEMPRESA'
        Title.Caption = 'Empresa'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALIDADEMP'
        Title.Caption = 'Localidad Empresa'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESPONSABLE'
        Title.Caption = 'Responsable'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fechaamerita'
        Title.Caption = 'Fecha Amerita'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha095093'
        Title.Caption = 'Fecha alta 095 '#243' 093'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECULTEV'
        Title.Caption = 'Fecha Ult. Evento'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGOULTEV'
        Title.Caption = 'C'#243'd. Ult. Evento'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIFERENCIADIAS'
        Title.Caption = 'Cant. d'#237'as desde Ult. Evento'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ex_fechaaccidente'
        Title.Caption = 'Fecha Accidente'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha100'
        Title.Caption = 'Fecha ev. 100'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ultfechaseguim'
        Title.Caption = 'Ult. fecha seguim.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'anteultfechaseguim'
        Title.Caption = 'Anteult. fecha seguim.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'observultseguim'
        Title.Caption = 'Obs. ult. seguim.'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'diasultanteultseguim'
        Title.Caption = 'D'#237'as entre ante'#250'lt. y  '#250'lt. ev.'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'diassin115'
        Title.Caption = 'D'#237'as sin ev. 115'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'capint'
        Title.Caption = 'Cap / Int'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha054'
        Title.Caption = 'Fecha ev. 054'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuario042'
        Title.Caption = 'Usuario ev. 042'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pe_fechaaltamedica'
        Title.Caption = 'Alta m'#233'dica'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pe_fechaaltalaboral'
        Title.Caption = 'Alta laboral'
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        DataField = 'ER_SINIESTRO'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Orden'
        DataField = 'ER_ORDEN'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Trabajador'
        DataField = 'NOMBRETRAB'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Loc. Trabajador'
        DataField = 'LOCALIDADTRAB'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Cuit'
        DataField = 'CUIT'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Empresa'
        DataField = 'NOMBREEMPRESA'
        Width = 350
        MaxLength = 0
      end
      item
        Title = 'Loc. Empresa'
        DataField = 'LOCALIDADEMP'
        Width = 250
        MaxLength = 0
      end
      item
        Title = 'Responsable'
        DataField = 'RESPONSABLE'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'F.Amerita'
        DataField = 'FECHAAMERITA'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'F.Ult.Ev.'
        DataField = 'FECULTEV'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Cod.Ult.Ev'
        DataField = 'CODIGOULTEV'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Cant.D'#237'as'
        DataField = 'DIFERENCIADIAS'
        Width = 200
        MaxLength = 0
      end>
    PageOrientation = pxLandscape
    PageSize = psA4
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
  object sdqResponsables: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT RE_RESPONSABLE, RE_NOMBRE'
      '  FROM MRE_RESPONSABLE'
      ' WHERE RE_FECBAJA IS NULL'
      'ORDER BY RE_NOMBRE')
    Left = 430
    Top = 15
  end
  object dsResponsables: TDataSource
    DataSet = sdqResponsables
    Left = 458
    Top = 15
  end
end
