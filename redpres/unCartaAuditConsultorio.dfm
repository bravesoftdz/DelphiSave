inherited frmCartaAuditConsultorio: TfrmCartaAuditConsultorio
  Left = 304
  Top = 189
  Caption = 'Auditor'#237'as en Consultorio'
  ClientHeight = 394
  ClientWidth = 710
  OldCreateOrder = True
  ExplicitWidth = 718
  ExplicitHeight = 424
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 710
    Height = 145
    ExplicitWidth = 710
    ExplicitHeight = 145
    object pnlSiniestro: TCheckPanel
      Left = 1
      Top = 2
      Width = 211
      Height = 45
      Caption = '&Siniestro '
      TabOrder = 0
      TabStop = True
      Checked = False
      OnChange = pnlSiniestroChange
      object Label1: TLabel
        Left = 98
        Top = 20
        Width = 15
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edSiniDesde: TIntEdit
        Left = 6
        Top = 16
        Width = 86
        Height = 21
        TabOrder = 0
        MaxLength = 8
      end
      object edSiniHasta: TIntEdit
        Left = 116
        Top = 16
        Width = 87
        Height = 21
        TabOrder = 1
        MaxLength = 8
      end
    end
    object pnlFechaCarga: TCheckPanel
      Left = 0
      Top = 50
      Width = 212
      Height = 45
      Caption = '&Fecha de Carga '
      TabOrder = 2
      TabStop = True
      Checked = False
      OnChange = pnlFechaCargaChange
      object Label2: TLabel
        Left = 98
        Top = 20
        Width = 15
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object deFechaDesde: TDateComboBox
        Left = 7
        Top = 17
        Width = 88
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = deFechaHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object deFechaHasta: TDateComboBox
        Left = 116
        Top = 17
        Width = 89
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = deFechaDesde
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object pnlGTrabajo: TCheckPanel
      Left = 217
      Top = 2
      Width = 491
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Grupo de Trabajo '
      TabOrder = 1
      TabStop = True
      Checked = False
      OnChange = pnlGTrabajoChange
      AutoFocus = False
      DesignSize = (
        491
        45)
      inline fraGrupoTrabajo: TfraGrupoTrabajo
        Left = 6
        Top = 15
        Width = 479
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 15
        ExplicitWidth = 479
        inherited lblGestor: TLabel
          Left = 308
          Width = 31
          ExplicitLeft = 308
          ExplicitWidth = 31
        end
        inherited cmbGestor: TArtComboBox
          Left = 344
          ExplicitLeft = 344
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 254
          ExplicitWidth = 254
        end
      end
    end
    object pnlDelegacion: TCheckPanel
      Left = 370
      Top = 50
      Width = 337
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Delegaci'#243'n '
      TabOrder = 3
      TabStop = True
      Checked = False
      OnChange = pnlDelegacionChange
      AutoFocus = False
      DesignSize = (
        337
        45)
      inline fraDelegacion: TfraDelegacion
        Left = 5
        Top = 16
        Width = 328
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 16
        ExplicitWidth = 328
        inherited cmbDescripcion: TArtComboBox
          Width = 263
          ExplicitWidth = 263
        end
      end
    end
    object pnlPrestador: TCheckPanel
      Left = 1
      Top = 99
      Width = 707
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Prestador '
      TabOrder = 4
      TabStop = True
      Checked = False
      OnChange = pnlPrestadorChange
      DesignSize = (
        707
        45)
      inline fraPrestador: TfraPrestador
        Left = 4
        Top = 15
        Width = 699
        Height = 24
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 15
        ExplicitWidth = 699
        ExplicitHeight = 24
        inherited lbCUIT: TLabel
          Width = 25
          ExplicitWidth = 25
        end
        inherited lbSec: TLabel
          Width = 22
          ExplicitWidth = 22
        end
        inherited lbIdentif: TLabel
          Width = 35
          ExplicitWidth = 35
        end
        inherited lbRSocial: TLabel
          Width = 40
          ExplicitWidth = 40
        end
        inherited lbDomicilio: TLabel
          Width = 42
          ExplicitWidth = 42
        end
        inherited lbLocalidad: TLabel
          Width = 46
          ExplicitWidth = 46
        end
        inherited lbCPostal: TLabel
          Left = 509
          Width = 14
          ExplicitLeft = 611
          ExplicitWidth = 14
        end
        inherited lbTelefono: TLabel
          Left = 421
          ExplicitLeft = 523
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 126
          ExplicitWidth = 126
        end
        inherited cmbPrestador: TArtComboBox
          Width = 251
          ExplicitWidth = 251
        end
        inherited edPresLocalidad: TEdit
          Width = 155
          ExplicitWidth = 155
        end
        inherited edPresCPostal: TEdit
          Left = 526
          ExplicitLeft = 526
        end
        inherited edPresTelefono: TEdit
          Left = 441
          ExplicitLeft = 441
        end
      end
    end
    object pnlEstado: TCheckPanel
      Left = 216
      Top = 50
      Width = 151
      Height = 45
      Caption = 'Estado'
      TabOrder = 5
      TabStop = True
      Checked = False
      OnChange = pnlEstadoChange
      object cmbEstado: TComboBox
        Left = 7
        Top = 17
        Width = 139
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        Items.Strings = (
          'Pendientes de Env'#237'o'
          'Enviadas'
          'Todas')
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 145
    Width = 710
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 706
      end>
    ExplicitTop = 145
    ExplicitWidth = 710
    inherited ToolBar: TToolBar
      Width = 697
      ExplicitWidth = 697
      inherited tbImprimir: TToolButton
        DropdownMenu = MnuImprimir
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        ImageIndex = 29
        Visible = False
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        Visible = False
        ExplicitLeft = 362
      end
      object tbEnviarAuditoria: TToolButton
        Left = 385
        Top = 0
        Hint = 'Enviar Auditorias seleccionadas'
        Caption = 'tbEnviarAuditoria'
        ImageIndex = 39
        OnClick = tbEnviarAuditoriaClick
      end
      object ToolButton2: TToolButton
        Left = 408
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 416
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 8
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 174
    Width = 710
    Height = 220
    TabOrder = 1
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnGetCellParams = GridGetCellParams
    OnContextPopup = GridContextPopup
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECKBOX'
        Title.Caption = '.'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_ORDEN'
        Title.Caption = 'Orden'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_RECAIDA'
        Title.Caption = 'Recaida'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_NROPARTE'
        Title.Caption = 'Nro.Parte'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_ENVIOAUDITCONSULT'
        Title.Caption = 'F.Envio Aud.Cons.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo Accidente'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_FECHAACCIDENTE'
        Title.Caption = 'Fecha Accidente'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_BAJAMEDICA'
        Title.Caption = 'Baja M'#233'dica'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_ALTAMEDICA'
        Title.Caption = 'Alta M'#233'dica'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_DIAGNOSTICO'
        Title.Caption = 'Diagn'#243'stico'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHACARGA'
        Title.Caption = 'Fecha de Carga'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTRABAJO'
        Title.Caption = 'Grupo Trabajo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_GESTOR'
        Title.Caption = 'Gestor'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MEDICO'
        Title.Caption = 'M'#233'dico'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PIPRESTDESC'
        Title.Caption = 'Prestador Parte Ingreso'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PVPRESTDESC'
        Title.Caption = 'Prestador de Audit.Consult.'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_FECHACONTROL'
        Title.Caption = 'Fecha Control'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_PROXIMOCONTROL'
        Title.Caption = 'Pr'#243'x. Control'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DIAGNOSTICOOMS'
        Title.Caption = 'CIE-10'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usutelegrama'
        Title.Caption = 'Gestor del telegrama'
        Width = 103
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        Width = 220
        MaxLength = 0
      end
      item
        Title = 'N'#176'Parte'
        DataField = 'PV_NROPARTE'
        Width = 140
        MaxLength = 0
      end
      item
        Title = 'Tipo Accidente'
        DataField = 'TIPO'
        Width = 250
        MaxLength = 0
      end
      item
        Title = 'F.Accidente'
        DataField = 'EX_FECHAACCIDENTE'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Empresa'
        DataField = 'EMPRESA'
        Width = 400
        MaxLength = 0
      end
      item
        Title = 'Trabajador'
        DataField = 'TRABAJADOR'
        Width = 400
        MaxLength = 0
      end
      item
        Title = 'Prest. P.Ingreso'
        DataField = 'PIPRESTDESC'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Prest.P.Evol.'
        DataField = 'PVPRESTDESC'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'F.Control'
        DataField = 'PV_FECHACONTROL'
        Width = 160
        MaxLength = 0
      end
      item
        Title = 'Prox.Cont.'
        DataField = 'PV_PROXIMOCONTROL'
        Width = 170
        MaxLength = 0
      end
      item
        Title = 'CIE-10'
        DataField = 'PV_DIAGNOSTICOOMS'
        Width = 120
        MaxLength = 0
      end
      item
        Title = 'Int.Desde'
        DataField = 'PV_INTERNADODESDE'
        Width = 160
        MaxLength = 0
      end
      item
        Title = 'Int.Hasta'
        DataField = 'PV_INTERNADOHASTA'
        Width = 170
        MaxLength = 0
      end>
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
        LinkControl = tbSalir2
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
  object MnuImprimir: TPopupMenu
    Left = 81
    Top = 272
    object mnuImprimirGrilla: TMenuItem
      Caption = 'Imprimir Grilla'
      OnClick = mnuImprimirGrillaClick
    end
    object mnuImprimirCartaPrestador: TMenuItem
      Caption = 'Imprimir/Visualizar Carta al Prestador'
      OnClick = mnuImprimirCartaPrestadorClick
    end
  end
end
