object frmGestionLote: TfrmGestionLote
  Left = 137
  Top = 75
  Width = 812
  Height = 569
  Caption = 'Gesti'#243'n de Lote'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbLoteDeGestion: TGroupBox
    Left = 0
    Top = 0
    Width = 804
    Height = 69
    Align = alTop
    Caption = ' Lote de Gesti'#243'n '
    TabOrder = 0
    DesignSize = (
      804
      69)
    object lblGestor: TLabel
      Left = 369
      Top = 21
      Width = 34
      Height = 13
      Caption = 'Gestor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblOrden: TLabel
      Left = 9
      Top = 45
      Width = 32
      Height = 13
      Caption = 'Orden:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblLote: TLabel
      Left = 11
      Top = 22
      Width = 24
      Height = 13
      Caption = 'Lote:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    inline fraGestor: TfraCodigoDescripcion
      Left = 408
      Top = 17
      Width = 391
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 61
        Width = 326
      end
      inherited edCodigo: TPatternEdit
        Width = 57
        Alignment = taRightJustify
      end
    end
    object cmbOrden: TComboBox
      Left = 65
      Top = 41
      Width = 288
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'Orden Por Acci'#243'n'
      Items.Strings = (
        'Por Acci'#243'n'
        'Por Sub-Acci'#243'n'
        'Por Contrato'
        'Por Gestor')
    end
    inline fraLote: TfraCodigoDescripcion
      Left = 64
      Top = 17
      Width = 294
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Left = 61
        Width = 229
      end
      inherited edCodigo: TPatternEdit
        Width = 57
        Alignment = taRightJustify
      end
    end
  end
  object gbAcciones: TGroupBox
    Left = 0
    Top = 98
    Width = 804
    Height = 246
    Align = alClient
    TabOrder = 1
    object ntResumenDetalle: TNotebook
      Left = 2
      Top = 15
      Width = 800
      Height = 229
      Align = alClient
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Detalle'
        DesignSize = (
          800
          229)
        object dbgProgreso: TArtDBGrid
          Left = 9
          Top = 1
          Width = 783
          Height = 219
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsAcciones
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgAccionesDblClick
          FooterBand = False
          TitleHeight = 30
          Columns = <
            item
              Expanded = False
              FieldName = 'DJ_CONTRATO'
              Title.Caption = 'Contrato'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DJ_PERIODO'
              Title.Caption = 'Per'#237'odo'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_ORDEN'
              Title.Caption = 'Orden'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AC_DESCRIPCION'
              Title.Caption = 'Acci'#243'n'
              Width = 201
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SA_DESCRIPCION'
              Title.Caption = 'Sub-Acci'#243'n'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_FECHAPLANIFICADA'
              Title.Caption = 'F.Planif.'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_CANTIDADPOSTERGACIONES'
              Title.Caption = 'Cant.Postergaciones'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_FECHAAPLICADA'
              Title.Caption = 'F.Aplicaci'#243'n'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_OBSERVACIONES'
              Title.Caption = 'Observaciones'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_RESULTADOGESTION'
              Title.Caption = 'Resultado Gesti'#243'n'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GL_USUARIO'
              Title.Caption = 'Gestor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EM_NOMBRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_IDGESTOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_IDACCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_SUBACCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_IDLOTEDDJJ'
              Visible = True
            end>
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Resumen'
        DesignSize = (
          800
          229)
        object dbgAcciones: TArtDBGrid
          Left = 6
          Top = 1
          Width = 785
          Height = 220
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsAcciones
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgAccionesDblClick
          FooterBand = False
          TitleHeight = 30
          Columns = <
            item
              Expanded = False
              FieldName = 'DJ_CONTRATO'
              Title.Caption = 'Contrato'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EM_NOMBRE'
              Title.Caption = 'Nombre'
              Width = 164
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cantidad Periodos'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_FECHAPLANIFICADA'
              Title.Caption = 'F.Planificada'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_CANTIDADPOSTERGACIONES'
              Title.Caption = 'Cant.Postergaciones'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GL_USUARIO'
              Title.Caption = 'Gestor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_OBSERVACIONES'
              Title.Caption = 'Observaciones'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_RESULTADOGESTION'
              Title.Caption = 'Result.Gest.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AC_DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SA_DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_IDACCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_SUBACCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_IDGESTOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DA_IDLOTEDDJJ'
              Visible = True
            end>
        end
      end
    end
  end
  object cbComandos: TCoolBar
    Left = 0
    Top = 69
    Width = 804
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 800
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 787
      Height = 27
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Caption = 'Refrescar'
        ImageIndex = 0
        OnClick = tbRefrescarClick
      end
      object ToolButton2: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 33
        Top = 0
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object ToolButton1: TToolButton
        Left = 58
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbPropiedades: TToolButton
        Left = 66
        Top = 0
        Hint = 'Inclir Nuevos Per'#237'odos para Contrato'
        ImageIndex = 13
        OnClick = tbPropiedadesClick
      end
      object tbReprogramar: TToolButton
        Left = 91
        Top = 0
        Hint = 'Reprogramar'
        Caption = 'tbReprogramar'
        ImageIndex = 16
      end
      object tbCancelar: TToolButton
        Left = 116
        Top = 0
        Caption = 'tbCancelar'
        ImageIndex = 8
      end
      object TToolButton
        Left = 141
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tbResumen: TToolButton
        Left = 149
        Top = 0
        Caption = 'tbResumen'
        ImageIndex = 34
        Style = tbsCheck
        OnClick = tbResumenClick
      end
      object tbOrdenar: TToolButton
        Left = 174
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        ImageIndex = 2
      end
      object TToolButton
        Left = 199
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 207
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Enabled = False
        ImageIndex = 4
      end
      object tbExportar: TToolButton
        Left = 232
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        Enabled = False
        ImageIndex = 3
      end
      object tbEnviarMail: TToolButton
        Left = 257
        Top = 0
        Hint = 'Enviar E-Mail'
        Enabled = False
        ImageIndex = 30
        Visible = False
      end
      object TToolButton
        Left = 282
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object btnAsignarALote: TToolButton
        Left = 290
        Top = 0
        Hint = 'Asignar selecci'#243'n a un lote de gesti'#243'n'
        Caption = 'btnAsignarALote'
        ImageIndex = 28
      end
      object tbDesasignarALote: TToolButton
        Left = 315
        Top = 0
        Caption = 'Desasignar'
        ImageIndex = 27
      end
      object TToolButton
        Left = 340
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 348
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object pnDetalle: TPanel
    Left = 0
    Top = 344
    Width = 804
    Height = 198
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object pgDetalleGestion: TPageControl
      Left = 0
      Top = 0
      Width = 804
      Height = 179
      ActivePage = tsObservacionesRealizadas
      Align = alClient
      TabOrder = 0
      object tsObservacionesRealizadas: TTabSheet
        Caption = 'Observaciones Realizadas'
        object dbgObservacionesRealizadas: TArtDBGrid
          Left = 0
          Top = 0
          Width = 796
          Height = 151
          Align = alClient
          DataSource = dsObservaciones
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              Title.Caption = 'Orden'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Observaci'#243'n'
              Width = 234
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Proceso'
              Width = 114
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Aceptaci'#243'n/Rechazo/Gesti'#243'n'
              Width = 163
              Visible = True
            end>
        end
      end
      object tsGestionRealizadas: TTabSheet
        Caption = 'Gestiones Realizadas'
        ImageIndex = 1
        object dbgGestionesRealizadas: TArtDBGrid
          Left = 0
          Top = 0
          Width = 798
          Height = 151
          Align = alClient
          DataSource = dsGestionesRealizadas
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Per'#237'odo'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Usuario'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Resultado'
              Width = 521
              Visible = True
            end>
        end
      end
      object TTabSheet
        Caption = 'Informaci'#243'n para Gesti'#243'n'
        ImageIndex = 2
        object dbgInformacionParaGestion: TArtDBGrid
          Left = 0
          Top = 0
          Width = 798
          Height = 223
          Align = alTop
          DataSource = dsInformacionGestion
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Medio de Ingreso'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Fecha Ingreso'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Usuario'
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Masa'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Cant.Trab.'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Estado'
              Visible = True
            end>
        end
      end
    end
    object sb: TStatusBar
      Left = 0
      Top = 179
      Width = 804
      Height = 19
      AutoHint = True
      Panels = <>
      ParentShowHint = False
      ShowHint = True
      SimplePanel = True
    end
  end
  object fpSeleccionPeriodos: TFormPanel
    Left = 128
    Top = 192
    Width = 425
    Height = 121
    FormWidth = 0
    FormHeigth = 0
    DesignSize = (
      425
      121)
    object btnAceptarIncluir: TButton
      Left = 260
      Top = 90
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
    end
    object btnCancelarIncluir: TButton
      Left = 343
      Top = 90
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object gbPeriodosAIncluir: TGroupBox
      Left = 7
      Top = 4
      Width = 409
      Height = 81
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Incluir Periodos del Contrato '
      TabOrder = 2
      DesignSize = (
        409
        81)
      object lblIncluirPeriodo: TLabel
        Left = 8
        Top = 54
        Width = 74
        Height = 13
        Caption = 'Incluir Per'#237'odos'
      end
      object lblIncluirPeriodoHasta: TLabel
        Left = 143
        Top = 54
        Width = 26
        Height = 13
        Caption = 'hasta'
      end
      object lblContrato: TLabel
        Left = 7
        Top = 28
        Width = 46
        Height = 13
        Caption = 'Contrato: '
      end
      object lblDescripcion: TLabel
        Left = 161
        Top = 26
        Width = 62
        Height = 13
        Caption = 'Descripci'#243'n: '
      end
      object ppPeriodoDesde: TPeriodoPicker
        Left = 87
        Top = 49
        Width = 49
        Height = 21
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = False
        Periodo.Orden = poAnoMes
        Periodo.Separador = '/'
        Periodo.Mes = 6
        Periodo.Ano = 2005
        Periodo.Valor = '2005/06'
        Periodo.MaxPeriodo = '2055/06'
        Periodo.MinPeriodo = '1955/06'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'MS Sans Serif'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NullDropDown = SetMax
      end
      object ppPeriodoHasta: TPeriodoPicker
        Left = 173
        Top = 49
        Width = 49
        Height = 21
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
        Color = clWindow
        Periodo.AllowNull = False
        Periodo.Orden = poAnoMes
        Periodo.Separador = '/'
        Periodo.Mes = 6
        Periodo.Ano = 2005
        Periodo.Valor = '2005/06'
        Periodo.MaxPeriodo = '2055/06'
        Periodo.MinPeriodo = '1955/06'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'MS Sans Serif'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NullDropDown = SetMax
      end
      object edtContrato: TEdit
        Left = 87
        Top = 24
        Width = 62
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtDescripcion: TEdit
        Left = 223
        Top = 24
        Width = 178
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  object sdqAcciones: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT   ida.da_idaccion, ida.da_subaccion, ida.da_fechaplanific' +
        'ada,'
      
        '         ida.da_cantidadpostergaciones, ida.da_idgestor, ida.da_' +
        'observaciones,'
      
        '         ida.da_resultadogestion, ida.da_idloteddjj, iac.ac_desc' +
        'ripcion,'
      
        '         isa.sa_descripcion, igl.gl_usuario, idj.dj_contrato, ae' +
        'm.em_nombre,'
      '         COUNT(*) AS "Cantidad Periodos"'
      '    FROM emi.ida_ddjjaccion ida,'
      '         emi.iac_accion iac,'
      '         emi.isa_subaccion isa,'
      '         emi.idj_ddjj idj,'
      '         emi.ild_loteddjj ild,'
      '         emi.igl_gestorlote igl,'
      '         afi.aco_contrato aco,'
      '         afi.aem_empresa aem'
      '   WHERE (    (iac.ac_id = ida.da_idaccion)'
      '          AND (idj.dj_id = ild.ld_idddjj)'
      '          AND (ild.ld_id = ida.da_idloteddjj)'
      '          AND (igl.gl_id = ida.da_idgestor)'
      '          AND (idj.dj_contrato = aco.co_contrato)'
      '          AND (aem.em_id = aco.co_idempresa))'
      '     AND (isa.sa_id = ida.da_subaccion)'
      'GROUP BY ida.da_idaccion,'
      '         ida.da_subaccion,'
      '         ida.da_fechaplanificada,'
      '         ida.da_cantidadpostergaciones,'
      '         ida.da_idgestor,'
      '         ida.da_observaciones,'
      '         ida.da_resultadogestion,'
      '         ida.da_idloteddjj,'
      '         iac.ac_descripcion,'
      '         isa.sa_descripcion,'
      '         igl.gl_usuario,'
      '         idj.dj_contrato,'
      '         aem.em_nombre'
      '')
    Left = 80
    Top = 142
  end
  object sdqObservaciones: TSDQuery
    Left = 52
    Top = 424
  end
  object sdqGestionesRealizadas: TSDQuery
    Left = 80
    Top = 424
  end
  object sdqInformacionGestion: TSDQuery
    Left = 108
    Top = 424
  end
  object dsObservaciones: TDataSource
    DataSet = sdqObservaciones
    Left = 52
    Top = 452
  end
  object dsGestionesRealizadas: TDataSource
    DataSet = sdqGestionesRealizadas
    Left = 80
    Top = 452
  end
  object dsInformacionGestion: TDataSource
    DataSet = sdqInformacionGestion
    Left = 108
    Top = 452
  end
  object dsAcciones: TDataSource
    DataSet = sdqAcciones
    Left = 79
    Top = 194
  end
end
