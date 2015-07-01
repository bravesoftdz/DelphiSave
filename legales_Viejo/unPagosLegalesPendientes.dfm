object frmPagosLegalesPendientes: TfrmPagosLegalesPendientes
  Left = 269
  Top = 246
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Conceptos Pendientes de Pago..'
  ClientHeight = 326
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgConceptosPendientesDePago: TDBGrid
    Left = 0
    Top = 29
    Width = 591
    Height = 297
    Align = alClient
    DataSource = dsPagoLegal
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawDataCell = dbgConceptosPendientesDePagoDrawDataCell
    Columns = <
      item
        Expanded = False
        FieldName = 'LP_ID'
        Title.Caption = 'Nro.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LP_CONPAGO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LP_IMPORPAGO'
        Title.Caption = 'Importe'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LP_IDJUICIOENTRAMITE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LP_IDTIPOOPERACION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CP_DESCRIPCION'
        Title.Caption = 'Concepto Pago'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TO_DESCRIPCION'
        Title.Caption = 'Operaci'#243'n'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LP_NUMPAGO'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Caption = 'Aceptado'
        Visible = True
      end>
  end
  object cbEdicionPagosEfectudos: TCoolBar
    Left = 0
    Top = 0
    Width = 591
    Height = 29
    Bands = <
      item
        Control = tbPagos
        ImageIndex = -1
        MinHeight = 27
        Width = 587
      end>
    object tbPagos: TToolBar
      Left = 9
      Top = 0
      Width = 574
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = dmLegales.ilColor
      Images = dmLegales.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbIngresoPago: TToolButton
        Left = 0
        Top = 0
        Hint = 'Aceptar Pago'
        ImageIndex = 20
      end
      object tbEdicionPago: TToolButton
        Left = 23
        Top = 0
        Hint = 'Modificar Pago'
        ImageIndex = 7
      end
      object tbEliminarPago: TToolButton
        Left = 46
        Top = 0
        Hint = 'Eliminar Pago'
        ImageIndex = 8
      end
      object ToolButton21: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 77
        Top = 0
        Hint = 'Salir'
        Caption = 'Salir'
        ImageIndex = 5
        Visible = False
        OnClick = tbSalirClick
      end
    end
  end
  object sdqPagoLegal: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT LPL.*, SCP.CP_DESCRIPCION, LTO.TO_DESCRIPCION FROM '
      ' LEGALES.LPL_PAGOLEGAL LPL,'
      ' ART.SCP_CONPAGO SCP, '
      ' LEGALES.LTO_TIPOOPERACION LTO'
      'WHERE LP_IDJUICIOENTRAMITE = :IDNROJUICIO '
      '  AND LP_CONPAGO = CP_CONPAGO'
      '  AND LP_IDTIPOOPERACION = TO_ID')
    Left = 220
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDNROJUICIO'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsPagoLegal: TDataSource
    DataSet = sdqPagoLegal
    Left = 252
    Top = 8
  end
  object JvMemoryData1: TJvMemoryData
    FieldDefs = <>
    Left = 192
    Top = 8
  end
  object sdqConceptosOperaciones: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT /*+ NOPARALLEL(LOP, ) */'
      
        '       lop.op_id, lop.op_idcppago, lop.op_cargofijo, lop.op_idop' +
        'eracion'
      '  FROM legales.lop_tipooperacionconceptopago lop'
      ' WHERE ((lop.op_idoperacion = :idoperacion))')
    Left = 188
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idoperacion'
        ParamType = ptInput
        Value = '0'
      end>
  end
end
