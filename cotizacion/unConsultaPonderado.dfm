inherited frmConsultaPonderado: TfrmConsultaPonderado
  Left = 391
  Top = 186
  Width = 537
  Height = 447
  Caption = 'Consulta de Cotizaciones Ponderadas'
  Constraints.MinHeight = 447
  Constraints.MinWidth = 537
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 529
    Height = 92
    object GroupBox1: TGroupBox
      Left = 268
      Top = 43
      Width = 260
      Height = 42
      Caption = 'Fecha de Ponderado'
      TabOrder = 3
      object Label4: TLabel
        Left = 9
        Top = 19
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object Label5: TLabel
        Left = 137
        Top = 19
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object cmbPO_FECHAVIGENCIADesde: TDateComboBox
        Left = 42
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cmbPO_FECHAVIGENCIAHasta: TDateComboBox
        Left = 167
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 121
      Top = 43
      Width = 140
      Height = 42
      Caption = 'Ponderado'
      TabOrder = 2
      object Label1: TLabel
        Left = 13
        Top = 19
        Width = 21
        Height = 13
        Caption = 'Nro.'
      end
      object edPO_NROPONDERADO: TCardinalEdit
        Left = 36
        Top = 14
        Width = 98
        Height = 21
        TabOrder = 0
        MaxLength = 9
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 43
      Width = 115
      Height = 42
      Caption = 'Cotizaci'#243'n'
      TabOrder = 1
      object Label2: TLabel
        Left = 6
        Top = 18
        Width = 21
        Height = 13
        Caption = 'Nro.'
      end
      object edCO_NROCOTIZACION: TCardinalEdit
        Left = 29
        Top = 14
        Width = 80
        Height = 21
        TabOrder = 0
        MaxLength = 9
      end
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 0
      Width = 527
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        527
        40)
      object Label3: TLabel
        Left = 113
        Top = 15
        Width = 60
        Height = 13
        Caption = 'Raz'#243'n Social'
      end
      object Label6: TLabel
        Left = 4
        Top = 15
        Width = 19
        Height = 13
        Caption = 'Cuit'
        Layout = tlCenter
      end
      object edCO_RAZONSOCIAL: TEdit
        Left = 179
        Top = 12
        Width = 342
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edCO_CUIT: TMaskEdit
        Left = 25
        Top = 12
        Width = 81
        Height = 21
        EditMask = '99-99999999-c;0;'
        MaxLength = 13
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 92
    Width = 529
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 525
      end>
    inherited ToolBar: TToolBar
      Width = 512
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbNuevo: TToolButton
        Hint = 'Agrupar (Ctrl+A)'
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
      end
      object tbSeparador: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'tbSeparador'
        ImageIndex = 23
        Style = tbsSeparator
      end
      object tbCerrarCotizacion: TToolButton
        Left = 378
        Top = 0
        Hint = 'Cerrar Cotizaci'#243'n'
        Caption = 'tbCerrarCotizacion'
        ImageIndex = 22
        OnClick = tbCerrarCotizacionClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 121
    Width = 529
    Height = 299
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'PO_NROPONDERADO'
        Title.Caption = 'Nro. Ponderado'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cotiorden'
        Title.Caption = 'Nro. Cotizaci'#243'n'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_RAZONSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_FECHAVIGENCIA'
        Title.Caption = 'Fecha Vigencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_SUMAFIJAFINAL'
        Title.Caption = 'Suma Fija'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_PORCVARIABLEFINAL'
        Title.Caption = 'Costo Variable'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_COSTOFINAL'
        Title.Caption = 'Costo Final'
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16449
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
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
        LinkControl = tbSalir
      end>
  end
end
