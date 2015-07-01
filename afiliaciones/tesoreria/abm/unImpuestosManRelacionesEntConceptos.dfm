inherited frmImpuestosManRelacionesEntConceptos: TfrmImpuestosManRelacionesEntConceptos
  Width = 668
  Height = 500
  Caption = 'Relaciones Entidades-Conceptos'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 668
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 660
    Height = 92
    Visible = True
    DesignSize = (
      660
      92)
    object chkNoMostrarBajas: TCheckBox
      Left = 550
      Top = 74
      Width = 105
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 0
      Width = 651
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Entidad'
      TabOrder = 0
      DesignSize = (
        651
        44)
      inline fraEntidadBusq: TfraCodigoDescripcion
        Left = 9
        Top = 15
        Width = 634
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          634
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 569
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 44
      Width = 538
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Concepto'
      TabOrder = 1
      DesignSize = (
        538
        44)
      inline fraConceptoBusq: TfraCodigoDescripcion
        Left = 9
        Top = 15
        Width = 520
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          520
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 455
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
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 92
    Width = 660
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 656
      end>
    inherited ToolBar: TToolBar
      Width = 643
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 121
    Width = 660
    Height = 351
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IE_NOMBRE'
        Title.Caption = 'Entidad'
        Width = 212
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'IE_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT Ent.'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IC_CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 256
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IM_DESCRIPCION'
        Title.Caption = 'Impuesto'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_DESCRIPCION'
        Title.Caption = 'Tipo de Liquidaci'#243'n'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IX_BENEFICIARIO'
        Title.Caption = 'Beneficario'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRMETPAGO'
        Title.Caption = 'M'#233'todo de Pago'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IX_ENDOSO'
        Title.Caption = 'Endoso'
        Width = 298
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 79
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 146
    Top = 204
    Width = 490
    Height = 176
    Constraints.MaxHeight = 176
    Constraints.MinHeight = 176
    Constraints.MinWidth = 490
    DesignSize = (
      490
      176)
    inherited BevelAbm: TBevel
      Top = 140
      Width = 482
    end
    object Label1: TLabel [1]
      Left = 9
      Top = 41
      Width = 85
      Height = 13
      AutoSize = False
      Caption = 'Concepto'
    end
    object Label2: TLabel [2]
      Left = 9
      Top = 13
      Width = 85
      Height = 13
      AutoSize = False
      Caption = 'Entidad'
    end
    object Label3: TLabel [3]
      Left = 9
      Top = 93
      Width = 85
      Height = 13
      AutoSize = False
      Caption = 'M'#233'todo de Pago'
    end
    object Label4: TLabel [4]
      Left = 9
      Top = 67
      Width = 85
      Height = 13
      AutoSize = False
      Caption = 'Beneficiario'
    end
    object Label5: TLabel [5]
      Left = 9
      Top = 119
      Width = 85
      Height = 13
      AutoSize = False
      Caption = 'Endoso'
    end
    inherited btnAceptar: TButton
      Left = 332
      Top = 146
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 410
      Top = 146
      TabOrder = 6
    end
    inline fraIX_IDENTIDAD: TfraCodigoDescripcion
      Left = 94
      Top = 9
      Width = 389
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        389
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 324
      end
    end
    inline fraIX_IDCONCEPTO: TfraCodigoDescripcion
      Left = 94
      Top = 36
      Width = 389
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        389
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 324
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
      end
    end
    inline fraIX_METODOPAGO: TfraCtbTablas
      Left = 94
      Top = 88
      Width = 389
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        389
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 64
        Width = 324
      end
      inherited edCodigo: TPatternEdit
        Width = 60
      end
    end
    object edIX_BENEFICIARIO: TEdit
      Left = 95
      Top = 63
      Width = 385
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 2
    end
    object edIX_ENDOSO: TEdit
      Left = 95
      Top = 115
      Width = 385
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 240
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT IC_CONCEPTO, IE_NOMBRE, IE_CUIT, IM_DESCRIPCION, IT_DESCR' +
        'IPCION,'
      '       TRUNC(IX_FECHABAJA) FECHABAJA, IX_ID ID, IX_METODOPAGO,'
      
        '       IX_BENEFICIARIO, IX_ENDOSO, METPAGO.TB_DESCRIPCION DESCRM' +
        'ETPAGO'
      
        '  FROM ART.CTB_TABLAS METPAGO, CONT.OIT_IMPTIPO, CONT.OIM_IMPUES' +
        'TO, CONT.OIE_IMPENTIDAD, CONT.OIC_IMPCONCEPTO, CONT.OIX_IMPENTID' +
        'ADCONCEPTO'
      ' WHERE IX_IDENTIDAD = IE_ID'
      '   AND IX_IDCONCEPTO = IC_ID'
      '   AND IC_IDIMPUESTO = IM_ID'
      '   AND IC_IDTIPO = IT_ID'
      '   AND METPAGO.TB_CLAVE = '#39'COBRO'#39
      '   AND METPAGO.TB_CODIGO = IX_METODOPAGO'
      ''
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
