inherited frmListPagosDirILT: TfrmListPagosDirILT
  Left = 239
  Top = 147
  Width = 790
  Height = 354
  Caption = 'Pagos Directos de ILT'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 782
    Height = 107
    object chkEmpresa: TCheckPanel
      Left = 188
      Top = 4
      Width = 389
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa '
      TabOrder = 1
      Checked = False
      OnChange = chkEmpresaChange
      DesignSize = (
        389
        47)
      inline fraEmpresa: TfraEmpresa
        Left = 6
        Top = 18
        Width = 377
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
          Left = 273
        end
        inherited edContrato: TIntEdit
          Left = 320
        end
        inherited cmbRSocial: TArtComboBox
          Width = 138
        end
      end
    end
    object chkDelegacion: TCheckPanel
      Left = 580
      Top = 4
      Width = 202
      Height = 47
      Anchors = [akTop, akRight]
      Caption = 'Delegaci'#243'n '
      TabOrder = 2
      Checked = False
      OnChange = chkDelegacionChange
      DesignSize = (
        202
        47)
      inline fraDelegacion: TfraDelegacion
        Left = 4
        Top = 17
        Width = 195
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 44
          Width = 150
        end
        inherited edCodigo: TPatternEdit
          Width = 40
        end
      end
    end
    object chkFechaRecCartaDoc: TCheckPanel
      Left = 1
      Top = 56
      Width = 194
      Height = 46
      Caption = 'Fecha pedido docum.'
      TabOrder = 3
      Checked = False
      OnChange = chkFechaRecCartaDocChange
      object Label1: TLabel
        Left = 91
        Top = 23
        Width = 13
        Height = 11
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Small Fonts'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dcRecDesde: TDateComboBox
        Left = 4
        Top = 19
        Width = 87
        Height = 21
        MaxDateCombo = dcRecHasta
        TabOrder = 0
      end
      object dcRecHasta: TDateComboBox
        Left = 104
        Top = 19
        Width = 87
        Height = 21
        MinDateCombo = dcRecDesde
        TabOrder = 1
      end
    end
    object chkFechaLiqILT: TCheckPanel
      Left = 195
      Top = 56
      Width = 194
      Height = 46
      Caption = 'Fecha pago dir. ILT '
      TabOrder = 4
      OnChange = chkFechaLiqILTChange
      object Label2: TLabel
        Left = 91
        Top = 23
        Width = 13
        Height = 11
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Small Fonts'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dcILTDesde: TDateComboBox
        Left = 4
        Top = 19
        Width = 87
        Height = 21
        MaxDateCombo = dcILTHasta
        TabOrder = 0
      end
      object dcILTHasta: TDateComboBox
        Left = 104
        Top = 19
        Width = 87
        Height = 21
        MinDateCombo = dcILTDesde
        TabOrder = 1
      end
    end
    object chkFechaEnvFondos: TCheckPanel
      Left = 390
      Top = 56
      Width = 194
      Height = 46
      Caption = 'Fecha env'#237'o fondos '
      TabOrder = 5
      Checked = False
      OnChange = chkFechaEnvFondosChange
      object Label3: TLabel
        Left = 91
        Top = 23
        Width = 13
        Height = 11
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Small Fonts'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dcFondDesde: TDateComboBox
        Left = 4
        Top = 19
        Width = 87
        Height = 21
        MaxDateCombo = dcFondHasta
        TabOrder = 0
      end
      object dcFondHasta: TDateComboBox
        Left = 104
        Top = 19
        Width = 87
        Height = 21
        MinDateCombo = dcFondDesde
        TabOrder = 1
      end
    end
    object chkFechaCCDisp: TCheckPanel
      Left = 585
      Top = 56
      Width = 194
      Height = 46
      Caption = 'Fecha puesta disp. '
      TabOrder = 6
      Checked = False
      OnChange = chkFechaCCDispChange
      object Label4: TLabel
        Left = 91
        Top = 23
        Width = 13
        Height = 11
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Small Fonts'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dcCCDesde: TDateComboBox
        Left = 4
        Top = 19
        Width = 87
        Height = 21
        MaxDateCombo = dcCCHasta
        TabOrder = 0
      end
      object dcCCHasta: TDateComboBox
        Left = 104
        Top = 19
        Width = 87
        Height = 21
        MinDateCombo = dcCCDesde
        TabOrder = 1
      end
    end
    object chkSiniestro: TCheckPanel
      Left = 1
      Top = 5
      Width = 184
      Height = 46
      Caption = 'Siniestro'
      TabOrder = 0
      Checked = False
      OnChange = chkSiniestroChange
      object Label5: TLabel
        Left = 86
        Top = 23
        Width = 13
        Height = 11
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Small Fonts'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edSinHasta: TSinEdit
        Left = 102
        Top = 18
        Width = 75
        Height = 21
        TabOrder = 1
        ViewStyle = [etSiniestro]
      end
      object edSinDesde: TSinEdit
        Left = 6
        Top = 18
        Width = 75
        Height = 21
        TabOrder = 0
        ViewStyle = [etSiniestro]
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 107
    Width = 782
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 778
      end>
    inherited ToolBar: TToolBar
      Width = 765
    end
  end
  inherited Grid: TArtDBGrid
    Top = 136
    Width = 782
    Height = 191
    Constraints.MinHeight = 163
    Constraints.MinWidth = 779
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Tahoma'
    ParentFont = False
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LE_NUMLIQUI'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Liq.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 250
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'FPEDIDODOCUM'
        Title.Alignment = taCenter
        Title.Caption = 'F. ped. docum.'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LE_FPROCESO'
        Title.Alignment = taCenter
        Title.Caption = 'F. pago dir. ILT'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FPUESTADISP'
        Title.Alignment = taCenter
        Title.Caption = 'F. puesta disp.'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CE_FECHACHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'F. env'#237'o fondos'
        Width = 95
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        Width = 250
        MaxLength = 0
      end
      item
        Title = 'Nro Liquid.'
        DataField = 'LE_NUMLIQUI'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Empresa'
        DataField = 'EMPRESA'
        Width = 250
        MaxLength = 0
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'DELEGACION'
        Width = 250
        MaxLength = 0
      end
      item
        Title = 'Fec.Recep.CD Ped.Doc.'
        DataField = 'FPEDIDODOCUM'
        Width = 250
        MaxLength = 0
      end
      item
        Title = 'Fec.Liq.pag ILT'
        DataField = 'LE_FPROCESO'
        Width = 250
        MaxLength = 0
      end
      item
        Title = 'Fec.CC pta Disp.'
        DataField = 'FPUESTADISP'
        Width = 250
        MaxLength = 0
      end
      item
        Title = 'Fec.Envio Fondos'
        DataField = 'CE_FECHACHEQUE'
        Width = 250
        MaxLength = 0
      end>
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
