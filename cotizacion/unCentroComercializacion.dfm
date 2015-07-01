inherited frmCentroComercializacion: TfrmCentroComercializacion
  Left = 391
  Top = 158
  Width = 780
  Height = 560
  Caption = 'Centro de Comercializaci'#243'n'
  Constraints.MinHeight = 560
  Constraints.MinWidth = 780
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TJvSplitter [0]
    Left = 200
    Top = 53
    Height = 480
    Beveled = True
    MinSize = 0
  end
  object pnlFiltros: TPanel [1]
    Left = 0
    Top = 0
    Width = 772
    Height = 53
    Align = alTop
    Color = clGray
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 8
      Width = 33
      Height = 13
      Caption = 'CANAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 191
      Top = 8
      Width = 44
      Height = 13
      Caption = 'ENTIDAD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 374
      Top = 8
      Width = 95
      Height = 13
      Caption = 'CENTRO REGIONAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 553
      Top = 8
      Width = 52
      Height = 13
      Caption = 'SUCURSAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inline fraSC_CANAL: TfraCanal
      Left = 7
      Top = 22
      Width = 180
      Height = 23
      TabOrder = 0
      inherited edCodigo: TPatternEdit
        Width = 50
      end
      inherited cmbDescripcion: TComboGrid
        Left = 53
        Width = 124
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
    inline fraSC_IDENTIDAD: TfraEntidades
      Left = 188
      Top = 22
      Width = 180
      Height = 23
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Left = 53
        Width = 124
        OnDropDown = fraSC_IDENTIDADcmbDescripcionDropDown
      end
      inherited edCodigo: TPatternEdit
        Width = 50
      end
    end
    inline fraSU_IDCENTROREG: TfraCentroRegional
      Left = 369
      Top = 22
      Width = 180
      Height = 23
      TabOrder = 2
      inherited edCodigo: TPatternEdit
        Width = 50
      end
      inherited cmbDescripcion: TComboGrid
        Left = 53
        Width = 124
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
    inline fraSC_IDSUCURSAL: TfraSucursal
      Left = 550
      Top = 22
      Width = 180
      Height = 23
      TabOrder = 3
      inherited edCodigo: TPatternEdit
        Width = 50
      end
      inherited cmbDescripcion: TComboGrid
        Left = 53
        Width = 124
        OnDropDown = fraSC_IDSUCURSALcmbDescripcionDropDown
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'Entidad'
          'Centro Regional')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          0)
      end
    end
  end
  object pnlIzquierda: TPanel [2]
    Left = 0
    Top = 53
    Width = 200
    Height = 480
    Align = alLeft
    BevelOuter = bvNone
    Constraints.MinWidth = 100
    TabOrder = 1
    object gbDatosAdicionales: TJvgGroupBox
      Left = 0
      Top = 380
      Width = 200
      Height = 100
      Align = alBottom
      Caption = ' Datos Adicionales '
      TabOrder = 0
      Border.Inner = bvSpace
      Border.Outer = bvNone
      Border.Bold = False
      CaptionBorder.Inner = bvSpace
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.Active = False
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      FullHeight = 0
      object VE_DIRELECTRONICA: TDBText
        Left = 4
        Top = 80
        Width = 106
        Height = 13
        AutoSize = True
        DataField = 'VE_DIRELECTRONICA'
        DataSource = dsXVE_VENDEDOR
      end
      object VE_CUIT: TDBText
        Left = 4
        Top = 36
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'VE_CUIT'
        DataSource = dsXVE_VENDEDOR
      end
      object VE_VENDEDOR: TDBText
        Left = 56
        Top = 20
        Width = 72
        Height = 13
        AutoSize = True
        DataField = 'VE_VENDEDOR'
        DataSource = dsXVE_VENDEDOR
      end
      object Label7: TLabel
        Left = 4
        Top = 20
        Width = 46
        Height = 13
        Caption = 'Vendedor'
      end
      object DOMICILIO: TDBMemo
        Left = 2
        Top = 52
        Width = 192
        Height = 29
        BorderStyle = bsNone
        DataField = 'DOMICILIO'
        DataSource = dsXVE_VENDEDOR
        ParentColor = True
        TabOrder = 0
      end
    end
    object pnl2: TPanel
      Left = 0
      Top = 0
      Width = 200
      Height = 380
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      OnCanResize = pnl2CanResize
      DesignSize = (
        200
        380)
      object Label4: TLabel
        Left = 2
        Top = 4
        Width = 66
        Height = 13
        Caption = 'VENDEDORES'
      end
      object Label5: TLabel
        Left = 2
        Top = 333
        Width = 32
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Buscar'
      end
      object edBusqueda: TEdit
        Left = 0
        Top = 348
        Width = 198
        Height = 21
        Anchors = [akLeft, akRight, akBottom]
        CharCase = ecUpperCase
        TabOrder = 1
        OnChange = edBusquedaChange
      end
      object dbgXVE_VENDEDOR: TArtDBGrid
        Left = 0
        Top = 20
        Width = 198
        Height = 311
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsXVE_VENDEDOR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnGetCellProps = dbgXVE_VENDEDORGetCellProps
        FooterBand = False
        TitleHeight = 17
        AutoTitleHeight = True
        Columns = <
          item
            Expanded = False
            FieldName = 'VE_VENDEDOR'
            Title.Caption = 'Vendedor'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VE_NOMBRE'
            Title.Caption = 'Apellido | Nombre'
            Width = 126
            Visible = True
          end>
      end
      object chkVerVendedores: TCheckBox
        Left = 163
        Top = 2
        Width = 37
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Ver'
        TabOrder = 2
        OnClick = chkVerVendedoresClick
      end
      object rbCodigo: TRadioButton
        Left = 47
        Top = 334
        Width = 55
        Height = 12
        Anchors = [akLeft, akBottom]
        Caption = 'C'#243'digo'
        TabOrder = 3
      end
      object rbNombre: TRadioButton
        Left = 103
        Top = 334
        Width = 59
        Height = 12
        Anchors = [akLeft, akBottom]
        Caption = 'Nombre'
        Checked = True
        TabOrder = 4
        TabStop = True
      end
    end
  end
  object pnlDerecha: TPanel [3]
    Left = 203
    Top = 53
    Width = 569
    Height = 480
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object pcPaginas: TPageControl
      Left = 0
      Top = 28
      Width = 569
      Height = 352
      ActivePage = tsACO_COTIZACION
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = pcPaginasChange
      object tsACO_COTIZACION: TTabSheet
        Caption = 'Cotizaciones'
        object ACO_COTIZACION: TArtDBGrid
          Left = 0
          Top = 0
          Width = 561
          Height = 305
          Align = alClient
          DataSource = dsACO_COTIZACION
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmuGeneral
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          IniStorage = FormStorage
          OnGetCellParams = ACO_COTIZACIONGetCellParams
          FooterBand = False
          TitleHeight = 34
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'SC_NROSOLICITUD'
              Title.Caption = 'N'#250'mero Solicitud'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CO_NROCOTIZACION'
              Title.Caption = 'N'#250'mero Cotizaci'#243'n'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CO_CONTRATO'
              Title.Caption = 'Contrato'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Title.Caption = 'Estado'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SC_CUIT'
              Title.Caption = 'C.U.I.T.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SC_RAZONSOCIAL'
              Title.Caption = 'Raz'#243'n Social'
              Width = 166
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SC_FECHASOLICITUD'
              Title.Caption = 'Fecha Pedido'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CO_FECHACERRADO'
              Title.Caption = 'Fecha de Rta. de A. T'#233'cnica'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SC_CONTACTO'
              Title.Caption = 'Contacto'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SC_TELEFONO'
              Title.Caption = 'T'#233'lefono'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SC_USUARIOSOLICITUD'
              Title.Caption = 'Usuario Solicit'#243
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SC_USUASIGNADO'
              Title.Caption = 'Asignado a'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TC_SUMAFIJA'
              Title.Caption = 'Suma Fija'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TC_PORCVARIABLE'
              Title.Caption = 'Porcentaje Variable'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TC_COSTOFINAL'
              Title.Caption = 'Costo Final'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AC_DESCRIPCION'
              Title.Caption = 'CIIU'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'HOLDING'
              Title.Caption = 'Holding'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ARTACTUAL'
              Title.Caption = 'ART Actual'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'VE_NOMBRE'
              Title.Caption = 'Vendedor'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SC_FECHARESPUESTA'
              Title.Caption = 'Fecha de Rta. al Cliente'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SC_OBSERVACIONESCIERRE'
              Title.Caption = 'Observaciones de Cierre'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SC_FECHACIERRE'
              Title.Caption = 'Fecha de Cierre'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DIFPLATA'
              Title.Caption = 'Diferencia en $'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIFPORC'
              Title.Caption = 'Diferencia en %'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESULTADO'
              Title.Caption = 'Resultado'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SC_COSTOFINAL'
              Title.Caption = 'Costo Actual x Trabajador'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SC_MASASALARIAL'
              Title.Caption = 'Masa Salarial'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SC_CANTTRABAJADOR'
              Title.Caption = 'Cantidad de Trabajadores'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SC_MOTIVOCANCELACION'
              Title.Caption = 'Motivo de Cancelaci'#243'n'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SC_MOTIVOSUSPENSION'
              Title.Caption = 'Motivo de Suspensi'#243'n'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SC_IDEVENTO'
              Title.Caption = 'N'#250'mero SGC'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TieneEventos'
              Title.Caption = 'Tiene eventos'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DESCCANAL'
              Title.Caption = 'Canal'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EN_NOMBRE'
              Title.Caption = 'Entidad'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SU_CODSUCURSAL'
              Title.Caption = 'C'#243'digo de Sucursal'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SU_DESCRIPCION'
              Title.Caption = 'Sucursal'
              Visible = False
            end>
        end
        object JvgGroupBox2: TJvgGroupBox
          Left = 0
          Top = 305
          Width = 561
          Height = 16
          Align = alBottom
          Caption = ' Datos de las cotizaciones '
          TabOrder = 1
          Border.Inner = bvSpace
          Border.Outer = bvNone
          Border.Bold = False
          CaptionBorder.Inner = bvSpace
          CaptionBorder.Outer = bvNone
          CaptionBorder.Bold = False
          CaptionGradient.Active = False
          CaptionGradient.Orientation = fgdHorizontal
          CaptionShift.X = 8
          CaptionShift.Y = 0
          Collapsed = True
          Colors.Text = clHighlightText
          Colors.TextActive = clHighlightText
          Colors.Caption = clBtnShadow
          Colors.CaptionActive = clBtnShadow
          Colors.Client = clBtnFace
          Colors.ClientActive = clBtnFace
          Gradient.FromColor = clBlack
          Gradient.ToColor = clGray
          Gradient.Active = False
          Gradient.Orientation = fgdHorizontal
          Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          DesignSize = (
            561
            16)
          FullHeight = 189
          object Label8: TLabel
            Left = 10
            Top = 24
            Width = 68
            Height = 13
            Caption = 'Rta. al Cliente'
            Visible = False
          end
          object Label9: TLabel
            Left = 102
            Top = 24
            Width = 29
            Height = 13
            Caption = 'Cierre'
            Visible = False
          end
          object Label10: TLabel
            Left = 194
            Top = 24
            Width = 44
            Height = 13
            Caption = 'Contacto'
            Visible = False
          end
          object Label12: TLabel
            Left = 414
            Top = 24
            Width = 42
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Tel'#233'fono'
            Visible = False
          end
          object Label13: TLabel
            Left = 10
            Top = 64
            Width = 46
            Height = 13
            Caption = 'Suma Fija'
            Visible = False
          end
          object Label14: TLabel
            Left = 74
            Top = 64
            Width = 52
            Height = 13
            Caption = '% Variable'
            Visible = False
          end
          object Label15: TLabel
            Left = 138
            Top = 64
            Width = 53
            Height = 13
            Caption = 'Costo Final'
            Visible = False
          end
          object Label16: TLabel
            Left = 490
            Top = 24
            Width = 60
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'N'#250'mero SGC'
            Visible = False
          end
          object Label17: TLabel
            Left = 202
            Top = 64
            Width = 104
            Height = 13
            Caption = 'Motivo de Suspensi'#243'n'
            Visible = False
          end
          object Label18: TLabel
            Left = 378
            Top = 64
            Width = 107
            Height = 13
            Caption = 'Motivo de Cancelaci'#243'n'
            Visible = False
          end
          object Label19: TLabel
            Left = 10
            Top = 104
            Width = 64
            Height = 13
            Caption = 'A.R.T. actual'
            Visible = False
          end
          object Label20: TLabel
            Left = 10
            Top = 144
            Width = 22
            Height = 13
            Caption = 'CIIU'
            Visible = False
          end
          object Label21: TLabel
            Left = 202
            Top = 104
            Width = 35
            Height = 13
            Caption = 'Holding'
            Visible = False
          end
          object Label22: TLabel
            Left = 202
            Top = 144
            Width = 113
            Height = 13
            Caption = 'Obervaciones de Cierre'
            Visible = False
          end
          object Label23: TLabel
            Left = 378
            Top = 104
            Width = 48
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Resultado'
            Visible = False
          end
          object JvDBDateEdit1: TJvDBDateEdit
            Left = 8
            Top = 40
            Width = 89
            Height = 21
            DataField = 'SC_FECHARESPUESTA'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            Color = clSilver
            TabOrder = 0
            Visible = False
          end
          object JvDBDateEdit2: TJvDBDateEdit
            Left = 100
            Top = 40
            Width = 89
            Height = 21
            DataField = 'SC_FECHACIERRE'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            Color = clSilver
            TabOrder = 1
            Visible = False
          end
          object DBEdit1: TDBEdit
            Left = 192
            Top = 40
            Width = 217
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clSilver
            DataField = 'SC_CONTACTO'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            TabOrder = 2
            Visible = False
          end
          object DBEdit2: TDBEdit
            Left = 412
            Top = 40
            Width = 73
            Height = 21
            Anchors = [akTop, akRight]
            Color = clSilver
            DataField = 'SC_TELEFONO'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            TabOrder = 3
            Visible = False
          end
          object JvDBMaskEdit1: TJvDBMaskEdit
            Left = 8
            Top = 80
            Width = 61
            Height = 21
            Color = clSilver
            DataField = 'TC_SUMAFIJA'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            TabOrder = 4
            Visible = False
          end
          object JvDBMaskEdit2: TJvDBMaskEdit
            Left = 72
            Top = 80
            Width = 61
            Height = 21
            Color = clSilver
            DataField = 'TC_PORCVARIABLE'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            TabOrder = 5
            Visible = False
          end
          object JvDBMaskEdit3: TJvDBMaskEdit
            Left = 136
            Top = 80
            Width = 61
            Height = 21
            Color = clSilver
            DataField = 'TC_COSTOFINAL'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            TabOrder = 6
            Visible = False
          end
          object DBCheckBox1: TDBCheckBox
            Left = 460
            Top = 122
            Width = 93
            Height = 17
            Anchors = [akTop, akRight]
            Caption = ' Tiene eventos'
            DataField = 'TIENEEVENTOS'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            TabOrder = 7
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            Visible = False
          end
          object DBEdit3: TDBEdit
            Left = 488
            Top = 40
            Width = 65
            Height = 21
            Anchors = [akTop, akRight]
            Color = clSilver
            DataField = 'SC_IDEVENTO'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            TabOrder = 8
            Visible = False
          end
          object DBMemo1: TDBMemo
            Left = 200
            Top = 80
            Width = 173
            Height = 21
            Color = clSilver
            DataField = 'SC_MOTIVOSUSPENSION'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 9
            Visible = False
          end
          object DBMemo2: TDBMemo
            Left = 376
            Top = 80
            Width = 177
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clSilver
            DataField = 'SC_MOTIVOCANCELACION'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 10
            Visible = False
          end
          object DBEdit4: TDBEdit
            Left = 8
            Top = 120
            Width = 189
            Height = 21
            Color = clSilver
            DataField = 'ARTACTUAL'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            TabOrder = 11
            Visible = False
          end
          object DBEdit5: TDBEdit
            Left = 8
            Top = 160
            Width = 189
            Height = 21
            Color = clSilver
            DataField = 'AC_DESCRIPCION'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            TabOrder = 12
            Visible = False
          end
          object DBEdit6: TDBEdit
            Left = 200
            Top = 120
            Width = 173
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clSilver
            DataField = 'HOLDING'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            TabOrder = 13
            Visible = False
          end
          object DBMemo3: TDBMemo
            Left = 200
            Top = 160
            Width = 353
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clSilver
            DataField = 'SC_OBSERVACIONESCIERRE'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 14
            Visible = False
          end
          object DBEdit7: TDBEdit
            Left = 376
            Top = 120
            Width = 77
            Height = 21
            Anchors = [akTop, akRight]
            Color = clSilver
            DataField = 'RESULTADO'
            DataSource = dsACO_COTIZACION
            ReadOnly = True
            TabOrder = 15
            Visible = False
          end
        end
      end
      object tsASA_SOLICITUDAFILIACION: TTabSheet
        Caption = 'Solicitudes de Afiliaci'#243'n'
        ImageIndex = 1
        object ASA_SOLICITUDAFILIACION: TArtDBGrid
          Left = 0
          Top = 0
          Width = 561
          Height = 305
          Align = alClient
          DataSource = dsASA_SOLICITUDAFILIACION
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmuGeneral
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'ORIGEN'
              Title.Caption = 'Origen'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SA_NROINTERNO'
              Title.Caption = 'N'#186' Interno'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FO_FORMULARIO'
              Title.Caption = 'Formulario'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SA_CUIT'
              Title.Caption = 'C.U.I.T.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SA_NOMBRE'
              Title.Caption = 'Raz'#243'n Social'
              Width = 194
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Title.Caption = 'Estado'
              Width = 116
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SA_FECHAAFILIACION'
              Title.Caption = 'Fecha de Afiliaci'#243'n'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SA_FECHAALTA'
              Title.Caption = 'Fecha de Alta'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOTIVOALTA'
              Title.Caption = 'Motivo de Alta'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SA_IDACTIVIDAD'
              Title.Caption = 'Actividad'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SA_TOTEMPLEADOS'
              Title.Caption = 'Empleados'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SA_MASATOTAL'
              Title.Caption = 'Masa Salarial'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AFILIACION.GET_CAMPOSFALTANTES(SA_ID)'
              Title.Caption = 'Faltan'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Title.Caption = 'Empresa'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ESTABLECIMIENTO'
              Title.Caption = 'Establecimiento'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOMINA'
              Title.Caption = 'Nomina'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'VE_VENDEDOR'
              Title.Caption = 'Vendedor (Cod.)'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'VE_NOMBRE'
              Title.Caption = 'Vendedor'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CA_CODIGO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EN_CODBANCO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EN_NOMBRE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CA_DESCRIPCION'
              Visible = False
            end>
        end
        object JvgGroupBox3: TJvgGroupBox
          Left = 0
          Top = 305
          Width = 561
          Height = 16
          Align = alBottom
          Caption = ' Datos de las solicitudes de afiliaci'#243'n '
          TabOrder = 1
          Border.Inner = bvSpace
          Border.Outer = bvNone
          Border.Bold = False
          CaptionBorder.Inner = bvSpace
          CaptionBorder.Outer = bvNone
          CaptionBorder.Bold = False
          CaptionGradient.Active = False
          CaptionGradient.Orientation = fgdHorizontal
          CaptionShift.X = 8
          CaptionShift.Y = 0
          Collapsed = True
          Colors.Text = clHighlightText
          Colors.TextActive = clHighlightText
          Colors.Caption = clBtnShadow
          Colors.CaptionActive = clBtnShadow
          Colors.Client = clBtnFace
          Colors.ClientActive = clBtnFace
          Gradient.FromColor = clBlack
          Gradient.ToColor = clGray
          Gradient.Active = False
          Gradient.Orientation = fgdHorizontal
          Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          DesignSize = (
            561
            16)
          FullHeight = 77
          object Label24: TLabel
            Left = 238
            Top = 24
            Width = 46
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Vendedor'
            Visible = False
          end
          object Label25: TLabel
            Left = 10
            Top = 24
            Width = 32
            Height = 13
            Caption = 'Origen'
            Visible = False
          end
          object Label26: TLabel
            Left = 434
            Top = 24
            Width = 52
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Masa Total'
            Visible = False
          end
          object Label27: TLabel
            Left = 498
            Top = 24
            Width = 51
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Empleados'
            Visible = False
          end
          object Label28: TLabel
            Left = 90
            Top = 24
            Width = 45
            Height = 13
            Caption = 'Faltantes'
            Visible = False
          end
          object DBEdit8: TDBEdit
            Left = 236
            Top = 40
            Width = 193
            Height = 21
            Anchors = [akTop, akRight]
            Color = clSilver
            DataField = 'VE_NOMBRE'
            DataSource = dsASA_SOLICITUDAFILIACION
            ReadOnly = True
            TabOrder = 0
            Visible = False
          end
          object DBEdit9: TDBEdit
            Left = 8
            Top = 40
            Width = 77
            Height = 21
            Color = clSilver
            DataField = 'ORIGEN'
            DataSource = dsASA_SOLICITUDAFILIACION
            ReadOnly = True
            TabOrder = 1
            Visible = False
          end
          object JvDBMaskEdit4: TJvDBMaskEdit
            Left = 432
            Top = 40
            Width = 61
            Height = 21
            Anchors = [akTop, akRight]
            Color = clSilver
            DataField = 'SA_MASATOTAL'
            DataSource = dsASA_SOLICITUDAFILIACION
            ReadOnly = True
            TabOrder = 2
            Visible = False
          end
          object DBEdit10: TDBEdit
            Left = 496
            Top = 40
            Width = 57
            Height = 21
            Anchors = [akTop, akRight]
            Color = clSilver
            DataField = 'SA_TOTEMPLEADOS'
            DataSource = dsASA_SOLICITUDAFILIACION
            ReadOnly = True
            TabOrder = 3
            Visible = False
          end
          object DBEdit11: TDBEdit
            Left = 88
            Top = 40
            Width = 145
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clSilver
            DataField = 'AFILIACION.GET_CAMPOSFALTANTES(SA_ID)'
            DataSource = dsASA_SOLICITUDAFILIACION
            ReadOnly = True
            TabOrder = 4
            Visible = False
          end
        end
      end
      object tsACO_CONTRATO: TTabSheet
        Caption = 'Contratos (Afiliaciones)'
        ImageIndex = 2
        object ACO_CONTRATO: TArtDBGrid
          Left = 0
          Top = 0
          Width = 561
          Height = 305
          Align = alClient
          DataSource = dsACO_CONTRATO
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmuGeneral
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CO_CONTRATO'
              Title.Caption = 'Contrato'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EM_CUIT'
              Title.Caption = 'C.U.I.T.'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EM_NOMBRE'
              Title.Caption = 'Raz'#243'n Social'
              Width = 152
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Title.Caption = 'Estado'
              Width = 103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CO_VIGENCIADESDE'
              Title.Caption = 'Vigencia Desde'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CO_VIGENCIAHASTA'
              Title.Caption = 'Vigencia Hasta'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CO_FECHAIMPRESION'
              Title.Caption = 'Fecha de Impresi'#243'n'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CO_RECEPCONTRATO'
              Title.Caption = 'Recepci'#243'n del Contrato'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'FO_FORMULARIO'
              Title.Caption = 'Formulario'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'IDFORMULARIO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ORIGEN'
              Title.Caption = 'Origen'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CO_FECHARECEPCION'
              Title.Caption = 'Fecha de Recepci'#243'n'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EM_FEINICACTIV'
              Title.Caption = 'Fecha de Inicio de Actividad'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CO_FECHAAFILIACION'
              Title.Caption = 'Fecha de Afiliaci'#243'n'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMAJ'
              Title.Caption = 'Forma Jur'#237'dica'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SECTOR'
              Title.Caption = 'Sector'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HOLDIN'
              Title.Caption = 'Holding'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EM_SUSS'
              Title.Caption = 'SUSS'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EJCUENTA'
              Title.Caption = 'Ejecutivo de Cuenta'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'GESTOR'
              Title.Caption = 'Gestor'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ART_ACT'
              Title.Caption = 'ART Anterior'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CO_FECHABAJA'
              Title.Caption = 'Fecha de baja'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'MOTIVO_BAJA'
              Title.Caption = 'Motivo de baja'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ART_FUT'
              Title.Caption = 'ART Futura'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AC_DESCRIPCION'
              Title.Caption = 'Actividad'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CO_NIVEL'
              Title.Caption = 'Nivel'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CO_TOTEMPLEADOS'
              Title.Caption = 'Total empleados'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CO_MASATOTAL'
              Title.Caption = 'Masa total'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CO_OBSERVACIONES'
              Title.Caption = 'Observaciones'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CO_DIASFRANQUICIA'
              Title.Caption = 'D'#237'as franquicia'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CO_VIGENCIAFRANQUICIA'
              Title.Caption = 'Vigencia franquicia'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CO_CLAUSULAESPECIAL'
              Title.Caption = 'Cl'#225'usula especial'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CO_VIGENCIACLAUSULA'
              Title.Caption = 'Vigencia cl'#225'usula'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TC_ALICUOTAPESOS'
              Title.Caption = 'Suma Fija'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TC_PORCMASA'
              Title.Caption = 'Porcentaje Variable'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOM_LEGAL'
              Title.Caption = 'Domicilio legal'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DOM_POSTAL'
              Title.Caption = 'Domicilio postal'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EN_ID'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NRO_CLIENTE'
              Title.Caption = 'N'#186' Cliente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ULTIMO_DEVENGADO'
              Title.Caption = #218'ltimo devengado'
              Width = 62
              Visible = True
            end>
        end
        object JvgGroupBox4: TJvgGroupBox
          Left = 0
          Top = 305
          Width = 561
          Height = 16
          Align = alBottom
          Caption = ' Datos de las afiliaciones '
          TabOrder = 1
          Border.Inner = bvSpace
          Border.Outer = bvNone
          Border.Bold = False
          CaptionBorder.Inner = bvSpace
          CaptionBorder.Outer = bvNone
          CaptionBorder.Bold = False
          CaptionGradient.Active = False
          CaptionGradient.Orientation = fgdHorizontal
          CaptionShift.X = 8
          CaptionShift.Y = 0
          Collapsed = True
          Colors.Text = clHighlightText
          Colors.TextActive = clHighlightText
          Colors.Caption = clBtnShadow
          Colors.CaptionActive = clBtnShadow
          Colors.Client = clBtnFace
          Colors.ClientActive = clBtnFace
          Gradient.FromColor = clBlack
          Gradient.ToColor = clGray
          Gradient.Active = False
          Gradient.Orientation = fgdHorizontal
          Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          DesignSize = (
            561
            16)
          FullHeight = 189
          object Label29: TLabel
            Left = 10
            Top = 24
            Width = 47
            Height = 13
            Hint = 'Fecha de impresi'#243'n del contrato'
            Caption = 'Impresi'#243'n'
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
          object Label30: TLabel
            Left = 102
            Top = 24
            Width = 49
            Height = 13
            Hint = 'Fecha de recepci'#243'n del contrato'
            Caption = 'Recepci'#243'n'
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
          object Label31: TLabel
            Left = 194
            Top = 24
            Width = 32
            Height = 13
            Caption = 'Origen'
            Visible = False
          end
          object Label32: TLabel
            Left = 310
            Top = 24
            Width = 50
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Formulario'
            Visible = False
          end
          object Label33: TLabel
            Left = 374
            Top = 24
            Width = 72
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Inicio Actividad'
            Visible = False
          end
          object Label34: TLabel
            Left = 466
            Top = 24
            Width = 49
            Height = 13
            Hint = 'Fecha de recepci'#243'n del contrato'
            Anchors = [akTop, akRight]
            Caption = 'Recepci'#243'n'
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
          object Label35: TLabel
            Left = 10
            Top = 64
            Width = 71
            Height = 13
            Caption = 'Observaciones'
            Visible = False
          end
          object Label36: TLabel
            Left = 186
            Top = 64
            Width = 35
            Height = 13
            Caption = 'Holding'
            Visible = False
          end
          object Label37: TLabel
            Left = 266
            Top = 64
            Width = 25
            Height = 13
            Caption = 'SUSS'
            Visible = False
          end
          object Label38: TLabel
            Left = 310
            Top = 64
            Width = 69
            Height = 13
            Caption = 'Forma Jur'#237'dica'
            Visible = False
          end
          object Label39: TLabel
            Left = 10
            Top = 104
            Width = 97
            Height = 13
            Caption = 'Ejecutivo de Cuenta'
            Visible = False
          end
          object Label40: TLabel
            Left = 146
            Top = 104
            Width = 32
            Height = 13
            Caption = 'Gestor'
            Visible = False
          end
          object Label41: TLabel
            Left = 10
            Top = 144
            Width = 73
            Height = 13
            Caption = 'A.R.T. anterior'
            Visible = False
          end
          object Label42: TLabel
            Left = 278
            Top = 144
            Width = 65
            Height = 13
            Caption = 'A.R.T. futura'
            Visible = False
          end
          object Label44: TLabel
            Left = 290
            Top = 104
            Width = 68
            Height = 13
            Hint = 'Fecha de recepci'#243'n del contrato'
            Caption = 'Fecha de Baja'
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
          object Label45: TLabel
            Left = 382
            Top = 104
            Width = 71
            Height = 13
            Caption = 'Motivo de Baja'
            Visible = False
          end
          object Label43: TLabel
            Left = 390
            Top = 64
            Width = 44
            Height = 13
            Caption = 'Actividad'
            Visible = False
          end
          object JvDBDateEdit3: TJvDBDateEdit
            Left = 8
            Top = 40
            Width = 89
            Height = 21
            Hint = 'Fecha de impresi'#243'n del contrato'
            DataField = 'CO_FECHAIMPRESION'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            Color = clSilver
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Visible = False
          end
          object JvDBDateEdit4: TJvDBDateEdit
            Left = 100
            Top = 40
            Width = 89
            Height = 21
            Hint = 'Fecha de recepci'#243'n del contrato'
            DataField = 'CO_RECEPCONTRATO'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            Color = clSilver
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Visible = False
          end
          object DBEdit12: TDBEdit
            Left = 192
            Top = 40
            Width = 113
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clSilver
            DataField = 'ORIGEN'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            TabOrder = 2
            Visible = False
          end
          object DBEdit13: TDBEdit
            Left = 308
            Top = 40
            Width = 61
            Height = 21
            Anchors = [akTop, akRight]
            Color = clSilver
            DataField = 'FO_FORMULARIO'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            TabOrder = 3
            Visible = False
          end
          object JvDBDateEdit5: TJvDBDateEdit
            Left = 372
            Top = 40
            Width = 89
            Height = 21
            DataField = 'EM_FEINICACTIV'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            Color = clSilver
            Anchors = [akTop, akRight]
            TabOrder = 4
            Visible = False
          end
          object JvDBDateEdit6: TJvDBDateEdit
            Left = 464
            Top = 40
            Width = 89
            Height = 21
            Hint = 'Fecha de recepci'#243'n del contrato'
            DataField = 'CO_FECHARECEPCION'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            Color = clSilver
            Anchors = [akTop, akRight]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            Visible = False
          end
          object DBMemo4: TDBMemo
            Left = 8
            Top = 80
            Width = 173
            Height = 21
            Color = clSilver
            DataField = 'CO_OBSERVACIONES'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 6
            Visible = False
          end
          object DBEdit14: TDBEdit
            Left = 184
            Top = 80
            Width = 77
            Height = 21
            Color = clSilver
            DataField = 'HOLDIN'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            TabOrder = 7
            Visible = False
          end
          object DBEdit15: TDBEdit
            Left = 264
            Top = 80
            Width = 41
            Height = 21
            Color = clSilver
            DataField = 'EM_SUSS'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            TabOrder = 8
            Visible = False
          end
          object DBEdit16: TDBEdit
            Left = 308
            Top = 80
            Width = 77
            Height = 21
            Color = clSilver
            DataField = 'FORMAJ'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            TabOrder = 9
            Visible = False
          end
          object DBEdit17: TDBEdit
            Left = 8
            Top = 120
            Width = 133
            Height = 21
            Color = clSilver
            DataField = 'EJCUENTA'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            TabOrder = 10
            Visible = False
          end
          object DBEdit18: TDBEdit
            Left = 144
            Top = 120
            Width = 141
            Height = 21
            Color = clSilver
            DataField = 'GESTOR'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            TabOrder = 11
            Visible = False
          end
          object DBEdit19: TDBEdit
            Left = 8
            Top = 160
            Width = 265
            Height = 21
            Color = clSilver
            DataField = 'ART_ACT'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            TabOrder = 12
            Visible = False
          end
          object DBEdit20: TDBEdit
            Left = 276
            Top = 160
            Width = 277
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clSilver
            DataField = 'ART_FUT'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            TabOrder = 13
            Visible = False
          end
          object JvDBDateEdit7: TJvDBDateEdit
            Left = 288
            Top = 120
            Width = 89
            Height = 21
            Hint = 'Fecha de recepci'#243'n del contrato'
            DataField = 'CO_FECHABAJA'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            Color = clSilver
            ParentShowHint = False
            ShowHint = True
            TabOrder = 14
            Visible = False
          end
          object DBMemo5: TDBMemo
            Left = 380
            Top = 120
            Width = 173
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clSilver
            DataField = 'MOTIVO_BAJA'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 15
            Visible = False
          end
          object DBEdit21: TDBEdit
            Left = 388
            Top = 80
            Width = 165
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clSilver
            DataField = 'AC_DESCRIPCION'
            DataSource = dsACO_CONTRATO
            ReadOnly = True
            TabOrder = 16
            Visible = False
          end
        end
      end
      object tsCPR_PRESTADORES: TTabSheet
        Caption = 'Prestadores'
        ImageIndex = 3
        object CPR_PRESTADORES: TArtDBGrid
          Left = 0
          Top = 0
          Width = 561
          Height = 305
          Align = alClient
          DataSource = dsCPR_PRESTADORES
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmuGeneral
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CUIT'
              Title.Caption = 'C.U.I.T.'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SECUENCIA'
              Title.Caption = 'Secuencia'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDENTIFICADOR'
              Title.Caption = 'Identificador'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAZONSOCIAL'
              Title.Caption = 'Raz'#243'n Social'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBREFANTA'
              Title.Caption = 'Nombre de Fantas'#237'a'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOPREST'
              Title.Caption = 'Tipo de Prestador'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESPECIALIDAD'
              Title.Caption = 'Especialidad'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOMICILIO'
              Title.Caption = 'Domicilio'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOCALIDAD'
              Title.Caption = 'Localidad'
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCPROVINCIA'
              Title.Caption = 'Provincia'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONO'
              Title.Caption = 'Tel'#233'fono'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAX'
              Title.Caption = 'Fax'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHABAJA'
              Title.Caption = 'Fecha de Baja'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VISIBLE'
              Title.Caption = 'Visible'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Title.Caption = 'Correo Electr'#243'nico'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESPONSABLE'
              Title.Caption = 'Responsable'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACIONES'
              Title.Caption = 'Observaciones'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HABILITACIONES'
              Title.Caption = 'Habilitaciones'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESONANCIA'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAC'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ELECTROM'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AMBULANCIA'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PISO'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TI'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UCO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AUTI'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUIROFANO'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GUARDIAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAYOS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONEX'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AUDITABLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RECLADEBITOS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTRATO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTRATO_MUTUAL_VIG'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CARACTER'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOCOMPROBANTE'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GANANCIAS'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOCUENTA'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INGRESOSBRUTOS'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANCO'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADOMALAPRAXIS'
              Title.Caption = 'Estado del seguro de mala praxis'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SM_VIGENCIADESDE'
              Title.Caption = 'Vigencia Desde'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SM_VIGENCIAHASTA'
              Title.Caption = 'Vigencia Hasta'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROXIMOVENCIMIENTO'
              Title.Caption = 'Pr'#243'ximo vencimiento del seguro'
              Width = 108
              Visible = True
            end>
        end
        object JvgGroupBox5: TJvgGroupBox
          Left = 0
          Top = 305
          Width = 561
          Height = 16
          Align = alBottom
          Caption = ' Datos de los prestadores '
          TabOrder = 1
          Border.Inner = bvSpace
          Border.Outer = bvNone
          Border.Bold = False
          CaptionBorder.Inner = bvSpace
          CaptionBorder.Outer = bvNone
          CaptionBorder.Bold = False
          CaptionGradient.Active = False
          CaptionGradient.Orientation = fgdHorizontal
          CaptionShift.X = 8
          CaptionShift.Y = 0
          Collapsed = True
          Colors.Text = clHighlightText
          Colors.TextActive = clHighlightText
          Colors.Caption = clBtnShadow
          Colors.CaptionActive = clBtnShadow
          Colors.Client = clBtnFace
          Colors.ClientActive = clBtnFace
          Gradient.FromColor = clBlack
          Gradient.ToColor = clGray
          Gradient.Active = False
          Gradient.Orientation = fgdHorizontal
          Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          FullHeight = 109
        end
      end
      object tsCSE_SEGUIMIENTOEVENTO: TTabSheet
        Caption = 'Eventos'
        ImageIndex = 4
        object CSE_SEGUIMIENTOEVENTO: TArtDBGrid
          Left = 0
          Top = 0
          Width = 561
          Height = 305
          Align = alClient
          DataSource = dsCSE_SEGUIMIENTOEVENTO
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmuGeneral
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'IDEVENTO'
              Title.Caption = 'Evento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUBEVENTO'
              Title.Caption = 'SubEvento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RELLAMADAS'
              Title.Caption = 'Rellamadas'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EVENTO'
              Title.Caption = 'Evento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USUREALIZADO'
              Title.Caption = 'Realiz'#243
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOMBREUSUREALIZADO'
              Title.Caption = 'Realiz'#243
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SECTORINVOLUCRADO'
              Title.Caption = 'Sector'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORA'
              Title.Caption = 'Hora'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDCODIGOINGRESO'
              Title.Caption = 'C'#243'd. Ingreso'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SECTORSOLICITANTE'
              Title.Caption = 'Sector solicitante'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERSONALSOLICITANTE'
              Title.Caption = 'Usuario solicitante'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INGRESO'
              Title.Caption = 'Ingreso'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOTIVO'
              Title.Caption = 'Motivo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SECTORINTERVINIENTE'
              Title.Caption = 'Sector interviniente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRIORIDAD'
              Title.Caption = 'Prioridad'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHACOMPROMETIDA'
              Title.Caption = 'Fecha Comprometida'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHAREALIZADO'
              Title.Caption = 'Fecha Realizaci'#243'n'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESPUESTA'
              Title.Caption = 'Respuesta'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACIONES'
              Title.Caption = 'Observaciones'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUITPRESTADOR'
              Title.Caption = 'CUIT Prestador'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAZONSOCIAL'
              Title.Caption = 'Raz'#243'n Social'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUIL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRABAJADOR'
              Title.Caption = 'Trabajador'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTRATO'
              Title.Caption = 'Contrato'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Title.Caption = 'Empresa'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUITEMPRESA'
              Title.Caption = 'CUIT Empresa'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SITUACIONEMPRESA'
              Title.Caption = 'Situaci'#243'n de la empresa'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USUALTA'
              Title.Caption = 'Usuario de Alta'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INTERRUMPIDO'
              Title.Caption = 'Interrumpido'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAILPROSPECTO'
              Title.Caption = 'Correo electr'#243'nico'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GENERAL'
              Title.Caption = 'General'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDSOLICITUDCOTIZACION'
              Title.Caption = 'ID Solicitud'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUITPROSPECTO'
              Title.Caption = 'CUIT Prospecto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAZONSOCIALPROSPECTO'
              Title.Caption = 'Raz'#243'n Social Prospecto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDPRESTADOREVENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDPROVEEDOREVENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDENTIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODENTIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBREENTIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDENTIDADVENDEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODVENDEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBREVENDEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDENTIFICADOREVENTO'
              Visible = True
            end>
        end
        object JvgGroupBox6: TJvgGroupBox
          Left = 0
          Top = 305
          Width = 561
          Height = 16
          Align = alBottom
          Caption = ' Datos del Sistema de Gesti'#243'n de Clientes'
          TabOrder = 1
          Border.Inner = bvSpace
          Border.Outer = bvNone
          Border.Bold = False
          CaptionBorder.Inner = bvSpace
          CaptionBorder.Outer = bvNone
          CaptionBorder.Bold = False
          CaptionGradient.Active = False
          CaptionGradient.Orientation = fgdHorizontal
          CaptionShift.X = 8
          CaptionShift.Y = 0
          Collapsed = True
          Colors.Text = clHighlightText
          Colors.TextActive = clHighlightText
          Colors.Caption = clBtnShadow
          Colors.CaptionActive = clBtnShadow
          Colors.Client = clBtnFace
          Colors.ClientActive = clBtnFace
          Gradient.FromColor = clBlack
          Gradient.ToColor = clGray
          Gradient.Active = False
          Gradient.Orientation = fgdHorizontal
          Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          FullHeight = 109
        end
      end
    end
    object JvgGroupBox1: TJvgGroupBox
      Left = 0
      Top = 380
      Width = 569
      Height = 100
      Align = alBottom
      Caption = ' Estadisticas '
      TabOrder = 1
      Border.Inner = bvSpace
      Border.Outer = bvNone
      Border.Bold = False
      CaptionBorder.Inner = bvSpace
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.Active = False
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      FullHeight = 92
      object Label11: TLabel
        Left = 10
        Top = 24
        Width = 43
        Height = 13
        Caption = 'Cantidad'
      end
      object lbCantidad: TLabel
        Left = 62
        Top = 24
        Width = 27
        Height = 13
        Caption = 'CANT'
      end
    end
    object tbToolBar: TToolBar
      Left = 0
      Top = 0
      Width = 569
      Height = 28
      DisabledImages = ilByN
      EdgeOuter = esRaised
      Flat = True
      HotImages = ilColor
      Images = ilByN
      TabOrder = 2
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 13
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
      end
      object Panel2: TPanel
        Left = 13
        Top = 0
        Width = 141
        Height = 22
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = ' Barra de Herramientas'
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 154
        Top = 0
        Width = 13
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
      end
      object tbRefrescar: TToolButton
        Left = 167
        Top = 0
        Hint = 'Actualizar'
        Caption = 'tbRefrescar'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = tbRefrescarClick
      end
      object tbLimpiar: TToolButton
        Left = 190
        Top = 0
        Hint = 'Limpiar'
        Caption = 'tbLimpiar'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = tbLimpiarClick
      end
      object tbOcultarVendedores: TToolButton
        Left = 213
        Top = 0
        Hint = 'Ocultar vendedores'
        Caption = 'tbOcultarVendedores'
        ImageIndex = 27
        ParentShowHint = False
        ShowHint = True
        OnClick = tbOcultarVendedoresClick
      end
      object tbOrdenar: TToolButton
        Left = 236
        Top = 0
        Hint = 'Ordenar'
        Caption = 'tbOrdenar'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = tbOrdenarClick
      end
      object tbExportar: TToolButton
        Left = 259
        Top = 0
        Hint = 'Exportar'
        Caption = 'tbExportar'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
      end
      object tbImprimir: TToolButton
        Left = 282
        Top = 0
        Hint = 'Imprimir'
        Caption = 'tbImprimir'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
      end
      object tbSalir: TToolButton
        Left = 305
        Top = 0
        Hint = 'Salir'
        Caption = 'tbSalir'
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        OnClick = tbSalirClick
      end
    end
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'chkVerVendedores.Checked')
    Left = 13
    Top = 144
  end
  inherited XPMenu: TXPMenu
    Left = 41
    Top = 144
  end
  inherited ilByN: TImageList
    Left = 13
    Top = 172
  end
  inherited ilColor: TImageList
    Left = 41
    Top = 172
  end
  inherited IconosXP: TImageList
    Left = 69
    Top = 144
  end
  object dsACO_COTIZACION: TDataSource
    DataSet = sdqACO_COTIZACION
    Left = 13
    Top = 200
  end
  object sdqACO_COTIZACION: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT sc_id, sc_nrosolicitud, NULL co_nrocotizacion, sc_fechaso' +
        'licitud, sc_usuariosolicitud, sc_cuit, sc_razonsocial,'
      
        '       sc_idactividad, sc_masasalarial, sc_canttrabajador, sc_id' +
        'cotizacion, sc_observaciones, sc_contacto, sc_telefono,'
      
        '       sc_usuasignado, sc_costofinal, sc_porcvariable, sc_sumafi' +
        'ja, sc_idgrupoeconomico, sc_fechaapertura, sc_canal,'
      
        '       sc_idartanterior, sc_usualta, sc_fechaalta, sc_usumodif, ' +
        'sc_fechamodif, sc_usubaja, sc_fechabaja, sc_form931,'
      
        '       sc_idvendedor, sc_identidad, sc_observacionescierre, sc_c' +
        'ostofinalform931, sc_sumafijaform931, sc_porcvariableform931,'
      
        '       est.tb_descripcion estado, sc_estado co_estado, TO_NUMBER' +
        '(NULL) tc_idcotizacion, sc_finalsumafija tc_sumafija,'
      
        '       sc_finalporcmasa tc_porcvariable, sc_finalportrabajador t' +
        'c_costofinal, ac_descripcion, canal.ca_descripcion desccanal,'
      
        '       hold.ge_descripcion holding, art.ar_nombre artactual, ve_' +
        'nombre, en_nombre, NULL obsatecnica, sc_idsucursal,'
      
        '       sc_actividadreal, sc_canttrabajador1, sc_canttrabajador2,' +
        ' sc_canttrabajador3, sc_idactividad2, sc_idactividad3,'
      
        '       sc_detalleoper, sc_detalleadmin, sc_detallecalle, sc_porc' +
        'comision, sc_nuevaregimen,'
      '       TRUNC(sc_fechavigencia) AS co_fechacerrado,'
      '       DECODE(sc_fechavigencia,'
      '              NULL, TO_NUMBER(NULL),'
      
        '              DECODE(sc_costofinal, 0, TO_NUMBER(NULL), sc_final' +
        'sumafija - sc_costofinal)) difplata,'
      '       DECODE(sc_fechavigencia,'
      '              NULL, TO_NUMBER(NULL),'
      
        '              DECODE(sc_costofinal, 0, TO_NUMBER(NULL),(sc_final' +
        'sumafija - sc_costofinal) / sc_costofinal * 100)) difporc,'
      '       DECODE(sc_fechavigencia,'
      '              NULL, NULL,'
      
        '              DECODE(sc_costofinal, 0, NULL, utiles.iif_compara(' +
        #39'<'#39', sc_finalsumafija, sc_costofinal, '#39'OK'#39', '#39'OUT'#39'))) resultado,'
      
        '       sc_fechacierre, su_codsucursal, su_descripcion, sc_motivo' +
        'cancelacion, sc_motivorevision, NULL co_usuarioconfecciono,'
      
        '       TO_NUMBER(NULL) co_idcotizacionanterior, sc_motivosuspens' +
        'ion, sc_fecharespuesta, sc_idevento, sc_mail,'
      
        '       afiliacion.is_solicitudtieneeventos(sc_id) tieneeventos, ' +
        'contratos.co_contrato'
      
        '  FROM asc_solicitudcotizacion, aca_canal canal, ctb_tablas est,' +
        ' aco_contrato contratos, age_grupoeconomico hold, cac_actividad,'
      '       aar_art art, xve_vendedor, xen_entidad, asu_sucursal'
      ' WHERE canal.ca_id = sc_canal'
      '   AND EXISTS(SELECT 1'
      '                FROM auc_usuariocanal'
      '               WHERE uc_usuario = :usuario'
      '                 AND uc_idcanal = canal.ca_id'
      '                 AND uc_fechabaja IS NULL)'
      '   AND hold.ge_id(+) = sc_idgrupoeconomico'
      '   AND est.tb_clave = '#39'ACOES'#39
      '   AND est.tb_codigo = sc_estado'
      '   AND art.ar_id(+) = sc_idartanterior'
      '   AND sc_idvendedor = ve_id(+)'
      '   AND sc_idsucursal = su_id(+)'
      '   AND sc_identidad = en_id(+)'
      '   AND sc_idactividad = ac_id(+)'
      '   AND sc_idcotizacion IS NULL'
      
        '   AND contratos.co_contrato(+) = afiliacion.get_contratovigente' +
        '(sc_cuit, SYSDATE)'
      '   AND sc_canal = :canal'
      '   AND sc_identidad = :entidad'
      '   AND (   sc_idsucursal = :sucursal'
      '        OR :sucursal IS NULL)'
      '   AND (   ve_id = :vendedor'
      '        OR :vendedor IS NULL)'
      'UNION'
      
        'SELECT sc_id, sc_nrosolicitud, co_nrocotizacion || '#39'/'#39' || co_ord' +
        'en co_nrocotizacion, sc_fechasolicitud, sc_usuariosolicitud,'
      
        '       sc_cuit, sc_razonsocial, sc_idactividad, sc_masasalarial,' +
        ' sc_canttrabajador, sc_idcotizacion, sc_observaciones,'
      
        '       sc_contacto, sc_telefono, sc_usuasignado, sc_costofinal, ' +
        'sc_porcvariable, sc_sumafija, sc_idgrupoeconomico,'
      
        '       sc_fechaapertura, sc_canal, sc_idartanterior, sc_usualta,' +
        ' sc_fechaalta, sc_usumodif, sc_fechamodif, sc_usubaja,'
      
        '       sc_fechabaja, sc_form931, sc_idvendedor, sc_identidad, sc' +
        '_observacionescierre, sc_costofinalform931, sc_sumafijaform931,'
      
        '       sc_porcvariableform931, est.tb_descripcion estado, cotiza' +
        'ciones.co_estado, tc_idcotizacion,'
      
        '       DECODE(co_fechacerrado, NULL, TO_NUMBER(NULL), tc_sumafij' +
        'a) tc_sumafija,'
      
        '       DECODE(co_fechacerrado, NULL, TO_NUMBER(NULL), tc_porcvar' +
        'iable) tc_porcvariable,'
      
        '       DECODE(co_fechacerrado, NULL, TO_NUMBER(NULL), tc_costofi' +
        'nal) tc_costofinal, ac_descripcion,'
      
        '       canal.ca_descripcion desccanal, hold.ge_descripcion holdi' +
        'ng, art.ar_nombre artactual, ve_nombre, en_nombre,'
      
        '       utiles.iif_compara('#39'>='#39', cotizaciones.co_estado, '#39'04'#39', tc' +
        '_observaciones, NULL) obsatecnica, sc_idsucursal,'
      
        '       sc_actividadreal, sc_canttrabajador1, sc_canttrabajador2,' +
        ' sc_canttrabajador3, sc_idactividad2, sc_idactividad3,'
      
        '       sc_detalleoper, sc_detalleadmin, sc_detallecalle, sc_porc' +
        'comision, sc_nuevaregimen, co_fechacerrado,'
      '       DECODE(sc_fechavigencia,'
      '              NULL, TO_NUMBER(NULL),'
      
        '              DECODE(sc_costofinal, 0, TO_NUMBER(NULL), tc_costo' +
        'final - sc_costofinal)) difplata,'
      '       DECODE(sc_fechavigencia,'
      '              NULL, TO_NUMBER(NULL),'
      
        '              DECODE(sc_costofinal, 0, TO_NUMBER(NULL),(tc_costo' +
        'final - sc_costofinal) / sc_costofinal * 100)) difporc,'
      '       DECODE(sc_fechavigencia,'
      '              NULL, NULL,'
      
        '              DECODE(sc_costofinal, 0, NULL, utiles.iif_compara(' +
        #39'<'#39', tc_costofinal, sc_costofinal, '#39'OK'#39', '#39'OUT'#39'))) resultado,'
      
        '       sc_fechacierre, su_codsucursal, su_descripcion, sc_motivo' +
        'cancelacion, sc_motivorevision, co_usuarioconfecciono,'
      
        '       co_idcotizacionanterior, sc_motivosuspension, sc_fechares' +
        'puesta, sc_idevento, sc_mail,'
      
        '       afiliacion.is_solicitudtieneeventos(sc_id) tieneeventos, ' +
        'contratos.co_contrato'
      
        '  FROM asc_solicitudcotizacion, aco_cotizacion cotizaciones, ctb' +
        '_tablas est, aca_canal canal, aco_contrato contratos,'
      
        '       age_grupoeconomico hold, atc_tarifacobrar, cac_actividad,' +
        ' aar_art art, xve_vendedor, xen_entidad, asu_sucursal'
      ' WHERE sc_idcotizacion = co_id'
      '   AND est.tb_codigo(+) = cotizaciones.co_estado'
      '   AND est.tb_clave(+) = '#39'ACOES'#39
      '   AND canal.ca_id = sc_canal'
      '   AND EXISTS(SELECT 1'
      '                FROM auc_usuariocanal'
      '               WHERE uc_usuario = :usuario'
      '                 AND uc_idcanal = canal.ca_id'
      '                 AND uc_fechabaja IS NULL)'
      '   AND hold.ge_id(+) = sc_idgrupoeconomico'
      '   AND art.ar_id(+) = sc_idartanterior'
      '   AND sc_idvendedor = ve_id(+)'
      '   AND sc_idsucursal = su_id(+)'
      '   AND sc_identidad = en_id(+)'
      '   AND sc_idactividad = ac_id(+)'
      
        '   AND contratos.co_contrato(+) = afiliacion.get_contratovigente' +
        '(sc_cuit, SYSDATE)'
      '   AND tc_id = (SELECT MAX(tc_id)'
      '                  FROM atc_tarifacobrar'
      '                 WHERE tc_idcotizacion = co_id)'
      '   AND sc_canal = :canal'
      '   AND sc_identidad = :entidad'
      '   AND (   sc_idsucursal = :sucursal'
      '        OR :sucursal IS NULL)'
      '   AND (   ve_id = :vendedor'
      '        OR :vendedor IS NULL)')
    Left = 41
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'Usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CANAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ENTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUCURSAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sucursal'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'vendedor'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'canal'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'entidad'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sucursal'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sucursal'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'vendedor'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'vendedor'
        ParamType = ptInput
      end>
  end
  object dsASA_SOLICITUDAFILIACION: TDataSource
    DataSet = sdqASA_SOLICITUDAFILIACION
    Left = 13
    Top = 228
  end
  object sdqASA_SOLICITUDAFILIACION: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT T1.TB_DESCRIPCION ORIGEN, SA_NROINTERNO, SA_CUIT,'
      
        '       FO_FORMULARIO, SA_NOMBRE, SA_ESTADO||'#39'-'#39'||T2.TB_DESCRIPCI' +
        'ON ESTADO,'
      
        '       SA_FECHAAFILIACION, SA_FECHAALTA, T3.TB_DESCRIPCION MOTIV' +
        'OALTA,'
      '       SA_IDACTIVIDAD, SA_TOTEMPLEADOS, SA_MASATOTAL,'
      
        '       AFILIACION.GET_CAMPOSFALTANTES(SA_ID), SA_ID, SA_ESTADO, ' +
        'SA_IDFORMULARIO,'
      '       T2.TB_ESPECIAL1, SA_TOTEMPLEADOS EMPRESA,'
      
        '       ART.AFILIACION.GET_EMPLEADOS_ESTABLECIMIENTO(SA_CUIT) EST' +
        'ABLECIMIENTO,'
      '       ART.AFILIACION.GET_EMPLEADOS_NOMINA(SA_CUIT) NOMINA,'
      
        '       EN_CODBANCO, EN_NOMBRE, VE_VENDEDOR, VE_NOMBRE, CA_CODIGO' +
        ', CA_DESCRIPCION'
      
        '  FROM XEV_ENTIDADVENDEDOR, CTB_TABLAS T1, CTB_TABLAS T2, ACA_CA' +
        'NAL, XVE_VENDEDOR,'
      
        '       CTB_TABLAS T3, AFO_FORMULARIO, CAC_ACTIVIDAD, ASA_SOLICIT' +
        'UDAFILIACION,'
      '       XEN_ENTIDAD'
      ' WHERE EV_ID = SA_IDENTIDADVENDEDOR (+)'
      '   AND T1.TB_CLAVE = '#39'ORSOL'#39
      '   AND T1.TB_CODIGO = SA_ORIGEN'
      '   AND FO_ID = SA_IDFORMULARIO'
      '   AND T2.TB_CLAVE = '#39'ESSOL'#39
      '   AND T2.TB_CODIGO = SA_ESTADO'
      '   AND T3.TB_CLAVE (+) = '#39'MOTIA'#39
      '   AND T3.TB_CODIGO (+) = SA_MOTIVOALTA'
      '   AND SA_IDACTIVIDAD = AC_ID (+)'
      '   AND EV_IDENTIDAD = EN_ID'
      '   AND EN_ENTRAMITE = '#39'N'#39
      '   AND EV_IDVENDEDOR = VE_ID'
      '   AND EN_IDCANAL = CA_ID'
      '   AND EN_IDCANAL = :CANAL'
      '   AND EN_ID = :ENTIDAD'
      '   AND (EV_IDVENDEDOR = :VENDEDOR OR :VENDEDOR IS NULL)')
    Left = 41
    Top = 228
    ParamData = <
      item
        DataType = ftString
        Name = 'CANAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ENTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VENDEDOR'
        ParamType = ptInput
      end>
  end
  object sdqXVE_VENDEDOR: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        ' SELECT VE_ID, VE_NOMBRE, '#39'2'#39', VE_DIRELECTRONICA, EV_FECHABAJA, ' +
        'VE_FECHABAJA,'
      '        UTILES.ARMAR_CUIT(VE_CUIT) as VE_CUIT,'
      
        '        VE_VENDEDOR, DECODE(VE_CALLE, null, VE_DOMICILIO, UTILES' +
        '.ARMAR_DOMICILIO(VE_CALLE, VE_NUMERO, VE_PISO, VE_DEPARTAMENTO, ' +
        'VE_LOCALIDAD)) as DOMICILIO'
      '   FROM XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XVE_VENDEDOR'
      '  WHERE VE_ID = EV_IDVENDEDOR'
      '    AND EV_IDENTIDAD = EN_ID'
      '    AND EN_IDCANAL = :CANAL'
      '    AND EN_ID = :ENTIDAD'
      '    AND (EN_ID = (SELECT SU_IDENTIDAD'
      '                    FROM ASU_SUCURSAL'
      '                   WHERE SU_ID = :SUCURSAL )'
      '         OR :SUCURSAL IS NULL)'
      ''
      '  UNION ALL'
      ''
      
        ' SELECT TO_NUMBER(NULL), '#39'[Todos]'#39', '#39'1'#39', '#39#39', TO_DATE(NULL), TO_D' +
        'ATE(NULL), '#39#39' as VE_CUIT,'
      '        '#39#39' as VE_VENDEDOR, '#39#39' as DOMICILIO'
      '   FROM DUAL'
      ''
      '  ORDER BY 3, 2 ')
    Left = 41
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CANAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ENTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUCURSAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUCURSAL'
        ParamType = ptInput
      end>
  end
  object dsXVE_VENDEDOR: TDataSource
    DataSet = sdqXVE_VENDEDOR
    Left = 13
    Top = 116
  end
  object pmuGeneral: TPopupMenu
    OwnerDraw = True
    Left = 97
    Top = 172
    object mnuOrdenar: TMenuItem
      Caption = 'Ordenar...'
      OnClick = acMnuOrdenar
    end
  end
  object SortDialogACO_COTIZACION: TSortDialog
    Caption = 'Ordenar Cotizaciones'
    DataSet = sdqACO_COTIZACION
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 69
    Top = 200
  end
  object sdqACO_CONTRATO: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT aem.em_nombre, aem.em_cuit, aco.co_contrato, estado.tb_de' +
        'scripcion AS estado, aco.co_vigenciadesde, aco.co_vigenciahasta,'
      
        '       aco.co_fechaimpresion, aco.co_recepcontrato, afo.fo_formu' +
        'lario, afo.fo_id idformulario, origen.tb_descripcion AS origen,'
      
        '       aco.co_fecharecepcion, aem.em_feinicactiv, aco.co_fechaaf' +
        'iliacion, formaj.tb_descripcion AS formaj,'
      
        '       sector.tb_descripcion AS sector, ge_descripcion AS holdin' +
        ', aem.em_suss, ecuenta.ec_nombre AS ejcuenta,'
      
        '       gestor.gc_nombre AS gestor, artact.ar_nombre AS art_act, ' +
        'aco.co_fechabaja, mot_baj.tb_descripcion AS motivo_baja,'
      
        '       artfut.ar_nombre AS art_fut, act.ac_descripcion, aco.co_n' +
        'ivel, aco.co_totempleados, aco.co_masatotal,'
      
        '       aco.co_observaciones, aco.co_diasfranquicia, aco.co_vigen' +
        'ciafranquicia, aco.co_clausulaespecial, aco.co_vigenciaclausula,'
      '       atc.tc_alicuotapesos, atc.tc_porcmasa,'
      
        '       art.utiles.armar_domicilio(adc_legal.dc_calle, adc_legal.' +
        'dc_numero, adc_legal.dc_piso,'
      
        '                                  adc_legal.dc_departamento, NUL' +
        'L)'
      
        '       || art.utiles.armar_localidad(adc_legal.dc_cpostal, NULL,' +
        ' adc_legal.dc_localidad, adc_legal.dc_provincia) AS dom_legal,'
      
        '       art.utiles.armar_domicilio(adc_postal.dc_calle, adc_posta' +
        'l.dc_numero, adc_postal.dc_piso,'
      
        '                                  adc_postal.dc_departamento, NU' +
        'LL)'
      
        '       || art.utiles.armar_localidad(adc_postal.dc_cpostal, NULL' +
        ', adc_postal.dc_localidad,'
      
        '                                     adc_postal.dc_provincia) AS' +
        ' dom_postal,'
      '       afiliacion.get_ultidendoso(em_cuit) AS en_id,'
      '       (SELECT MIN(aco2.co_contrato)'
      '          FROM aco_contrato aco2, aem_empresa aem2'
      '         WHERE aco2.co_idempresa = aem2.em_id'
      
        '           AND aem2.em_cuit = aem.em_cuit) AS nro_cliente, art.c' +
        'obranza.get_ultimodevengado(em_cuit) AS ultimo_devengado'
      
        '  FROM aco_contrato aco, aem_empresa aem, ctb_tablas estado, afo' +
        '_formulario afo, ctb_tablas origen, ctb_tablas formaj,'
      
        '       ctb_tablas sector, age_grupoeconomico, atc_tarifariocontr' +
        'ato atc, afi.aec_ejecutivocuenta ecuenta,'
      
        '       afi.agc_gestorcuenta gestor, aar_art artact, aar_art artf' +
        'ut, ctb_tablas mot_baj, cac_actividad act,'
      
        '       adc_domiciliocontrato adc_legal, xen_entidad, adc_domicil' +
        'iocontrato adc_postal, xev_entidadvendedor xev,'
      '       avc_vendedorcontrato avc'
      ' WHERE aem.em_id = aco.co_idempresa'
      '   AND estado.tb_codigo = aco.co_estado'
      '   AND estado.tb_clave = '#39'AFEST'#39
      '   AND afo.fo_id = aco.co_idformulario'
      '   AND origen.tb_codigo = aco.co_origen'
      '   AND origen.tb_clave = '#39'ORSOL'#39
      '   AND formaj.tb_codigo(+) = aem.em_formaj'
      '   AND formaj.tb_clave(+) = '#39'FJURI'#39
      '   AND sector.tb_codigo = aem.em_sector'
      '   AND sector.tb_clave = '#39'SECT'#39
      '   AND ge_id(+) = aem.em_idgrupoeconomico'
      '   AND ecuenta.ec_id(+) = aco.co_idejecutivo'
      '   AND gestor.gc_id(+) = aco.co_idgestor'
      '   AND artact.ar_id(+) = aco.co_idartanterior'
      '   AND mot_baj.tb_codigo(+) = aco.co_motivobaja'
      '   AND mot_baj.tb_clave(+) = '#39'MOTIB'#39
      '   AND artfut.ar_id(+) = aco.co_idartfutura'
      '   AND act.ac_id = aco.co_idactividad'
      '   AND adc_legal.dc_contrato = aco.co_contrato'
      '   AND adc_postal.dc_contrato = aco.co_contrato'
      '   AND adc_legal.dc_tipo = '#39'L'#39
      '   AND adc_postal.dc_tipo = '#39'P'#39
      '   AND atc.tc_contrato = aco.co_contrato'
      '   AND aco.co_contrato = avc.vc_contrato'
      '   AND avc.vc_identidadvend = xev.ev_id'
      
        '   AND avc.vc_id = comision.get_ultidentidadvendcontrato(aco.co_' +
        'contrato)'
      '   AND ev_identidad = en_id'
      '   AND en_idcanal = :canal'
      '   AND en_id = :entidad'
      '   AND (   ev_idvendedor = :vendedor'
      '        OR :vendedor IS NULL)')
    Left = 41
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'CANAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ENTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'vendedor'
        ParamType = ptInput
      end>
  end
  object dsACO_CONTRATO: TDataSource
    DataSet = sdqACO_CONTRATO
    Left = 13
    Top = 256
  end
  object SortDialogASA_SOLICITUDAFILIACION: TSortDialog
    Caption = 'Ordenar Solicitudes de Afiliaci'#243'n'
    DataSet = sdqASA_SOLICITUDAFILIACION
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 69
    Top = 228
  end
  object SortDialogACO_CONTRATO: TSortDialog
    Caption = 'Ordenar Contratos'
    DataSet = sdqACO_CONTRATO
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 69
    Top = 256
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 69
    Top = 172
  end
  object dsCPR_PRESTADORES: TDataSource
    DataSet = sdqCPR_PRESTADORES
    Left = 13
    Top = 284
  end
  object sdqCPR_PRESTADORES: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT CA_CLAVE CUIT, CA_SECUENCIA SECUENCIA, CA_IDENTIFICADOR I' +
        'DENTIFICADOR,'
      
        '       CA_DESCRIPCION RAZONSOCIAL, CA_NOMBREFANTA  NOMBREFANTA, ' +
        'TP_DESCRIPCION TIPOPREST,'
      #9'     ES_DESCRIPCION ESPECIALIDAD,'
      
        '       CA_DOMICILIO DOMICILIO, CA_LOCALIDAD LOCALIDAD, PV_DESCRI' +
        'PCION DESCPROVINCIA,'
      
        '       CA_TELEFONO TELEFONO, CA_FAX FAX,  CA_FECHABAJA FECHABAJA' +
        ', CA_VISIBLE VISIBLE,'
      
        '       CA_DIRELECTRONICA EMAIL, CA_RESPONSABLE RESPONSABLE, CA_O' +
        'BSERVACIONES OBSERVACIONES,'
      
        '       CA_HABILITACIONES HABILITACIONES, CA_RMN RESONANCIA, CA_T' +
        'AC TAC, CA_EMG ELECTROM,'
      
        '       CA_AMBULANCIA AMBULANCIA, CA_PISO PISO, CA_CTI TI, CA_UCO' +
        ' UCO, CA_AUTI AUTI,'
      
        '       CA_QUIROFANOS QUIROFANO, CA_GUARDIAS GUARDIAS, CA_RAYOS R' +
        'AYOS, CA_CONEX CONEX, CA_AUDITABLE AUDITABLE,'
      
        '       CA_RECLADEBITOS RECLADEBITOS, CA_CONTRATO CONTRATO,  CA_C' +
        'ONTRATOMUTUAL CONTRATO_MUTUAL_VIG,'
      
        '       TCARACTER.TB_DESCRIPCION CARACTER, TCOMPROB.TB_DESCRIPCIO' +
        'N TIPOCOMPROBANTE, TGANANCIAS.TB_DESCRIPCION GANANCIAS,'
      
        '       TIVA.TB_DESCRIPCION IVA, TTCUENTA.TB_DESCRIPCION TIPOCUEN' +
        'TA, IB_RETENCION INGRESOSBRUTOS, BA_NOMBRE BANCO,'
      '       SM_ID, SM_VIGENCIADESDE, SM_VIGENCIAHASTA,'
      
        '       SINIESTRO.GET_SEGUROPROXIMOVENCIMIENTO(CA_IDENTIFICADOR) ' +
        'AS PROXIMOVENCIMIENTO,'
      '       CTB_SEGMP.TB_DESCRIPCION AS ESTADOMALAPRAXIS'
      
        '  FROM CCP_CODIGOPOSTAL, MSM_SEGUROMALAPRAXIS, CPR_PRESTADOR, CT' +
        'B_TABLAS TCARACTER,'
      
        '       CTB_TABLAS TCOMPROB, CTB_TABLAS TGANANCIAS, CTB_TABLAS TI' +
        'VA, CTB_TABLAS TTCUENTA,'
      
        '       CTB_TABLAS CTB_SEGMP, XEN_ENTIDAD, CPV_PROVINCIAS, MTP_TI' +
        'POPRESTADOR,'
      
        '       CPE_PRESTAESPECI, CIB_INGRESOSBRUTOS, ZBA_BANCOS, MES_ESP' +
        'ECIALIDADES'
      ' WHERE '#39'TATEN'#39' = TCARACTER.TB_CLAVE(+)'
      '   AND CA_TIPO = TCARACTER.TB_CODIGO(+)'
      '   AND '#39'TCOMP'#39' = TCOMPROB.TB_CLAVE(+)'
      '   AND CA_TIPOCOMPROBANTE = TCOMPROB.TB_CODIGO(+)'
      '   AND '#39'RETGA'#39' = TGANANCIAS.TB_CLAVE(+)'
      '   AND TGANANCIAS.TB_ESPECIAL1 IS NULL'
      '   AND CA_RETGANANCIAS = TGANANCIAS.TB_CODIGO(+)'
      '   AND '#39'SIVA'#39' = TIVA.TB_CLAVE(+)'
      '   AND CA_IVA = TIVA.TB_CODIGO(+)'
      '   AND '#39'BCOCT'#39' = TTCUENTA.TB_CLAVE(+)'
      '   AND CA_TIPOCUENTA = TTCUENTA.TB_CODIGO(+)'
      '   AND CA_INGRESOSBRUTOS = IB_CODIGO (+)'
      '   AND CA_BANCO = BA_CODIGO (+)'
      '   AND CA_PROVINCIA = PV_CODIGO(+)'
      '   AND CA_ESPECIALIDAD = TP_CODIGO(+)'
      '   AND CA_IDENTIFICADOR = PE_PRESTADOR(+)'
      '   AND PE_ESPECIALIDAD = ES_CODIGO(+)'
      '   AND CA_PROVINCIA = IB_PROVINCIA (+)'
      '   AND CA_CODPOSTAL=CP_CODIGO(+)'
      '   AND CA_LOCALIDAD=CP_LOCALIDAD(+)'
      '   AND PE_FECHABAJA IS NULL'
      
        '   AND SINIESTRO.GET_ESTADOSEGUROMALAPRAXIS(CA_IDENTIFICADOR) = ' +
        'CTB_SEGMP.TB_CODIGO (+)'
      '   AND '#39'SEGMP'#39' = CTB_SEGMP.TB_CLAVE (+)'
      
        '   AND SINIESTRO.GET_SEGUROMALAPRAXISACTIVO(CA_IDENTIFICADOR) = ' +
        'SM_ID (+)'
      '   AND EN_CPOSTAL = CA_CODPOSTAL'
      '   AND EN_IDCANAL = :CANAL'
      '   AND EN_ID = :ENTIDAD'
      '   AND CA_FECHABAJA IS NULL'
      
        '   AND CA_ESPECIALIDAD IN (SELECT PC_CODIGO FROM APC_PRESTADORCO' +
        'MERCIAL)'
      '   AND CA_VISIBLE = '#39'S'#39)
    Left = 41
    Top = 284
    ParamData = <
      item
        DataType = ftString
        Name = 'CANAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ENTIDAD'
        ParamType = ptInput
      end>
  end
  object SortDialogCPR_PRESTADORES: TSortDialog
    Caption = 'Ordenar Prestadores'
    DataSet = sdqCPR_PRESTADORES
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 69
    Top = 284
  end
  object dsCSE_SEGUIMIENTOEVENTO: TDataSource
    DataSet = sdqCSE_SEGUIMIENTOEVENTO
    Left = 13
    Top = 312
  end
  object sdqCSE_SEGUIMIENTOEVENTO: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   SE.SE_ID IDEVENTO,'
      '         CE.CE_DESCRIPCION EVENTO,'
      '         SE_SUBEVENTO SUBEVENTO, '
      
        '         VARIOS.GET_CANTRELLAMADAS (SE.SE_IDENTIFICADOR) RELLAMA' +
        'DAS,'
      
        '         SE.SE_USUREALIZADO USUREALIZADO, USUREA.SE_NOMBRE NOMBR' +
        'EUSUREALIZADO,'
      '         TO_CHAR (SE.SE_FECHA, '#39'DD/MM/YYYY'#39') FECHA,'
      '         SE.SE_SECTORINVOLUCRADO SECTORINVOLUCRADO,'
      '         TO_CHAR (SE.SE_FECHA, '#39'HH24:MI'#39') HORA,'
      '         SE.SE_IDCODIGOINGRESO IDCODIGOINGRESO,'
      '         SINTER.SC_DESCRIPCION SECTORSOLICITANTE,'
      
        '         USU.SE_NOMBRE PERSONALSOLICITANTE, IE.IE_DESCRIPCION IN' +
        'GRESO,'
      
        '         ME.ME_DESCRIPCION MOTIVO, SINVOL.SC_DESCRIPCION SECTORI' +
        'NTERVINIENTE,'
      '         PE.PE_DESCRIPCION PRIORIDAD,'
      '         SE.SE_FECHACOMPROMETIDA FECHACOMPROMETIDA,'
      '         TRUNC (SE.SE_FECHAREALIZADO) FECHAREALIZADO,'
      '         REPLACE (SE_OBSERVACIONREALIZADO, CHR (13) || CHR (10),'
      '                  '#39' '#39') RESPUESTA,'
      
        '         REPLACE (SE.SE_OBSERVACION, CHR (13) || CHR (10), '#39' '#39') ' +
        'OBSERVACIONES,'
      
        '         PRE.CA_CLAVE CUITPRESTADOR, PRE.CA_DESCRIPCION RAZONSOC' +
        'IAL,'
      '         SE.SE_CUILEVENTO CUIL, TJT.TJ_NOMBRE TRABAJADOR,'
      '         CON.CO_CONTRATO CONTRATO, EMP.EM_NOMBRE EMPRESA,'
      '         EMP.EM_CUIT CUITEMPRESA,'
      
        '         SI.SI_DESCRIPCION SITUACIONEMPRESA, SE.SE_USUALTA USUAL' +
        'TA,'
      '         SE.SE_EVENTOINTERRUMPIDO INTERRUMPIDO,'
      
        '         SE.SE_EMAILPROSPECTO EMAILPROSPECTO, SE.SE_GENERAL GENE' +
        'RAL,'
      '         SE.SE_IDSOLICITUDCOTIZACION IDSOLICITUDCOTIZACION,'
      '         SE.SE_CUITPROSPECTO CUITPROSPECTO,'
      '         SE_RAZONSOCIALPROSPECTO RAZONSOCIALPROSPECTO,'
      '         SE.SE_IDPRESTADOREVENTO IDPRESTADOREVENTO,'
      
        '         SE.SE_IDPROVEEDOREVENTO IDPROVEEDOREVENTO, SE.SE_IDENTI' +
        'DAD IDENTIDAD,'
      
        '         ENT.EN_CODBANCO CODENTIDAD, ENT.EN_NOMBRE NOMBREENTIDAD' +
        ','
      '         SE.SE_IDENTIDADVENDEDOR IDENTIDADVENDEDOR,'
      
        '         VEND.VE_VENDEDOR CODVENDEDOR, VEND.VE_NOMBRE NOMBREVEND' +
        'EDOR,'
      '         SE.SE_IDENTIFICADOR IDENTIFICADOREVENTO'
      '    FROM XEN_ENTIDAD ENT,'
      '         XVE_VENDEDOR VEND,'
      '         XEV_ENTIDADVENDEDOR ENTVEND,'
      '         CPE_PRIORIDADEVENTO PE,'
      '         CSI_SITUACIONEMPRESA SI,'
      '         CME_MOTIVOEVENTO ME,'
      '         CSE_SEGUIMIENTOEVENTO SE,'
      '         USC_SECTORES SINTER,'
      '         USC_SECTORES SINVOL,'
      '         CCE_CODIGOEVENTO CE,'
      '         CPR_PRESTADOR PRE,'
      '         USE_USUARIOS USU,'
      '         USE_USUARIOS USUREA,'
      '         CIE_INGRESOEVENTO IE,'
      '         CTJ_TRABAJADOR TJT,'
      '         ACO_CONTRATO CON,'
      '         AEM_EMPRESA EMP'
      '   WHERE SE.SE_IDCODIGOEVENTO = CE.CE_ID(+)'
      '     AND SE.SE_SECTORINVOLUCRADO = SINVOL.SC_CODIGO(+)'
      '     AND SE.SE_IDMOTIVOEVENTO = ME.ME_ID(+)'
      '     AND SE.SE_IDPRESTADOREVENTO = PRE.CA_IDENTIFICADOR(+)'
      '     AND SE.SE_USUARIOINTERVINIENTE = USU.SE_USUARIO(+)'
      '     AND SE.SE_IDCODIGOINGRESO = IE.IE_ID(+)'
      '     AND SE.SE_SECTORINTERVINIENTE = SINTER.SC_CODIGO(+)'
      '     AND SE.SE_CONTRATO = CON.CO_CONTRATO(+)'
      '     AND CON.CO_IDEMPRESA = EMP.EM_ID(+)'
      '     AND SE.SE_CUILEVENTO = TJT.TJ_CUIL(+)'
      '     AND SE.SE_PRIORIDAD = PE.PE_ID(+)'
      '     AND SE.SE_IDSITUACIONEMPRESA = SI.SI_ID(+)'
      '     AND SE.SE_USUREALIZADO = USUREA.SE_USUARIO(+)'
      '     AND SE.SE_IDENTIDAD = ENT.EN_ID'
      '     AND SE.SE_IDENTIDADVENDEDOR = ENTVEND.EV_ID(+)'
      '     AND EV_IDVENDEDOR = VEND.VE_ID(+)'
      '     AND EN_ID = :ENTIDAD'
      'ORDER BY SE.SE_ID DESC')
    Left = 41
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ENTIDAD'
        ParamType = ptInput
      end>
  end
  object SortDialogCSE_SEGUIMIENTOEVENTO: TSortDialog
    Caption = 'Ordenar Eventos'
    DataSet = sdqCSE_SEGUIMIENTOEVENTO
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 69
    Top = 312
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end>
    Left = 97
    Top = 144
  end
end
