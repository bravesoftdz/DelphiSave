inherited frmCostosxSiniestro: TfrmCostosxSiniestro
  Left = 270
  Top = 117
  Width = 663
  Height = 510
  Caption = 'Costos por siniestro'
  Constraints.MinWidth = 465
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 653
    object Label1: TLabel
      Left = 220
      Top = 10
      Width = 128
      Height = 13
      Caption = 'Siniestro, Orden y Recaida'
    end
    object Label3: TLabel
      Left = 8
      Top = 10
      Width = 83
      Height = 13
      Caption = 'Siniestro y Orden'
    end
    object edSOR: TSinEdit
      Left = 355
      Top = 6
      Width = 100
      Height = 21
      OnEnter = edSOREnter
      OnExit = edSORExit
      TabOrder = 1
    end
    object EdSO: TSinEdit
      Left = 98
      Top = 6
      Width = 103
      Height = 21
      OnEnter = EdSOEnter
      OnExit = EdSOExit
      TabOrder = 0
      ViewStyle = [etSiniestro, etOrden]
    end
  end
  inherited CoolBar: TCoolBar
    Width = 653
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 649
      end>
    inherited ToolBar: TToolBar
      Width = 636
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 4
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 23
      end
      inherited tbModificar: TToolButton
        ImageIndex = 24
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 25
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 15
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 3
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 5
        Visible = False
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 7
      end
      inherited tbExportar: TToolButton
        ImageIndex = 1
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 17
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 19
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 8
        Visible = False
      end
      object tbPEvolutivo: TToolButton
        Left = 370
        Top = 0
        Hint = 'Ver Parte Evolutivo'
        Caption = 'tbPEvolutivo'
        ImageIndex = 28
        OnClick = tbPEvolutivoClick
      end
      object tbAutorizac: TToolButton
        Left = 393
        Top = 0
        Hint = 'Ver Autorizaciones'
        Caption = 'tbAutorizac'
        ImageIndex = 29
        OnClick = tbAutorizacClick
      end
      object tbDetPrestac: TToolButton
        Left = 416
        Top = 0
        Hint = 'Detalle de las Prestaciones'
        Caption = 'tbDetPrestac'
        ImageIndex = 30
        OnClick = tbDetPrestacClick
      end
      object tbDetILT: TToolButton
        Left = 439
        Top = 0
        Hint = 'Pagos de ILT'
        Caption = 'tbDetILT'
        ImageIndex = 31
        OnClick = tbDetILTClick
      end
      object tbetILP: TToolButton
        Left = 462
        Top = 0
        Hint = 'Pagos de ILP'
        Caption = 'tbetILP'
        ImageIndex = 32
        OnClick = tbetILPClick
      end
      object tbDetOC: TToolButton
        Left = 485
        Top = 0
        Hint = 'Pagos de otros conceptos'
        Caption = 'tbDetOC'
        ImageIndex = 33
        OnClick = tbDetOCClick
      end
      object ToolButton1: TToolButton
        Left = 508
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'ToolButton1'
        ImageIndex = 8
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 653
    Height = 415
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = MnuPop
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIP'
        Title.Caption = 'Detalle'
        Width = 206
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'EFECTIVOS'
        Title.Caption = 'Efectivos'
        Width = 73
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ESTIMADOS'
        Title.Caption = 'Estimados'
        Width = 67
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CANTDIAS'
        Title.Caption = 'Cant/Dias %'
        Width = 84
        Visible = True
      end>
  end
  object FPanelComun: TFormPanel [3]
    Left = 24
    Top = 96
    Width = 657
    Height = 190
    FormWidth = 0
    FormHeigth = 0
    Position = poOwnerFormCenter
    DesignSize = (
      657
      190)
    object LblTitulo: TLabel
      Left = 7
      Top = 5
      Width = 62
      Height = 19
      Caption = 'TITULO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ArtDBGrid1: TArtDBGrid
      Left = 4
      Top = 28
      Width = 649
      Height = 133
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DsGrilla
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GridDblClick
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'RECAIDA'
          Title.Caption = 'Recaida'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NRO'
          Title.Caption = 'N'#186
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Title.Caption = 'Estado'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESDE'
          Title.Caption = 'Desde'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HASTA'
          Title.Caption = 'Hasta'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIAS'
          Title.Caption = 'D'#237'as'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIQUIDADO'
          Title.Caption = 'Liquidado'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'A_PAGAR'
          Title.Caption = 'A Pagar'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USU_PROC'
          Title.Caption = 'U. Proceso'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FEC_IMP'
          Title.Caption = 'F. Impresi'#243'n'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FEC_APRO'
          Title.Caption = 'F. Aprob.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USU_APRO'
          Title.Caption = 'U. Aprob.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONCEPTO'
          Title.Caption = 'Concepto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FEC_PAG'
          Title.Caption = 'F. Pago'
          Width = 70
          Visible = True
        end>
    end
    object Button1: TButton
      Left = 577
      Top = 164
      Width = 76
      Height = 20
      Anchors = [akRight, akBottom]
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object FPanelC: TFormPanel [4]
    Left = 82
    Top = 200
    Width = 657
    Height = 182
    FormWidth = 0
    FormHeigth = 0
    Position = poOwnerFormCenter
    DesignSize = (
      657
      182)
    object lblTituloC: TLabel
      Left = 7
      Top = 5
      Width = 62
      Height = 19
      Caption = 'TITULO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ArtDBGrid2: TArtDBGrid
      Left = 4
      Top = 28
      Width = 649
      Height = 125
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DSc
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GridDblClick
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'VOLANTE'
          Title.Caption = 'Volante'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NRO'
          Title.Caption = 'N'#186
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Title.Caption = 'Estado'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRESTADOR'
          Title.Caption = 'Prestador'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONCEPTO'
          Title.Caption = 'Concepto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FEC_PRESTA'
          Title.Caption = 'F. Presta.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Title.Caption = 'Cantidad'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'IMPORTE'
          Title.Caption = 'Importe'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FEC_APROBACION'
          Title.Caption = 'F. Aprob.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USU_APROBACION'
          Title.Caption = 'U. Aprob.'
          Visible = True
        end>
    end
    object Button2: TButton
      Left = 578
      Top = 157
      Width = 76
      Height = 20
      Anchors = [akRight, akBottom]
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object FPReca: TFormPanel [5]
    Left = 217
    Top = 266
    Width = 297
    Height = 182
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      297
      182)
    object Label2: TLabel
      Left = 7
      Top = 5
      Width = 62
      Height = 19
      Caption = 'TITULO'
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
    end
    object ArtDBGrid3: TArtDBGrid
      Left = 6
      Top = 27
      Width = 286
      Height = 126
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DSReca
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GridDblClick
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'EX_RECAIDA'
          Title.Caption = 'Recaida'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EFECTIVOS'
          Title.Caption = 'Efectivos'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTIMADOS'
          Title.Caption = 'Estimados'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTDIAS'
          Title.Caption = 'Cant / D'#237'as %'
          Width = 75
          Visible = True
        end>
    end
    object Button3: TButton
      Left = 217
      Top = 155
      Width = 76
      Height = 22
      Anchors = [akRight, akBottom]
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'Select '#39'Prestaciones Medicas Autorizadas'#39' Descrip, NULL Efectivo' +
        's,Null Estimados,Null CantDias from dual')
    Left = 8
    Top = 388
  end
  inherited dsConsulta: TDataSource
    Left = 36
    Top = 388
  end
  inherited SortDialog: TSortDialog
    AutoModifySql = False
    Left = 8
    Top = 416
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'DESCRIP'
      end
      item
        DataField = 'EFECTIVOS'
      end
      item
        DataField = 'ESTIMADOS'
      end
      item
        DataField = 'CANTDIAS'
      end>
    Left = 36
    Top = 416
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Descripci'#243'n'
        DataField = 'DESCRIP'
        Width = 2500
        MaxLength = 32
      end
      item
        Title = 'Efectivos'
        DataField = 'EFECTIVOS'
        Alignment = taRightJustify
        Width = 600
        MaxLength = 0
      end
      item
        Title = 'Estimados'
        DataField = 'ESTIMADOS'
        Alignment = taRightJustify
        Width = 600
        MaxLength = 0
      end
      item
        Title = 'Cant. D'#237'as'
        DataField = 'CANTDIAS'
        Width = 600
        MaxLength = 0
      end>
    Headers.Color = clSilver
    Headers.Font.Color = clWindowText
    Detail.Font.Height = -13
    Detail.GridLinesWidth = 1
    Detail.MaxLines = 500
    LastColType = lcNone
    PageOrientation = pxPortrait
    PageSize = psLetter
    Left = 36
    Top = 444
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 7
    Top = 360
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 360
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
    Top = 444
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
    Left = 64
    Top = 360
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 64
    Top = 388
  end
  object DsGrilla: TDataSource
    DataSet = SdqGrilla
    Left = 133
    Top = 362
  end
  object SdqGrilla: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT LE_RECAIDA RECAIDA, LE_NUMLIQUI NRO, ART.IIF_CHAR(LE_TIPO' +
        'LIQUI, '#39'W'#39', '#39'Cancelaci'#243'n'#39', (ART.IIF_CHAR(LE_TIPOLIQUI, '#39'X'#39', '#39'Can' +
        'celaci'#243'n'#39', (DECODE(LE_ESTADO, '#39'C'#39', '#39'Liquidada'#39', '#39'M'#39', '#39'Liquidada'#39 +
        ', '#39'E'#39', '#39'Aprobada'#39', '#39'A'#39', '#39'Anulada'#39', '#39'X'#39', '#39'Cancelada'#39', NULL))))) E' +
        'STADO,'
      
        'LE_FECHADES DESDE, LE_FECHAHAS HASTA, LE_DIASAPLICA DIAS, LE_IMP' +
        'ILTP LIQUIDADO, LE_IMPORPERI A_PAGAR, LE_USUALTA USU_PROC, LE_FE' +
        'MISION FEC_IMP, LE_FAPROBADO FEC_APRO, LE_APROBADO USU_APRO, NUL' +
        'L CONCEPTO, NULL FEC_PAG'
      'FROM ART.SLE_LIQUIEMPSIN'
      'WHERE LE_CONPAGO IN ('#39'50'#39','#39'51'#39')')
    Left = 105
    Top = 362
  end
  object SdqC: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT IV_VOLANTE VOLANTE, IV_NUMPAGO NRO,  TB_DESCRIPCION ESTAD' +
        'O, '
      ' CA_DESCRIPCION PRESTADOR,  CP_DENPAGO CONCEPTO, IV_FECPRESTA '
      ' FEC_PRESTA,   IV_CANTIDAD CANTIDAD,  IV_IMPFACTURADO IMPORTE, '
      ' VO_FECHAPAGO FEC_APROBACION, VO_USUPAGO USU_APROBACION'
      'FROM ART.SVO_VOLANTES, ART.CPR_PRESTADOR, ART.SCP_CONPAGO, '
      'ART.CTB_TABLAS, ART.SIV_ITEMVOLANTE'
      'WHERE TB_CODIGO = IV_ESTADO'
      'AND TB_CLAVE = '#39'MUVOL'#39
      'AND IV_CONPAGO = CP_CONPAGO'
      'AND VO_VOLANTE = IV_VOLANTE'
      'AND VO_PRESTADOR = CA_IDENTIFICADOR')
    Left = 105
    Top = 390
  end
  object DSc: TDataSource
    DataSet = SdqC
    Left = 133
    Top = 390
  end
  object SDQReca: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT EX_RECAIDA,ART.Amebpba.get_costossin (1818,1,EX_RECAIDA,1' +
        ') Efectivos,0 Estimados,0 CantDias'
      'FROM ART.SEX_EXPEDIENTES'
      'WHERE EX_SINIESTRO=1818'
      'AND EX_Orden=1'
      'AND NVL(EX_CAUSAFIN,'#39#39')<>'#39'99'#39)
    Left = 105
    Top = 418
  end
  object DSReca: TDataSource
    DataSet = SDQReca
    Left = 133
    Top = 418
  end
  object MnuPop: TPopupMenu
    Left = 161
    Top = 418
    object VerDetalle1: TMenuItem
      Caption = '&Ver Detalle'
      OnClick = VerDetalle1Click
    end
  end
end
