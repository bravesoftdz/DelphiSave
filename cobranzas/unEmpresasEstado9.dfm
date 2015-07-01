inherited frmEmpresasEstado9: TfrmEmpresasEstado9
  Left = 41
  Top = 93
  Width = 664
  Height = 376
  Caption = 'Empresas en Estado 9'
  Constraints.MinHeight = 376
  Constraints.MinWidth = 664
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 656
    Height = 25
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 25
    Width = 656
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 652
      end>
    inherited ToolBar: TToolBar
      Width = 639
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 54
    Width = 656
    Height = 295
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Raz'#243'n Social'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FBAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'C_INTIMACION'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Carta Intimac.'
        Width = 97
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'I_FIMPRESION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Impresi'#243'n Intimac.'
        Width = 101
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'I_FRECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recep. Intimac.'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'I_CODRECEPCION'
        Title.Caption = 'C'#243'd. Recep. Intimac.'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'I_DESCRECEPCION'
        Title.Caption = 'Descr. Recep. Intimac.'
        Width = 113
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'C_RESCISION'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Carta Resc.'
        Width = 86
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'R_FIMPRESION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Impresi'#243'n Resc.'
        Width = 98
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'R_FRECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recep. Resc.'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'R_CODRECEPCION'
        Title.Caption = 'C'#243'd. Recep. Resc.'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'R_DESCRECEPCION'
        Title.Caption = 'Descr. Recep. Resc.'
        Width = 104
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'D_DEUDAINTIMACION'
        Title.Alignment = taCenter
        Title.Caption = 'Deuda Intimac.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_CANTPERINTIMACION'
        Title.Alignment = taCenter
        Title.Caption = 'Cant. Per. Intimac.'
        Width = 93
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'D_TOTDEVPOSTERIORINTIMAC'
        Title.Alignment = taCenter
        Title.Caption = 'Tot. Dev. Posterior Intimac.'
        Width = 134
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'D_DEVANULADOSINEMPLEADOS'
        Title.Alignment = taCenter
        Title.Caption = 'Dev. Anulado Carga sin Empl.'
        Width = 148
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'D_MAYORDEVULTANIO'
        Title.Alignment = taCenter
        Title.Caption = 'Mayor Dev. Ult. A'#241'o'
        Width = 103
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'D_DEUDAANTERIORIMPRRESCISION'
        Title.Alignment = taCenter
        Title.Caption = 'Deuda Anterior Impr. Resc.'
        Width = 133
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'D_DEUDAANTERIORRECEPCRESCISION'
        Title.Alignment = taCenter
        Title.Caption = 'Deuda Anterior Recep. Resc.'
        Width = 145
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'D_TOTCOBRPOSTERIORPERINTIMAC'
        Title.Alignment = taCenter
        Title.Caption = 'Tot. Cobrado Deuda Intimac.'
        Width = 146
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'D_DEVENGADOANULADOINTIMACION'
        Title.Alignment = taCenter
        Title.Caption = 'Dev. Anulado Intimaci'#243'n'
        Width = 127
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'D_ULTFECHAPAGOMOVIM'
        Title.Alignment = taCenter
        Title.Caption = 'Ult. F. Pago Ingresada'
        Width = 119
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'D_PERULTFECHAPAGOMOVIM'
        Title.Alignment = taCenter
        Title.Caption = 'Per Ult. F. Pago Ingresada'
        Width = 133
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'D_ULTFECHAPAGOINTIMACION'
        Title.Alignment = taCenter
        Title.Caption = 'Ult. F. Pago Intimac.'
        Width = 108
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'D_PERULTFECHAPAGOINTIMACION'
        Title.Alignment = taCenter
        Title.Caption = 'Per Ult. F. Pago Intimac.'
        Width = 121
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'D_ULTFECHAPAGOFUERAINTIMACION'
        Title.Alignment = taCenter
        Title.Caption = 'Ult. F. Pago Fuera Intimac.'
        Width = 132
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'D_PERULTFPAGOFUERAINTIMACION'
        Title.Alignment = taCenter
        Title.Caption = 'Per Ult. F. Pago Fuera Intimac.'
        Width = 156
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'P_ULTFECHAPLANPAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Ult. F. Plan Pago'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'P_TOTALAPAGARPLANPAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Plan Pago'
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'P_FECHAVENCPROXCUOTAPLANPAGO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Prox. Vencim. Plan Pago'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'P_SECTORPLANPAGO'
        Title.Caption = 'Sector Plan Pago'
        Width = 150
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM DSCVER.DIS_ESTADO9')
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 80
    Options = [qoZoomPrint, qoZoomCalcFontSize]
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
end
