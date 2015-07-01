object frmRptChequeReemplazados: TfrmRptChequeReemplazados
  Left = 383
  Top = 236
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informe de Cheques Reemplazados'
  ClientHeight = 117
  ClientWidth = 240
  Color = clBtnFace
  Constraints.MinHeight = 144
  Constraints.MinWidth = 248
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    240
    117)
  PixelsPerInch = 96
  TextHeight = 13
  object lbFechaDesde: TLabel
    Left = 43
    Top = 16
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = 'Fecha Desde:'
  end
  object Label1: TLabel
    Left = 46
    Top = 39
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = 'Fecha Hasta:'
  end
  object Bevel1: TBevel
    Left = 4
    Top = 84
    Width = 235
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object btnAceptar: TButton
    Left = 80
    Top = 89
    Width = 72
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 3
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 160
    Top = 89
    Width = 72
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object edFECHA_REEMP_DESDE: TDateComboBox
    Left = 121
    Top = 11
    Width = 88
    Height = 21
    MaxDateCombo = edFECHA_REEMP_HASTA
    TabOrder = 0
  end
  object edFECHA_REEMP_HASTA: TDateComboBox
    Left = 121
    Top = 35
    Width = 88
    Height = 21
    MinDateCombo = edFECHA_REEMP_DESDE
    TabOrder = 1
  end
  object edNO_Conta: TCheckBox
    Left = 121
    Top = 62
    Width = 109
    Height = 17
    Caption = 'No Contabilizados'
    TabOrder = 2
  end
  object sdqReporte: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT DISTINCT SC.CHECK_ID, 1 CORTE, SC.CHEQUE, SC.OP, SC.FECHA' +
        '_CHEQUE, SC.FECHA_ESTADO, SC.MONTO, SC.CE_BENEFICIARIO '
      
        'FROM SCOTT.SEGUIMIENTO_CHEQUES SC, SCOTT.SEGUIMIENTO_CHEQUES SC2' +
        ', SCOTT.OP_REEMPLAZO_CHEQUES ORC'
      'WHERE SC2.CHEQUE_REEMP = SC.CHECK_ID '
      'AND SC2.OP = ORC.OP_ID ')
    Left = 4
    Top = 88
  end
  object qpReporte: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <
      item
        Title = 'Cheque'
        TitleAlignment = taCenter
        DataField = 'CE_NUMERO'
        Alignment = taRightJustify
        Width = 400
        MaxLength = 0
      end
      item
        Title = 'Orden Pago'
        TitleAlignment = taCenter
        DataField = 'CE_ORDENPAGO'
        Alignment = taRightJustify
        Width = 462
        MaxLength = 0
      end
      item
        Title = 'Fecha Cheque'
        TitleAlignment = taCenter
        DataField = 'CE_FECHACHEQUE'
        Alignment = taCenter
        Width = 500
        MaxLength = 0
      end
      item
        Title = 'Fecha Estado'
        TitleAlignment = taCenter
        DataField = 'CE_FECHAESTADO'
        Alignment = taCenter
        Width = 500
        MaxLength = 0
      end
      item
        Title = 'Monto'
        TitleAlignment = taCenter
        DataField = 'CE_MONTO'
        Alignment = taRightJustify
        TotalType = ttCustom
        FormatFloat = '0.00'
        Width = 662
        MaxLength = 0
      end
      item
        Title = 'Beneficiario'
        TitleAlignment = taCenter
        DataField = 'CE_BENEFICIARIO'
        Width = 3525
        MaxLength = 0
      end>
    DataSource = dsReporte
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Listado de Reemplazo de Cheques'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = clWhite
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -11
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    OnGetTotals = qpReporteGetTotals
    OnGetCellParams = qpReporteGetCellParams
    OnReportBegin = qpReporteReportBegin
    Margins.Left = 10
    Margins.Right = 10
    PrinterOptions.PrintDialog = PrintDialog
    Left = 60
    Top = 88
  end
  object dsReporte: TDataSource
    DataSet = sdqReporte
    Left = 32
    Top = 88
  end
  object PrintDialog: TPrintDialog
    Left = 88
    Top = 88
  end
end
