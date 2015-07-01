object frmPRS: TfrmPRS
  Left = 389
  Top = 227
  BorderStyle = bsNone
  ClientHeight = 659
  ClientWidth = 1130
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  DesignSize = (
    1130
    659)
  PixelsPerInch = 96
  TextHeight = 13
  object pcTipoPRS: TPageControl
    Left = 0
    Top = 0
    Width = 1130
    Height = 659
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    OnChange = pcTipoPRSChange
    OnChanging = pcTipoPRSChanging
  end
  object pcPRS: TPageControl
    Left = 0
    Top = 0
    Width = 1130
    Height = 659
    ActivePage = tsRecomendaciones
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    OnChange = pcPRSChange
    object tsDiagEstableci: TTabSheet
      Caption = 'Diagn'#243'stico por Establecimiento'
      object cBarDiagEstableci: TCoolBar
        Left = 0
        Top = 0
        Width = 1122
        Height = 30
        Bands = <
          item
            Control = tBarDiagEstableci
            ImageIndex = -1
            MinHeight = 26
            Width = 1116
          end>
        object tBarDiagEstableci: TToolBar
          Left = 9
          Top = 0
          Width = 1109
          Height = 26
          BorderWidth = 1
          Caption = 'tBarDiagEstableci'
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbDiagRefrescar: TToolButton
            Left = 0
            Top = 0
            Hint = 'Refrescar (F5)'
            Caption = 'tbDiagRefrescar'
            ImageIndex = 0
            OnClick = tbDiagRefrescarClick
          end
          object ToolButton2: TToolButton
            Left = 23
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object tbDiagAgregar: TToolButton
            Left = 31
            Top = 0
            Hint = 'Nuevo (Ctrl+N)'
            Caption = 'tbDiagAgregar'
            ImageIndex = 6
            OnClick = tbDiagAgregarClick
          end
          object tbDiagModificar: TToolButton
            Left = 54
            Top = 0
            Hint = 'Modificar (Ctrl+M)'
            Caption = 'tbDiagModificar'
            ImageIndex = 7
            OnClick = tbDiagModificarClick
          end
          object tbDiagQuitar: TToolButton
            Left = 77
            Top = 0
            Hint = 'Eliminar (Del)'
            Caption = 'tbDiagQuitar'
            ImageIndex = 8
            OnClick = tbDiagQuitarClick
          end
          object ToolButton4: TToolButton
            Left = 100
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 4
            Style = tbsSeparator
          end
          object tbDiagOrdenar: TToolButton
            Left = 108
            Top = 0
            Hint = 'Ordenar (Ctrl+O)'
            Caption = 'tbDiagOrdenar'
            ImageIndex = 2
            OnClick = tbDiagOrdenarClick
          end
          object ToolButton6: TToolButton
            Left = 131
            Top = 0
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 5
            Style = tbsSeparator
          end
          object tbDiagExportar: TToolButton
            Left = 139
            Top = 0
            Hint = 'Exportar (Ctrl+E)'
            Caption = 'tbDiagExportar'
            ImageIndex = 3
            OnClick = tbDiagExportarClick
          end
          object tbDiagImprimir: TToolButton
            Left = 162
            Top = 0
            Hint = 'Imprimir (Ctrl+I)'
            Caption = 'tbDiagImprimir'
            ImageIndex = 4
            OnClick = tbDiagImprimirClick
          end
        end
      end
      object dbgDiagnostico: TArtDBGrid
        Left = 0
        Top = 30
        Width = 1122
        Height = 598
        Align = alClient
        DataSource = dsDiagnostico
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = tbDiagModificarClick
        IniStorage = FormPlacement
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'DE_DIAGNOSTICO'
            Title.Caption = 'Diagn'#243'stico'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DE_SECTOREMPRESA'
            Title.Caption = 'Sector'
            Width = 148
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DE_TRABAJADORESEXPUESTOS'
            Title.Caption = 'Cant. Expuestos'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DE_DESCRIPCION1'
            Title.Caption = 'Descripci'#243'n'
            Width = 534
            Visible = True
          end>
      end
      object fpDiagAMB: TFormPanel
        Left = 113
        Top = 471
        Width = 469
        Height = 269
        Caption = 'Diagn'#243'stico por Establecimiento'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        Position = poScreenCenter
        ActiveControl = edDiagTipo
        Constraints.MinHeight = 90
        Constraints.MinWidth = 370
        DesignSize = (
          469
          269)
        object lbDiagTipo: TLabel
          Left = 152
          Top = 8
          Width = 95
          Height = 13
          Caption = 'Tipo de Diagn'#243'stico'
        end
        object lbDiagNro: TLabel
          Left = 8
          Top = 8
          Width = 94
          Height = 13
          Caption = 'Nro. de Diagn'#243'stico'
        end
        object Bevel1: TBevel
          Left = 4
          Top = 29
          Width = 461
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object lblPuestoTrabajo: TLabel
          Left = 8
          Top = 40
          Width = 133
          Height = 13
          Caption = 'Puesto de Trabajo o Sector:'
        end
        object lblTrabajadoresExpuestos: TLabel
          Left = 8
          Top = 66
          Width = 145
          Height = 13
          Caption = 'Cant. Trabajadores Expuestos:'
        end
        object edDiagTipo: TPatternEdit
          Left = 252
          Top = 4
          Width = 21
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 1
          TabOrder = 1
          OnExit = edDiagTipoExit
          OnKeyPress = edDiagTipoKeyPress
          Alignment = taCenter
          Pattern = 'CRE'
        end
        object cmbDiagTipo: TComboBox
          Left = 272
          Top = 4
          Width = 193
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnChange = cmbDiagTipoChange
          Items.Strings = (
            'Causales de Accidente'
            'Riesgo Potencial')
        end
        object edDiagNro: TIntEdit
          Left = 108
          Top = 4
          Width = 29
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          Text = '99'
          Alignment = taCenter
          MaxLength = 2
          MaxValue = 99
          Value = 99
        end
        object edMemoDiagnostico: TMemo
          Left = 4
          Top = 89
          Width = 461
          Height = 142
          Anchors = [akLeft, akTop, akRight, akBottom]
          MaxLength = 7900
          ScrollBars = ssBoth
          TabOrder = 5
        end
        object btnDiagAceptar: TButton
          Left = 310
          Top = 240
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 6
          OnClick = btnDiagAceptarClick
        end
        object btnDiagCancelar: TButton
          Left = 390
          Top = 240
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 7
        end
        object edPuestoTrabajo: TEdit
          Left = 155
          Top = 37
          Width = 307
          Height = 21
          MaxLength = 50
          TabOrder = 3
        end
        object edTrabajadoresExpuestos: TIntEdit
          Left = 155
          Top = 62
          Width = 55
          Height = 21
          TabStop = False
          TabOrder = 4
          Alignment = taRightJustify
          MaxLength = 2
        end
      end
    end
    object tsRecomendaciones: TTabSheet
      Caption = 'Recomendaciones por Establecimiento'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 830
        Top = 0
        Height = 628
        Align = alRight
        ExplicitLeft = 504
        ExplicitHeight = 445
      end
      object pnlRecomendaciones: TPanel
        Left = 0
        Top = 0
        Width = 830
        Height = 628
        Align = alClient
        TabOrder = 0
        object CoolBar1: TCoolBar
          Left = 1
          Top = 1
          Width = 828
          Height = 30
          Bands = <
            item
              Control = tBarRecomendaciones
              ImageIndex = -1
              MinHeight = 26
              Width = 822
            end>
          object tBarRecomendaciones: TToolBar
            Left = 9
            Top = 0
            Width = 815
            Height = 26
            BorderWidth = 1
            Caption = 'tBarDiagEstableci'
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Wrapable = False
            object tbRecRefrescar: TToolButton
              Left = 0
              Top = 0
              Hint = 'Refrescar (F5)'
              Caption = 'tbRecRefrescar'
              ImageIndex = 0
              OnClick = tbRecRefrescarClick
            end
            object ToolButton3: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton2'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object tbRecNuevo: TToolButton
              Left = 31
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 6
              OnClick = tbRecNuevoClick
            end
            object tbRecModificar: TToolButton
              Left = 54
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              ImageIndex = 7
              OnClick = tbRecModificarClick
            end
            object tbRecEliminar: TToolButton
              Left = 77
              Top = 0
              Hint = 'Eliminar (Del)'
              ImageIndex = 8
              OnClick = tbRecEliminarClick
            end
            object ToolButton7: TToolButton
              Left = 100
              Top = 0
              Width = 8
              Caption = 'ToolButton7'
              ImageIndex = 6
              Style = tbsSeparator
            end
            object tbHistorico: TToolButton
              Left = 108
              Top = 0
              Hint = 'Hist'#243'rico'
              ImageIndex = 16
              OnClick = tbHistoricoClick
            end
            object ToolButton9: TToolButton
              Left = 131
              Top = 0
              Width = 8
              Caption = 'ToolButton4'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object tbRecOrdenar: TToolButton
              Left = 139
              Top = 0
              Hint = 'Ordenar (Ctrl+O)'
              ImageIndex = 2
              OnClick = tbRecOrdenarClick
            end
            object ToolButton11: TToolButton
              Left = 162
              Top = 0
              Width = 8
              Caption = 'ToolButton6'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbRecExportar: TToolButton
              Left = 170
              Top = 0
              Hint = 'Exportar (Ctrl+E)'
              ImageIndex = 3
              OnClick = tbRecExportarClick
            end
            object tbRecImprimir: TToolButton
              Left = 193
              Top = 0
              Hint = 'Imprimir (Ctrl+I)'
              ImageIndex = 4
              OnClick = tbRecImprimirClick
            end
          end
        end
        object dbgRecomendaciones: TArtDBGrid
          Left = 1
          Top = 31
          Width = 828
          Height = 511
          Align = alClient
          DataSource = dsRecomendaciones
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = dbgRecomendacionesCellClick
          OnDblClick = tbRecModificarClick
          IniStorage = FormPlacement
          MultiSelect = True
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'RE_RECOMENDACION'
              Title.Caption = 'Nro.'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RE_DESCRIPCION1'
              Title.Caption = 'Recomendaci'#243'n'
              Width = 260
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RE_RESPONSABLE'
              Title.Caption = 'Responsable'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RE_CUMPLIMIENTO'
              Title.Caption = 'Cumplimiento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RE_SEGUIMIENTO'
              Title.Caption = 'Seguimiento'
              Visible = True
            end>
        end
        object ArtDBGrid1: TArtDBGrid
          Left = 1
          Top = 542
          Width = 828
          Height = 85
          Align = alBottom
          DataSource = dsRelaciones
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FormPlacement
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              ButtonStyle = cbsNone
              Expanded = False
              FieldName = 'ROWNUM'
              ReadOnly = True
              Title.Caption = 'Nro.'
              Width = 26
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DR_DIAGNOSTICO'
              Title.Caption = 'Nro. Diagn'#243'stico'
              Width = 90
              Visible = True
            end
            item
              ButtonStyle = cbsNone
              Expanded = False
              FieldName = 'DE_DESCRIPCION1'
              ReadOnly = True
              Title.Caption = 'Diagn'#243'stico'
              Width = 600
              Visible = True
            end>
        end
        object fpCopiarEstableci: TFormPanel
          Left = 72
          Top = 75
          Width = 529
          Height = 97
          FormWidth = 0
          FormHeigth = 0
          FormLeft = 0
          FormTop = 0
          BorderIcons = [biSystemMenu, biMaximize]
          Position = poOwnerFormCenter
          OnBeforeShow = fpCopiarEstableciBeforeShow
          Constraints.MinHeight = 73
          Constraints.MinWidth = 163
          DesignSize = (
            529
            97)
          object BevelAbm: TBevel
            Left = 4
            Top = 61
            Width = 521
            Height = 2
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object btnCopEstAceptar: TButton
            Left = 371
            Top = 67
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 0
            OnClick = btnCopEstAceptarClick
          end
          object btnCopEstCancelar: TButton
            Left = 449
            Top = 67
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 1
          end
          inline fraEstabCopia: TfraEstablecimientoDomic
            Left = 6
            Top = 8
            Width = 519
            Height = 47
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
            ExplicitLeft = 6
            ExplicitTop = 8
            inherited lbLocalidad: TLabel
              Width = 46
              ExplicitWidth = 46
            end
            inherited lbEstableci: TLabel
              Width = 30
              ExplicitWidth = 30
            end
            inherited lbCPostal: TLabel
              Width = 20
              ExplicitWidth = 20
            end
            inherited lbDomicilio: TLabel
              Width = 42
              ExplicitWidth = 42
            end
            inherited lbProvincia: TLabel
              Width = 44
              ExplicitWidth = 44
            end
          end
        end
      end
      object prItemsRec: TPageControl
        Left = 833
        Top = 0
        Width = 289
        Height = 628
        ActivePage = tsVisitas
        Align = alRight
        TabOrder = 2
        OnChange = prItemsRecChange
        object tsVisitas: TTabSheet
          Caption = 'Visitas'
          ImageIndex = 1
          object pnlVisitas: TPanel
            Left = 0
            Top = 0
            Width = 281
            Height = 279
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object CoolBar3: TCoolBar
              Left = 0
              Top = 0
              Width = 281
              Height = 30
              Bands = <
                item
                  Control = tbVisitas
                  ImageIndex = -1
                  MinHeight = 26
                  Width = 275
                end>
              object tbVisitas: TToolBar
                Left = 9
                Top = 0
                Width = 268
                Height = 26
                BorderWidth = 1
                Caption = 'tBarDiagEstableci'
                HotImages = frmPrincipal.ilColor
                Images = frmPrincipal.ilByN
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                object tbVisAgregar: TToolButton
                  Left = 0
                  Top = 0
                  Hint = 'Nuevo (Ctrl+V)'
                  ImageIndex = 6
                  OnClick = tbVisAgregarClick
                end
                object tbVisQuitar: TToolButton
                  Left = 23
                  Top = 0
                  Hint = 'Eliminar (Ctrl+E)'
                  ImageIndex = 8
                  OnClick = tbVisQuitarClick
                end
                object ToolButton5: TToolButton
                  Left = 46
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton5'
                  ImageIndex = 5
                  Style = tbsSeparator
                end
                object tbVisOrdenar: TToolButton
                  Left = 54
                  Top = 0
                  Caption = 'tbVisOrdenar'
                  ImageIndex = 2
                  OnClick = tbVisOrdenarClick
                end
              end
            end
            object dbgVisitas: TArtDBGrid
              Left = 0
              Top = 30
              Width = 281
              Height = 249
              Align = alClient
              DataSource = dsVisitas
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              IniStorage = FormPlacement
              FooterBand = False
              TitleHeight = 17
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Title.Caption = 'Tipo'
                  Width = 172
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RV_FECHA'
                  Title.Caption = 'Fecha'
                  Width = 72
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RV_USUALTA'
                  Title.Caption = 'Usuario de Alta'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RV_FECHAALTA'
                  Title.Caption = 'Fecha de Alta'
                  Visible = True
                end>
            end
          end
          object pnlPlanVisitas: TPanel
            Left = 0
            Top = 279
            Width = 281
            Height = 202
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object CoolBar4: TCoolBar
              Left = 0
              Top = 22
              Width = 281
              Height = 30
              Bands = <
                item
                  Control = ToolBar1
                  ImageIndex = -1
                  MinHeight = 26
                  Width = 275
                end>
              object ToolBar1: TToolBar
                Left = 9
                Top = 0
                Width = 268
                Height = 26
                BorderWidth = 1
                Caption = 'tBarDiagEstableci'
                HotImages = frmPrincipal.ilColor
                Images = frmPrincipal.ilByN
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                object tbNuevoVisitaPlan: TToolButton
                  Left = 0
                  Top = 0
                  Hint = 'Nuevo (Ctrl+V)'
                  ImageIndex = 6
                  OnClick = tbNuevoVisitaPlanClick
                end
                object tbEliminarVisitaPlan: TToolButton
                  Left = 23
                  Top = 0
                  Hint = 'Eliminar (Ctrl+E)'
                  ImageIndex = 8
                  OnClick = tbEliminarVisitaPlanClick
                end
                object ToolButton10: TToolButton
                  Left = 46
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton5'
                  ImageIndex = 5
                  Style = tbsSeparator
                end
                object tbOrdenarVisitaPlan: TToolButton
                  Left = 54
                  Top = 0
                  Caption = 'tbVisOrdenar'
                  ImageIndex = 2
                  OnClick = tbOrdenarVisitaPlanClick
                end
              end
            end
            object dbgPlanVisitas: TArtDBGrid
              Left = 0
              Top = 52
              Width = 281
              Height = 150
              Align = alClient
              DataSource = dsPlanVisitas
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              IniStorage = FormPlacement
              OnGetCellParams = dbgPlanVisitasGetCellParams
              FooterBand = False
              TitleHeight = 17
              Columns = <
                item
                  Expanded = False
                  FieldName = 'PV_FECHA'
                  Title.Caption = 'Fecha'
                  Width = 101
                  Visible = True
                end>
            end
            object pnlCaptionPlan: TPanel
              Left = 0
              Top = 0
              Width = 281
              Height = 22
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Caption = 'Plan de Visitas'
              TabOrder = 2
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 481
            Width = 281
            Height = 119
            Align = alBottom
            TabOrder = 2
            object Label8: TLabel
              Left = 6
              Top = 7
              Width = 67
              Height = 13
              Caption = 'Nivel de Firma'
            end
            object chkNivelFirmas: TCheckListBox
              Left = 3
              Top = 26
              Width = 279
              Height = 90
              OnClickCheck = chkNivelFirmasClickCheck
              ItemHeight = 13
              TabOrder = 0
            end
            object cbSinFirmas: TCheckBox
              Left = 83
              Top = 6
              Width = 97
              Height = 17
              Caption = 'Sin Firmas'
              TabOrder = 1
              OnClick = cbSinFirmasClick
            end
          end
        end
      end
      object fpRecAMB: TFormPanel
        Left = 423
        Top = 110
        Width = 400
        Height = 478
        Caption = 'Recomendaciones por Establecimiento'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        Position = poScreenCenter
        Constraints.MinHeight = 200
        Constraints.MinWidth = 400
        DesignSize = (
          400
          478)
        object Bevel2: TBevel
          Left = 0
          Top = 28
          Width = 392
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 116
          Height = 13
          Caption = 'Nro. de Recomendaci'#243'n'
        end
        object lbRelCumplimiento: TLabel
          Left = 8
          Top = 348
          Width = 294
          Height = 13
          Caption = 'Fecha comprometida de Cumplimiento por parte del Empleador'
        end
        object lbRelSeguimiento: TLabel
          Left = 8
          Top = 376
          Width = 282
          Height = 13
          Caption = 'Fecha prevista del Seguimiento por parte de la Aseguradora'
        end
        object Bevel5: TBevel
          Left = 4
          Top = 181
          Width = 392
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label6: TLabel
          Left = 8
          Top = 323
          Width = 138
          Height = 13
          Caption = 'Responsable de la Ejecuci'#243'n'
        end
        object lblPreventorRecomendacion: TLabel
          Left = 9
          Top = 424
          Width = 43
          Height = 13
          Caption = 'Firmante:'
        end
        object lblVisita: TLabel
          Left = 9
          Top = 400
          Width = 28
          Height = 13
          Caption = 'Visita:'
        end
        object Bevel6: TBevel
          Left = 4
          Top = 236
          Width = 392
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object btnBuscarVisitas: TSpeedButton
          Left = 371
          Top = 397
          Width = 23
          Height = 22
          Hint = 'Buscar Visita'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000003131
            310031313100FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000031313100C6C6C600FFFF
            FF00C6C6C600000000000000000031636300639CCE0000000000FF00FF00FF00
            FF00FF00FF00FF00FF000000000031313100C6C6C600FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0000000000316363009CCECE00C6D6EF0000000000FF00FF00FF00
            FF000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF63
            63000000000031636300639CCE00C6D6EF0000000000FF00FF00FF00FF00FF00
            FF0084848400FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000
            000031636300639CCE00C6D6EF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FFFFFF00FFCECE00FF636300FFCECE00FF636300000000003163
            6300639CCE009CCECE000000000000000000FF00FF00FF00FF00FF00FF003131
            3100DEDEDE000000000000000000000000000000000000000000639CCE00319C
            CE00C6D6EF0000000000FFFFFF0031313100FF00FF00FF00FF0000000000FFFF
            FF0000000000CECE3100FFFF9C00CECE3100CECE31000000000000000000319C
            CE0000000000FF636300FFCECE00C6C6C60000000000FF00FF00FF00FF000000
            0000CECE3100FFFF9C00FFFF9C00CECE3100CECE3100CECE3100000000000000
            0000FFCECE00FF636300FF636300FFFFFF0031313100FF00FF0000000000FFFF
            CE00FFFFFF00FFEFCE00FFFF9C00CECE6300CECE3100CECE3100CECE31000000
            0000FF636300FFCECE00FF636300FFCECE00C6C6C6000000000000000000FFFF
            9C00FFEFCE00FFEFCE00FFFF9C00CECE6300CECE3100CECE3100CECE31000000
            0000FFCECE00FFCECE00FFFFFF00FFFFFF00FFFFFF003131310000000000FFFF
            9C00FFFF9C00FFFF9C00FFCE6300CECE3100CECE3100CE9C3100CE9C31000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6003131310000000000FFFF
            3100FFCE9C00FFCE9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000
            000094949400DEDEDE00C6C6C6003131310000000000FF00FF00FF00FF000000
            0000CECE6300CECE6300CECE3100CECE3100CECE31009C9C310000000000DEDE
            DE00B5B5B500181818006363630000000000FF00FF00FF00FF00FF00FF00FF00
            FF0000000000CECE3100CECE3100CE9C3100CE9C310000000000848484008484
            8400848484003131310000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000000000000000000000000000000000000000000000000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnBuscarVisitasClick
        end
        object Label2: TLabel
          Left = 5
          Top = 32
          Width = 61
          Height = 13
          Caption = 'Diagn'#243'sticos'
        end
        object Label4: TLabel
          Left = 5
          Top = 184
          Width = 78
          Height = 13
          Caption = 'Recomendaci'#243'n'
        end
        object btnRecAceptar: TButton
          Left = 238
          Top = 446
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 9
          OnClick = btnRecAceptarClick
        end
        object btnRecCancelar: TButton
          Left = 318
          Top = 446
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 10
        end
        object edRecDescripcion: TMemo
          Left = 4
          Top = 200
          Width = 392
          Height = 117
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 7900
          ScrollBars = ssBoth
          TabOrder = 3
        end
        object edRecNumero: TIntEdit
          Left = 140
          Top = 4
          Width = 29
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          Alignment = taCenter
          MaxLength = 2
          MaxValue = 99
        end
        object edResponsableEjecucion: TEdit
          Left = 154
          Top = 320
          Width = 240
          Height = 21
          MaxLength = 50
          TabOrder = 4
        end
        inline fraPreventorRecomendacion: TfraCodigoDescripcionExt
          Left = 62
          Top = 420
          Width = 335
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
          ExplicitLeft = 62
          ExplicitTop = 420
          ExplicitWidth = 335
          inherited cmbDescripcion: TArtComboBox
            Width = 270
            CharCase = ecUpperCase
            OnDropDown = fraPreventorRecomendacioncmbDescripcionDropDown
            ExplicitWidth = 270
          end
          inherited edCodigo: TPatternEdit
            Width = 59
            CharCase = ecNormal
            ExplicitWidth = 59
          end
        end
        object cbDiagnosticos: TRxCheckListBox
          Left = 4
          Top = 47
          Width = 392
          Height = 132
          CheckKind = ckCheckMarks
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 2
          InternalVersion = 202
        end
        object edVisita: TEdit
          Left = 63
          Top = 397
          Width = 304
          Height = 21
          TabStop = False
          Color = clSilver
          ReadOnly = True
          TabOrder = 7
        end
        object edRelCumplimiento: TDateEdit
          Left = 304
          Top = 345
          Width = 91
          Height = 21
          NumGlyphs = 2
          TabOrder = 5
        end
        object edRelSeguimiento: TDateEdit
          Left = 304
          Top = 372
          Width = 90
          Height = 21
          NumGlyphs = 2
          TabOrder = 6
        end
        object chkNoamerita: TCheckBox
          Left = 248
          Top = 8
          Width = 145
          Height = 17
          Caption = 'Recepci'#243'n de No Amerita'
          TabOrder = 1
          OnClick = chkNoameritaClick
        end
      end
      object fpVisitas: TFormPanel
        Left = 920
        Top = 205
        Width = 281
        Height = 97
        Caption = 'Visitas de Seguimiento de Recomendaciones'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        Position = poScreenCenter
        Constraints.MaxHeight = 97
        Constraints.MinHeight = 97
        Constraints.MinWidth = 200
        DesignSize = (
          281
          97)
        object Label5: TLabel
          Left = 8
          Top = 40
          Width = 30
          Height = 13
          Caption = 'Fecha'
        end
        object Bevel7: TBevel
          Left = 4
          Top = 60
          Width = 273
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label3: TLabel
          Left = 8
          Top = 12
          Width = 21
          Height = 13
          Caption = 'Tipo'
        end
        object btnVisAceptar: TButton
          Left = 122
          Top = 68
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 2
          OnClick = btnVisAceptarClick
        end
        object btnVisCancelar: TButton
          Left = 202
          Top = 68
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 3
        end
        object cmbVisTipo: TExComboBox
          Left = 132
          Top = 8
          Width = 145
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 0
          Items.Strings = (
            'C=Cumplimiento'
            'I=Incumplimiento'
            ' ')
          ItemIndex = -1
          Options = []
          ValueWidth = 64
        end
        object edVisFecha: TDateEdit
          Left = 132
          Top = 34
          Width = 94
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
      end
    end
  end
  object btnCopiarDe: TButton
    Left = 1059
    Top = 1
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Copiar de...'
    TabOrder = 2
    OnClick = btnCopiarDeClick
  end
  object fpHistorico: TFormPanel
    Left = 216
    Top = 194
    Width = 547
    Height = 221
    Caption = 'Hist'#243'rico Item'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poScreenCenter
    object dbgHistorico: TArtDBGrid
      Left = 0
      Top = 30
      Width = 547
      Height = 191
      Align = alClient
      DataSource = dsHistorico
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      IniStorage = FormPlacement
      MultiSelect = True
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 're_recomendacion'
          Title.Caption = 'Nro.'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RE_DESCRIPCION1'
          Title.Caption = 'Recomendaci'#243'n'
          Width = 260
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hp_cumplimiento'
          Title.Caption = 'Cumplimiento'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hp_seguimiento'
          Title.Caption = 'Seguimiento'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hp_fechamodif'
          Title.Caption = 'Fecha Carga'
          Width = 135
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hp_usumodif'
          Title.Caption = 'Usuario Carga'
          Width = 111
          Visible = True
        end>
    end
    object CoolBar2: TCoolBar
      Left = 0
      Top = 0
      Width = 547
      Height = 30
      Bands = <
        item
          Control = ToolBar2
          ImageIndex = -1
          MinHeight = 26
          Width = 541
        end
        item
          Control = DBMemo2
          ImageIndex = -1
          Width = 541
        end>
      object ToolBar2: TToolBar
        Left = 9
        Top = 0
        Width = 534
        Height = 26
        BorderWidth = 1
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Wrapable = False
        object tbSalir: TToolButton
          Left = 0
          Top = 0
          Hint = 'Salir'
          Caption = 'Salir'
          ImageIndex = 5
          OnClick = tbSalirClick
        end
      end
      object DBMemo2: TDBMemo
        Left = 9
        Top = 28
        Width = 534
        Height = 25
        TabOrder = 1
      end
    end
  end
  object fpPlanVisita: TFormPanel
    Left = 919
    Top = 333
    Width = 166
    Height = 76
    Caption = 'Plan de Visitas'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poScreenCenter
    Constraints.MaxHeight = 97
    Constraints.MinHeight = 76
    Constraints.MinWidth = 100
    DesignSize = (
      166
      76)
    object Label7: TLabel
      Left = 8
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Bevel3: TBevel
      Left = 4
      Top = 40
      Width = 158
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object btnAceptarPlanVisitas: TButton
      Left = 6
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarPlanVisitasClick
    end
    object Button2: TButton
      Left = 86
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object edFechaPlanVisitas: TDateEdit
      Left = 54
      Top = 12
      Width = 94
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object sdqDiagnostico: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT DE_DIAGNOSTICO, DE_TIPO, IIF_CHAR(DE_TIPO, '#39'C'#39', '#39'Causales' +
        ' de Accidente'#39', '#39'Riesgo Potencial'#39') TIPO, DE_DESCRIPCION1, DE_DE' +
        'SCRIPCION2,'
      'DE_SECTOREMPRESA,DE_TRABAJADORESEXPUESTOS'
      'FROM PDE_DIAGESTABLECI '
      'WHERE 1=2')
    Left = 16
    Top = 232
  end
  object dsDiagnostico: TDataSource
    DataSet = sdqDiagnostico
    Left = 44
    Top = 232
  end
  object sdDiagnostico: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDiagnostico
    SortFields = <
      item
        Title = 'Diagn'#243'stico'
        DataField = 'DE_DIAGNOSTICO'
        FieldIndex = 0
      end
      item
        Title = 'Tipo'
        DataField = 'TIPO'
        FieldIndex = 0
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'DE_DESCRIPCION1'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 72
    Top = 232
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Diagn'#243'stico'
        TitleAlignment = taCenter
        DataField = 'DE_DIAGNOSTICO'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'Tipo'
        TitleAlignment = taCenter
        DataField = 'TIPO'
        MaxLength = 17
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'DE_DESCRIPCION1'
        MaxLength = 60
      end>
    DataSource = dsDiagnostico
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Diagn'#243'stico por Establecimiento'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Detail.MaxLines = 7
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
    Left = 100
    Top = 232
  end
  object edDiagnostico: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDiagnostico
    Fields = <
      item
        DataField = 'DE_DIAGNOSTICO'
        Title = 'Diagn'#243'stico'
      end
      item
        DataField = 'TIPO'
        Title = 'Tipo'
      end
      item
        DataField = 'DE_DESCRIPCION1'
        Title = 'Descripci'#243'n'
      end>
    IniStorage = FormPlacement
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 128
    Top = 232
  end
  object FormPlacement: TFormPlacement
    Options = []
    UseRegistry = True
    Left = 103
    Top = 201
  end
  object sccDiagnostico: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        OnShortCutPress = tbDiagAgregarClick
      end
      item
        Key = 16461
        OnShortCutPress = tbDiagModificarClick
      end
      item
        Key = 46
        OnShortCutPress = tbDiagQuitarClick
      end
      item
        Key = 16463
        OnShortCutPress = tbDiagOrdenarClick
      end
      item
        Key = 16453
        OnShortCutPress = tbDiagExportarClick
      end
      item
        Key = 16457
        OnShortCutPress = tbDiagImprimirClick
      end
      item
        Key = 116
        LinkControl = tbDiagRefrescar
      end>
    Left = 156
    Top = 232
  end
  object sdqRecomendaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqRecomendacionesAfterScroll
    SQL.Strings = (
      'SELECT RE_RECOMENDACION, RE_DESCRIPCION1, RE_DESCRIPCION2,'
      '               RE_CUMPLIMIENTO, RE_SEGUIMIENTO, RE_RESPONSABLE, '
      '               RE_NOAMERITA'
      'FROM PRE_RECOMENDACIONES'
      'WHERE 1=2')
    Left = 16
    Top = 260
  end
  object dsRecomendaciones: TDataSource
    DataSet = sdqRecomendaciones
    Left = 44
    Top = 260
  end
  object sdRecomendaciones: TSortDialog
    Caption = 'Orden'
    DataSet = sdqRecomendaciones
    SortFields = <
      item
        Title = 'Nro.'
        DataField = 'RE_RECOMENDACION'
        FieldIndex = 0
      end
      item
        Title = 'Recomendaci'#243'n'
        DataField = 'RE_DESCRIPCION1'
        FieldIndex = 0
      end
      item
        Title = 'Cumplimiento'
        DataField = 'RE_CUMPLIMIENTO'
        FieldIndex = 0
      end
      item
        Title = 'Seguimiento'
        DataField = 'RE_SEGUIMIENTO'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 72
    Top = 260
  end
  object qpRecomendaciones: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Recomendaci'#243'n'
        TitleAlignment = taCenter
        DataField = 'RE_RECOMENDACION'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'Cumplimiento'
        TitleAlignment = taCenter
        DataField = 'RE_CUMPLIMIENTO'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'Seguimiento'
        TitleAlignment = taCenter
        DataField = 'RE_SEGUIMIENTO'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'RE_DESCRIPCION1'
        MaxLength = 60
      end>
    DataSource = dsRecomendaciones
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Recomendaciones por Establecimiento'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -11
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = []
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Detail.MaxLines = 7
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
    OnGetCellParams = qpRepRecomendacionesGetCellParams
    Left = 100
    Top = 260
  end
  object edRecomendaciones: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqRecomendaciones
    Fields = <
      item
        DataField = 'RE_RECOMENDACION'
        Title = 'Nro.'
      end
      item
        DataField = 'RE_DESCRIPCION1'
        Title = 'Recomendaci'#243'n'
      end
      item
        DataField = 'RE_CUMPLIMIENTO'
        Title = 'Cumplimiento'
      end
      item
        DataField = 'RE_SEGUIMIENTO'
        Title = 'Seguimiento'
      end>
    IniStorage = FormPlacement
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 128
    Top = 260
  end
  object sccRecomendaciones: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        OnShortCutPress = tbRecNuevoClick
      end
      item
        Key = 16461
        OnShortCutPress = tbRecModificarClick
      end
      item
        Key = 46
        OnShortCutPress = tbRecEliminarClick
      end
      item
        Key = 16463
        OnShortCutPress = tbRecOrdenarClick
      end
      item
        Key = 16453
        OnShortCutPress = tbRecExportarClick
      end
      item
        Key = 16457
        OnShortCutPress = tbRecImprimirClick
      end
      item
        Key = 16449
      end
      item
        Key = 116
        LinkControl = tbRecRefrescar
      end>
    Left = 156
    Top = 260
  end
  object sdqRelaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT ROWNUM, DE_DESCRIPCION1, DR_DIAGNOSTICO'
      'FROM PDR_DIAGPORREC, PDE_DIAGESTABLECI'
      'WHERE DR_CUIT = DE_CUIT'
      'AND DR_ESTABLECI = DE_ESTABLECI '
      'AND DR_TIPO = DE_TIPO '
      'AND DR_OPERATIVOO = DE_OPERATIVO '
      'AND DR_DIAGNOSTICO = DE_DIAGNOSTICO '
      'and 1=2')
    Left = 16
    Top = 288
    object sdqRelacionesROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object sdqRelacionesDE_DESCRIPCION1: TStringField
      FieldName = 'DE_DESCRIPCION1'
      Size = 4000
    end
    object sdqRelacionesDR_DIAGNOSTICO: TFloatField
      FieldName = 'DR_DIAGNOSTICO'
      Required = True
    end
  end
  object dsRelaciones: TDataSource
    DataSet = sdqRelaciones
    Left = 44
    Top = 288
  end
  object sdqVisitas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT RV_CUIT,'
      '       RV_ESTABLECI,'
      '       RV_RECOMENDACION,'
      '       RV_TIPO,'
      
        '       IIF_CHAR(RV_TIPO, '#39'S'#39', '#39'Seguimiento'#39', '#39'Incumplimiento'#39') T' +
        'IPO,'
      '       RV_FECHA,  RV_FECHAALTA, RV_USUALTA'
      'FROM PRV_RECVISITAS'
      'WHERE RV_FECHABAJA IS NULL'
      ''
      'AND 1=2')
    Left = 16
    Top = 316
  end
  object dsVisitas: TDataSource
    DataSet = sdqVisitas
    Left = 44
    Top = 316
  end
  object sdVisitas: TSortDialog
    Caption = 'Orden'
    DataSet = sdqVisitas
    SortFields = <
      item
        Title = 'Tipo'
        DataField = 'TIPO'
        FieldIndex = 0
      end
      item
        Title = 'Fecha'
        DataField = 'RV_FECHA'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 72
    Top = 316
  end
  object sdqRepRecomendaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AutoCalcFields = False
    AfterScroll = sdqRepRecomendacionesAfterScroll
    OnCalcFields = sdqRepRecomendacionesCalcFields
    Left = 16
    Top = 204
    object sdqRepRecomendacionesRE_RECOMENDACION: TFloatField
      FieldName = 'RE_RECOMENDACION'
      Required = True
    end
    object sdqRepRecomendacionesRE_DESCRIPCION1: TStringField
      DisplayWidth = 4000
      FieldName = 'RE_DESCRIPCION1'
      Size = 4000
    end
    object sdqRepRecomendacionesRE_DESCRIPCION2: TStringField
      FieldName = 'RE_DESCRIPCION2'
      Size = 3900
    end
    object sdqRepRecomendacionesRE_CUMPLIMIENTO: TDateTimeField
      FieldName = 'RE_CUMPLIMIENTO'
    end
    object sdqRepRecomendacionesRE_SEGUIMIENTO: TDateTimeField
      FieldName = 'RE_SEGUIMIENTO'
    end
    object sdqRepRecomendacionesRV_FECHA: TDateTimeField
      FieldName = 'RV_FECHA'
      Required = True
    end
    object sdqRepRecomendacionesTIPO_VISITA: TStringField
      FieldName = 'TIPO_VISITA'
      Size = 14
    end
    object sdqRepRecomendacionesDESCRIPCION: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRIPCION'
      Size = 8000
      Calculated = True
    end
    object sdqRepRecomendacionesRE_RESPONSABLE: TStringField
      FieldName = 'RE_RESPONSABLE'
      Size = 50
    end
  end
  object qpRepRecomendaciones: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Nro.Rec.'
        TitleAlignment = taCenter
        DataField = 'RE_RECOMENDACION'
        Alignment = taCenter
        SubTotalGroup = True
        MaxLines = 1
        MaxLength = 9
      end
      item
        Title = 'F.Cump'
        TitleAlignment = taCenter
        DataField = 'RE_CUMPLIMIENTO'
        Alignment = taCenter
        MaxLines = 1
        MaxLength = 10
      end
      item
        Title = 'Seguimiento'
        TitleAlignment = taCenter
        DataField = 'RE_SEGUIMIENTO'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'DESCRIPCION'
        MaxLines = 40
        MaxLength = 175
      end
      item
        Title = 'Fecha'
        TitleAlignment = taCenter
        DataField = 'RV_FECHA'
        Alignment = taCenter
        MaxLines = 1
        MaxLength = 15
      end
      item
        Title = 'Tipo'
        DataField = 'TIPO_VISITA'
        MaxLines = 1
        MaxLength = 15
      end>
    DataSource = dsRepRecomendaciones
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Recomendaciones por Establecimiento'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Detail.MaxLines = 40
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
    PageOrientation = pxLandscape
    PageSize = psLegal
    OnGetCellParams = qpRepRecomendacionesGetCellParams
    Left = 72
    Top = 204
  end
  object dsRepRecomendaciones: TDataSource
    DataSet = sdqRepRecomendaciones
    Left = 44
    Top = 204
  end
  object qryDiagnosticos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT de_cuit, de_estableci, de_tipo, de_operativo, de_diagnost' +
        'ico,'
      '         TO_CHAR(de_diagnostico)'
      '       || '#39' - '#39
      
        '       || IIF_CHAR(de_tipo_diagnostico, '#39'C'#39', '#39'Causales de Accide' +
        'nte'#39', '#39'Riesgo Potencial'#39')'
      '       || '#39': '#39
      '       || de_descripcion1 de_descripcion1,'
      '       de_diagnostico checked'
      '  FROM pde_diagestableci'
      ' WHERE de_fechabaja IS NULL'
      '   AND de_cuit = :fcuit'
      '   AND de_estableci = :festableci'
      '   AND de_tipo = :ftipo'
      '   AND de_operativo = :foperativo'
      '   AND NOT EXISTS ('
      '          SELECT 1'
      '            FROM pdr_diagporrec'
      '           WHERE dr_cuit = de_cuit'
      '             AND dr_estableci = de_estableci'
      '             AND dr_tipo = de_tipo'
      '             AND dr_operativo = de_operativo'
      '             AND dr_diagnostico = de_diagnostico'
      '             AND dr_recomendacion = :frecomendacion'
      '             AND dr_fechabaja IS NULL)'
      'UNION'
      
        'SELECT de_cuit, de_estableci, de_tipo, de_operativo, de_diagnost' +
        'ico,'
      '         TO_CHAR(de_diagnostico)'
      '       || '#39' - '#39
      
        '       || IIF_CHAR(de_tipo_diagnostico, '#39'C'#39', '#39'Causales de Accide' +
        'nte'#39', '#39'Riesgo Potencial'#39')'
      '       || '#39': '#39
      '       || de_descripcion1 de_descripcion1,'
      '       10000+de_diagnostico checked'
      '  FROM pde_diagestableci'
      ' WHERE de_fechabaja IS NULL'
      '   AND de_cuit = :fcuit'
      '   AND de_estableci = :festableci'
      '   AND de_tipo = :ftipo'
      '   AND de_operativo = :foperativo'
      '   AND EXISTS ('
      '          SELECT 1'
      '            FROM pdr_diagporrec'
      '           WHERE dr_cuit = de_cuit'
      '             AND dr_estableci = de_estableci'
      '             AND dr_tipo = de_tipo'
      '             AND dr_operativo = de_operativo'
      '             AND dr_diagnostico = de_diagnostico'
      '             AND dr_recomendacion = :frecomendacion'
      '             AND dr_fechabaja IS NULL)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 132
    Top = 292
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fcuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'festableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ftipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'foperativo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'frecomendacion'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fcuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'festableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ftipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'foperativo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'frecomendacion'
        ParamType = ptInput
      end>
  end
  object SDQuery1: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqRecomendacionesAfterScroll
    SQL.Strings = (
      'SELECT RE_RECOMENDACION, RE_DESCRIPCION1, RE_DESCRIPCION2,'
      '               RE_CUMPLIMIENTO, RE_SEGUIMIENTO, RE_RESPONSABLE'
      'FROM PRE_RECOMENDACIONES'
      'WHERE 1=2')
    Left = 79
    Top = 119
    object FloatField1: TFloatField
      FieldName = 'RE_RECOMENDACION'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'RE_DESCRIPCION1'
      Size = 4000
    end
    object StringField2: TStringField
      FieldName = 'RE_DESCRIPCION2'
      Size = 3900
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'RE_CUMPLIMIENTO'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'RE_SEGUIMIENTO'
    end
    object StringField3: TStringField
      FieldName = 'RE_RESPONSABLE'
      Size = 50
    end
  end
  object sccVisitas: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
      end
      item
        Key = 16461
      end
      item
        Key = 46
      end
      item
        Key = 16463
      end
      item
        Key = 16453
        LinkControl = tbVisQuitar
      end
      item
        Key = 16457
      end
      item
        Key = 16449
      end
      item
        Key = 16470
        LinkControl = tbVisAgregar
      end>
    Left = 188
    Top = 260
  end
  object sdqHistorico: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   re_recomendacion, re_descripcion1, re_descripcion2, hp_' +
        'cumplimiento, hp_seguimiento, hp_fechamodif, hp_usumodif'
      '    FROM hys.hhp_historicoprs, art.pre_recomendaciones'
      '   WHERE re_id = hp_idrecomendacion'
      '     AND re_id = :re_id'
      'ORDER BY hp_id DESC'
      '')
    Left = 17
    Top = 345
    ParamData = <
      item
        DataType = ftUnknown
        Name = 're_id'
        ParamType = ptInput
      end>
  end
  object dsHistorico: TDataSource
    DataSet = sdqHistorico
    Left = 46
    Top = 344
  end
  object sdqPlanVisitas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT _pv_cuit, pv_estableci, pv_fecha, pv_fechaalta, pv_usualt' +
        'a,'
      '       pv_fechabaja, pv_usubaja, pv_fechaexport, pv_usuexport,'
      '       pv_fechamodif, pv_usumodif, pv_operativo, pv_tipo, pv_id'
      'FROM hys.hpv_planvisitas'
      'WHERE  1=2')
    Left = 17
    Top = 373
  end
  object dsPlanVisitas: TDataSource
    DataSet = sdqPlanVisitas
    Left = 46
    Top = 373
  end
  object sdPlanVisitas: TSortDialog
    Caption = 'Orden'
    DataSet = sdqPlanVisitas
    SortFields = <
      item
        Title = 'Fecha'
        DataField = 'PV_FECHA'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 74
    Top = 373
  end
end
