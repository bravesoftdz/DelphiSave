object frmSolicitudConsultas: TfrmSolicitudConsultas
  Left = 69
  Top = 105
  Width = 745
  Height = 476
  Caption = 'Solicitudes de Consultas'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 580
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 0
    Top = 223
    Width = 737
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Color = clTeal
    ParentColor = False
    ResizeStyle = rsLine
  end
  object Panel1: TPanel
    Left = 0
    Top = 226
    Width = 737
    Height = 223
    Align = alBottom
    Anchors = [akLeft, akRight]
    Constraints.MinHeight = 220
    TabOrder = 0
    object gbListaPedidos: TGroupBox
      Left = 1
      Top = 1
      Width = 735
      Height = 152
      Align = alClient
      Caption = ' Lista de Pedidos '
      TabOrder = 0
      object slPedidos: TStringGrid
        Left = 2
        Top = 15
        Width = 731
        Height = 135
        Hint = 'Lista con los pedidos de reportes'
        TabStop = False
        Align = alClient
        BorderStyle = bsNone
        DefaultColWidth = 80
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 153
      Width = 735
      Height = 69
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        735
        69)
      object Label1: TLabel
        Left = 10
        Top = 34
        Width = 93
        Height = 13
        Caption = 'e-mail de env'#237'o:'
      end
      inline fraPreventores: TfraCodigoDescripcion
        Left = 9
        Top = 6
        Width = 460
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 395
          OnChange = fraPreventorescmbDescripcionChange
        end
        inherited edCodigo: TPatternEdit
          CharCase = ecNormal
        end
      end
      object edEmail: TRxDBLookupCombo
        Left = 105
        Top = 32
        Width = 363
        Height = 21
        DropDownCount = 8
        DisplayAllFields = True
        Anchors = [akLeft, akTop, akRight]
        LookupField = 'nombre'
        LookupDisplay = 'email'
        LookupSource = dsPreventores
        TabOrder = 1
        TabStop = False
        OnChange = edEmailCloseUp
        OnCloseUp = edEmailCloseUp
      end
      object btnLimpiarTodo: TButton
        Left = 489
        Top = 7
        Width = 75
        Height = 25
        Hint = 'Limpiar todo'
        Anchors = [akTop, akRight]
        Caption = 'Limpiar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnLimpiarTodoClick
      end
      object btnGuardar: TButton
        Left = 570
        Top = 7
        Width = 75
        Height = 25
        Hint = 
          'Guardar la lista de reportes pedidos'#13#10'en archivo para procesar c' +
          'on IMPOEXPO'
        Anchors = [akTop, akRight]
        Caption = 'Guardar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnGuardarClick
      end
      object btnAgregar: TButton
        Left = 651
        Top = 7
        Width = 75
        Height = 25
        Hint = 'Agregar los reportes seleccionados '#13#10'a la lista de pedidos'
        Anchors = [akTop, akRight]
        Caption = 'Agregar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btnAgregarClick
      end
      object btnSalir: TButton
        Left = 651
        Top = 37
        Width = 75
        Height = 25
        Hint = 'Salir del m'#243'dulo'
        Anchors = [akTop, akRight]
        Caption = 'Salir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btnSalirClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 223
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 406
      Top = 0
      Height = 187
      Color = clTeal
      ParentColor = False
      ResizeStyle = rsLine
    end
    object gbReportes: TGroupBox
      Left = 0
      Top = 0
      Width = 406
      Height = 187
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Reportes Disponibles '
      TabOrder = 0
      object clbReportes: TRxCheckListBox
        Left = 2
        Top = 15
        Width = 402
        Height = 170
        Hint = 'Seleccionar el reporte deseado'
        CheckKind = ckCheckMarks
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Sorted = True
        TabOrder = 0
        OnClickCheck = clbReportesClick
        OnClick = clbReportesClick
        InternalVersion = 202
      end
    end
    object GroupBox1: TGroupBox
      Left = 409
      Top = 0
      Width = 328
      Height = 187
      Align = alClient
      Caption = ' Datos para Reportes '
      TabOrder = 1
      object vedParametros: TStringGrid
        Left = 2
        Top = 15
        Width = 324
        Height = 170
        Hint = 'Asignar datos para '#13#10'los reportes seleccionados'
        Align = alClient
        ColCount = 3
        DefaultColWidth = 160
        DefaultRowHeight = 20
        FixedCols = 2
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
        ParentShowHint = False
        ScrollBars = ssVertical
        ShowHint = True
        TabOrder = 0
        RowHeights = (
          20
          20
          20
          20
          20)
      end
      object pnlParametros: TPanel
        Left = 69
        Top = 186
        Width = 238
        Height = 217
        TabOrder = 1
        Visible = False
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 187
      Width = 737
      Height = 36
      Align = alBottom
      TabOrder = 2
      object Label3: TLabel
        Left = 6
        Top = 3
        Width = 489
        Height = 26
        Caption = 
          'Formatos:   CUIT: sin guiones          Fechas: DD/MM/AAAA       ' +
          '   Operativo: AAAA01'#13#10'Ingresar, cuando sea requerido, CUIT  '#243'   ' +
          'Contrato   '#243'   Siniestro y Orden'
      end
    end
  end
  object sdqQueries: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   (rw_descripcion || NVL2 (rw_detalle, '#39': '#39', '#39#39') || rw_de' +
        'talle'
      '         ) descripcion,'
      
        '         rw_id, qr_descripcion, qr_consulta, qr_subconsulta, qr_' +
        'preproceso'
      '    FROM hys.hqr_queriesrotulo a,'
      '         hys.hrr_rotulosreporte rr,'
      '         hys.hrw_reporteweb rw'
      '   WHERE rr.rr_id = a.qr_idrotulo'
      '     AND rw.rw_id = rr.rr_idreporte'
      '     AND rw.rw_solicitable = '#39'S'#39
      'ORDER BY rw.rw_descripcion'
      ''
      ''
      ''
      ' ')
    Left = 447
    Top = 138
  end
  object sdqQry: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT a.qr_descripcion, a.qr_consulta,'
      '       a.qr_subconsulta,'
      '       a.qr_preproceso'
      '  FROM hys.hqr_queriesrotulo a'
      ''
      '')
    Left = 417
    Top = 138
  end
  object sdqParametrosTipo: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT a.parametro, a.tipo'
      '  FROM hys.hpt_parametrostipo a')
    Left = 477
    Top = 138
  end
  object SaveDialog1: TSaveDialog
    FileName = 'Pedidos Reportes.txt'
    Filter = 'Pedidos Reportes.txt'
    Left = 507
    Top = 138
  end
  object sdqPreventores: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   TRIM(it_nombre) nombre, TRIM (it_email) email, it_id'
      '    FROM art.pit_firmantes'
      '   WHERE (it_email IS NOT NULL) AND it_fechabaja IS NULL'
      'ORDER BY it_nombre'
      ''
      ''
      '')
    Left = 417
    Top = 174
  end
  object dsPreventores: TDataSource
    DataSet = sdqPreventores
    Left = 417
    Top = 204
  end
  object FormPlacement1: TFormPlacement
    UseRegistry = True
    Left = 385
    Top = 139
  end
end
