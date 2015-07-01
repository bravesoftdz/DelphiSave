inherited frmListDenunciasGraves: TfrmListDenunciasGraves
  Left = 294
  Top = 135
  Width = 730
  Height = 361
  Caption = 'Listado de Denuncias Graves'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 722
    Height = 90
    object gbFechas: TGroupBox
      Left = 1
      Top = 1
      Width = 235
      Height = 43
      Caption = 'Denuncia Inicial y Modif. SRT - Fechas'
      TabOrder = 0
      object Label2: TLabel
        Left = 112
        Top = 21
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFecDesde: TDateComboBox
        Left = 9
        Top = 17
        Width = 95
        Height = 21
        MaxDateCombo = edFecHasta
        TabOrder = 0
      end
      object edFecHasta: TDateComboBox
        Left = 133
        Top = 17
        Width = 95
        Height = 21
        MinDateCombo = edFecDesde
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 366
      Top = 1
      Width = 355
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Delegaci'#243'n'
      TabOrder = 2
      DesignSize = (
        355
        43)
      inline fraDelegacion: TfraDelegacion
        Left = 6
        Top = 15
        Width = 345
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 280
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 239
      Top = 1
      Width = 124
      Height = 43
      Caption = 'Siniestro'
      TabOrder = 1
      DesignSize = (
        124
        43)
      object edSiniestro: TSinEdit
        Left = 6
        Top = 16
        Width = 109
        Height = 21
        Hint = 'C'#243'digo de Siniestro'
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 239
      Top = 44
      Width = 482
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Prestador'
      TabOrder = 4
      DesignSize = (
        482
        43)
      inline fraPrestador: TfraPrestador
        Left = 2
        Top = 13
        Width = 476
        Height = 27
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCPostal: TLabel
          Left = 388
        end
        inherited lbTelefono: TLabel
          Left = 300
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 5
        end
        inherited cmbPrestador: TArtComboBox
          Width = 130
        end
        inherited edPresLocalidad: TEdit
          Width = 34
        end
        inherited edPresCPostal: TEdit
          Left = 405
        end
        inherited edPresTelefono: TEdit
          Left = 320
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 1
      Top = 44
      Width = 235
      Height = 43
      Caption = 'Denuncia Inicial y Modif. SRT - Tipo'
      TabOrder = 3
      DesignSize = (
        235
        43)
      object cmbTipoModif: TDBCheckCombo
        Left = 8
        Top = 16
        Width = 221
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsTipoModif
        KeyField = 'DH_ID'
        ListField = 'DH_DESCRIPCION'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 90
    Width = 722
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 718
      end>
    inherited ToolBar: TToolBar
      Width = 705
    end
  end
  inherited Grid: TArtDBGrid
    Top = 119
    Width = 722
    Height = 215
    Columns = <
      item
        Expanded = False
        FieldName = 'EX_SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_ORDEN'
        Title.Caption = 'Orden'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_RECAIDA'
        Title.Caption = 'Reca'#237'da'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_CUIL'
        Title.Caption = 'CUIL'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_CUIT'
        Title.Caption = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_FECHAACCIDENTE'
        Title.Caption = 'F. Accidente'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_FECHAMODIFSRT1'
        Title.Caption = '1) Fec. Modif. SRT'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOMODIFSRT1'
        Title.Caption = '1) Tipo Modif SRT'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_TIPOMODIFSRT_OTROS1'
        Title.Caption = '1) Tipo Modif - Otros'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_FECHAMODIFSRT2'
        Title.Caption = '2) Fec. Modif. SRT'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOMODIFSRT2'
        Title.Caption = '2) Tipo Modif SRT'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_TIPOMODIFSRT_OTROS2'
        Title.Caption = '2) Tipo Modif - Otros'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_FECHAMODIFSRT3'
        Title.Caption = '3) Fec. Modif. SRT'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOMODIFSRT3'
        Title.Caption = '3) Tipo Modif SRT'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_TIPOMODIFSRT_OTROS3'
        Title.Caption = '3) Tipo Modif - Otros'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_FECHAMODIFSRT4'
        Title.Caption = '4) Fec. Modif. SRT'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOMODIFSRT4'
        Title.Caption = '4) Tipo Modif SRT'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_TIPOMODIFSRT_OTROS4'
        Title.Caption = '4) Tipo Modif - Otros'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_FECHAMODIFSRT5'
        Title.Caption = '5) Fec. Modif. SRT'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOMODIFSRT5'
        Title.Caption = '5) Tipo Modif SRT'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_TIPOMODIFSRT_OTROS5'
        Title.Caption = '5) Tipo Modif - Otros'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_FECHAIMPRESION_NOTA'
        Title.Caption = 'Fec. Impresi'#243'n Nota Extemp.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_FECHAMAIL_NOTA'
        Title.Caption = 'Fec. Mail Nota Extemp.'
        Width = 150
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, EX_CUIL, TJ_NOMBRE, E' +
        'X_CUIT, EM_NOMBRE, EX_FECHAACCIDENTE, '
      
        '       DG_FECHAMODIFSRT1, DG_TIPOMODIFSRT1, DG_TIPOMODIFSRT_OTRO' +
        'S1, '
      
        '       DG_FECHAMODIFSRT2, DG_TIPOMODIFSRT2, DG_TIPOMODIFSRT_OTRO' +
        'S2,'
      
        '       DG_FECHAMODIFSRT3, DG_TIPOMODIFSRT3, DG_TIPOMODIFSRT_OTRO' +
        'S3,'
      
        '       DG_FECHAMODIFSRT4, DG_TIPOMODIFSRT4, DG_TIPOMODIFSRT_OTRO' +
        'S4,'
      
        '       DG_FECHAMODIFSRT5, DG_TIPOMODIFSRT5, DG_TIPOMODIFSRT_OTRO' +
        'S5,'
      '       DG_FECHAIMPRESION_NOTA, DG_FECHAMAIL_NOTA'
      
        '  FROM SIN.SDG_DENUNCIAGRAVE, ART.SEX_EXPEDIENTES, CTJ_TRABAJADO' +
        'R, AEM_EMPRESA'
      ' WHERE DG_IDEXPEDIENTE = EX_ID'
      '   AND TJ_CUIL = EX_CUIL'
      '   AND TJ_ID = EX_IDTRABAJADOR'
      '   AND EM_CUIT = EX_CUIT')
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        DataField = 'EX_SINIESTRO'
        Width = 110
        MaxLength = 0
      end
      item
        Title = 'Orden'
        DataField = 'EX_ORDEN'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'Rec.'
        DataField = 'EX_RECAIDA'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'Trabajador'
        DataField = 'TJ_NOMBRE'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Empresa'
        DataField = 'EM_NOMBRE'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Fec. Accidente'
        DataField = 'EX_FECHAACCIDENTE'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '1) F.Modif.SRT'
        DataField = 'DG_FECHAMODIFSRT1'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '1) Tipo Modif.'
        DataField = 'TIPOMODIFSRT1'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '1) Tipo Otros'
        DataField = 'DG_TIPOMODIFSRT_OTROS1'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '2) F.Modif.SRT'
        DataField = 'DG_FECHAMODIFSRT2'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '2) Tipo Modif.'
        DataField = 'TIPOMODIFSRT2'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '2) Tipo Otros'
        DataField = 'DG_TIPOMODIFSRT_OTROS2'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '3) F.Modif.SRT'
        DataField = 'DG_FECHAMODIFSRT3'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '3) Tipo Modif.'
        DataField = 'TIPOMODIFSRT3'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '3) Tipo Otros'
        DataField = 'DG_TIPOMODIFSRT_OTROS3'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '4) F.Modif.SRT'
        DataField = 'DG_FECHAMODIFSRT4'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '4) Tipo Modif.'
        DataField = 'TIPOMODIFSRT4'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '4) Tipo Otros'
        DataField = 'DG_TIPOMODIFSRT_OTROS4'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '5) F.Modif.SRT'
        DataField = 'DG_FECHAMODIFSRT5'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '5) Tipo Modif.'
        DataField = 'TIPOMODIFSRT5'
        Width = 150
        MaxLength = 0
      end
      item
        Title = '5) Tipo Otros'
        DataField = 'DG_TIPOMODIFSRT_OTROS5'
        Width = 150
        MaxLength = 0
      end>
    Headers.Font.Height = -9
    PageOrientation = pxLandscape
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
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
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  object dsTipoModif: TDataSource
    DataSet = sdqTipoModif
    Left = 148
    Top = 60
  end
  object sdqTipoModif: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'select dh_id, dh_descripcion '
      'from SIN.SDH_TIPOSMODIFICACIONESSRT'
      'where dh_fechabaja is null')
    Left = 176
    Top = 60
  end
end
