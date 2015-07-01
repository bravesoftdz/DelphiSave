inherited frmAprobacionSolicitud: TfrmAprobacionSolicitud
  Left = 198
  Top = 109
  Caption = 'Aprobacion de Solicitud'
  ClientHeight = 436
  ClientWidth = 942
  Constraints.MinHeight = 466
  Constraints.MinWidth = 950
  OldCreateOrder = True
  OnShow = FSFormShow
  ExplicitWidth = 950
  ExplicitHeight = 466
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 45
    Top = 135
    Width = 47
    Height = 13
    Caption = 'Actividad:'
  end
  inherited pnlFiltros: TPanel
    Width = 942
    Height = 81
    ExplicitWidth = 942
    ExplicitHeight = 81
    DesignSize = (
      942
      81)
    object Label4: TLabel
      Left = 885
      Top = 55
      Width = 103
      Height = 13
      Caption = 'Fecha de Suscripci'#243'n'
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = -1
      Width = 205
      Height = 38
      Caption = 'Estado'
      TabOrder = 0
      DesignSize = (
        205
        38)
      object cmbSA_ESTADO: TDBCheckCombo
        Left = 7
        Top = 13
        Width = 191
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsEstado
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
    object GroupBox2: TGroupBox
      Left = 207
      Top = -1
      Width = 87
      Height = 38
      Caption = 'Nro. Interno'
      TabOrder = 1
      object edSA_NROINTERNO: TCardinalEdit
        Left = 7
        Top = 13
        Width = 73
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 298
      Top = -1
      Width = 643
      Height = 38
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 2
      DesignSize = (
        643
        38)
      object lbCUIT: TLabel
        Left = 6
        Top = 17
        Width = 3
        Height = 13
        Caption = '.'
      end
      inline fraEmpresa: TfraEmpresaSolicitud
        Left = 6
        Top = 12
        Width = 633
        Height = 23
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
        ExplicitLeft = 6
        ExplicitTop = 12
        ExplicitWidth = 633
        inherited lbContrato: TLabel
          Left = 398
          Visible = False
          ExplicitLeft = 246
        end
        inherited lbFormulario: TLabel
          Left = 505
          Width = 50
          Font.Name = 'Tahoma'
          ExplicitLeft = 353
          ExplicitWidth = 50
        end
        inherited edContrato: TIntEdit
          Left = 443
          Visible = False
          ExplicitLeft = 443
        end
        inherited cmbRSocial: TArtComboBox
          Width = 370
          ExplicitWidth = 370
        end
        inherited edFormulario: TPatternEdit
          Left = 557
          Width = 72
          ExplicitLeft = 557
          ExplicitWidth = 72
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 0
      Top = 40
      Width = 205
      Height = 38
      Caption = 'Documentaci'#243'n Faltante'
      TabOrder = 3
      DesignSize = (
        205
        38)
      object edDocFaltante: TCheckCombo
        Left = 8
        Top = 13
        Width = 189
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Items.Strings = (
          'DNI.'
          'DNI sin firma del titular'
          'DNI sin firma del vendedor'
          'DNI inconsistente'
          'Poder.'
          'Poder sin firma del titular'
          'Poder sin firma del vendedor'
          'Poder inconsistente'
          'Contrato Social.'
          'Contrato Social sin firma del titular'
          'Contrato Social sin firma del vendedor'
          'Contrato Social inconsistente'
          'Acta de Designaci'#243'n.'
          'Acta de Designaci'#243'n sin firma del titular'
          'Acta de Designaci'#243'n sin firma del vendedor'
          'Acta de Designaci'#243'n inconsistente'
          'Acta de Asamblea.'
          'Acta de Asamblea sin firma del titular'
          'Acta de Asamblea sin firma del vendedor'
          'Acta de Asamblea inconsistente'
          'Condiciones Particulares.'
          'Condiciones Particulares sin firma del titular'
          'Condiciones Particulares sin firma del vendedor'
          'Condiciones Particulares inconsistente'
          'Condiciones Generales.'
          'Condiciones Generales sin firma del titular'
          'Condiciones Generales sin firma del vendedor'
          'Condiciones Generales inconsistente'
          'Cl'#225'usulas Adicionales.'
          'Cl'#225'usulas Adicionales sin firma del titular'
          'Cl'#225'usulas Adicionales sin firma del vendedor'
          'Cl'#225'usulas Adicionales inconsistente'
          'Adenda Plan Comercial 2011.'
          'Adenda Plan Comercial 2011 sin firma del titular'
          'Adenda Plan Comercial 2011 sin firma del vendedor'
          'RGRL.'
          'RGRL inconsistente'
          'Ubicaci'#243'n de Riesgo.'
          'Ubicaci'#243'n de Riesgo inconsistente'
          'Responsabilidad Civil Patronal.'
          'Responsabilidad Civil Patronal sin firma del titular'
          'Responsabilidad Civil Patronal sin firma del vendedor'
          'Sin revisi'#243'n de firmante'
          'Formulario PEP'
          'PEP sin firma del titular'
          'PEP sin firma del vendedor')
      end
    end
    object GroupBox5: TGroupBox
      Left = 320
      Top = 40
      Width = 200
      Height = 38
      Caption = ' Fecha de Revisi'#243'n '
      TabOrder = 4
      object Label15: TLabel
        Left = 94
        Top = 16
        Width = 12
        Height = 10
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edSA_FECHAREVISION_DESDE: TDateComboBox
        Left = 8
        Top = 12
        Width = 84
        Height = 21
        TabOrder = 0
      end
      object edSA_FECHAREVISION_HASTA: TDateComboBox
        Left = 108
        Top = 12
        Width = 84
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 208
      Top = 40
      Width = 109
      Height = 38
      Caption = 'Revisi'#243'n'
      TabOrder = 5
      object cboxRevision: TComboBox
        Left = 8
        Top = 12
        Width = 85
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 0
        Items.Strings = (
          'S'#237
          'No'
          ' ')
      end
    end
    object GroupBox7: TGroupBox
      Left = 524
      Top = 40
      Width = 257
      Height = 38
      Caption = 'Usuario Revisi'#243'n'
      TabOrder = 6
      DesignSize = (
        257
        38)
      inline fraUsuarioRevision: TfraUsuarios
        Left = 4
        Top = 11
        Width = 249
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 11
        ExplicitWidth = 249
        inherited cmbDescripcion: TArtComboBox
          Width = 156
          ExplicitWidth = 156
        end
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 782
      Top = 40
      Width = 97
      Height = 38
      Caption = 'Excluir Sorteo'
      TabOrder = 7
    end
    object rbSorteoSi: TRadioButton
      Left = 787
      Top = 55
      Width = 40
      Height = 17
      Caption = 'S'#237
      TabOrder = 8
    end
    object rbSorteoNo: TRadioButton
      Left = 833
      Top = 55
      Width = 36
      Height = 17
      Caption = 'No'
      TabOrder = 9
    end
    object edSA_FECHAAFILIACION: TDateComboBox
      Left = 993
      Top = 52
      Width = 84
      Height = 21
      TabOrder = 10
    end
  end
  inherited CoolBar: TCoolBar
    Top = 81
    Width = 942
    Height = 56
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 938
      end
      item
        Control = pnlRef
        ImageIndex = -1
        MinHeight = 24
        Width = 938
      end>
    ExplicitTop = 81
    ExplicitWidth = 942
    ExplicitHeight = 56
    inherited ToolBar: TToolBar
      Left = 9
      Width = 929
      ExplicitLeft = 9
      ExplicitWidth = 929
      inherited tbNuevo: TToolButton
        Hint = 'Aprobar (Ctrl+A)'
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Hint = 'Modificar Solicitud (Ctrl+M)'
        ImageIndex = 15
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbDatosLegajos: TToolButton
        Left = 370
        Top = 0
        Hint = 'Datos de los Legajos (Ctrl+D)'
        ImageIndex = 55
        OnClick = tbDatosLegajosClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object ToolButton1: TToolButton
        Left = 424
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object Panel1: TPanel
        Left = 432
        Top = 0
        Width = 99
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 7
          Top = 4
          Width = 50
          Height = 13
          Caption = 'Selecci'#243'n '
          Layout = tlCenter
        end
        object edSeleccion: TCardinalEdit
          Left = 58
          Top = 0
          Width = 38
          Height = 21
          Color = clSilver
          ReadOnly = True
          TabOrder = 0
        end
      end
      object ToolButton7: TToolButton
        Left = 531
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbCalcularTotal: TToolButton
        Left = 539
        Top = 0
        Hint = 'Total Registros'
        Caption = 'tbCalcularTotal'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbCalcularTotalClick
      end
      object Panel2: TPanel
        Left = 562
        Top = 0
        Width = 78
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 6
          Top = 4
          Width = 27
          Height = 13
          Caption = 'Total '
          Layout = tlCenter
        end
        object edTotal: TCardinalEdit
          Left = 37
          Top = 0
          Width = 38
          Height = 21
          Color = clSilver
          ReadOnly = True
          TabOrder = 0
        end
      end
      object ToolButton10: TToolButton
        Left = 640
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 50
        Style = tbsSeparator
      end
      object tbReferencias: TToolButton
        Left = 648
        Top = 0
        Caption = 'tbReferencias'
        ImageIndex = 51
        OnClick = tbReferenciasClick
      end
    end
    object pnlRef: TPanel
      Left = 9
      Top = 29
      Width = 929
      Height = 24
      BevelOuter = bvNone
      TabOrder = 1
      object pnlRojo: TPanel
        Left = 121
        Top = 0
        Width = 150
        Height = 24
        Align = alLeft
        Caption = 'Faltantes de Carga'
        TabOrder = 0
        object Shape1: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = clRed
        end
      end
      object Panel3: TPanel
        Left = 271
        Top = 0
        Width = 150
        Height = 24
        Align = alLeft
        Caption = 'Sin cantidad de hojas'
        TabOrder = 1
        object Shape2: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = clBlue
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 121
        Height = 24
        Align = alLeft
        Caption = 'Completa'
        TabOrder = 2
        object Shape3: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = clBlack
        end
      end
      object Panel5: TPanel
        Left = 581
        Top = 0
        Width = 99
        Height = 24
        Align = alLeft
        Caption = 'Sin Revisi'#243'n'
        TabOrder = 3
        object Shape4: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = 7446527
        end
      end
      object Panel6: TPanel
        Left = 421
        Top = 0
        Width = 160
        Height = 24
        Align = alLeft
        Caption = 'Documentaci'#243'n Faltante '
        TabOrder = 4
        object Shape5: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = clPurple
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 137
    Width = 942
    Height = 299
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnDblClick = nil
    OnKeyUp = GridKeyUp
    MultiSelect = True
    OnContextPopup = GridContextPopup
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SA_NROINTERNO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Nro. Interno'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_CUIT'
        Title.Caption = 'CUIT'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 123
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SA_FECHAAFILIACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Suscripci'#243'n'
        Width = 80
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'FO_FORMULARIO'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#186' Formulario'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SA_FECHARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'Vigencia'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'faltarenglon'
        Title.Caption = 'Doc. Faltante'
        Width = 229
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_USUREVISION'
        Title.Caption = 'Usuario Revisi'#243'n'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_FECHAREVISION'
        Title.Caption = 'Fecha Revisi'#243'n'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AR_NOMBRE'
        Title.Caption = 'A.R.T. Anterior'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_EMPRESA'
        Title.Caption = 'Cant.Emp.Emp'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_ESTABLEMIENTO'
        Title.Caption = 'Cant.Emp.Est.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_NOMINA'
        Title.Caption = 'Cant.Emp.Nom.'
        Width = 80
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'HOJASLEGAJOS'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cant. Hojas Leg.'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_descripcion'
        Title.Caption = 'Canal'
        Width = 97
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'diasdemora'
        Title.Alignment = taRightJustify
        Title.Caption = 'D'#237'as de Demora'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'falta'
        Title.Caption = 'Campos Faltantes'
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT asa.sa_id, asa.sa_cuit, asa.sa_nombre, ctb.tb_descripcion' +
        ', asa.sa_fechaafiliacion, afo.fo_formulario,'
      
        '       asa.sa_fecharecepcion, asa.sa_motivoalta, art.afiliacion.' +
        'get_camposfaltantes(asa.sa_id) falta,'
      
        '       asa.sa_totempleados cant_empresa, art.afiliacion.get_empl' +
        'eados_establecimiento(asa.sa_cuit) cant_establemiento,'
      
        '       art.afiliacion.get_empleados_nomina(asa.sa_cuit) cant_nom' +
        'ina'
      
        '  FROM asa_solicitudafiliacion asa, ctb_tablas ctb, afo_formular' +
        'io afo')
    Left = 36
    Top = 315
  end
  inherited dsConsulta: TDataSource
    Left = 64
    Top = 314
  end
  inherited SortDialog: TSortDialog
    Left = 36
    Top = 342
  end
  inherited ExportDialog: TExportDialog
    Left = 64
    Top = 342
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    Title.Text = 'Listado de Solicitudes'
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 64
    Top = 370
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 35
    Top = 286
  end
  inherited FormStorage: TFormStorage
    Left = 64
    Top = 286
  end
  inherited PrintDialog: TPrintDialog
    Left = 36
    Top = 370
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
        Key = 16449
        LinkControl = tbNuevo
      end
      item
        Key = 16452
        LinkControl = tbDatosLegajos
      end>
    Left = 92
    Top = 286
  end
  inherited FieldHider: TFieldHider
    QueryPrint = nil
    Left = 92
    Top = 314
  end
  object sdqEstado: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      'FROM CTB_TABLAS '
      'WHERE TB_CLAVE = '#39'ESSOL'#39
      'AND TB_CODIGO > 0'
      'AND TB_FECHABAJA IS NULL'
      'AND SUBSTR(TB_ESPECIAL1, 10, 1) = '#39'S'#39)
    Left = 107
    Top = 7
  end
  object dsEstado: TDataSource
    DataSet = sdqEstado
    Left = 135
    Top = 7
  end
  object cdDuplicados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 92
    Top = 342
    object cdDuplicadosCUIT: TStringField
      FieldName = 'CUIT'
      Required = True
      Size = 15
    end
  end
  object sdqFaltante: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT * FROM  ART.ADF_DOCUMENTOAFI '
      'WHERE  DF_FECHABAJA IS NULL'
      'ORDER BY DF_ORDEN')
    Left = 106
    Top = 39
  end
  object dsFaltante: TDataSource
    DataSet = sdqFaltante
    Left = 134
    Top = 39
  end
end
