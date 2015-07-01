inherited frmManSHT_HORARIOSTRASLADOS: TfrmManSHT_HORARIOSTRASLADOS
  Left = 305
  Top = 173
  Width = 666
  Caption = 
    'Prestadores | Mantenimiento de los horarios de los medios de tra' +
    'nsporte'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 658
    Height = 205
    Visible = True
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 287
      Height = 13
      Caption = 'Prestador que realiza la pr'#225'ctica m'#233'dica (FKT, etc.)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 80
      Width = 184
      Height = 13
      Caption = 'Prestador que realiza el traslado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 12
      Top = 156
      Width = 175
      Height = 13
      Caption = 'Medio de transporte (veh'#237'culo)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inline fraPrestadorPrestacion: TfraPrestador
      Left = 6
      Top = 27
      Width = 644
      Height = 50
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      AutoScroll = False
      TabOrder = 0
      DesignSize = (
        644
        50)
      inherited lbCUIT: TLabel
        Width = 24
      end
      inherited lbSec: TLabel
        Width = 21
      end
      inherited lbIdentif: TLabel
        Width = 40
      end
      inherited lbRSocial: TLabel
        Width = 38
      end
      inherited lbDomicilio: TLabel
        Width = 40
      end
      inherited lbLocalidad: TLabel
        Width = 44
      end
      inherited lbCPostal: TLabel
        Left = 572
        Width = 13
      end
      inherited lbTelefono: TLabel
        Left = 484
        Visible = True
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 189
      end
      inherited cmbPrestador: TArtComboBox
        Width = 314
      end
      inherited edPresDomicilio: TEdit
        Width = 249
      end
      inherited edPresLocalidad: TEdit
        Width = 126
      end
      inherited edPresCPostal: TEdit
        Left = 589
      end
      inherited edPresTelefono: TEdit
        Left = 504
        Visible = True
      end
      inherited sdqDatos: TSDQuery
        Top = 52
      end
      inherited dsDatos: TDataSource
        Top = 52
      end
    end
    inline fraPrestadorTransportista: TfraPrestador
      Left = 6
      Top = 99
      Width = 644
      Height = 50
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      AutoScroll = False
      TabOrder = 1
      DesignSize = (
        644
        50)
      inherited lbCUIT: TLabel
        Width = 24
      end
      inherited lbSec: TLabel
        Width = 21
      end
      inherited lbIdentif: TLabel
        Width = 40
      end
      inherited lbRSocial: TLabel
        Width = 38
      end
      inherited lbDomicilio: TLabel
        Width = 40
      end
      inherited lbLocalidad: TLabel
        Width = 44
      end
      inherited lbCPostal: TLabel
        Left = 572
        Width = 13
      end
      inherited lbTelefono: TLabel
        Left = 484
        Visible = True
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 189
      end
      inherited cmbPrestador: TArtComboBox
        Width = 314
      end
      inherited edPresDomicilio: TEdit
        Width = 249
      end
      inherited edPresLocalidad: TEdit
        Width = 126
      end
      inherited edPresCPostal: TEdit
        Left = 589
      end
      inherited edPresTelefono: TEdit
        Left = 504
        Visible = True
      end
      inherited sdqDatos: TSDQuery
        Top = 52
      end
      inherited dsDatos: TDataSource
        Top = 52
      end
    end
    inline fraDT_ID: TfraCodDesc
      Left = 8
      Top = 172
      Width = 304
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PATENTE'
            Title.Caption = 'Patente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_CANTLUGARES'
            Title.Caption = 'Lugares'
            Visible = True
          end>
        OnDropDown = fraDT_IDcmbDescripcionDropDown
      end
      inherited Propiedades: TPropiedadesFrame
        ShowBajas = True
        TableName = 'SIN.SDT_DETALLETRANSPORTE'
        FieldID = 'DT_ID'
        FieldCodigo = 'DT_IDPRESTADOR'
        FieldDesc = 'DT_DESCRIPCION'
        FieldBaja = 'DT_FECHABAJA'
        ExtraFields = ' , DT_PATENTE, DT_CANTLUGARES '
        IdType = ctInteger
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 205
    Width = 658
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 654
      end>
    inherited ToolBar: TToolBar
      Width = 641
      inherited tbPropiedades: TToolButton
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 234
    Width = 658
    Height = 205
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'DIA'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HT_HORADESDE'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HT_HORAHASTA'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HT_FRECUENCIA'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HT_IDPRESTADOR'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR_PRESTACION'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HT_IDMEDIOTRANSPORTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRANSPORTISTA'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_DESCRIPCION'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HT_VIGENCIADESDE'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HT_VIGENCIAHASTA'
        Width = 46
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 152
    Width = 533
    Height = 281
    inherited BevelAbm: TBevel
      Top = 245
      Width = 525
    end
    object Label4: TLabel [1]
      Left = 8
      Top = 8
      Width = 287
      Height = 13
      Caption = 'Prestador que realiza la pr'#225'ctica m'#233'dica (FKT, etc.)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel [2]
      Left = 8
      Top = 80
      Width = 184
      Height = 13
      Caption = 'Prestador que realiza el traslado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel [3]
      Left = 12
      Top = 156
      Width = 175
      Height = 13
      Caption = 'Medio de transporte (veh'#237'culo)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel [4]
      Left = 256
      Top = 200
      Width = 61
      Height = 13
      Caption = 'Frecuencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel [5]
      Left = 200
      Top = 200
      Width = 33
      Height = 13
      Caption = 'Hasta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel [6]
      Left = 340
      Top = 156
      Width = 47
      Height = 13
      Caption = 'Vigencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel [7]
      Left = 424
      Top = 176
      Width = 12
      Height = 13
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel [8]
      Left = 144
      Top = 200
      Width = 35
      Height = 13
      Caption = 'Desde'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel [9]
      Left = 16
      Top = 200
      Width = 96
      Height = 13
      Caption = 'D'#237'a de la semana'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel [10]
      Left = 328
      Top = 220
      Width = 46
      Height = 13
      Caption = 'minutos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnAceptar: TButton
      Left = 378
      Top = 251
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    inherited btnCancelar: TButton
      Left = 453
      Top = 251
      TabOrder = 11
    end
    inline fraHT_IDPRESTADOR: TfraPrestador
      Left = 6
      Top = 27
      Width = 517
      Height = 50
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      AutoScroll = False
      TabOrder = 0
      DesignSize = (
        517
        50)
      inherited lbCUIT: TLabel
        Width = 24
      end
      inherited lbSec: TLabel
        Width = 21
      end
      inherited lbIdentif: TLabel
        Width = 40
      end
      inherited lbRSocial: TLabel
        Width = 38
      end
      inherited lbDomicilio: TLabel
        Width = 40
      end
      inherited lbLocalidad: TLabel
        Left = 234
        Width = 44
      end
      inherited lbCPostal: TLabel
        Left = 445
        Width = 13
      end
      inherited lbTelefono: TLabel
        Left = 357
        Visible = True
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 62
      end
      inherited cmbPrestador: TArtComboBox
        Width = 187
      end
      inherited edPresDomicilio: TEdit
        Width = 181
      end
      inherited edPresLocalidad: TEdit
        Left = 284
        Width = 69
      end
      inherited edPresCPostal: TEdit
        Left = 462
      end
      inherited edPresTelefono: TEdit
        Left = 377
        Visible = True
      end
      inherited sdqDatos: TSDQuery
        Top = 52
      end
      inherited dsDatos: TDataSource
        Top = 52
      end
    end
    inline fraTransportista: TfraPrestador
      Left = 6
      Top = 99
      Width = 517
      Height = 50
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      AutoScroll = False
      TabOrder = 1
      DesignSize = (
        517
        50)
      inherited lbCUIT: TLabel
        Width = 24
      end
      inherited lbSec: TLabel
        Width = 21
      end
      inherited lbIdentif: TLabel
        Width = 40
      end
      inherited lbRSocial: TLabel
        Width = 38
      end
      inherited lbDomicilio: TLabel
        Width = 40
      end
      inherited lbLocalidad: TLabel
        Left = 234
        Width = 44
      end
      inherited lbCPostal: TLabel
        Left = 445
        Width = 13
      end
      inherited lbTelefono: TLabel
        Left = 357
        Visible = True
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 62
      end
      inherited cmbPrestador: TArtComboBox
        Width = 187
      end
      inherited edPresDomicilio: TEdit
        Width = 181
      end
      inherited edPresLocalidad: TEdit
        Left = 284
        Width = 69
      end
      inherited edPresCPostal: TEdit
        Left = 462
      end
      inherited edPresTelefono: TEdit
        Left = 377
        Visible = True
      end
      inherited sdqDatos: TSDQuery
        Top = 52
      end
      inherited dsDatos: TDataSource
        Top = 52
      end
    end
    inline fraHT_IDMEDIOTRANSPORTE: TfraCodDesc
      Left = 8
      Top = 172
      Width = 325
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 260
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PATENTE'
            Title.Caption = 'Patente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_CANTLUGARES'
            Title.Caption = 'Lugares'
            Visible = True
          end>
        OnDropDown = fraHT_IDMEDIOTRANSPORTEcmbDescripcionDropDown
      end
      inherited Propiedades: TPropiedadesFrame
        ShowBajas = True
        TableName = 'SIN.SDT_DETALLETRANSPORTE'
        FieldID = 'DT_ID'
        FieldCodigo = 'DT_IDPRESTADOR'
        FieldDesc = 'DT_DESCRIPCION'
        FieldBaja = 'DT_FECHABAJA'
        ExtraFields = ' , DT_PATENTE, DT_CANTLUGARES '
        IdType = ctInteger
      end
    end
    object btnAgregarOtroDia: TButton
      Left = 6
      Top = 251
      Width = 187
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'A&gregar otro d'#237'a de atenci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = btnAgregarOtroDiaClick
    end
    object edHT_FRECUENCIA: TSpinEdit
      Left = 252
      Top = 216
      Width = 73
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 8
      Value = 0
    end
    object edHT_HORAHASTA: TJvDateTimePicker
      Left = 196
      Top = 216
      Width = 53
      Height = 21
      Date = 39640.000000000000000000
      Format = 'HH:mm'
      Time = 39640.000000000000000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 7
      DropDownDate = 39640.000000000000000000
    end
    object edHT_HORADESDE: TJvDateTimePicker
      Left = 140
      Top = 216
      Width = 53
      Height = 21
      Date = 39640.000000000000000000
      Format = 'HH:mm'
      Time = 39640.000000000000000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 6
      DropDownDate = 39640.000000000000000000
    end
    object edHT_VIGENCIADESDE: TJvDateTimePicker
      Left = 340
      Top = 172
      Width = 81
      Height = 21
      Date = 39640.769525590280000000
      Time = 39640.769525590280000000
      TabOrder = 3
      DropDownDate = 39640.000000000000000000
    end
    object edHT_VIGENCIAHASTA: TJvDateTimePicker
      Left = 440
      Top = 172
      Width = 81
      Height = 21
      Date = 39640.769525590280000000
      Time = 39640.769525590280000000
      TabOrder = 4
      DropDownDate = 39640.000000000000000000
    end
    object cmbHT_DIA: TComboBox
      Left = 12
      Top = 216
      Width = 125
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        'Lunes'
        'Martes'
        'Mi'#233'rcoles'
        'Jueves'
        'Viernes'
        'S'#225'bado'
        'Domingo')
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ht_id, ht_vigenciadesde, ht_vigenciahasta, ht_horadesde, ' +
        'ht_horahasta, ht_frecuencia,'
      
        '       ht_idprestador, crp_prestacion.ca_descripcion AS prestado' +
        'r_prestacion,'
      
        '       ht_idmediotransporte, cpr_transportista.ca_descripcion AS' +
        ' transportista,'
      '       (CASE ht_dia'
      '          WHEN 1 THEN '#39'Lunes'#39
      '          WHEN 2 THEN '#39'Martes'#39
      '          WHEN 3 THEN '#39'Mi'#233'rcoles'#39
      '          WHEN 4 THEN '#39'Jueves'#39
      '          WHEN 5 THEN '#39'Viernes'#39
      '          WHEN 6 THEN '#39'S'#225'bado'#39
      '          WHEN 7 THEN '#39'Domingo'#39
      '        END) AS dia,'
      
        '       ht_usualta, ht_fechaalta, ht_usumodif, ht_fechamodif, ht_' +
        'usubaja, ht_fechabaja,'
      '       ht_dia, dt_descripcion'
      
        '  FROM art.cpr_prestador crp_prestacion, art.cpr_prestador cpr_t' +
        'ransportista,'
      '       SIN.sdt_detalletransporte, SIN.sht_horariostraslados'
      ' WHERE ht_idprestador = crp_prestacion.ca_identificador'
      '   AND ht_idmediotransporte = dt_id'
      '   AND cpr_transportista.ca_identificador = dt_idprestador')
    Left = 8
    Top = 324
    object sdqConsultaHT_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'HT_ID'
      Required = True
    end
    object sdqConsultaHT_VIGENCIADESDE: TDateTimeField
      DisplayLabel = 'Vigencia Desde'
      FieldName = 'HT_VIGENCIADESDE'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sdqConsultaHT_VIGENCIAHASTA: TDateTimeField
      DisplayLabel = 'Vigencia Hasta'
      FieldName = 'HT_VIGENCIAHASTA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sdqConsultaHT_HORADESDE: TDateTimeField
      DisplayLabel = 'Desde'
      FieldName = 'HT_HORADESDE'
      Required = True
      DisplayFormat = 'hh:nn'
    end
    object sdqConsultaHT_HORAHASTA: TDateTimeField
      DisplayLabel = 'Hasta'
      FieldName = 'HT_HORAHASTA'
      Required = True
      DisplayFormat = 'hh:nn'
    end
    object sdqConsultaHT_IDPRESTADOR: TFloatField
      DisplayLabel = 'Prestador'
      FieldName = 'HT_IDPRESTADOR'
      Required = True
    end
    object sdqConsultaPRESTADOR_PRESTACION: TStringField
      DisplayLabel = 'Prestador que realiza la pr'#225'ctica'
      FieldName = 'PRESTADOR_PRESTACION'
      Size = 150
    end
    object sdqConsultaHT_IDMEDIOTRANSPORTE: TFloatField
      DisplayLabel = 'Transportista'
      FieldName = 'HT_IDMEDIOTRANSPORTE'
      Required = True
    end
    object sdqConsultaTRANSPORTISTA: TStringField
      DisplayLabel = 'Prestador Transportista'
      FieldName = 'TRANSPORTISTA'
      Size = 150
    end
    object sdqConsultaHT_DIA: TFloatField
      DisplayLabel = 'D'#237'a'
      FieldName = 'HT_DIA'
      Required = True
    end
    object sdqConsultaDIA: TStringField
      DisplayLabel = 'D'#237'a'
      FieldName = 'DIA'
      Size = 9
    end
    object sdqConsultaHT_FRECUENCIA: TFloatField
      DisplayLabel = 'Frecuencia'
      FieldName = 'HT_FRECUENCIA'
      Required = True
    end
    object sdqConsultaHT_USUALTA: TStringField
      FieldName = 'HT_USUALTA'
      Required = True
    end
    object sdqConsultaHT_FECHAALTA: TDateTimeField
      FieldName = 'HT_FECHAALTA'
      Required = True
    end
    object sdqConsultaHT_USUMODIF: TStringField
      FieldName = 'HT_USUMODIF'
    end
    object sdqConsultaHT_FECHAMODIF: TDateTimeField
      FieldName = 'HT_FECHAMODIF'
    end
    object sdqConsultaHT_USUBAJA: TStringField
      FieldName = 'HT_USUBAJA'
    end
    object sdqConsultaHT_FECHABAJA: TDateTimeField
      FieldName = 'HT_FECHABAJA'
    end
    object sdqConsultaDT_DESCRIPCION: TStringField
      DisplayLabel = 'Veh'#237'culo'
      FieldName = 'DT_DESCRIPCION'
      Size = 250
    end
  end
  inherited dsConsulta: TDataSource
    Left = 36
    Top = 324
  end
  inherited SortDialog: TSortDialog
    Left = 8
    Top = 352
  end
  inherited ExportDialog: TExportDialog
    Left = 36
    Top = 352
  end
  inherited QueryPrint: TQueryPrint
    Left = 36
    Top = 380
  end
  inherited Seguridad: TSeguridad
    Left = 8
    Top = 296
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 296
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
    Top = 380
  end
  inherited ShortCutControl: TShortCutControl
    Left = 64
    Top = 296
  end
  inherited FieldHider: TFieldHider
    Left = 64
    Top = 324
  end
end
