inherited frmManLnoNorma: TfrmManLnoNorma
  Left = 321
  Top = 198
  Caption = 'Mantenimiento de Normas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'NO_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TN_DESCRIPCION'
        Title.Caption = 'Tipo Norma'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_NRO'
        Title.Caption = 'N'#250'mero'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_IDTIPONORMA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 368
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHANORMA'
        Title.Caption = 'Fecha Norma'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHAPUBLICACION'
        Title.Caption = 'F. Publicaci'#243'n'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHADEROGACION'
        Title.Caption = 'F. Derogaci'#243'n'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_USUMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_FECHAMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_FECHABAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_CANTIDADARTICULOS'
        Title.Caption = 'C. Art'#237'culos'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_IDNORMADEPENDIENTE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_TEXTONORMA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_IDDEPENDENCIA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_DEPENDENCIA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DE_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DE_DESCRIPCION'
        Title.Caption = 'Dependencia'
        Width = 159
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 24
    Top = 104
    Width = 569
    Height = 265
    inherited BevelAbm: TBevel
      Top = 229
      Width = 561
    end
    object lblNumero: TLabel [1]
      Left = 9
      Top = 95
      Width = 40
      Height = 13
      Caption = 'N'#250'mero:'
    end
    object lblTipoNorma: TLabel [2]
      Left = 9
      Top = 42
      Width = 58
      Height = 13
      Caption = 'Tipo Norma:'
    end
    object lblDescripcion: TLabel [3]
      Left = 9
      Top = 121
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object lblFechaNorma: TLabel [4]
      Left = 9
      Top = 153
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object lblFechaPublicacion: TLabel [5]
      Left = 202
      Top = 153
      Width = 67
      Height = 13
      Caption = 'F.Publicaci'#243'n:'
    end
    object lblFechaDerogacion: TLabel [6]
      Left = 382
      Top = 153
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'F.Derogaci'#243'n:'
    end
    object lblDependencia: TLabel [7]
      Left = 9
      Top = 70
      Width = 67
      Height = 13
      Caption = 'Dependencia:'
    end
    object Label1: TLabel [8]
      Left = 9
      Top = 183
      Width = 78
      Height = 13
      Caption = 'N. Dependiente:'
    end
    object Label2: TLabel [9]
      Left = 9
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    inherited btnAceptar: TButton
      Left = 411
      Top = 235
      TabOrder = 9
    end
    inherited btnCancelar: TButton
      Left = 489
      Top = 235
      TabOrder = 10
    end
    inline fraNorma: TfraCodigoDescripcionExt
      Left = 93
      Top = 37
      Width = 464
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Left = 66
        Width = 399
        Color = clWhite
      end
      inherited edCodigo: TPatternEdit
        Width = 61
        Color = clWhite
      end
    end
    object edFechaNorma: TDateComboBox
      Left = 94
      Top = 150
      Width = 90
      Height = 21
      TabStop = False
      Color = clWhite
      TabOrder = 5
    end
    object edFechaPublicacion: TDateComboBox
      Left = 273
      Top = 150
      Width = 90
      Height = 21
      TabStop = False
      Color = clWhite
      TabOrder = 6
    end
    object edFechaDerogacion: TDateComboBox
      Left = 454
      Top = 150
      Width = 90
      Height = 21
      TabStop = False
      MinDate = 35431.000000000000000000
      Color = clWhite
      TabOrder = 7
    end
    inline fraDependencia: TfraCodigoDescripcionExt
      Left = 93
      Top = 63
      Width = 464
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Left = 66
        Width = 399
        Color = clWhite
      end
      inherited edCodigo: TPatternEdit
        Width = 61
        Color = clWhite
      end
    end
    object edDescripcionNorma: TEdit
      Left = 94
      Top = 118
      Width = 450
      Height = 21
      MaxLength = 250
      TabOrder = 4
    end
    object edNroNorma: TEdit
      Left = 94
      Top = 91
      Width = 82
      Height = 21
      MaxLength = 20
      TabOrder = 3
    end
    inline fraNombreNormaDependiente: TfraCodigoDescripcionExt
      Left = 93
      Top = 177
      Width = 451
      Height = 23
      TabOrder = 8
      inherited cmbDescripcion: TArtComboBox
        Left = 66
        Width = 386
        Color = clWhite
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
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NO_DESCRIPCION'
            ReadOnly = True
            Title.Caption = 'N'#250'mero'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NO_CANTIDADARTICULOS'
            Title.Caption = 'Cant.Art.'
            Visible = True
          end>
      end
      inherited edCodigo: TPatternEdit
        Width = 61
        Color = clWhite
      end
    end
    object edNO_ID: TIntEdit
      Left = 94
      Top = 12
      Width = 49
      Height = 21
      TabStop = False
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'select *'
      
        'from LEGALES.LNO_NORMA lno, LEGALES.lde_dependencia lde, LEGALES' +
        '.LTN_TIPONORMA ltn'
      'where lno.no_iddependencia = lde.de_id'
      'and ltn.tn_id = lno.no_idtiponorma'
      'order by  lno.no_idtiponorma')
    Top = 350
  end
  inherited dsConsulta: TDataSource
    Top = 350
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'N'#250'mero'
        DataField = 'NO_NRO'
        FieldIndex = 2
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'NO_DESCRIPCION'
        FieldIndex = 4
      end
      item
        Title = 'Fecha Norma'
        DataField = 'NO_FECHANORMA'
        FieldIndex = 5
      end
      item
        Title = 'F. Publicaci'#243'n'
        DataField = 'NO_FECHAPUBLICACION'
        FieldIndex = 6
      end
      item
        Title = 'F. Derogaci'#243'n'
        DataField = 'NO_FECHADEROGACION'
        FieldIndex = 7
      end
      item
        Title = 'C. Art'#237'culos'
        DataField = 'NO_CANTIDADARTICULOS'
        FieldIndex = 14
      end
      item
        Title = 'Dependencia'
        DataField = 'DE_DESCRIPCION'
        FieldIndex = 20
      end>
    Top = 378
  end
  inherited ExportDialog: TExportDialog
    Top = 378
  end
  inherited QueryPrint: TQueryPrint
    Top = 406
  end
  inherited Seguridad: TSeguridad
    Top = 322
  end
  inherited FormStorage: TFormStorage
    Top = 322
  end
  inherited PrintDialog: TPrintDialog
    Top = 406
  end
  inherited ShortCutControl: TShortCutControl
    Top = 322
  end
  inherited FieldHider: TFieldHider
    Top = 350
  end
end
