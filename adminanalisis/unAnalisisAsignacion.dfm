inherited frmAnalisisAsignacion: TfrmAnalisisAsignacion
  Left = 377
  Top = 173
  Width = 759
  Height = 421
  Caption = 'An'#225'lisis de Asignaci'#243'n de Lotes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 751
    Height = 131
    object Bevel2: TBevel
      Left = -20
      Top = 26
      Width = 769
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lbCUIT: TLabel
      Left = 5
      Top = 7
      Width = 25
      Height = 13
      Caption = 'CUIT'
      FocusControl = fraEstablecimiento.edCodigo
    end
    object lblFechaRelev: TLabel
      Left = 5
      Top = 84
      Width = 77
      Height = 13
      Caption = 'F. Relevamiento'
    end
    object lblRelevHasta: TLabel
      Left = 179
      Top = 85
      Width = 26
      Height = 13
      Caption = 'hasta'
    end
    object Label1: TLabel
      Left = 484
      Top = 85
      Width = 26
      Height = 13
      Caption = 'hasta'
    end
    object Label2: TLabel
      Left = 310
      Top = 84
      Width = 79
      Height = 13
      Caption = 'F.Notif.Prestador'
    end
    object Label20: TLabel
      Left = 5
      Top = 108
      Width = 72
      Height = 13
      Caption = 'Estado Sublote'
      WordWrap = True
    end
    inline fraEmpresa: TfraEmpresa
      Left = 37
      Top = 3
      Width = 709
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited lbContrato: TLabel
        Left = 605
      end
      inherited edContrato: TIntEdit
        Left = 652
      end
      inherited cmbRSocial: TArtComboBox
        Width = 470
      end
    end
    inline fraEstablecimiento: TfraEstablecimiento_OLD
      Left = 1
      Top = 32
      Width = 747
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited lbLocalidad: TLabel
        Left = 513
      end
      inherited lbCPostal: TLabel
        Left = 676
      end
      inherited lbProvincia: TLabel
        Left = 513
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 426
      end
      inherited edLocalidad: TEdit
        Left = 565
      end
      inherited edCPostal: TEdit
        Left = 700
      end
      inherited edDomicilio: TEdit
        Width = 456
      end
      inherited edProvincia: TEdit
        Left = 565
      end
    end
    object edFechaRelevDesde: TDateComboBox
      Left = 87
      Top = 81
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edFechaRelevHasta: TDateComboBox
      Left = 211
      Top = 81
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object chkRelevConLotes: TCheckBox
      Left = 308
      Top = 108
      Width = 132
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ver s'#243'lo relev. con lotes'
      Checked = True
      Color = clBtnFace
      ParentColor = False
      State = cbChecked
      TabOrder = 7
    end
    object edFechaNotifHasta: TDateComboBox
      Left = 516
      Top = 81
      Width = 88
      Height = 21
      TabOrder = 5
    end
    object edFechaNotifDesde: TDateComboBox
      Left = 392
      Top = 81
      Width = 88
      Height = 21
      TabOrder = 4
    end
    object cbEstadoSubLote: TCheckCombo
      Left = 87
      Top = 105
      Width = 212
      Height = 21
      TabOrder = 6
    end
  end
  inherited CoolBar: TCoolBar
    Top = 131
    Width = 751
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 747
      end>
    inherited ToolBar: TToolBar
      Width = 734
    end
  end
  inherited Grid: TArtDBGrid
    Top = 160
    Width = 751
    Height = 234
    Columns = <
      item
        Expanded = False
        FieldName = 'cn_cuit'
        Title.Caption = 'CUIT'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Raz'#243'n Social'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cn_estableci'
        Title.Caption = 'Nro. Estab.'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Caption = 'Nombre Estab.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cn_fecharelevamiento'
        Title.Caption = 'F.Relevamiento'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado'
        Title.Caption = 'Estado Relev.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'operativo'
        Title.Caption = 'Operativo'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'el_idlote'
        Title.Caption = 'Lote'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LE_FECHANOTIFICACION'
        Title.Caption = 'F. Notif. Prestador'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'de_descripcion'
        Title.Caption = 'Estado SubLote'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'canttrab'
        Title.Caption = 'Trab. Asignados'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CN_CONSEMESTRAL'
        Title.Caption = 'Con Semestral'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fechaultrelev'
        Title.Caption = 'Fecha Ult. Relev.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fechaprimerexamen'
        Title.Caption = 'Fecha Primer Ex'#225'men'
        Width = 110
        Visible = True
      end>
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
    Top = 256
  end
end
