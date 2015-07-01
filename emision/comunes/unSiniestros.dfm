inherited frmSiniestros: TfrmSiniestros
  Left = 56
  Top = 116
  Width = 680
  Height = 420
  Caption = 'Siniestros'
  Constraints.MinHeight = 420
  Constraints.MinWidth = 680
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 672
    Height = 13
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 13
    Width = 672
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 668
      end>
    inherited ToolBar: TToolBar
      Width = 655
      inherited tbLimpiar: TToolButton
        Visible = False
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
    end
  end
  inherited Grid: TArtDBGrid
    Top = 42
    Width = 672
    Height = 351
    ParentFont = False
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -9
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'SS_SINIESTRO'
        Title.Caption = ' Siniestro'
        Title.Color = clNavy
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SS_ORDEN'
        Title.Alignment = taCenter
        Title.Caption = 'Orden'
        Title.Color = clNavy
        Width = 35
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SS_RECAIDA'
        Title.Alignment = taCenter
        Title.Caption = 'Reca'#237'da'
        Title.Color = clNavy
        Width = 47
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SS_CUIL'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. de CUIL'
        Title.Color = clNavy
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_NOMBRE'
        Title.Caption = ' Nombre y Apellido'
        Title.Color = clNavy
        Width = 204
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SS_FNACIMIENTOTRAB'
        Title.Alignment = taCenter
        Title.Caption = ' F. Nacim. Trab.'
        Title.Color = clNavy
        Width = 84
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SS_FACCIDENTE'
        Title.Alignment = taCenter
        Title.Caption = ' F. del Accidente'
        Title.Color = clNavy
        Width = 86
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SS_FBAJA'
        Title.Alignment = taCenter
        Title.Caption = ' Baja M'#233'dica'
        Title.Color = clNavy
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SS_FALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Alta M'#233'dica'
        Title.Color = clNavy
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_TIPO'
        Title.Caption = ' C'#243'd. y Desc. del Tipo'
        Title.Color = clNavy
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_ESTADO'
        Title.Caption = ' C'#243'd. y Desc. del Estado'
        Title.Color = clNavy
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_CAUSAFIN'
        Title.Caption = ' C'#243'd. y Desc. de la Causa del Cierre'
        Title.Color = clNavy
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_GRAVEDAD'
        Title.Caption = ' C'#243'd. y Desc. de la Gravedad'
        Title.Color = clNavy
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_BREVEDESCRIPCIONEXP'
        Title.Caption = ' Breve Descripci'#243'n del Expediente'
        Title.Color = clNavy
        Width = 483
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
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
