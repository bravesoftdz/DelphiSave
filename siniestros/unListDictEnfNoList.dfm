inherited frmListDictEnfNoList: TfrmListDictEnfNoList
  Left = 263
  Top = 156
  Width = 648
  Height = 411
  Caption = 'Dict'#225'menes con Enfermedad no listada'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 640
    Height = 96
    object chkSiniestro: TCheckPanel
      Left = 1
      Top = 1
      Width = 147
      Height = 46
      Caption = 'Siniestro '
      TabOrder = 0
      Checked = False
      OnChange = chkSiniestroChange
      object edSiniestro: TSinEdit
        Left = 11
        Top = 17
        Width = 126
        Height = 21
        TabOrder = 0
        Color = clHighlightText
      end
    end
    object chkFecMarcaENL: TCheckPanel
      Left = 151
      Top = 1
      Width = 242
      Height = 46
      Caption = 'Fecha marca ENL '
      TabOrder = 1
      Checked = False
      OnChange = chkFecMarcaENLChange
      object Label8: TLabel
        Left = 114
        Top = 22
        Width = 13
        Height = 11
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dcMarcaDesde: TDateComboBox
        Left = 9
        Top = 18
        Width = 100
        Height = 21
        MaxDateCombo = dcMarcaHasta
        TabOrder = 0
      end
      object dcMarcaHasta: TDateComboBox
        Left = 134
        Top = 18
        Width = 100
        Height = 21
        MinDateCombo = dcMarcaDesde
        TabOrder = 1
      end
    end
    object chkFecEvento: TCheckPanel
      Left = 397
      Top = 1
      Width = 242
      Height = 46
      Caption = 'Fecha del Evento '
      TabOrder = 2
      Checked = False
      OnChange = chkFecEventoChange
      object Label1: TLabel
        Left = 116
        Top = 22
        Width = 13
        Height = 11
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dcFecEventoDesde: TDateComboBox
        Left = 9
        Top = 18
        Width = 100
        Height = 21
        MaxDateCombo = dcFecEventoHasta
        TabOrder = 0
      end
      object dcFecEventoHasta: TDateComboBox
        Left = 135
        Top = 18
        Width = 100
        Height = 21
        MinDateCombo = dcFecEventoDesde
        TabOrder = 1
      end
    end
    object chkTrabajador: TCheckPanel
      Left = 1
      Top = 49
      Width = 267
      Height = 46
      Caption = 'Trabajador '
      TabOrder = 3
      Checked = False
      OnChange = chkTrabajadorChange
      DesignSize = (
        267
        46)
      inline fraTrabajador: TfraTrabajador
        Left = 7
        Top = 17
        Width = 253
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbNombre: TArtComboBox
          Width = 169
        end
      end
    end
    object chkEmpresa: TCheckPanel
      Left = 270
      Top = 49
      Width = 368
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa '
      TabOrder = 4
      Checked = False
      OnChange = chkEmpresaChange
      DesignSize = (
        368
        46)
      inline fraEmpresa: TfraEmpresa
        Left = 6
        Top = 17
        Width = 353
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
          Left = 249
        end
        inherited edContrato: TIntEdit
          Left = 296
        end
        inherited cmbRSocial: TArtComboBox
          Width = 114
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 96
    Width = 640
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 636
      end>
    inherited ToolBar: TToolBar
      Width = 623
      inherited tbNuevo: TToolButton
        Enabled = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 125
    Width = 640
    Height = 259
    Columns = <
      item
        Expanded = False
        FieldName = 'EX_SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_ORDEN'
        Title.Caption = 'Orden'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_RECAIDA'
        Title.Caption = 'Reca'#237'da'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NL_FECHAMARCA'
        Title.Caption = 'Fecha Marca ENL'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NL_TAREA'
        Title.Caption = 'Tarea'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NL_ENFERMEDAD'
        Title.Caption = 'Enfermedad'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NL_USUMARCA'
        Title.Caption = 'Usuario Marca'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NL_OBSMARCA'
        Title.Caption = 'Obsev. Marca'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_CODIGO'
        Title.Caption = 'Cod. Evento'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_FECHA'
        Title.Caption = 'Fec. Evento'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_PORCINCAPACIDAD'
        Title.Caption = '% Incap.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Nombre Trabajador'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_CUIL'
        Title.Caption = 'Cuil Trabajador'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit Empresa'
        Width = 100
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        DataField = 'EX_SINIESTRO'
        Width = 150
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
        Title = 'F.Marca ENL'
        DataField = 'NL_FECHAMARCA'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Usu Marca'
        DataField = 'NL_USUMARCA'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Nombre Trab.'
        DataField = 'TJ_NOMBRE'
        Width = 350
        MaxLength = 0
      end
      item
        Title = 'Cuil Trab.'
        DataField = 'TJ_CUIL'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'EM_NOMBRE'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Cuit'
        DataField = 'EM_CUIT'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Tarea'
        DataField = 'NL_TAREA'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Enfermedad'
        DataField = 'NL_ENFERMEDAD'
        Width = 250
        MaxLength = 0
      end
      item
        Title = 'Evento'
        DataField = 'EV_CODIGO'
        Width = 120
        MaxLength = 0
      end
      item
        Title = 'Fec.Evento'
        DataField = 'EV_FECHA'
        Width = 200
        MaxLength = 0
      end
      item
        Title = '% Incap'
        DataField = 'EV_PORCINCAPACIDAD'
        MaxLength = 0
      end>
    PageOrientation = pxLandscape
    OnReportBegin = QueryPrintReportBegin
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
end
