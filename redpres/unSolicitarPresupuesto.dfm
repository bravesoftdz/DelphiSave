inherited frmSolicitarPresupuesto: TfrmSolicitarPresupuesto
  Left = 446
  Top = 154
  Width = 780
  Height = 547
  Caption = 'AMP | Solicitud de presupuestos'
  Constraints.MinHeight = 540
  Constraints.MinWidth = 780
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter1: TJvNetscapeSplitter [0]
    Left = 502
    Top = 317
    Height = 184
    Align = alRight
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
  end
  inherited pnlFiltros: TPanel
    Width = 772
    Height = 288
    AutoSize = True
    object gbFiltros: TJvgGroupBox
      Left = 0
      Top = 0
      Width = 772
      Height = 288
      Align = alTop
      Caption = 'Filtros'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionAlignment = fcaWidth
      CaptionBorder.Inner = bvRaised
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.FromColor = 10461087
      CaptionGradient.ToColor = clSilver
      CaptionGradient.Active = True
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
      Options = [fgoCanCollapse, fgoCollapseOther, fgoResizeParent, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 1
      GlyphCollapsed.Data = {
        DE000000424DDE0000000000000076000000280000000F0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
        7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
        FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
        FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFF0}
      GlyphExpanded.Data = {
        DE000000424DDE0000000000000076000000280000000F0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
        7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
        FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
        FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFF0}
      FullHeight = 64
      object gbPrestador: TJvgGroupBox
        Left = 2
        Top = 155
        Width = 768
        Height = 115
        Align = alTop
        Caption = ' Prestador / Datos del presupuesto '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Border.Inner = bvNone
        Border.Outer = bvNone
        Border.Bold = False
        CaptionAlignment = fcaWidth
        CaptionBorder.Inner = bvRaised
        CaptionBorder.Outer = bvNone
        CaptionBorder.Bold = False
        CaptionGradient.FromColor = 10461087
        CaptionGradient.ToColor = clSilver
        CaptionGradient.Active = True
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
        Options = [fgoCanCollapse, fgoCollapseOther, fgoResizeParent, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
        GroupIndex = 3
        GlyphCollapsed.Data = {
          DE000000424DDE0000000000000076000000280000000F0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
          7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
          FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
          FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
          FFF0}
        GlyphExpanded.Data = {
          DE000000424DDE0000000000000076000000280000000F0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
          7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
          FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
          FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
          FFF0}
        FullHeight = 115
        object Panel2: TPanel
          Left = 2
          Top = 16
          Width = 764
          Height = 97
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            764
            97)
          inline fraCA_IDENTIFICADOR: TfraPrestador
            Left = 4
            Top = 6
            Width = 758
            Height = 50
            VertScrollBar.Range = 49
            Anchors = [akLeft, akTop, akRight]
            AutoScroll = False
            TabOrder = 0
            DesignSize = (
              758
              50)
            inherited lbCUIT: TLabel
              Width = 24
            end
            inherited lbSec: TLabel
              Width = 21
            end
            inherited lbIdentif: TLabel
              Width = 40
            end
            inherited lbRSocial: TLabel
              Width = 38
            end
            inherited lbDomicilio: TLabel
              Width = 40
            end
            inherited lbCPostal: TLabel [5]
              Left = 686
              Width = 13
            end
            inherited lbTelefono: TLabel [6]
              Left = 598
              Visible = True
            end
            inherited lbLocalidad: TLabel [7]
              Width = 44
            end
            inherited cmbPrestFantasia: TArtComboBox
              Width = 213
            end
            inherited cmbPrestador: TArtComboBox
              Width = 428
            end
            inherited edPresDomicilio: TEdit
              Width = 249
            end
            inherited edPresLocalidad: TEdit
              Width = 241
            end
            inherited edPresCPostal: TEdit
              Left = 703
              Width = 54
            end
            inherited edPresTelefono: TEdit
              Left = 618
              Width = 66
              Visible = True
            end
            inherited sdqDatos: TSDQuery
              Top = 52
            end
            inherited dsDatos: TDataSource
              Top = 52
            end
          end
          object chkPendientes: TCheckBox
            Left = 172
            Top = 60
            Width = 234
            Height = 17
            Hint = 'Muestra s'#243'lo solicitudes con presupuestos pendientes de recibir'
            Caption = 'Solicitudes con presup. pendientes de recibir'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = chkPendientesClick
          end
          object chkAntiguos: TCheckBox
            Left = 414
            Top = 60
            Width = 165
            Height = 17
            Hint = 
              'Omite los presupuestos sin constestar pero que se hayan enviado ' +
              'hace mas de dos semanas'
            Caption = 'Omitir presupuestos antiguos'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object chkSinEnviar: TCheckBox
            Left = 414
            Top = 79
            Width = 160
            Height = 17
            Hint = 'Muestra los pedidos de presupuesto sin enviar a ning'#250'n prestador'
            Caption = 'Sin enviar a ning'#250'n prestador'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object chkSinPresupuesto: TCheckBox
            Left = 4
            Top = 60
            Width = 153
            Height = 17
            Hint = 'Muestra las solicitudes que no tengan presupuesto relacionado'
            Caption = 'Solicitudes Pendientes'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object chkMenosDe3Presupuestos: TCheckBox
            Left = 187
            Top = 80
            Width = 218
            Height = 17
            Hint = 
              'Muestra los pedidos de presupuesto que fueron solicitados a meno' +
              's de tres prestadores'
            Caption = 'Solicitudes con menos de 3 presupuestos'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
          end
          object rgBajas: TRadioGroup
            Left = 578
            Top = 58
            Width = 185
            Height = 37
            Caption = 'Ver Bajas'
            Columns = 3
            ItemIndex = 2
            Items.Strings = (
              'Si'
              'No'
              'Todos')
            TabOrder = 6
          end
          object chkSolicSinPresPost: TCheckBox
            Left = 4
            Top = 80
            Width = 173
            Height = 17
            Hint = 
              'Solicitudes que no poseen presupuesto posterior para el mismo es' +
              'tablecimiento'
            Caption = 'Solic. sin presupuesto posterior'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 7
          end
        end
      end
      object gbEmpresa: TJvgGroupBox
        Left = 2
        Top = 16
        Width = 768
        Height = 139
        Align = alTop
        Caption = ' Empresa / Datos generales '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Border.Inner = bvNone
        Border.Outer = bvNone
        Border.Bold = False
        CaptionAlignment = fcaWidth
        CaptionBorder.Inner = bvRaised
        CaptionBorder.Outer = bvNone
        CaptionBorder.Bold = False
        CaptionGradient.FromColor = 10461087
        CaptionGradient.ToColor = clSilver
        CaptionGradient.Active = True
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
        Options = [fgoCanCollapse, fgoCollapseOther, fgoResizeParent, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
        GroupIndex = 2
        GlyphCollapsed.Data = {
          DE000000424DDE0000000000000076000000280000000F0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
          7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
          FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
          FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
          FFF0}
        GlyphExpanded.Data = {
          DE000000424DDE0000000000000076000000280000000F0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
          7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
          FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
          FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
          FFF0}
        FullHeight = 139
        object pnlSubFiltros: TPanel
          Left = 2
          Top = 16
          Width = 764
          Height = 121
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            764
            121)
          object Label1: TLabel
            Left = 136
            Top = 100
            Width = 36
            Height = 13
            Caption = 'Usuario'
          end
          object Label2: TLabel
            Left = 468
            Top = 100
            Width = 85
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Fecha de solicitud'
          end
          object Label3: TLabel
            Left = 652
            Top = 100
            Width = 16
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '>>'
          end
          object Label4: TLabel
            Left = 14
            Top = 15
            Width = 24
            Height = 13
            Caption = 'CUIT'
          end
          object Label5: TLabel
            Left = 8
            Top = 100
            Width = 54
            Height = 13
            Caption = 'N'#176' Solicitud'
          end
          inline fraSP_CONTRATO: TfraEmpresa
            Left = 42
            Top = 12
            Width = 720
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            DesignSize = (
              720
              21)
            inherited lbContrato: TLabel
              Left = 616
            end
            inherited edContrato: TIntEdit
              Left = 661
            end
            inherited cmbRSocial: TArtComboBox
              Width = 478
            end
          end
          inline fraES_NROESTABLECI: TfraEstablecimiento
            Left = 5
            Top = 42
            Width = 757
            Height = 49
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            DesignSize = (
              757
              49)
            inherited lbLocalidad: TLabel
              Left = 523
              Width = 44
            end
            inherited lbEstableci: TLabel
              Width = 31
            end
            inherited lbCPostal: TLabel
              Left = 686
              Width = 21
            end
            inherited lbDomicilio: TLabel
              Top = 32
              Width = 40
            end
            inherited lbProvincia: TLabel
              Left = 523
              Top = 32
              Width = 43
            end
            inherited cmbDescripcion: TArtComboBox
              Width = 436
            end
            inherited edLocalidad: TEdit
              Left = 575
            end
            inherited edCPostal: TEdit
              Left = 710
            end
            inherited edDomicilio: TEdit
              Top = 28
              Width = 466
            end
            inherited edProvincia: TEdit
              Left = 575
              Top = 28
            end
            inherited sdqDatos: TSDQuery
              Top = 52
            end
            inherited dsDatos: TDataSource
              Top = 52
            end
          end
          object edSP_FECHASOLICITUDDesde: TDateComboBox
            Left = 560
            Top = 96
            Width = 88
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 4
          end
          object edSP_FECHASOLICITUDHasta: TDateComboBox
            Left = 672
            Top = 96
            Width = 88
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 5
          end
          inline fraSP_USUARIO: TfraUsuarios
            Left = 176
            Top = 96
            Width = 287
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            DesignSize = (
              287
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 60
              Width = 224
            end
            inherited edCodigo: TPatternEdit
              Width = 59
            end
          end
          object edSP_ID: TIntEdit
            Left = 68
            Top = 96
            Width = 61
            Height = 21
            TabOrder = 2
          end
        end
      end
      object gbLocalidades: TJvgGroupBox
        Left = 2
        Top = 270
        Width = 768
        Height = 16
        Align = alTop
        Caption = ' Localidades '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Border.Inner = bvNone
        Border.Outer = bvNone
        Border.Bold = False
        CaptionAlignment = fcaWidth
        CaptionBorder.Inner = bvRaised
        CaptionBorder.Outer = bvNone
        CaptionBorder.Bold = False
        CaptionGradient.FromColor = 10461087
        CaptionGradient.ToColor = clSilver
        CaptionGradient.Active = True
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
        Options = [fgoCanCollapse, fgoCollapseOther, fgoResizeParent, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
        GroupIndex = 4
        GlyphCollapsed.Data = {
          DE000000424DDE0000000000000076000000280000000F0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
          7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
          FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
          FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
          FFF0}
        GlyphExpanded.Data = {
          DE000000424DDE0000000000000076000000280000000F0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
          7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
          FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
          FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
          FFF0}
        FullHeight = 163
        inline fraES_PROVINCIA: TfraCodDesc
          Left = 2
          Top = 16
          Width = 764
          Height = 23
          Align = alTop
          TabOrder = 1
          Visible = False
          DesignSize = (
            764
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 24
            Width = 740
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            Width = 25
          end
          inherited Propiedades: TPropiedadesFrame
            FieldBaja = 'null'
            FieldCodigo = 'pv_codigo'
            FieldDesc = 'pv_descripcion'
            FieldID = 'pv_codigo'
            OrderBy = 'pv_descripcion'
            TableName = 'cpv_provincias'
            OnChange = fraES_PROVINCIAChange
            Left = 88
          end
        end
        object cblLocalidades: TARTCheckListBox
          Left = 2
          Top = 58
          Width = 764
          Height = 103
          Align = alClient
          BevelEdges = []
          Columns = 1
          ItemHeight = 13
          PopupMenu = pmuLocalidades
          TabOrder = 0
          Visible = False
          AutoAjustarColumnas = True
          Locked = False
          SQL = 
            'SELECT DISTINCT CP_LOCALIDAD, CP_LOCALIDAD FROM ART.CCP_CODIGOPO' +
            'STAL ORDER BY 1'
        end
        object pnlSoloGBA: TPanel
          Left = 2
          Top = 39
          Width = 764
          Height = 19
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 2
          Visible = False
          object chkSoloGBA: TCheckBox
            Left = 2
            Top = 3
            Width = 140
            Height = 13
            Caption = 'S'#243'lo localidades del GBA'
            TabOrder = 0
            OnClick = chkSoloGBAClick
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 288
    Width = 772
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 768
      end>
    inherited ToolBar: TToolBar
      Width = 755
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Ajustar pantalla (Optimiza el ancho)'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbEnviarMail: TToolButton
        Hint = 'Enviar al prestador'
        Enabled = True
        Visible = True
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 317
    Width = 502
    Height = 184
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmuGrilla
    TitleFont.Name = 'Tahoma'
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnGetCellParams = GridGetCellParams
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECKBOX'
        Title.Caption = '.'
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_ID'
        Title.Caption = 'N'#250'mero'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'C.U.I.T.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Caption = 'N'#176' Est.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Establecimiento'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTAL'
        Title.Caption = 'C'#243'digo Postal'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_FECHASOLICITUD'
        Title.Caption = 'Solicitud'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_MAIL'
        Title.Caption = 'Correo electr'#243'nico'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Solicitante'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sp_motivobaja'
        Title.Caption = 'Motivo baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_OBSERVACION'
        Width = 100
        Visible = True
      end>
  end
  object pnlRight: TPanel [4]
    Left = 512
    Top = 317
    Width = 260
    Height = 184
    Align = alRight
    TabOrder = 4
    object SeparadorVertical: TJvNetscapeSplitter
      Left = 1
      Top = 121
      Width = 258
      Height = 10
      Cursor = crVSplit
      Align = alTop
      Maximized = False
      Minimized = False
      ButtonCursor = crDefault
    end
    object GridPrestadores: TArtDBGrid
      Left = 1
      Top = 154
      Width = 258
      Height = 317
      Hint = 'Click derecho ofrece opciones'
      Align = alClient
      DataSource = dsPrestadores
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = pmuReimpresionPresupuesto
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Visible = False
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'CA_IDENTIFICADOR'
          Title.Caption = 'Id'
          Width = 21
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CA_DESCRIPCION'
          Title.Caption = 'Prestador'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SD_FECHA_CORREO'
          Title.Caption = 'Correo'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SD_FECHA_IMPRESION'
          Title.Caption = 'Impresi'#243'n'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SD_FECHA_FAX'
          Title.Caption = 'Fax'
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RECIBIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Wingdings'
          Font.Style = []
          Title.Caption = 'R'
          Width = 11
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SD_MONTOPRESUPUESTADO'
          Width = 50
          Visible = True
        end>
    end
    object tbPrestadores: TToolBar
      Left = 1
      Top = 131
      Width = 258
      Height = 23
      AutoSize = True
      ButtonHeight = 23
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = imgPopUp
      Images = imgPopUp
      TabOrder = 1
      object ToolButton7: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbMarcarComoRecibido: TToolButton
        Left = 8
        Top = 0
        Action = acMarcarComoRecibido
        ParentShowHint = False
        ShowHint = True
      end
      object tbReimprimirPresupuesto: TToolButton
        Left = 31
        Top = 0
        Action = acReimprimirPresupuesto
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton9: TToolButton
        Left = 54
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbNotificarAMP: TToolButton
        Left = 62
        Top = 0
        Hint = 'Notificar a quien solicit'#243' el an'#225'lsis'
        Caption = 'Notificar a quien solicit'#243' el an'#225'lsis'
        ImageIndex = 2
        OnClick = tbNotificarAMPClick
      end
      object tbSeparador2: TToolButton
        Left = 85
        Top = 0
        Width = 8
        Caption = 'tbSeparador2'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object pnlTotalPresupuestados: TPanel
        Left = 93
        Top = 0
        Width = 94
        Height = 23
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        DesignSize = (
          94
          23)
        object edPresupuestados: TEdit
          Left = 8
          Top = 2
          Width = 82
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          BevelInner = bvLowered
          BevelOuter = bvNone
          Color = clSilver
          ReadOnly = True
          TabOrder = 0
          Text = 'edPresupuestados'
          OnChange = edPresupuestadosChange
        end
      end
    end
    object gbFiltroEstudios: TJvgGroupBox
      Left = 1
      Top = 1
      Width = 258
      Height = 120
      Align = alTop
      Caption = 'Detalle de Estudios'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionAlignment = fcaWidth
      CaptionBorder.Inner = bvNone
      CaptionBorder.Outer = bvNone
      CaptionBorder.Sides = []
      CaptionBorder.Bold = False
      CaptionGradient.FromColor = 10461087
      CaptionGradient.ToColor = clSilver
      CaptionGradient.Active = True
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      CaptionTextStyle = fstVolumetric
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
      Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 10
      GlyphCollapsed.Data = {
        DE000000424DDE0000000000000076000000280000000F0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
        7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
        FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
        FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFF0}
      GlyphExpanded.Data = {
        DE000000424DDE0000000000000076000000280000000F0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
        7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
        FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
        FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFF0}
      OnCollapsed = gbFiltroEstudiosCollapsed
      OnExpanded = gbFiltroEstudiosExpanded
      FullHeight = 120
      object GridEstudios: TArtDBGrid
        Left = 2
        Top = 16
        Width = 254
        Height = 80
        Align = alClient
        DataSource = dsEstudios
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'ESTUDIO'
            Title.Caption = 'Estudio'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD'
            Title.Caption = 'Cantidad'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Width = 47
            Visible = True
          end>
      end
      object pnlEstudios: TPanel
        Left = 2
        Top = 96
        Width = 254
        Height = 22
        Align = alBottom
        BevelInner = bvLowered
        Caption = 'Estudios: '
        TabOrder = 1
      end
      object RichEditAux: TRxRichEdit
        Left = 141
        Top = -13
        Width = 680
        Height = 89
        TabOrder = 2
        Visible = False
      end
    end
    object DBAdvCardListPrestadores: TDBAdvCardList
      Left = 1
      Top = 154
      Width = 258
      Height = 317
      DataSource = dsPrestadores
      CardTemplate.CardCaptionHeight = 16
      CardTemplate.CardWidth = 174
      CardTemplate.DefaultItem.Caption = 'AdvCardTemplateItem0'
      CardTemplate.DefaultItem.CaptionFont.Charset = DEFAULT_CHARSET
      CardTemplate.DefaultItem.CaptionFont.Color = clWindowText
      CardTemplate.DefaultItem.CaptionFont.Height = -11
      CardTemplate.DefaultItem.CaptionFont.Name = 'Tahoma'
      CardTemplate.DefaultItem.CaptionFont.Style = []
      CardTemplate.DefaultItem.ItemEditor = ieText
      CardTemplate.DefaultItem.Name = 'AdvCardTemplateItem0'
      CardTemplate.DefaultItem.Tag = 0
      CardTemplate.DefaultItem.ValueFont.Charset = DEFAULT_CHARSET
      CardTemplate.DefaultItem.ValueFont.Color = clWindowText
      CardTemplate.DefaultItem.ValueFont.Height = -11
      CardTemplate.DefaultItem.ValueFont.Name = 'Tahoma'
      CardTemplate.DefaultItem.ValueFont.Style = []
      CardTemplate.HorMargins = 5
      CardTemplate.Indent = 2
      CardTemplate.ItemLabelWidth = 64
      CardTemplate.Items = <
        item
          Caption = 'Identificador'
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          ItemEditor = ieText
          Name = 'DBAdvCardTemplateItem0'
          Tag = 0
          ValueFont.Charset = DEFAULT_CHARSET
          ValueFont.Color = clWindowText
          ValueFont.Height = -11
          ValueFont.Name = 'Tahoma'
          ValueFont.Style = []
          FieldName = 'CA_IDENTIFICADOR'
        end
        item
          Caption = 'Correo'
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          ItemEditor = ieText
          Name = 'DBAdvCardTemplateItem1'
          Tag = 0
          ValueFont.Charset = DEFAULT_CHARSET
          ValueFont.Color = clWindowText
          ValueFont.Height = -11
          ValueFont.Name = 'Tahoma'
          ValueFont.Style = []
          FieldName = 'SD_FECHA_CORREO'
        end
        item
          Caption = 'Impresi'#243'n'
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          ItemEditor = ieText
          Name = 'DBAdvCardTemplateItem2'
          Tag = 0
          ValueFont.Charset = DEFAULT_CHARSET
          ValueFont.Color = clWindowText
          ValueFont.Height = -11
          ValueFont.Name = 'Tahoma'
          ValueFont.Style = []
          FieldName = 'SD_FECHA_IMPRESION'
        end
        item
          Caption = 'Fax'
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          ItemEditor = ieText
          Name = 'DBAdvCardTemplateItem3'
          Tag = 0
          ValueFont.Charset = DEFAULT_CHARSET
          ValueFont.Color = clWindowText
          ValueFont.Height = -11
          ValueFont.Name = 'Tahoma'
          ValueFont.Style = []
          FieldName = 'SD_FECHA_FAX'
        end
        item
          Caption = 'Recibido'
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          ItemEditor = ieText
          Name = 'DBAdvCardTemplateItem5'
          Tag = 0
          ValueFont.Charset = DEFAULT_CHARSET
          ValueFont.Color = clMaroon
          ValueFont.Height = -13
          ValueFont.Name = 'Wingdings'
          ValueFont.Style = []
          FieldName = 'RECIBIDO'
        end
        item
          Caption = 'Recepci'#243'n'
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          ItemEditor = ieText
          Name = 'DBAdvCardTemplateItem4'
          Tag = 0
          ValueFont.Charset = DEFAULT_CHARSET
          ValueFont.Color = clWindowText
          ValueFont.Height = -11
          ValueFont.Name = 'Tahoma'
          ValueFont.Style = []
          FieldName = 'SD_FECHA_RECEPCION'
        end
        item
          Caption = 'Monto'
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          ItemEditor = ieText
          Name = 'DBAdvCardTemplateItem6'
          Tag = 0
          ValueFont.Charset = DEFAULT_CHARSET
          ValueFont.Color = clWindowText
          ValueFont.Height = -11
          ValueFont.Name = 'Tahoma'
          ValueFont.Style = []
          FieldName = 'SD_MONTOPRESUPUESTADO'
        end>
      CardTemplate.ItemSpacing = 0
      CardTemplate.VertMargins = 5
      CardTemplate.CaptionFieldName = 'CA_DESCRIPCION'
      Align = alClient
      TabOrder = 3
      DockOrientation = doNoOrient
      PopupMenu = pmuReimpresionPresupuesto
      AutoEdit = False
      BorderColor = 12164479
      CardEditingAppearance.BevelOuter = bvNone
      CardEditingAppearance.BorderColor = clBtnFace
      CardEditingAppearance.CaptionColor.Color = clNavy
      CardEditingAppearance.CaptionFont.Charset = DEFAULT_CHARSET
      CardEditingAppearance.CaptionFont.Color = clWhite
      CardEditingAppearance.CaptionFont.Height = -11
      CardEditingAppearance.CaptionFont.Name = 'Tahoma'
      CardEditingAppearance.CaptionFont.Style = [fsBold]
      CardEditingAppearance.Color.Color = clInfoBk
      CardEditingAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
      CardEditingAppearance.ItemLabelFont.Color = clWindowText
      CardEditingAppearance.ItemLabelFont.Height = -11
      CardEditingAppearance.ItemLabelFont.Name = 'Tahoma'
      CardEditingAppearance.ItemLabelFont.Style = []
      CardEditingAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
      CardEditingAppearance.ItemEditFont.Color = clWindowText
      CardEditingAppearance.ItemEditFont.Height = -11
      CardEditingAppearance.ItemEditFont.Name = 'Tahoma'
      CardEditingAppearance.ItemEditFont.Style = []
      CardNormalAppearance.BevelOuter = bvNone
      CardNormalAppearance.CaptionColor.Color = clBtnFace
      CardNormalAppearance.CaptionFont.Charset = DEFAULT_CHARSET
      CardNormalAppearance.CaptionFont.Color = clBlack
      CardNormalAppearance.CaptionFont.Height = -11
      CardNormalAppearance.CaptionFont.Name = 'Tahoma'
      CardNormalAppearance.CaptionFont.Style = [fsBold]
      CardNormalAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
      CardNormalAppearance.ItemLabelFont.Color = clWindowText
      CardNormalAppearance.ItemLabelFont.Height = -11
      CardNormalAppearance.ItemLabelFont.Name = 'Tahoma'
      CardNormalAppearance.ItemLabelFont.Style = []
      CardNormalAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
      CardNormalAppearance.ItemEditFont.Color = clWindowText
      CardNormalAppearance.ItemEditFont.Height = -11
      CardNormalAppearance.ItemEditFont.Name = 'Tahoma'
      CardNormalAppearance.ItemEditFont.Style = []
      CardSelectedAppearance.BevelOuter = bvNone
      CardSelectedAppearance.BorderColor = clBtnFace
      CardSelectedAppearance.CaptionColor.Color = clNavy
      CardSelectedAppearance.CaptionFont.Charset = DEFAULT_CHARSET
      CardSelectedAppearance.CaptionFont.Color = clWhite
      CardSelectedAppearance.CaptionFont.Height = -11
      CardSelectedAppearance.CaptionFont.Name = 'Tahoma'
      CardSelectedAppearance.CaptionFont.Style = [fsBold]
      CardSelectedAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
      CardSelectedAppearance.ItemLabelFont.Color = clWindowText
      CardSelectedAppearance.ItemLabelFont.Height = -11
      CardSelectedAppearance.ItemLabelFont.Name = 'Tahoma'
      CardSelectedAppearance.ItemLabelFont.Style = []
      CardSelectedAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
      CardSelectedAppearance.ItemEditFont.Color = clWindowText
      CardSelectedAppearance.ItemEditFont.Height = -11
      CardSelectedAppearance.ItemEditFont.Name = 'Tahoma'
      CardSelectedAppearance.ItemEditFont.Style = []
      CardHoverAppearance.BevelOuter = bvNone
      CardHoverAppearance.BorderColor = clSilver
      CardHoverAppearance.CaptionColor.Color = clBtnFace
      CardHoverAppearance.CaptionFont.Charset = DEFAULT_CHARSET
      CardHoverAppearance.CaptionFont.Color = clBlack
      CardHoverAppearance.CaptionFont.Height = -11
      CardHoverAppearance.CaptionFont.Name = 'Tahoma'
      CardHoverAppearance.CaptionFont.Style = [fsBold]
      CardHoverAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
      CardHoverAppearance.ItemLabelFont.Color = clWindowText
      CardHoverAppearance.ItemLabelFont.Height = -11
      CardHoverAppearance.ItemLabelFont.Name = 'Tahoma'
      CardHoverAppearance.ItemLabelFont.Style = []
      CardHoverAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
      CardHoverAppearance.ItemEditFont.Color = clWindowText
      CardHoverAppearance.ItemEditFont.Height = -11
      CardHoverAppearance.ItemEditFont.Name = 'Tahoma'
      CardHoverAppearance.ItemEditFont.Style = []
      CardHorSpacing = 5
      CardVertSpacing = 5
      Color.Color = clSilver
      ColumnSizing = False
      ColumnWidth = 184
      DelayedCardLoad = False
      DelayedCardLoadInterval = 100
      GridLineWidth = 2
      ReadOnly = True
      ShowGridLine = False
      Version = '1.2.2.3'
    end
    object rgTipo: TAdvOfficeRadioGroup
      Left = 1
      Top = 153
      Width = 258
      Height = 30
      BorderStyle = bsNone
      CaptionPosition = cpTopCenter
      Version = '1.2.1.0'
      Align = alBottom
      ParentBackground = False
      ParentCtl3D = True
      TabOrder = 4
      OnClick = rgTipoClick
      ButtonVertAlign = tlCenter
      Ellipsis = False
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Tarjetas'
        'Grilla')
    end
  end
  object fpPrestador: TFormPanel [5]
    Left = -50
    Top = 349
    Width = 565
    Height = 121
    Caption = 'Seleccione el prestador'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpPrestadorBeforeShow
    DesignSize = (
      565
      121)
    object Bevel1: TBevel
      Left = 0
      Top = 72
      Width = 565
      Height = 49
      Align = alBottom
      Shape = bsTopLine
    end
    inline fraPrestadorSolicitud: TfraPrestador
      Left = 6
      Top = 12
      Width = 547
      Height = 50
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      AutoScroll = False
      TabOrder = 0
      DesignSize = (
        547
        50)
      inherited lbCUIT: TLabel
        Width = 24
      end
      inherited lbSec: TLabel
        Width = 21
      end
      inherited lbIdentif: TLabel
        Width = 40
      end
      inherited lbRSocial: TLabel
        Width = 38
      end
      inherited lbDomicilio: TLabel
        Width = 40
      end
      inherited lbLocalidad: TLabel
        Left = 238
        Width = 44
      end
      inherited lbCPostal: TLabel
        Left = 475
        Width = 13
      end
      inherited lbTelefono: TLabel
        Left = 385
        Visible = True
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 92
      end
      inherited cmbPrestador: TArtComboBox
        Width = 217
      end
      inherited edPresDomicilio: TEdit
        Width = 185
      end
      inherited edPresLocalidad: TEdit
        Left = 288
        Width = 93
      end
      inherited edPresCPostal: TEdit
        Left = 492
      end
      inherited edPresTelefono: TEdit
        Left = 406
        Visible = True
      end
      inherited sdqDatos: TSDQuery
        Top = 52
      end
      inherited dsDatos: TDataSource
        Top = 52
      end
    end
    object btnCancelar: TButton
      Left = 476
      Top = 84
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object btnSolicitar: TButton
      Left = 400
      Top = 84
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Solicitar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnSolicitarClick
    end
  end
  object sbInfo: TStatusBar [6]
    Left = 0
    Top = 501
    Width = 772
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object fpMotivoBaja: TFormPanel [7]
    Left = 34
    Top = 24
    Width = 315
    Height = 186
    Caption = 'Motivo de la Baja'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    DesignSize = (
      315
      186)
    object Bevel7: TBevel
      Left = 4
      Top = 144
      Width = 306
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object edMotivoBaja: TMemo
      Left = 6
      Top = 6
      Width = 303
      Height = 132
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
    end
    object btnAceptarBaja: TButton
      Left = 158
      Top = 154
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAceptarBajaClick
    end
    object btnCancelarBaja: TButton
      Left = 234
      Top = 154
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object fpRecepcionPresupuesto: TFormPanel [8]
    Left = 28
    Top = 358
    Width = 600
    Height = 208
    Caption = 'Recepci'#243'n del Presupuesto'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    OnShow = fpRecepcionPresupuestoShow
    Constraints.MaxHeight = 208
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 208
    Constraints.MinWidth = 600
    DesignSize = (
      600
      208)
    object bvl1: TBevel
      Left = 4
      Top = 166
      Width = 591
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lblMonto: TLabel
      Left = 148
      Top = 88
      Width = 105
      Height = 13
      Caption = 'Monto presupuestado'
    end
    object lblPrestador: TLabel
      Left = 16
      Top = 16
      Width = 47
      Height = 13
      Caption = 'Prestador'
    end
    object btnAceptarRecepcionPresupuesto: TButton
      Left = 443
      Top = 176
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarRecepcionPresupuestoClick
    end
    object btnCancelarRecepcionPresupuesto: TButton
      Left = 519
      Top = 176
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object edMontoRecepcionPresupuesto: TCurrencyEdit
      Left = 148
      Top = 108
      Width = 113
      Height = 21
      AutoSize = False
      TabOrder = 2
    end
    inline fraPrestadorRecepcionPresupuesto: TfraPrestador
      Left = 13
      Top = 32
      Width = 575
      Height = 52
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      AutoScroll = False
      TabOrder = 3
      DesignSize = (
        575
        52)
      inherited lbCUIT: TLabel
        Width = 24
      end
      inherited lbSec: TLabel
        Width = 21
      end
      inherited lbIdentif: TLabel
        Width = 40
      end
      inherited lbRSocial: TLabel
        Width = 38
      end
      inherited lbDomicilio: TLabel
        Width = 40
      end
      inherited lbLocalidad: TLabel
        Width = 44
      end
      inherited lbCPostal: TLabel
        Left = 503
        Width = 13
      end
      inherited lbTelefono: TLabel
        Left = 415
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 143
      end
      inherited cmbPrestador: TArtComboBox
        Width = 245
      end
      inherited edPresLocalidad: TEdit
        Width = 149
      end
      inherited edPresCPostal: TEdit
        Left = 520
      end
      inherited edPresTelefono: TEdit
        Left = 416
      end
      inherited sdqDatos: TSDQuery
        Left = 188
        Top = 4
      end
      inherited dsDatos: TDataSource
        Left = 216
        Top = 4
      end
    end
    object rgAceptaPresupuestar: TRadioGroup
      Left = 16
      Top = 84
      Width = 121
      Height = 45
      Caption = ' Envi'#243' el Presupuesto '
      Columns = 2
      Items.Strings = (
        'S'#237
        'No')
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    BeforeOpen = sdqConsultaBeforeOpen
    AfterClose = sdqConsultaAfterClose
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT 0 AS checkbox, sp_id, em_cuit, em_nombre, es_nombre, es_c' +
        'postal, sp_fechasolicitud, se_nombre, se_mail, es_id,'
      
        '       es_nroestableci, es_localidad, co_contrato, pv_descripcio' +
        'n, sp_fechabaja, sp_motivobaja, es_fechabaja, co_estado,'
      
        '       sp_observacion, art.afiliacion.is_empresavip(co_contrato)' +
        ' AS empresa_vip, co_fechabaja,'
      '       (SELECT tb_descripcion'
      '          FROM art.ctb_tablas'
      '         WHERE tb_clave = '#39'MOTIB'#39
      '           AND tb_codigo = co_motivobaja'
      
        '           AND co_fechabaja IS NOT NULL) AS motivo_baja, (SELECT' +
        ' tb_descripcion'
      
        '                                                            FROM' +
        ' art.ctb_tablas'
      
        '                                                           WHERE' +
        ' tb_clave = '#39'AFEST'#39
      
        '                                                             AND' +
        ' tb_codigo = co_estado) AS estado,'
      '       (SELECT 1'
      '          FROM DUAL'
      '         WHERE EXISTS(SELECT DISTINCT 1'
      
        '                                 FROM hys.v_trabajadores_con_rie' +
        'sgo, aem_empresa,'
      
        '                                      aes_establecimiento establ' +
        'e, aco_contrato, aes_estudios estudios,'
      '                                      hys.hur_ultimorelevamiento'
      '                                WHERE em_id = co_idempresa'
      
        '                                  AND estudios.es_id = rs_idestu' +
        'dio'
      '                                  AND estudios.es_sincosto = '#39'N'#39
      
        '                                  AND estable.es_id = estab.es_i' +
        'd'
      
        '                                  AND estable.es_contrato = co_c' +
        'ontrato'
      
        '                                  AND rs_idestableci = estable.e' +
        's_id'
      '                                  AND rs_fecha = ur_fecharelev'
      '                                  AND rs_periodicidad <='
      
        '                                        DECODE((SELECT NVL(sp_op' +
        'erativo, art.amp.get_operativoproxlote(rs_idestableci))'
      
        '                                                  FROM comunes.c' +
        'sp_solicitudpresupuesto otro'
      
        '                                                 WHERE sp_contra' +
        'to = co_contrato'
      
        '                                                   AND sp_idesta' +
        'blecimiento = rs_idestableci'
      
        '                                                   AND otro.sp_i' +
        'd = csp.sp_id),'
      '                                               '#39'S'#39', 6,'
      '                                               '#39'A'#39', 24,'
      '                                               '#39'R'#39', -1,'
      '                                               24)'
      '                                  AND ur_cuit = em_cuit'
      
        '                                  AND ur_estableci = estable.es_' +
        'nroestableci'
      '                             GROUP BY rs_descripcion_estudio'
      '                      UNION ALL'
      '                      SELECT DISTINCT 1'
      
        '                                 FROM afi.aes_establecimiento ae' +
        's, hys.hdl_detallelote hdl, art.aes_estudios,'
      
        '                                      hys.hre_reconfirmacionestu' +
        'dio hre, hys.hgr_gestionreconfirmacion hgr'
      '                                WHERE dl_id = gr_iddetallelote'
      '                                  AND sp_contrato = es_contrato'
      
        '                                  AND sp_idestablecimiento = dl_' +
        'idestableci'
      '                                  AND sp_operativo = '#39'R'#39
      '                                  AND aes.es_id = dl_idestableci'
      
        '                                  AND dl_idestableci = estab.es_' +
        'id'
      '                                  AND dl_id = gr_iddetallelote'
      '                                  AND es_codigo = re_idestudio'
      '                                  AND re_fechabaja IS NULL'
      
        '                                  AND re_idreconfirmacion = gr_i' +
        'd'
      '                                  AND gr_enfprofesional = '#39'N'#39
      '                                  AND gr_idpresupuesto = sp_id'
      '                                  AND gr_fechabaja IS NULL'
      '                                  AND gr_estado = '#39'AP'#39
      
        '                             GROUP BY es_descripcion)) AS sin_es' +
        'tudio'
      
        '  FROM art.use_usuarios, art.cpv_provincias, aem_empresa, aes_es' +
        'tablecimiento estab, aco_contrato,'
      '       comunes.csp_solicitudpresupuesto csp'
      ' WHERE em_id = co_idempresa'
      '   AND es_contrato = co_contrato'
      '   AND sp_idestablecimiento = es_id'
      '   AND sp_contrato = co_contrato'
      '   AND sp_usuario = se_usuario'
      '   AND pv_codigo = es_provincia'
      '')
    Left = 16
    Top = 384
    object sdqConsultaCHECKBOX: TFloatField
      FieldName = 'CHECKBOX'
    end
    object sdqConsultaSP_ID: TFloatField
      FieldName = 'SP_ID'
      Required = True
    end
    object sdqConsultaEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Required = True
      Size = 11
    end
    object sdqConsultaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqConsultaES_NOMBRE: TStringField
      FieldName = 'ES_NOMBRE'
      Required = True
      Size = 100
    end
    object sdqConsultaES_CPOSTAL: TStringField
      FieldName = 'ES_CPOSTAL'
      Size = 5
    end
    object sdqConsultaSP_FECHASOLICITUD: TDateTimeField
      FieldName = 'SP_FECHASOLICITUD'
      Required = True
    end
    object sdqConsultaSE_NOMBRE: TStringField
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
    object sdqConsultaSE_MAIL: TStringField
      FieldName = 'SE_MAIL'
      Size = 100
    end
    object sdqConsultaES_ID: TFloatField
      FieldName = 'ES_ID'
      Required = True
    end
    object sdqConsultaES_NROESTABLECI: TFloatField
      FieldName = 'ES_NROESTABLECI'
      Required = True
    end
    object sdqConsultaCO_CONTRATO: TFloatField
      FieldName = 'CO_CONTRATO'
      Required = True
    end
    object sdqConsultaES_LOCALIDAD: TStringField
      FieldName = 'ES_LOCALIDAD'
      Size = 60
    end
    object sdqConsultaPV_DESCRIPCION: TStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PV_DESCRIPCION'
      Size = 50
    end
    object sdqConsultasp_fechabaja: TDateTimeField
      FieldName = 'sp_fechabaja'
    end
    object sdqConsultasp_motivobaja: TStringField
      FieldName = 'sp_motivobaja'
      Size = 255
    end
    object sdqConsultaES_FECHABAJA: TDateTimeField
      FieldName = 'ES_FECHABAJA'
    end
    object sdqConsultaMOTIVO_BAJA: TStringField
      FieldName = 'MOTIVO_BAJA'
      Size = 150
    end
    object sdqConsultaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 150
    end
    object sdqConsultaCO_ESTADO: TStringField
      FieldName = 'CO_ESTADO'
      Required = True
      Size = 2
    end
    object sdqConsultaCO_FECHABAJA: TDateTimeField
      FieldName = 'CO_FECHABAJA'
    end
    object sdqConsultaSIN_ESTUDIO: TFloatField
      FieldName = 'SIN_ESTUDIO'
    end
    object sdqConsultaEMPRESA_VIP: TStringField
      FieldName = 'EMPRESA_VIP'
      Size = 4000
    end
    object sdqConsultaSP_OBSERVACION: TStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'SP_OBSERVACION'
      Size = 4000
    end
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 384
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 412
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 412
  end
  inherited QueryPrint: TQueryPrint
    Left = 44
    Top = 440
  end
  inherited Seguridad: TSeguridad
    Left = 16
    Top = 356
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'gbFiltroEstudios.Collapsed'
      'SeparadorVertical.Visible'
      'gbFiltroEstudios.Height'
      'gbFiltros.Collapsed'
      'gbLocalidades.Collapsed'
      'gbEmpresa.Collapsed'
      'gbPrestador.Collapsed'
      'pnlRight.Width'
      'rgTipo.ItemIndex')
    Left = 44
    Top = 356
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 440
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
    Left = 72
    Top = 356
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 72
    Top = 384
  end
  object ShortCutControlHijo: TShortCutControl
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
    Left = 72
    Top = 412
  end
  object sdqEstudios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqEstudiosAfterOpen
    SQL.Strings = (
      'SELECT   '
      '         rs_descripcion_estudio estudio, '#39'AMP'#39' tipo,'
      
        '         COUNT(DISTINCT rs_idtrabajador || rs_idestudio) AS cant' +
        'idad'
      '    FROM hys.v_trabajadores_con_riesgo, aem_empresa,'
      
        '         aes_establecimiento estable, aco_contrato, aes_estudios' +
        ' estudios,'
      '         hys.hur_ultimorelevamiento'
      '   WHERE em_id = co_idempresa'
      '     AND estudios.es_id = rs_idestudio'
      '     AND estudios.es_sincosto = '#39'N'#39
      '     AND estable.es_id = :idestablecimiento'
      '     AND estable.es_contrato = co_contrato'
      '     AND rs_idestableci = estable.es_id'
      '     AND rs_fecha = ur_fecharelev'
      '     AND rs_periodicidad <='
      '           DECODE'
      '                 ((SELECT NVL(sp_operativo,'
      
        '                              art.amp.get_operativoproxlote(rs_i' +
        'destableci))'
      '                     FROM comunes.csp_solicitudpresupuesto'
      '                    WHERE sp_contrato = co_contrato'
      '                      AND sp_idestablecimiento = rs_idestableci'
      '                      AND sp_id = :idsolicitudpresupuesto),'
      '                  '#39'S'#39', 6,'
      '                  '#39'A'#39', 24,'
      '                  '#39'R'#39', -1,'
      '                  24)'
      '     AND ur_cuit = em_cuit'
      '     AND ur_estableci = estable.es_nroestableci'
      'GROUP BY rs_descripcion_estudio'
      'UNION ALL'
      'SELECT   '
      '         es_descripcion estudio, '#39'REC'#39' tipo,'
      '         COUNT(dl_idtrabajador || re_idestudio) AS cantidad'
      
        '    FROM comunes.csp_solicitudpresupuesto, afi.aes_establecimien' +
        'to aes,'
      '         hys.hdl_detallelote hdl, art.aes_estudios,'
      
        '         hys.hre_reconfirmacionestudio hre, hys.hgr_gestionrecon' +
        'firmacion hgr'
      '   WHERE dl_id = gr_iddetallelote'
      '     AND sp_contrato = es_contrato'
      '     AND sp_idestablecimiento = dl_idestableci'
      '     AND sp_id = :idsolicitudpresupuesto'
      '     AND sp_operativo = '#39'R'#39
      '     AND aes.es_id = dl_idestableci'
      '     AND dl_idestableci = :idestablecimiento'
      '     AND dl_id = gr_iddetallelote'
      '     AND es_codigo = re_idestudio'
      '     AND re_fechabaja IS NULL'
      '     AND re_idreconfirmacion = gr_id'
      '     AND gr_enfprofesional = '#39'N'#39
      '     and gr_idpresupuesto = sp_id'
      '     AND gr_fechabaja IS NULL'
      '     AND gr_estado = '#39'AP'#39
      'GROUP BY es_descripcion'
      'ORDER BY 3 DESC, 2 ASC'
      '')
    Left = 216
    Top = 398
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idestablecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idsolicitudpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idsolicitudpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idestablecimiento'
        ParamType = ptInput
      end>
    object sdqEstudiosESTUDIO: TStringField
      FieldName = 'ESTUDIO'
      Required = True
      Size = 100
    end
    object sdqEstudiosCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
    end
    object sdqEstudiosTIPO: TStringField
      FieldName = 'TIPO'
      Size = 6
    end
  end
  object dsEstudios: TDataSource
    DataSet = sdqEstudios
    Left = 244
    Top = 398
  end
  object pmuGrilla: TPopupMenu
    OwnerDraw = True
    Left = 72
    Top = 440
    object mnuSeleccionarTodos: TMenuItem
      Caption = 'Seleccionar todos'
      OnClick = mnuSeleccionarTodosClick
    end
    object mnuNoSeleccionarNinguno: TMenuItem
      Caption = 'No seleccionar ning'#250'n presupuesto'
      OnClick = mnuNoSeleccionarNingunoClick
    end
  end
  object sdqPrestadores: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPrestadoresAfterOpen
    AfterClose = sdqPrestadoresAfterClose
    SQL.Strings = (
      
        '  SELECT ca_identificador, ca_descripcion, sd_fecha_correo, sd_f' +
        'echa_impresion, sd_fecha_fax, sd_nrosolicitud,'
      
        '         sd_idprestador, sd_fecha_recepcion, sd_usurecepcion, de' +
        'code(sd_fecha_recepcion, null, '#39#251#39', '#39#252#39') recibido,'
      '         sd_montopresupuestado'
      
        '    FROM comunes.csd_solicitud_det_presupuesto, art.cpr_prestado' +
        'r'
      '   WHERE sd_idsolicitudpresupuesto = :param'
      '     AND sd_idprestador = ca_identificador'
      'ORDER BY sd_montopresupuestado')
    Left = 216
    Top = 426
    ParamData = <
      item
        DataType = ftString
        Name = 'param'
        ParamType = ptInput
        Value = '0'
      end>
    object sdqPrestadoresCA_DESCRIPCION: TStringField
      FieldName = 'CA_DESCRIPCION'
      Size = 150
    end
    object sdqPrestadoresSD_FECHA_CORREO: TDateTimeField
      FieldName = 'SD_FECHA_CORREO'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
    object sdqPrestadoresSD_FECHA_IMPRESION: TDateTimeField
      FieldName = 'SD_FECHA_IMPRESION'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
    object sdqPrestadoresSD_FECHA_FAX: TDateTimeField
      FieldName = 'SD_FECHA_FAX'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
    object sdqPrestadoresSD_NROSOLICITUD: TFloatField
      FieldName = 'SD_NROSOLICITUD'
      Required = True
    end
    object sdqPrestadoresSD_IDPRESTADOR: TFloatField
      FieldName = 'SD_IDPRESTADOR'
      Required = True
    end
    object sdqPrestadoresSD_FECHA_RECEPCION: TDateTimeField
      FieldName = 'SD_FECHA_RECEPCION'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
    object sdqPrestadoresSD_USURECEPCION: TStringField
      FieldName = 'SD_USURECEPCION'
    end
    object sdqPrestadoresRECIBIDO: TStringField
      FieldName = 'RECIBIDO'
      Size = 1
    end
    object sdqPrestadoresCA_IDENTIFICADOR: TFloatField
      FieldName = 'CA_IDENTIFICADOR'
      Required = True
    end
    object sdqPrestadoresSD_MONTOPRESUPUESTADO: TFloatField
      DisplayLabel = 'Monto'
      FieldName = 'SD_MONTOPRESUPUESTADO'
    end
  end
  object dsPrestadores: TDataSource
    DataSet = sdqPrestadores
    Left = 244
    Top = 426
  end
  object pmuReimpresionPresupuesto: TPopupMenu
    Images = imgPopUp
    OwnerDraw = True
    Left = 272
    Top = 426
    object mnuReimprimirPresupuesto: TMenuItem
      Action = acReimprimirPresupuesto
    end
    object mnuMarcarComoRecibido: TMenuItem
      Action = acMarcarComoRecibido
    end
  end
  object imgPopUp: TImageList
    DrawingStyle = dsTransparent
    Left = 300
    Top = 426
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      0000424242007373730084848400000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A00CECECE00CECECE00CECE
      CE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600B5B5B500B5B5B5004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      420073737300C6C6C600B5B5B500424242000000000000000000000000000000
      0000000000000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A00D6D6D600EFEFEF00EFEF
      EF00DEDEDE00D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600C6C6C6009C9C9C004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00CECECE009C9C9C00424242007373
      7300A5A5A500C6C6C60042424200000000000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A005A5A5A00CECECE00DEDE
      DE00DEDEDE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600B5B5B5005A5A5A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00CECECE009C9C9C00CECECE004242420073737300A5A5
      A500B5B5B5004242420000000000000000000000000000000000000000000000
      0000848484008484840063636300848484008484840000000000000000000000
      0000000000000000000000000000000000004A4A4A00E7E7E7005A5A5A00C6C6
      C600D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00B5B5B5005A5A5A00B5B5B5004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00CECECE009C9C9C00CECECE009C9C9C004242420073737300A5A5A500B5B5
      B500424242000000000000000000000000000000000000000000000000008484
      8400848484006363630000000000636363008484840000000000000000000000
      0000000000000000000000000000000000004A4A4A00E7E7E700DEDEDE005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A00E7E7E700C6C6C6004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100DEDEDE004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200FFFFFF003131310000000000000000000000000000000000848484008484
      8400636363000000000000000000636363008484840084848400000000000000
      0000000000000000000000000000000000004A4A4A00E7E7E7005A5A5A00DEDE
      DE00DEDEDE00DEDEDE00C6C6C600C6C6C600C6C6C600DEDEDE00C6C6C600DEDE
      DE00DEDEDE005A5A5A00C6C6C6004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242009C9C
      9C00CECECE00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630084848400000000000000
      0000000000000000000000000000000000004A4A4A005A5A5A004A4A4A00EFEF
      EF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00DEDE
      DE00EFEFEF004A4A4A005A5A5A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200CECECE009C9C
      9C009C9C9C00FFFFFF0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300848484000000
      0000000000000000000000000000000000004A4A4A00B5B5B5004A4A4A00EFEF
      EF00DEDEDE00DEDEDE00C6C6C600DEDEDE00DEDEDE00C6C6C600C6C6C600DEDE
      DE00EFEFEF004A4A4A00B5B5B5004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C600424242009C9C9C00CECE
      CE009C9C9C00CECECE00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300848484008484
      840000000000000000000000000000000000000000004A4A4A004A4A4A00EFEF
      EF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00C6C6C600DEDE
      DE00EFEFEF004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200CECECE00CECE
      CE00FFFFFF00FFFFFF00FFFFFF00313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363008484
      84000000000000000000000000000000000000000000000000004A4A4A00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      63008484840000000000000000000000000000000000000000004A4A4A00EFEF
      EF00DEDEDE00C6C6C600C6C6C600EFEFEF00EFEFEF00EFEFEF00EFEFEF00D6E7
      E700DEDEDE004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A5004242420094949400DEDE
      DE00C6C6C6003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006363630084848400000000000000000000000000000000004A4A4A00F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF00C6C6C6004A4A
      4A004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C6008484840042424200DEDEDE00B5B5B5001818
      1800636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063636300848484000000000000000000000000004A4A4A00F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF0084848400EFEF
      EF00DEDEDE004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242008484840084848400848484003131
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000636363000000000000000000000000004A4A4A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400DEDE
      DE00636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006363630000000000000000004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FF18FFFF00000000FC00FEFF00000000
      F000FCFF00000000C001F8FF00000000C003F07F00000000C003E27F00000000
      8003C63F000000000001FF3F000000008001FF9F000000000000FF8F80010000
      0000FFCFC00300000000FFE7C00300000001FFF3C00300008003FFF9C0030000
      C007FFFDC0070000E00FFFFEC00F000000000000000000000000000000000000
      000000000000}
  end
  object XPMenu: TXPMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = True
    Active = True
    Left = 16
    Top = 440
  end
  object alPrestadores: TActionList
    Images = imgPopUp
    Left = 188
    Top = 426
    object acMarcarComoRecibido: TAction
      Caption = 'Marcar como recibido'
      Hint = 'Marcar como recibido'
      ImageIndex = 1
      OnExecute = acMarcarComoRecibidoExecute
    end
    object acReimprimirPresupuesto: TAction
      Caption = 'Reimprimir Presupuesto'
      Hint = 'Reimprimir Presupuesto'
      ImageIndex = 0
      OnExecute = acReimprimirPresupuestoExecute
    end
  end
  object pmuLocalidades: TPopupMenu
    OwnerDraw = True
    Left = 100
    Top = 440
    object mnuSeleccionarTodas: TMenuItem
      Caption = 'Seleccionar todas'
      OnClick = mnuSeleccionarTodasClick
    end
    object mnuNoSeleccionarNinguna: TMenuItem
      Caption = 'No seleccionar ninguna'
      OnClick = mnuNoSeleccionarNingunaClick
    end
  end
end
