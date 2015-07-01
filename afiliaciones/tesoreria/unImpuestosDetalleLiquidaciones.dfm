inherited frmImpuestosDetalleLiquidaciones: TfrmImpuestosDetalleLiquidaciones
  Left = 154
  Top = 171
  Caption = 'Detalle de Liquidaciones'
  ClientHeight = 538
  ClientWidth = 902
  Constraints.MinHeight = 500
  Constraints.MinWidth = 500
  FormStyle = fsNormal
  Visible = False
  ExplicitLeft = 154
  ExplicitTop = 171
  ExplicitWidth = 910
  ExplicitHeight = 568
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 902
    Height = 98
    Visible = True
    ExplicitWidth = 902
    ExplicitHeight = 98
    DesignSize = (
      902
      98)
    object Panel1: TPanel
      Left = 5
      Top = 4
      Width = 892
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 2
      DesignSize = (
        892
        47)
      object Label1: TLabel
        Left = 5
        Top = 4
        Width = 64
        Height = 13
        Caption = 'CUIT Entidad'
      end
      object Label2: TLabel
        Left = 97
        Top = 4
        Width = 37
        Height = 13
        Caption = 'Nombre'
      end
      object Label3: TLabel
        Left = 788
        Top = 4
        Width = 92
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Importe Liquidaci'#243'n'
      end
      object edCUITEntidad: TEdit
        Left = 5
        Top = 20
        Width = 89
        Height = 21
        TabOrder = 0
      end
      object edNombreEntidad: TEdit
        Left = 97
        Top = 20
        Width = 686
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edImporte: TCurrencyEdit
        Left = 788
        Top = 20
        Width = 97
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Anchors = [akTop, akRight]
        TabOrder = 2
      end
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 51
      Width = 784
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Concepto'
      TabOrder = 0
      DesignSize = (
        784
        44)
      inline fraConceptoBusq: TfraCodigoDescripcion
        Left = 9
        Top = 15
        Width = 765
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 9
        ExplicitTop = 15
        ExplicitWidth = 765
        inherited cmbDescripcion: TArtComboBox
          Width = 700
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IM_DESCRIPCION'
              Title.Caption = 'Impuesto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IT_DESCRIPCION'
              Title.Caption = 'Tipo Liquidaci'#243'n'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PV_DESCRIPCION'
              Title.Caption = 'Provincia'
              Visible = True
            end>
          ExplicitWidth = 700
        end
      end
    end
    object chkNoMostrarBajas: TCheckBox
      Left = 796
      Top = 80
      Width = 105
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Top = 98
    Width = 902
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 896
      end>
    ExplicitTop = 98
    ExplicitWidth = 902
    inherited ToolBar: TToolBar
      Width = 887
      ExplicitWidth = 887
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 127
    Width = 902
    Height = 411
    Columns = <
      item
        Expanded = False
        FieldName = 'IDLIQ'
        Title.Alignment = taCenter
        Title.Caption = 'ID Det. Liquid.'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHALIQ'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTELIQ'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCEPTOLIQ'
        Title.Caption = 'Concepto'
        Width = 257
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPUESTOLIQ'
        Title.Caption = 'Impuesto'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOLIQ'
        Title.Caption = 'Tipo'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRMETPAGO'
        Title.Caption = 'M'#233'todo de Pago'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDOSO'
        Title.Caption = 'Endoso'
        Width = 236
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONESLIQ'
        Title.Caption = 'Observaciones'
        Width = 307
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTALIQ'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTALIQ'
        Title.Caption = 'Usuario Alta'
        Width = 102
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJALIQ'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUBAJALIQ'
        Title.Caption = 'Usuario Baja'
        Width = 119
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 208
    Top = 172
    Width = 470
    Height = 250
    Constraints.MaxHeight = 250
    Constraints.MaxWidth = 470
    Constraints.MinHeight = 250
    Constraints.MinWidth = 470
    ExplicitLeft = 208
    ExplicitTop = 172
    ExplicitWidth = 470
    ExplicitHeight = 250
    DesignSize = (
      470
      250)
    inherited BevelAbm: TBevel
      Top = 214
      Width = 462
      ExplicitTop = 214
      ExplicitWidth = 462
    end
    object Label5: TLabel [1]
      Left = 10
      Top = 44
      Width = 35
      Height = 13
      Caption = 'Importe'
    end
    object Label4: TLabel [2]
      Left = 10
      Top = 85
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label6: TLabel [3]
      Left = 10
      Top = 5
      Width = 46
      Height = 13
      Caption = 'Concepto'
    end
    inherited btnAceptar: TButton
      Left = 312
      Top = 220
      TabOrder = 3
      ExplicitLeft = 312
      ExplicitTop = 220
    end
    inherited btnCancelar: TButton
      Left = 390
      Top = 220
      TabOrder = 4
      ExplicitLeft = 390
      ExplicitTop = 220
    end
    object edID_IMPORTE: TCurrencyEdit
      Left = 10
      Top = 60
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      TabOrder = 1
    end
    object edID_OBSERVACIONES: TMemo
      Left = 9
      Top = 100
      Width = 452
      Height = 108
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 240
      TabOrder = 2
    end
    inline fraID_IDCONCEPTO: TfraCodigoDescripcion
      Left = 10
      Top = 20
      Width = 453
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 10
      ExplicitTop = 20
      ExplicitWidth = 453
      inherited cmbDescripcion: TArtComboBox
        Width = 388
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IM_DESCRIPCION'
            Title.Caption = 'Impuesto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IT_DESCRIPCION'
            Title.Caption = 'Tipo Liquidaci'#243'n'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PV_DESCRIPCION'
            Title.Caption = 'Provincia'
            Visible = True
          end>
        ExplicitWidth = 388
      end
    end
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
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
    Left = 110
    Top = 200
  end
end
