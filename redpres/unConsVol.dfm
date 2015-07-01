object frmConsVol: TfrmConsVol
  Left = 571
  Top = 148
  Caption = 'Consulta de Volante'
  ClientHeight = 568
  ClientWidth = 820
  Color = clBtnFace
  Constraints.MinHeight = 411
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter1: TJvNetscapeSplitter
    Left = 0
    Top = 445
    Width = 820
    Height = 9
    Cursor = crVSplit
    Align = alBottom
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 229
    Width = 820
    Height = 32
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        Width = 814
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 807
      Height = 25
      Caption = 'ToolBar'
      Color = clBtnFace
      Images = ImageList
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'Refrescar (F5)'
        ImageIndex = 0
        OnClick = tbRefrescarClick
      end
      object tbDetalles: TToolButton
        Left = 23
        Top = 0
        Hint = 'Detalle del Volante (Ctrl+D)'
        Caption = 'tbDetalles'
        ImageIndex = 2
        OnClick = tbDetallesClick
      end
      object tbLimpiar: TToolButton
        Left = 46
        Top = 0
        Hint = 'Limpiar Filtros (Ctrl+L)'
        Caption = 'tbLimpiar'
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object tbOrden: TToolButton
        Left = 69
        Top = 0
        Hint = 'Orden (Ctrl+O)'
        ImageIndex = 7
        OnClick = tbOrdenClick
      end
      object tbImprimir: TToolButton
        Left = 92
        Top = 0
        Hint = 'Imprimir Resultados (Ctrl+I)'
        Caption = 'tbImprimir'
        DropdownMenu = pMnuImpresiones
        ImageIndex = 3
        Style = tbsDropDown
        OnClick = tbImprimirClick
      end
      object tbEnviarMail: TToolButton
        Left = 130
        Top = 0
        Hint = 'Enviar por mail al prestador'
        Caption = 'tbEnviarMail'
        DropdownMenu = pMnuEnviarMail
        ImageIndex = 30
        Style = tbsDropDown
        OnClick = tbEnviarMailClick
      end
      object tbExportar: TToolButton
        Left = 168
        Top = 0
        DropdownMenu = pMnuExportar
        ImageIndex = 18
        Style = tbsDropDown
        OnClick = tbExportarClick
      end
      object SEP3: TToolButton
        Left = 206
        Top = 0
        Width = 8
        Caption = 'SEP3'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbCancelar: TToolButton
        Left = 214
        Top = 0
        Hint = 'Cancelar Volante'
        Caption = 'tbCancelar'
        DropdownMenu = pMnuCancelar
        ImageIndex = 8
        Style = tbsDropDown
        OnClick = tbCancelarClick
      end
      object tbDesAprobar: TToolButton
        Left = 252
        Top = 0
        Hint = 'Desaprobar Volante (Ctrl+A)'
        Caption = 'tbDesAprobar'
        ImageIndex = 12
        OnClick = tbDesAprobarClick
      end
      object tbFechaTerm: TToolButton
        Left = 275
        Top = 0
        Hint = 'Fecha de terminaci'#243'n'
        Caption = 'tbFechaTerm'
        ImageIndex = 32
        OnClick = tbFechaTermClick
      end
      object ToolButton2: TToolButton
        Left = 298
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbAuditoria: TToolButton
        Left = 306
        Top = 0
        Hint = 'Auditor'#237'a/discrepancias (Ctrl+U)'
        DropdownMenu = pMnuAuditoria
        ImageIndex = 27
        Style = tbsDropDown
        OnClick = tbAuditoriaClick
      end
      object tbAuditoriaOrtopedia: TToolButton
        Left = 344
        Top = 0
        Hint = 'Auditor'#237'a Ortopedia (Ctrl+T)'
        ImageIndex = 29
        OnClick = tbAuditoriaOrtopediaClick
      end
      object tbMarcarNoAuditable: TToolButton
        Left = 367
        Top = 0
        Hint = 'Marcar volante como "No Auditable"'
        Caption = 'Marcar volante como "No Auditable"'
        DropdownMenu = pMnuNoAuditable
        ImageIndex = 28
        Style = tbsDropDown
      end
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 5
        Wrap = True
        Style = tbsSeparator
      end
      object tbDerivar: TToolButton
        Left = 0
        Top = 30
        Hint = 'Derivar (Ctrl+R)'
        ImageIndex = 25
        OnClick = tbDerivarClick
      end
      object tbReasignar: TToolButton
        Left = 23
        Top = 30
        Hint = 'Reasignar (Ctrl+G)'
        ImageIndex = 24
        OnClick = tbReasignarClick
      end
      object tbReasignarAudit: TToolButton
        Left = 46
        Top = 30
        Hint = 'Reasignar auditor'#237'a'
        Caption = 'tbReasignarAudit'
        ImageIndex = 33
        OnClick = tbReasignarAuditClick
      end
      object SEP4: TToolButton
        Left = 69
        Top = 30
        Width = 8
        Caption = 'SEP4'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbTotales: TToolButton
        Left = 77
        Top = 30
        Hint = 'Sumatoria de los Montos'
        Down = True
        ImageIndex = 10
        Style = tbsCheck
        OnClick = tbTotalesClick
      end
      object tbTotPorEstado: TToolButton
        Left = 100
        Top = 30
        Hint = 'Totales por Estado (Ctrl+E)'
        ImageIndex = 11
        OnClick = tbTotPorEstadoClick
      end
      object tbCtaCte: TToolButton
        Left = 123
        Top = 30
        Hint = 'Cuenta Corriente'
        Caption = 'Cuenta Corriente'
        ImageIndex = 17
        Style = tbsCheck
        OnClick = tbCtaCteClick
      end
      object tbDebitoTotal: TToolButton
        Left = 146
        Top = 30
        Hint = 'D'#233'bito Total'
        Caption = 'tbDebitoTotal'
        Enabled = False
        ImageIndex = 31
        OnClick = tbDebitoTotalClick
      end
      object tbHistorico: TToolButton
        Left = 169
        Top = 30
        Hint = 'Hist'#243'rico de Estados (Ctrl + H)'
        Caption = 'tbHistorico'
        ImageIndex = 32
        OnClick = tbHistoricoClick
      end
      object tbVerTemporarios: TToolButton
        Left = 192
        Top = 30
        Hint = 'Ver temporarios'
        Caption = 'tbVerTemporarios'
        ImageIndex = 19
        Style = tbsCheck
        OnClick = tbVerTemporariosClick
      end
      object tbPasarTemporarios: TToolButton
        Left = 215
        Top = 30
        Hint = 'Pasar temporarios'
        Caption = 'tbPasarTemporarios'
        DropdownMenu = pMnuTmp
        Enabled = False
        ImageIndex = 20
        Style = tbsDropDown
        OnClick = tbPasarTemporariosClick
      end
      object tbEliminarTemporarios: TToolButton
        Left = 253
        Top = 30
        Hint = 'Eliminar temporario'
        Caption = 'tbEliminarTemporarios'
        Enabled = False
        ImageIndex = 21
        OnClick = tbEliminarTemporariosClick
      end
      object tbImpExpTemporarios: TToolButton
        Left = 276
        Top = 30
        Hint = 'Imprimir/exportar temporarios/traspasados'
        Caption = 'tbImpExpTemporarios'
        DropdownMenu = pMnuTmpImpExp
        ImageIndex = 22
        Style = tbsDropDown
        OnClick = tbImpExpTemporariosClick
      end
      object tbOcultarMostrar: TToolButton
        Left = 314
        Top = 30
        Hint = 'Ocultar Filtros'
        Caption = 'tbOcultarMostrar'
        ImageIndex = 6
        Style = tbsCheck
        OnClick = tbOcultarMostrarClick
      end
      object tbAsignarAuditorVolante: TToolButton
        Left = 337
        Top = 30
        Hint = 'Asignar Auditor de Volante'
        Caption = 'Asignar Auditor de Volante'
        ImageIndex = 34
        OnClick = tbAsignarAuditorVolanteClick
      end
      object tbVencimientoEgresosSem: TToolButton
        Left = 360
        Top = 30
        Hint = 'Vencimiento Egresos Semanales'
        Caption = 'Vencimiento Egresos Semanales'
        ImageIndex = 32
        OnClick = tbVencimientoEgresosSemClick
      end
      object ToolButton4: TToolButton
        Left = 383
        Top = 30
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 391
        Top = 30
        Hint = 'Salir (Ctrl+S)'
        Caption = 'Salir'
        ImageIndex = 4
        OnClick = tbSalirClick
      end
    end
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 0
    Width = 820
    Height = 229
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object pcFiltros: TPageControl
      Left = 0
      Top = 0
      Width = 820
      Height = 229
      ActivePage = tsFiltros0
      Align = alClient
      TabOrder = 0
      TabPosition = tpBottom
      object tsFiltros0: TTabSheet
        Caption = '&0-Filtros <<'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          812
          203)
        object pnlPrestador: TPanel
          Left = 166
          Top = 49
          Width = 645
          Height = 72
          Anchors = [akLeft, akTop, akRight]
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 15
          DesignSize = (
            645
            72)
          inline fraPrestador: TfraPrestador
            Left = 2
            Top = 13
            Width = 640
            Height = 52
            VertScrollBar.Range = 49
            VertScrollBar.Visible = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 2
            ExplicitTop = 13
            ExplicitWidth = 640
            ExplicitHeight = 52
            DesignSize = (
              640
              52)
            inherited lbCUIT: TLabel
              Left = 2
              ExplicitLeft = 2
            end
            inherited lbSec: TLabel
              Left = 112
              ExplicitLeft = 112
            end
            inherited lbIdentif: TLabel
              Left = 165
              ExplicitLeft = 165
            end
            inherited lbRSocial: TLabel
              Left = 246
              ExplicitLeft = 246
            end
            inherited lbCPostal: TLabel
              Left = 568
              ExplicitLeft = 568
            end
            inherited lbTelefono: TLabel
              Left = 480
              ExplicitLeft = 480
            end
            inherited mskPrestCUIT: TMaskEdit [8]
              Left = 28
              ExplicitLeft = 28
            end
            inherited cmbPrestador: TArtComboBox [9]
              Left = 286
              Width = 353
              ExplicitLeft = 286
              ExplicitWidth = 353
            end
            inherited edPresDomicilio: TEdit [10]
            end
            inherited edPresLocalidad: TEdit [11]
              Width = 214
              ExplicitWidth = 214
            end
            inherited edPresCPostal: TEdit [12]
              Left = 585
              ExplicitLeft = 585
            end
            inherited edPrestIdentif: TIntEdit [13]
              Left = 202
              Width = 41
              ExplicitLeft = 202
              ExplicitWidth = 41
            end
            inherited edPrestSecuencia: TIntEdit [14]
              Left = 135
              Width = 27
              ExplicitLeft = 135
              ExplicitWidth = 27
            end
            inherited edPresTelefono: TEdit [15]
              Left = 500
              ExplicitLeft = 500
            end
            inherited cmbPrestFantasia: TArtComboBox [16]
              Width = 574
              ExplicitWidth = 574
            end
          end
        end
        object pnlNotaDebito: TPanel
          Left = 124
          Top = 5
          Width = 124
          Height = 38
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 13
          object Label6: TLabel
            Left = 55
            Top = 16
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object edNotaDebitoDesde: TIntEdit
            Left = 5
            Top = 12
            Width = 49
            Height = 21
            Hint = 'Nota de D'#233'bito Desde'
            TabOrder = 0
            AutoExit = True
            MaxLength = 8
          end
          object edNotaDebitoHasta: TIntEdit
            Left = 68
            Top = 12
            Width = 52
            Height = 21
            Hint = 'Nota de D'#233'bito Hasta'
            TabOrder = 1
            OnEnter = edNotaDebitoHastaEnter
            AutoExit = True
            MaxLength = 8
          end
        end
        object pnlSiniestro: TPanel
          Left = 0
          Top = 5
          Width = 122
          Height = 38
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 12
          object Label7: TLabel
            Left = 55
            Top = 16
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object edNumDesde: TIntEdit
            Left = 4
            Top = 12
            Width = 50
            Height = 21
            Hint = 'Volande Desde'
            TabOrder = 0
            OnExit = edNumDesdeExit
            AutoExit = True
            MaxLength = 8
          end
          object edNumHasta: TIntEdit
            Left = 68
            Top = 12
            Width = 50
            Height = 21
            Hint = 'Volante Hasta'
            TabOrder = 1
            OnEnter = edNumHastaEnter
            AutoExit = True
            MaxLength = 8
          end
        end
        object chkPrestador: TCheckBox
          Left = 176
          Top = 43
          Width = 68
          Height = 17
          TabStop = False
          Caption = '&Prestador'
          TabOrder = 8
          OnClick = chkPrestadorClick
        end
        object cpnlRefacturacion: TCheckPanel
          Left = 319
          Top = 0
          Width = 82
          Height = 42
          Caption = 'Ref&actur.'
          TabOrder = 3
          Checked = False
          OnChange = cpnlRefacturacionChange
          DesignSize = (
            82
            42)
          object cmbRefacturacion: TComboBox
            Left = 4
            Top = 16
            Width = 74
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Items.Strings = (
              'Si'
              'No'
              'Todos')
          end
        end
        object pnlEstado: TPanel
          Left = 615
          Top = 5
          Width = 196
          Height = 38
          Anchors = [akLeft, akTop, akRight]
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 14
          DesignSize = (
            196
            38)
          object cmbEstados: TDBCheckCombo
            Left = 3
            Top = 11
            Width = 189
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DataSource = dsEstados
            KeyField = 'TB_CODIGO'
            ListField = 'TB_DESCRIPCION'
          end
        end
        object chkEstado: TCheckBox
          Left = 622
          Top = 0
          Width = 54
          Height = 13
          TabStop = False
          Caption = '&Estado'
          TabOrder = 6
          OnClick = chkEstadoClick
        end
        object cpnlAuditado: TCheckPanel
          Left = 401
          Top = 0
          Width = 84
          Height = 43
          Caption = 'V. Au&ditado'
          TabOrder = 4
          Checked = False
          OnChange = cpnlAuditadoChange
          DesignSize = (
            84
            43)
          object cmbAuditado: TComboBox
            Left = 5
            Top = 16
            Width = 75
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Items.Strings = (
              'Si'
              'Con d'#233'bito'
              'Sin d'#233'bito'
              'No'
              'Todos')
          end
        end
        object cpnlVolAjustado: TCheckPanel
          Left = 249
          Top = 0
          Width = 69
          Height = 42
          Caption = 'V. Aj&ust.'
          TabOrder = 2
          Checked = False
          OnChange = cpnlVolAjustadoChange
          DesignSize = (
            69
            42)
          object edVolAjustado: TIntEdit
            Left = 5
            Top = 15
            Width = 59
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            MaxLength = 8
          end
        end
        object pnlConNotaDebito: TPanel
          Left = 0
          Top = 49
          Width = 166
          Height = 32
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 7
          object chkConNotaDebito: TCheckBox
            Left = 4
            Top = 10
            Width = 84
            Height = 13
            TabStop = False
            Caption = 'Con nota d'#233'b.'
            TabOrder = 0
            OnClick = chkDelegacionPagoClick
          end
          object chkSinCheque: TCheckBox
            Left = 93
            Top = 11
            Width = 69
            Height = 13
            TabStop = False
            Caption = 'Sin cheque'
            TabOrder = 1
            OnClick = chkDelegacionPagoClick
          end
        end
        object pnlDelegacionPago: TPanel
          Left = 166
          Top = 126
          Width = 149
          Height = 36
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 18
          DesignSize = (
            149
            36)
          object cmbDelegacionPago: TArtComboBox
            Left = 7
            Top = 11
            Width = 139
            Height = 21
            GlyphKind = gkDropDown
            Anchors = [akLeft, akTop, akRight]
            NumGlyphs = 1
            TabOrder = 0
            Columns = <
              item
                Expanded = False
                FieldName = 'LG_NOMBRE'
                Title.Caption = 'Nombre'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIRECCION'
                Title.Caption = 'Direcci'#243'n'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LG_LOCALIDAD'
                Title.Caption = 'Localidad'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TELEFONO'
                Title.Caption = 'Tel'#233'fono'
                Width = 100
                Visible = True
              end>
            DataSource = dsDelegacionPago
            FieldList = 'LG_NOMBRE'
            FieldKey = 'LG_CODIGO'
            ClearOnCancel = True
          end
        end
        object chkDelegacionPago: TCheckBox
          Left = 174
          Top = 123
          Width = 119
          Height = 13
          TabStop = False
          Caption = 'Dele&gaci'#243'n de pago'
          TabOrder = 11
          OnClick = chkDelegacionPagoClick
        end
        object pnlDelegacion: TPanel
          Left = 0
          Top = 126
          Width = 166
          Height = 36
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 17
          DesignSize = (
            166
            36)
          object cmbDelegacion: TArtComboBox
            Left = 6
            Top = 11
            Width = 157
            Height = 21
            DirectInput = False
            GlyphKind = gkDropDown
            Anchors = [akLeft, akTop, akRight]
            NumGlyphs = 1
            TabOrder = 0
            Columns = <
              item
                Expanded = False
                FieldName = 'LG_NOMBRE'
                Title.Caption = 'Nombre'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIRECCION'
                Title.Caption = 'Direcci'#243'n'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LG_LOCALIDAD'
                Title.Caption = 'Localidad'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TELEFONO'
                Title.Caption = 'Tel'#233'fono'
                Width = 100
                Visible = True
              end>
            DataSource = dsDelegacion
            FieldList = 'LG_NOMBRE'
            FieldKey = 'LG_CODIGO'
          end
        end
        object chkDelegacion: TCheckBox
          Left = 6
          Top = 122
          Width = 122
          Height = 15
          TabStop = False
          Caption = 'De&legaci'#243'n de carga'
          TabOrder = 10
          OnClick = chkDelegacionClick
        end
        object pnlProvinciaPrestador: TPanel
          Left = 0
          Top = 84
          Width = 166
          Height = 36
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 16
          DesignSize = (
            166
            36)
          object cmbPrestProvincia: TArtComboBox
            Left = 7
            Top = 11
            Width = 153
            Height = 21
            GlyphKind = gkDropDown
            Anchors = [akLeft, akTop, akRight]
            NumGlyphs = 1
            TabOrder = 0
            Columns = <
              item
                Expanded = False
                FieldName = 'PV_CODIGO'
                Title.Caption = 'C'#243'digo'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PV_DESCRIPCION'
                Title.Caption = 'Descripci'#243'n'
                Width = 70
                Visible = True
              end>
            DataSource = dsProvinciaPrestador
            FieldList = 'PV_DESCRIPCION'
            FieldKey = 'PV_CODIGO'
          end
        end
        object chkProvinciaPrestador: TCheckBox
          Left = 6
          Top = 81
          Width = 131
          Height = 13
          TabStop = False
          Caption = 'Provin&cia del prestador'
          TabOrder = 9
          OnClick = chkProvinciaPrestadorClick
        end
        object chkNotaDebito: TCheckBox
          Left = 130
          Top = 1
          Width = 93
          Height = 14
          Hint = 'Filtrar por Nota de D'#233'bito'
          TabStop = False
          Caption = 'N&ota de d'#233'bito'
          TabOrder = 1
          OnClick = chkNotaDebitoClick
        end
        object chkNumero: TCheckBox
          Left = 6
          Top = -1
          Width = 61
          Height = 17
          Hint = 'Filtrar por Volante'
          TabStop = False
          Caption = 'Vola&nte'
          TabOrder = 0
          OnClick = chkNumeroClick
        end
        object cpnlPendAudit: TCheckPanel
          Left = 486
          Top = 0
          Width = 127
          Height = 43
          Caption = 'Pend. de auditar'
          TabOrder = 5
          Checked = False
          OnChange = cpnlPendAuditChange
          DesignSize = (
            127
            43)
          object cmbPendAuditar: TComboBox
            Left = 4
            Top = 16
            Width = 119
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Items.Strings = (
              'Ingresados a Auditor'#237'a'
              'Pendientes de ingreso'
              'Todos')
          end
        end
        object cpnlAuditorVolante: TCheckPanel
          Left = 532
          Top = 121
          Width = 279
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Usuario Auditor'
          TabOrder = 19
          Checked = False
          OnChange = cpnlAuditorVolanteChange
          DesignSize = (
            279
            41)
          inline fraUsuAuditorFiltro: TfraUsuario
            Left = 7
            Top = 16
            Width = 268
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 7
            ExplicitTop = 16
            ExplicitWidth = 268
            DesignSize = (
              268
              21)
            inherited cmbDescripcion: TArtComboBox
              Width = 184
              ExplicitWidth = 184
            end
          end
        end
        object cpnlUsuAuditoria: TCheckPanel
          Left = 315
          Top = 121
          Width = 217
          Height = 41
          Caption = 'Usuario Auditor'#237'a'
          TabOrder = 20
          Checked = False
          OnChange = cpnlUsuAuditoriaChange
          DesignSize = (
            217
            41)
          inline fraUsuarioAuditoria: TfraUsuario
            Left = 7
            Top = 16
            Width = 206
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 7
            ExplicitTop = 16
            ExplicitWidth = 206
            DesignSize = (
              206
              21)
            inherited cmbDescripcion: TArtComboBox
              Width = 122
              ExplicitWidth = 122
            end
          end
        end
      end
      object tsFechas: TTabSheet
        Caption = '&1-Fechas <<'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cpnlFecRecepCentral: TCheckPanel
          Left = 393
          Top = 52
          Width = 193
          Height = 48
          Caption = 'Fecha de Recepci'#243'n Cen&tral '
          TabOrder = 11
          Checked = False
          OnChange = cpnlFecRecepCentralChange
          object Label8: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object deFechaRecCentDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = deFechaRecCentHasta
            TabOrder = 0
          end
          object deFechaRecCentHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = deFechaRecCentDesde
            TabOrder = 1
          end
        end
        object cpnlFecRecepOrtopedia: TCheckPanel
          Left = 1
          Top = 103
          Width = 193
          Height = 48
          Caption = 'Fecha de revisi'#243'n CP'
          TabOrder = 8
          Checked = False
          OnChange = cpnlFecRecepOrtopediaChange
          object Label15: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object deFechaRecOrtDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = deFechaRecOrtHasta
            TabOrder = 0
          end
          object deFechaRecOrtHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = deFechaRecOrtDesde
            TabOrder = 1
          end
        end
        object cpnlFecRecepLiquid: TCheckPanel
          Left = 197
          Top = 103
          Width = 193
          Height = 48
          Caption = 'Fecha de recepci'#243'n &liquidaciones '
          TabOrder = 9
          Checked = False
          OnChange = cpnlFecRecepLiquidChange
          object Label16: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object deFechaRecLiqDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = deFechaRecLiqHasta
            TabOrder = 0
          end
          object deFechaRecLiqHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = deFechaRecLiqDesde
            TabOrder = 1
          end
        end
        object pnlFechaRecep: TCheckPanel
          Left = 197
          Top = 52
          Width = 193
          Height = 48
          Caption = 'Fecha de &recepci'#243'n '
          TabOrder = 5
          Checked = False
          OnChange = pnlFechaRecepChange
          object Label17: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object deFechaRecepDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = deFechaRecepHasta
            TabOrder = 0
          end
          object deFechaRecepHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = deFechaRecepDesde
            TabOrder = 1
          end
        end
        object pnlFechaAlta: TCheckPanel
          Left = 1
          Top = 52
          Width = 193
          Height = 48
          Caption = 'Fec&ha de carga '
          TabOrder = 4
          Checked = False
          OnChange = pnlFechaAltaChange
          object Label9: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object deFechaAltaDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = deFechaAltaHasta
            TabOrder = 0
          end
          object deFechaAltaHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = deFechaAltaDesde
            TabOrder = 1
          end
        end
        object pnlFechaAuto: TCheckPanel
          Left = 393
          Top = 1
          Width = 193
          Height = 48
          Caption = 'Fecha de autori&zaci'#243'n '
          TabOrder = 2
          Checked = False
          OnChange = pnlFechaAutoChange
          object Label2: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object deFechaAutoDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = deFechaAutoHasta
            TabOrder = 0
          end
          object deFechaAutoHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = deFechaAutoDesde
            TabOrder = 1
          end
        end
        object pnlFechaApro: TCheckPanel
          Left = 197
          Top = 1
          Width = 193
          Height = 48
          Caption = 'Fecha de apro&baci'#243'n '
          TabOrder = 1
          Checked = False
          OnChange = pnlFechaAproChange
          object Label3: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object deFechaAproDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = deFechaAproHasta
            TabOrder = 0
          end
          object deFechaAproHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = deFechaAproDesde
            TabOrder = 1
          end
        end
        object pnlFecha: TCheckPanel
          Left = 1
          Top = 1
          Width = 193
          Height = 48
          Caption = '&Fecha de factura '
          TabOrder = 0
          Checked = False
          OnChange = pnlFechaChange
          object Label1: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object deFechaDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = deFechaHasta
            TabOrder = 0
          end
          object deFechaHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = deFechaDesde
            TabOrder = 1
          end
        end
        object cpnlFechaAud: TCheckPanel
          Left = 393
          Top = 103
          Width = 193
          Height = 48
          Caption = 'Fecha de a&uditor'#237'a '
          TabOrder = 10
          Checked = False
          OnChange = cpnlFechaAudChange
          object Label4: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object deFechaAudDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = deFechaAudHasta
            TabOrder = 0
          end
          object deFechaAudHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = deFechaAudDesde
            TabOrder = 1
          end
        end
        object pnlFechaVenc: TCheckPanel
          Left = 393
          Top = 52
          Width = 193
          Height = 48
          Caption = 'Fecha de &vencimiento'
          TabOrder = 6
          Checked = False
          OnChange = pnlFechaVencChange
          object Label18: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object deFechaVencDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = deFechaVencHasta
            TabOrder = 0
          end
          object deFechaVencHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = deFechaVencDesde
            TabOrder = 1
          end
        end
        object cpnlFechaRecepAud: TCheckPanel
          Left = 589
          Top = 1
          Width = 193
          Height = 48
          Caption = 'Fecha recepci'#243'n de a&uditor'#237'a '
          TabOrder = 3
          Checked = False
          OnChange = cpnlFechaRecepAudChange
          object Label5: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object deFechaRecepAudDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = deFechaRecepAudHasta
            TabOrder = 0
          end
          object deFechaRecepAudHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = deFechaRecepAudDesde
            TabOrder = 1
          end
        end
        object cpnlFechaTerminacion: TCheckPanel
          Left = 589
          Top = 52
          Width = 193
          Height = 48
          Caption = 'Fecha terminaci'#243'n de derivaci'#243'n'
          TabOrder = 7
          Checked = False
          OnChange = cpnlFechaTerminacionChange
          object Label21: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object deFechaTermDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = deFechaTermHasta
            TabOrder = 0
          end
          object deFechaTermHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = deFechaTermDesde
            TabOrder = 1
          end
        end
        object pnlFechaEnvioND: TCheckPanel
          Left = 588
          Top = 103
          Width = 194
          Height = 48
          Caption = 'Fecha de env'#237'o Nota de D'#233'bito'
          TabOrder = 12
          Checked = False
          OnChange = pnlFechaEnvioNDChange
          object Label24: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object cbFechaEnvioNDDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = cbFechaEnvioNDHasta
            TabOrder = 0
          end
          object cbFechaEnvioNDHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = cbFechaEnvioNDDesde
            TabOrder = 1
          end
        end
        object cpnlFechaTraspaso: TCheckPanel
          Left = 0
          Top = 153
          Width = 194
          Height = 48
          Caption = 'Fecha de traspaso'
          TabOrder = 13
          Checked = False
          OnChange = cpnlFechaTraspasoChange
          object Label25: TLabel
            Left = 90
            Top = 24
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object dcFecTrasDesde: TDateComboBox
            Left = 4
            Top = 20
            Width = 84
            Height = 21
            MaxDateCombo = dcFecTrasHasta
            TabOrder = 0
          end
          object dcFecTrasHasta: TDateComboBox
            Left = 105
            Top = 20
            Width = 84
            Height = 21
            MinDateCombo = dcFecTrasDesde
            TabOrder = 1
          end
        end
      end
    end
  end
  object dbgListado: TArtDBGrid
    Left = 0
    Top = 261
    Width = 820
    Height = 184
    Align = alClient
    DataSource = dsDatos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pMnuImpresiones
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = tbDetallesClick
    IniStorage = FormPlacement
    MultiSelect = True
    RowColor1 = clWhite
    RowColor2 = 14811135
    OnGetCellParams = dbgListadoGetCellParams
    OnPaintFooter = dbgListadoPaintFooter
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'VO_VOLANTE'
        Title.Caption = 'Volante'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_CLAVE'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_NOMBREFANTA'
        Title.Caption = 'Nombre Fantas'#237'a'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Pcia. Prestador'
        Width = 85
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CBU'
        Title.Alignment = taCenter
        Title.Caption = 'CBU/Cuenta Prestador'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FACTURA'
        Title.Caption = 'Factura'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHALTA'
        Title.Caption = 'Fecha de Alta'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_MONTO'
        Title.Caption = 'Monto Facturado'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 112
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_MIXTO'
        Title.Alignment = taCenter
        Title.Caption = 'Mixto'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOPAGADO'
        Title.Caption = 'Monto a Pagar'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_NOTADEBITO'
        Title.Caption = 'Nota de D'#233'bito'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FACPEN'
        Title.Caption = 'Facturado Pendiente'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 276
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHARECEPCION'
        Title.Caption = 'F.Recepci'#243'n'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHARECEPCION_CENTRAL'
        Title.Caption = 'F.Rec.Central'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_VENCIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'F.Vencimiento'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_FECHAFACTURA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Factura'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHAPRO'
        Title.Caption = 'Fecha Aprob.'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_USUAPRO'
        Title.Caption = 'Usuario Aprob.'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHAPAGO'
        Title.Caption = 'Fecha Aut.Pago'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_USUPAGO'
        Title.Caption = 'Usuario Aut.Pago'
        Width = 94
        Visible = True
      end
      item
        Color = 14811135
        Expanded = False
        FieldName = 'VO_ORDENPAGO'
        Title.Caption = 'Orden de Pago'
        Visible = False
      end
      item
        Color = 14811135
        Expanded = False
        FieldName = 'TP_DESCRIPCION'
        Title.Caption = 'Tipo de Pago'
        Visible = False
      end
      item
        Color = 14811135
        Expanded = False
        FieldName = 'FECHACHEQUE'
        Title.Caption = 'Fecha del Pago'
        Visible = False
      end
      item
        Color = 14811135
        Expanded = False
        FieldName = 'VO_CHEQUE'
        Title.Caption = 'Nro.de Cheque'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ESTADOCHEQUE'
        Title.Caption = 'Estado Cheque'
        Visible = True
      end
      item
        Color = 14811135
        Expanded = False
        FieldName = 'IMPPAGADO'
        Title.Caption = 'Importe Pagado'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DELEGCARGA'
        Title.Caption = 'Deleg. de la Carga'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGPAGO'
        Title.Caption = 'Deleg. del Pago'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_AJUSTE'
        Title.Caption = 'Volante Ajustado'
        Width = 85
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_AUDITADO'
        Title.Alignment = taCenter
        Title.Caption = 'Auditado'
        Width = 52
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_AUDITCONDEBITO'
        Title.Alignment = taCenter
        Title.Caption = 'Audit.c/d'#233'b'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_USUARIOAUDITORIA'
        Title.Caption = 'Usuario Auditor'#237'a'
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_FECHAAUDITORIA'
        Title.Alignment = taCenter
        Title.Caption = 'Fec. Audi.'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_USUAVALDEBITO'
        Title.Caption = 'Usuario aval d'#233'bito'
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_FECHAAVALDEBITO'
        Title.Alignment = taCenter
        Title.Caption = 'F. aval d'#233'b.'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_REFACTURACION'
        Title.Alignment = taCenter
        Title.Caption = 'Refacturac.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_NOREQUIEREAUDI'
        Title.Caption = 'No Req. Audi'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_OBSERVACIONES_DERIVACION'
        Title.Caption = 'Observaciones de Derivaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_CARGA_CENTRAL'
        Title.Caption = 'Proceso Central'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_USUARIOORTOPEDIA'
        Title.Caption = 'Usuario Audi. Ortopedia'
        Width = 148
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_FECHAORTOPEDIA'
        Title.Alignment = taCenter
        Title.Caption = 'Fec. Audi. Ortopedia'
        Width = 108
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_FECHARECEPAUDIT'
        Title.Alignment = taCenter
        Title.Caption = 'Fec. Recep. Audit.'
        Width = 108
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_FECHAREVISIONCP'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Revisi'#243'n CP'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_FECHARECEPLIQUID'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Recep. Liquid.'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_VOLANTECANCELA'
        Title.Alignment = taCenter
        Title.Caption = 'Volante que cancela a'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_VOLANTECANCELADO'
        Title.Alignment = taCenter
        Title.Caption = 'Volante reemplazado por'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALDEBITO'
        Title.Caption = 'Total d'#233'bito'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VO_FECHATERMINACION'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha term. derivaci'#243'n'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_USUAUDITOR'
        Title.Caption = 'Usuario Auditor'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECUSUAUDITOR'
        Title.Caption = 'Fec. Asign. Usu Audit.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHAENVIOND'
        Title.Caption = 'Env'#237'o Nota de D'#233'bito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vo_fechaenviondauto'
        Title.Caption = 'Env'#237'o Nota de D'#233'bito Auto.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vo_volantetemp'
        Title.Caption = 'Volante Temporal'
        Visible = True
      end>
  end
  object gbDetalleEstudios: TJvgGroupBox
    Left = 0
    Top = 454
    Width = 820
    Height = 114
    Hint = 'Mostrar/Ocultar Trabajadores'#13#10'de la Empresa/Establecimiento'
    Align = alBottom
    Caption = 'Detalle de estudios AMP'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Border.Inner = bvSpace
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvSpace
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = clSilver
    CaptionGradient.Active = False
    CaptionGradient.BufferedDraw = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Text = clHighlightText
    Colors.TextActive = clWhite
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBlue
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    GlyphCollapsed.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA47755BA
      865DBB865EA87958FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFA3773FDA9D3CCF924DC1875CC58A66D6976AECA76AAF7E59FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA98047E2AD42DFAB42AA7A5D57
      3CA8573CA8A67467EDA864F5AD6DBA865CFF00FFFF00FFFF00FFFF00FFFF00FF
      9F7B54E8BD66E6BE6EE5BD6F9E77790000FF0000FF8F6672DEA03CEAA65EF5AE
      6DAF7E59FF00FFFF00FFFF00FFFF00FFDFBC7CEECE8FECCE96ECCF96AA84840C
      0EFF0000FF987077DBA63BDEA13DEDA864ECA76AFF00FFFF00FFFF00FF9A7C60
      F2D7A0B49289A88996A9899385679E2E2FFF1113FF67499F976F78916771A674
      67D6976AA87958FF00FFFF00FFB09477F9E5BB8C73AB696EFF6365FF5658FF49
      49FD3535FD1819FF0002FF0000FF4F36AEC48967BB865EFF00FFFF00FFB0977F
      FDF0D38D73AD6D72FF6E6FFF6869FF5D5DFC4E4EFD3A3BFF2123FF0104FF5036
      AEBF875DBA855DFF00FFFF00FF9B8170FDF3DEBFA4A6B59BAAB69BA7977BA06A
      6BFE5F60FF896C9EAA8583A27B78AA7A5CCF934DA47756FF00FFFF00FFFF00FF
      EBDFCFFFFEF5FEFDFCFFFEFDB89EAA6F70FF6B6CFFAC8C94ECCE96E5BC6EDFAA
      40DA9E3DFF00FFFF00FFFF00FFFF00FFA58E80FEFCF3FFFFFDFEFDFBB499A96D
      71FF6D71FFA88996ECCE95E6BD6DE2AC41A37740FF00FFFF00FFFF00FFFF00FF
      FF00FFAD978BFEFBF3FFFDF5BEA3A59279AE9177ABB5928AEECE8EE8BC65A980
      46FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA58E80EADFCFFDF3DDFD
      EFD1F9E5BAF2D79EDFBB7B9F7B54FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF9B816FB0977FB094769B7B60FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    GlyphExpanded.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA77855B9
      855DBA855DAB7B59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF9F743FD59A3AE7A641EBA74CF0AA5DF5AD6AE8A469AE7E59FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08649E5B046E0AD46DCA83FDB
      A337DBA034E1A144EDA863F6AF6DC28B5EFF00FFFF00FFFF00FFFF00FFFF00FF
      9F7B53EABE67E6BE6EE5BD6FE4BA68E1B55DDEAD4ADAA335DFA03FECA763F6AE
      6DAE7E59FF00FFFF00FFFF00FFFF00FFDCBA7CEECE8FECCE95ECCE95EACB8EE8
      C682E5BE72E1B45ADBA53BDFA03FEEA964E8A569FF00FFFF00FFFF00FF9E8064
      F4DBA6B9978DAA8B97AD8E95AC8B94AC8A8EB08C86AD867DA97F6FAC7C58B47F
      5DD6966AAB7B58FF00FFFF00FFB2967AFAE7C09A7EA26A6EFF6667FF5F60FF54
      55FF4949FD3B3BFD2B2BFE1415FC4632BDAF7A6FBB855DFF00FFFF00FFB29982
      FDF0D49579A46B6EFF6667FF5F60FF5455FF4748FF3739FF2729FF0B10FF4C36
      B7B57E64B9855DFF00FFFF00FF9E8473FEF5E1C4AAABB9A0ACB398AAAF94A7AE
      91A2A6889C9D7D9698768C906C84996D6BC68C54A77957FF00FFFF00FFFF00FF
      E6DBCCFFFEF7FEFDFCFFFEFDFDF9F2FAF2E2F6E8CDF1DDB4EBCC91E4BB6AE0AA
      40D69A3EFF00FFFF00FFFF00FFFF00FF9F887BFFFEF6FFFFFCFEFDFAFCF8F0F9
      F1E1F6E7CCF1DCB3EBCB8FE5BB69E3AD409F7440FF00FFFF00FFFF00FFFF00FF
      FF00FFB4A194FFFEF5FFFEF5FBF3E7F8ECD8F4E4C4F0D9ABEDCC89E9BC60AF84
      45FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F887AE6DAC9FEF3DCFC
      EECFF9E5BAF4D8A0DBB7769E7951FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF9E8472B2987FB195779E7E62FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    FullHeight = 184
    object dbgEstudios: TArtDBGrid
      Left = 2
      Top = 43
      Width = 816
      Height = 69
      Align = alClient
      DataSource = dsEstudios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'LOTE'
          Title.Caption = 'Lote'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUIL'
          Title.Caption = 'Cuil'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Caption = 'Nombre trabajador'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTUDIO'
          Title.Caption = 'Estudio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Title.Caption = 'Descripci'#243'n estudio'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DL_FECHAREALIZACION'
          Title.Caption = 'F.Realizaci'#243'n'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEBITADO'
          Title.Caption = 'Debitado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DL_FECHADEBITO'
          Title.Caption = 'F.D'#233'bito'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTIVO'
          Title.Caption = 'Motivo d'#233'bito'
          Width = 200
          Visible = True
        end>
    end
    object tbTrabajadores: TToolBar
      Left = 2
      Top = 16
      Width = 816
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object tbOrdenarEstudios: TToolButton
        Left = 0
        Top = 0
        Hint = 'Ordenar Estudios'
        Caption = 'ToolButton2'
        ImageIndex = 5
        OnClick = tbOrdenarEstudiosClick
      end
      object tbImprimirEstudios: TToolButton
        Left = 23
        Top = 0
        Hint = 'Imprimir Estudios'
        Caption = 'tbImprimirEstudios'
        ImageIndex = 7
        OnClick = tbImprimirEstudiosClick
      end
      object tbExportarEstudios: TToolButton
        Left = 46
        Top = 0
        Hint = 'Exportar Esudios'
        Caption = 'Exportar Esudios'
        ImageIndex = 1
        OnClick = tbExportarEstudiosClick
      end
    end
  end
  object ScrollBox1: TScrollBox
    Left = 72
    Top = 360
    Width = 710
    Height = 1177
    TabOrder = 4
    Visible = False
    object fpAsignarAuditorVolante: TFormPanel
      Left = 8
      Top = 5
      Width = 446
      Height = 104
      Caption = 'Asignar / Desasignar Auditor de Volante'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      OnBeforeShow = fpAsignarAuditorVolanteBeforeShow
      Constraints.MaxHeight = 140
      DesignSize = (
        446
        104)
      object Bevel5: TBevel
        Left = 4
        Top = 67
        Width = 438
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object Label22: TLabel
        Left = 55
        Top = 13
        Width = 36
        Height = 13
        Caption = 'Volante'
      end
      object Label23: TLabel
        Left = 11
        Top = 41
        Width = 81
        Height = 13
        Caption = 'Auditor asignado'
      end
      object btnAceptarUsuAudit: TButton
        Left = 285
        Top = 73
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Aceptar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnAceptarUsuAuditClick
      end
      object btnCancelarUsuAudit: TButton
        Left = 366
        Top = 73
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Cancel = True
        Caption = 'Cancelar'
        ModalResult = 2
        TabOrder = 1
      end
      object edVolanteUsuAudit: TIntEdit
        Left = 99
        Top = 10
        Width = 82
        Height = 21
        Hint = 'Volande Desde'
        Color = clActiveBorder
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnExit = edNumDesdeExit
        AutoExit = True
        MaxLength = 8
      end
      inline fraUsuAuditor: TfraUsuario
        Left = 99
        Top = 36
        Width = 314
        Height = 21
        TabOrder = 3
        ExplicitLeft = 99
        ExplicitTop = 36
        ExplicitWidth = 314
        DesignSize = (
          314
          21)
        inherited cmbDescripcion: TArtComboBox
          Width = 230
          ExplicitWidth = 230
        end
      end
      object ToolBar2: TToolBar
        Left = 416
        Top = 36
        Width = 27
        Height = 27
        Align = alNone
        Caption = 'ToolBar2'
        Images = ImageList
        TabOrder = 4
        object tbLimpiarAuditorAsignado: TToolButton
          Left = 0
          Top = 0
          Hint = 'Limpiar Auditor asignado'
          Caption = 'tbLimpiarAuditorAsignado'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          OnClick = tbLimpiarAuditorAsignadoClick
        end
      end
    end
    object fpFechaTerm: TFormPanel
      Left = 7
      Top = 132
      Width = 246
      Height = 81
      Caption = 'Terminaci'#243'n de la derivaci'#243'n'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      DesignSize = (
        246
        81)
      object Label10: TLabel
        Left = 15
        Top = 18
        Width = 102
        Height = 13
        Caption = 'Fecha de terminaci'#243'n'
      end
      object Bevel1: TBevel
        Left = 2
        Top = 44
        Width = 240
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object btnAceptarTerm: TButton
        Left = 89
        Top = 51
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Aceptar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnAceptarTermClick
      end
      object btnCancelarTerm: TButton
        Left = 166
        Top = 51
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = 'Cancelar'
        ModalResult = 2
        TabOrder = 2
      end
      object dcTerminacion: TDateComboBox
        Left = 128
        Top = 14
        Width = 95
        Height = 21
        TabOrder = 0
      end
    end
    object fpImporteNuevo: TFormPanel
      Left = 372
      Top = 219
      Width = 200
      Height = 130
      Caption = 'Nuevos importes'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      Constraints.MaxHeight = 130
      Constraints.MinHeight = 130
      Constraints.MinWidth = 200
      OnEnter = fpDerivacionEnter
      DesignSize = (
        200
        130)
      object Label13: TLabel
        Left = 11
        Top = 13
        Width = 67
        Height = 13
        Caption = 'Importe bruto'
      end
      object Label14: TLabel
        Left = 11
        Top = 40
        Width = 58
        Height = 13
        Caption = 'Importe IVA'
      end
      object Label19: TLabel
        Left = 11
        Top = 68
        Width = 65
        Height = 13
        Caption = 'Importe Total'
      end
      object Bevel3: TBevel
        Left = 2
        Top = 91
        Width = 195
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object btnAceptarReemplazo: TButton
        Left = 43
        Top = 98
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Aceptar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnAceptarReemplazoClick
      end
      object btnCancelarReemplazo: TButton
        Left = 120
        Top = 98
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Cancelar'
        TabOrder = 4
        OnClick = btnCancelarReemplazoClick
      end
      object edImporteVolante: TCurrencyEdit
        Left = 104
        Top = 9
        Width = 79
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        TabOrder = 0
        OnExit = edImporteVolanteExit
        OnKeyPress = edImporteVolanteKeyPress
      end
      object edImporteIVA: TCurrencyEdit
        Left = 104
        Top = 36
        Width = 79
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        TabOrder = 1
        OnExit = edImporteVolanteExit
        OnKeyPress = edImporteIVAKeyPress
      end
      object edImporteTotal: TCurrencyEdit
        Left = 104
        Top = 64
        Width = 79
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
    end
    object fpRemitoMalaPraxis: TFormPanel
      Left = 19
      Top = 225
      Width = 334
      Height = 140
      Caption = 'Nuevos importes'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      OnBeforeShow = fpRemitoMalaPraxisBeforeShow
      Constraints.MaxHeight = 140
      Constraints.MinHeight = 140
      Constraints.MinWidth = 200
      DesignSize = (
        334
        140)
      object Label20: TLabel
        Left = 7
        Top = 81
        Width = 29
        Height = 13
        Caption = 'Fecha'
      end
      object Bevel4: TBevel
        Left = 2
        Top = 103
        Width = 328
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object btnAceptarMP: TButton
        Left = 177
        Top = 109
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Aceptar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnAceptarMPClick
      end
      object btnCancelarMP: TButton
        Left = 254
        Top = 109
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Cancel = True
        Caption = 'Cancelar'
        ModalResult = 2
        TabOrder = 3
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 2
        Width = 326
        Height = 67
        TabOrder = 0
        object rbUsuarioMP: TRadioButton
          Left = 4
          Top = 16
          Width = 57
          Height = 17
          Caption = 'Usuario'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbUsuarioMPClick
        end
        object rbDelegMP: TRadioButton
          Left = 4
          Top = 44
          Width = 73
          Height = 17
          Caption = 'Delegaci'#243'n'
          TabOrder = 2
          OnClick = rbUsuarioMPClick
        end
        inline fraUsuarioMP: TfraUsuario
          Left = 78
          Top = 13
          Width = 244
          Height = 21
          TabOrder = 1
          ExplicitLeft = 78
          ExplicitTop = 13
          ExplicitWidth = 244
          DesignSize = (
            244
            21)
          inherited cmbDescripcion: TArtComboBox
            Width = 160
            DataSource = nil
            ExplicitWidth = 160
          end
        end
        inline fraDelegacionMP: TfraDelegacion
          Left = 78
          Top = 39
          Width = 244
          Height = 23
          TabOrder = 3
          ExplicitLeft = 78
          ExplicitTop = 39
          ExplicitWidth = 244
          DesignSize = (
            244
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 179
            DataSource = nil
            ExplicitWidth = 179
          end
        end
      end
      object dcFechaMP: TDateComboBox
        Left = 42
        Top = 77
        Width = 95
        Height = 21
        MaxDateCombo = deFechaAproHasta
        TabOrder = 1
      end
    end
    object fpPrestador: TFormPanel
      Left = 24
      Top = 377
      Width = 537
      Height = 241
      Caption = 'Confirmar prestador'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      Position = poOwnerFormCenter
      OnBeforeShow = fpPrestadorBeforeShow
      Constraints.MinHeight = 177
      Constraints.MinWidth = 377
      DesignSize = (
        537
        241)
      object gbPresTMP: TGroupBox
        Left = 4
        Top = 5
        Width = 529
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Prestador volante temporal '
        TabOrder = 3
        DesignSize = (
          529
          45)
        object edCuitTMP: TMaskEdit
          Left = 8
          Top = 16
          Width = 81
          Height = 21
          Hint = 'CUIT o Clave del Prestador'
          Color = clBtnFace
          EditMask = '99-99999999-c;0;'
          MaxLength = 13
          ReadOnly = True
          TabOrder = 0
        end
        object edDescrTMP: TEdit
          Left = 96
          Top = 16
          Width = 426
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
        end
      end
      object btnCancelarPres: TButton
        Left = 457
        Top = 214
        Width = 75
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = 'Cancelar'
        ModalResult = 2
        TabOrder = 2
      end
      object btnAceptarPres: TButton
        Left = 377
        Top = 214
        Width = 75
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = 'Aceptar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnAceptarPresClick
      end
      object gbPresSel: TGroupBox
        Left = 4
        Top = 53
        Width = 529
        Height = 157
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Seleccionar prestador correspondiente '
        TabOrder = 0
        DesignSize = (
          529
          157)
        object lvPrestadores: TListView
          Left = 6
          Top = 17
          Width = 518
          Height = 133
          Anchors = [akLeft, akTop, akRight, akBottom]
          Checkboxes = True
          Columns = <
            item
              Caption = 'ID'
              Width = 55
            end
            item
              Caption = 'CUIT'
              Width = 100
            end
            item
              Alignment = taCenter
              Caption = 'Secuencia'
              Width = 60
            end
            item
              Caption = 'Nombre fantas'#237'a'
              Width = 300
            end>
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
    object fpDerivacion: TFormPanel
      Left = 264
      Top = 128
      Width = 327
      Height = 70
      Caption = 'Selecci'#243'n de la derivaci'#243'n'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      Constraints.MaxHeight = 70
      Constraints.MinHeight = 70
      Constraints.MinWidth = 310
      OnEnter = fpDerivacionEnter
      DesignSize = (
        327
        70)
      object Bevel2: TBevel
        Left = 2
        Top = 11
        Width = 319
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Shape = bsBottomLine
      end
      object Label12: TLabel
        Left = 4
        Top = 10
        Width = 50
        Height = 13
        Caption = 'Derivaci'#243'n'
      end
      object btnAceptarDerivar: TButton
        Left = 174
        Top = 39
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Aceptar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnAceptarDerivarClick
      end
      object btnCancelarDerivar: TButton
        Left = 249
        Top = 39
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Cancelar'
        TabOrder = 2
        OnClick = btnCancelarDerivarClick
      end
      inline fraStaticCTBDerivacion: TfraStaticCTB_TABLAS
        Left = 60
        Top = 6
        Width = 263
        Height = 23
        TabOrder = 0
        ExplicitLeft = 60
        ExplicitTop = 6
        ExplicitWidth = 263
        DesignSize = (
          263
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 199
          ExplicitWidth = 199
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
    end
    object fpObservaciones: TFormPanel
      Left = 16
      Top = 630
      Width = 473
      Height = 108
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      Position = poDesktopCenter
      object Label11: TLabel
        Left = 3
        Top = 2
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object memoObservaciones: TMemo
        Left = 2
        Top = 15
        Width = 468
        Height = 66
        MaxLength = 250
        TabOrder = 0
      end
      object btnObsAceptar: TButton
        Left = 395
        Top = 83
        Width = 75
        Height = 23
        Caption = '&Aceptar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnObsAceptarClick
      end
    end
    object fpImpVolantes: TFormPanel
      Left = 19
      Top = 746
      Width = 301
      Height = 60
      Caption = 'Imprimiendo Volantes'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      Icon.Data = {
        0000010001001010000000000000680500001600000028000000100000002000
        0000010008000000000000010000000000000000000000000000000000000000
        0000000080000080000000808000800000008000800080800000C0C0C000C0DC
        C000F0CAA60004040400080808000C0C0C0011111100161616001C1C1C002222
        220029292900555555004D4D4D004242420039393900807CFF005050FF009300
        D600FFECCC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000
        CC00003300000033330000336600003399000033CC000033FF00006600000066
        330000666600006699000066CC000066FF000099000000993300009966000099
        99000099CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CC
        FF0000FF660000FF990000FFCC00330000003300330033006600330099003300
        CC003300FF00333300003333330033336600333399003333CC003333FF003366
        00003366330033666600336699003366CC003366FF0033990000339933003399
        6600339999003399CC003399FF0033CC000033CC330033CC660033CC990033CC
        CC0033CCFF0033FF330033FF660033FF990033FFCC0033FFFF00660000006600
        330066006600660099006600CC006600FF006633000066333300663366006633
        99006633CC006633FF00666600006666330066666600666699006666CC006699
        00006699330066996600669999006699CC006699FF0066CC000066CC330066CC
        990066CCCC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00
        CC009999000099339900990099009900CC009900000099333300990066009933
        CC009900FF00996600009966330099336600996699009966CC009933FF009999
        330099996600999999009999CC009999FF0099CC000099CC330066CC660099CC
        990099CCCC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FF
        FF00CC00000099003300CC006600CC009900CC00CC0099330000CC333300CC33
        6600CC339900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66
        CC009966FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC
        0000CCCC3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF
        6600CCFF9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF33
        3300FF336600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF66
        9900FF66CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99
        FF00FFCC0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF
        6600FFFF9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF
        66002100A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7
        D700DDDDDD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A0008080
        80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000A0A
        0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0743150A0A0A0A0A0A0A0A0A
        0A0ABC07F80A0A13120A0A0A0A0A0A0AF1F0F8F80743150A0AEA6D0A0A0A0AF8
        F8F7BC0707431513120A0AEB0A0AF8F7F1F0BC070743151312EA6D0A0A0AF8FF
        F1F0BC07FF43151312EA6DEBF80AF8FFF1F0FFFF0707071312EA6DEBF80AF8FF
        FFFFF0BC47FD070707EA6DEBF80AF8FFF1F09EFAF0BCBCF8F80A07EBF80A0AF8
        F8FFF107F0F8F8A0A00AF10A0A0A0A0A0AF8F8FFF8A0A0A0C3C30A0A0A0A0A0A
        0A0A0AF8F8A0C3C3C3C3C30A0A0A0A0A0A0A0A0A0AEDC3C3C3C3F6F60A0A0A0A
        0A0A0A0A0A0AEDC3F6F6EDED0A0A0A0A0A0A0A0A0A0A0AEFEFEF0A0A0A0AFC7F
        0000F01F0000C007000080010000800100000001000000000000000000000000
        00000000000080010000E0070000F8030000FE000000FF030000FF8F0000}
      BorderStyle = bsSingle
      Position = poDesktopCenter
      ActiveControl = btnImpVolCancelar
      Constraints.MaxHeight = 60
      Constraints.MinHeight = 60
      Constraints.MinWidth = 260
      DesignSize = (
        301
        60)
      object lbTraspasos: TLabel
        Left = 4
        Top = 39
        Width = 213
        Height = 13
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = '...'
      end
      object btnImpVolCancelar: TButton
        Left = 220
        Top = 31
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        TabOrder = 0
        OnClick = btnImpVolCancelarClick
      end
      object ProgressBar: TProgressBar
        Left = 4
        Top = 12
        Width = 293
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        ParentShowHint = False
        Smooth = True
        Step = 1
        ShowHint = True
        TabOrder = 1
      end
    end
    object fpHistorico: TFormPanel
      Left = 19
      Top = 816
      Width = 673
      Height = 308
      Caption = 'Estados de Volantes'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      Position = poOwnerFormCenter
      Constraints.MinHeight = 308
      Constraints.MinWidth = 546
      DesignSize = (
        673
        308)
      object bvNomMid: TBevel
        Left = 4
        Top = 273
        Width = 661
        Height = 5
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object dgHistorico: TArtDBGrid
        Left = 5
        Top = 31
        Width = 662
        Height = 238
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsHistoricoVolante
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        IniStorage = FormPlacement
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HV_ID'
            Title.Alignment = taCenter
            Title.Caption = 'ID'
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HV_VOLANTE'
            Title.Alignment = taCenter
            Title.Caption = 'Volante'
            Width = 68
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HV_FECHAALTA'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HV_USUALTA'
            Title.Caption = 'Usuario'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TB_DESCRIPCION'
            Title.Caption = 'Estado'
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ANTERIOR'
            Title.Caption = 'Estado anterior'
            Width = 130
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HV_FECHATERMINACION'
            Title.Alignment = taCenter
            Title.Caption = 'F. Terminaci'#243'n'
            Width = 75
            Visible = True
          end>
      end
      object btnCerrar: TBitBtn
        Left = 591
        Top = 279
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cerrar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        ModalResult = 2
        NumGlyphs = 2
        TabOrder = 1
      end
      object btnOrdenarHist: TBitBtn
        Left = 5
        Top = 3
        Width = 28
        Height = 25
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF007B000000FF00FF00FF00FF00FF00FF00FF00FF000000
          000000000000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF007B7B7B007B0000007B7B7B00FF00FF00FF00FF00FF00FF00FF00
          FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF007B0000007B0000007B000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF007B7B7B007B0000007B0000007B0000007B7B7B00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF007B0000007B0000007B0000007B0000007B000000FF00FF00FF00FF000000
          0000FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF007B000000FF00FF00FF00FF00FF00FF00FF00FF000000
          00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF007B000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF007B000000FF00FF00FF00FF00FF00FF00FF00FF000000
          00000000000000000000FF00FF00000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF007B000000FF00FF00FF00FF00FF00FF00FF00FF007B7B
          7B0000000000FF00FF00FF00FF00FF00FF00000000007B7B7B00FF00FF00FF00
          FF00FF00FF00FF00FF007B000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF007B000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF007B7B7B0000000000FF00FF00000000007B7B7B00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF007B000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF007B000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF007B7B7B00000000007B7B7B00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF007B000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF007B000000FF00FF00FF00FF00FF00FF00}
        Spacing = 0
        TabOrder = 2
        TabStop = False
        OnClick = btnOrdenarHistClick
      end
    end
  end
  object fpVencimientoEgSem: TFormPanel
    Left = 135
    Top = 360
    Width = 215
    Height = 104
    Caption = 'Vencimiento egresos semanales'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpVencimientoEgSemBeforeShow
    Constraints.MaxHeight = 140
    DesignSize = (
      215
      104)
    object Bevel6: TBevel
      Left = 4
      Top = 67
      Width = 207
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitWidth = 438
    end
    object Label26: TLabel
      Left = 11
      Top = 12
      Width = 96
      Height = 13
      Caption = 'Vencimiento volante'
    end
    object Label27: TLabel
      Left = 11
      Top = 41
      Width = 102
      Height = 13
      Caption = 'Vencimiento eg. sem.'
    end
    object btnAceptarEgSem: TButton
      Left = 54
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarEgSemClick
    end
    object Button2: TButton
      Left = 137
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object ToolBar3: TToolBar
      Left = 416
      Top = 36
      Width = 27
      Height = 27
      Align = alNone
      Caption = 'ToolBar2'
      Images = ImageList
      TabOrder = 2
    end
    object dcVencimEgSem: TDateComboBox
      Left = 118
      Top = 37
      Width = 84
      Height = 21
      TabOrder = 3
    end
    object dcVencimVolEgSem: TDateComboBox
      Left = 118
      Top = 5
      Width = 84
      Height = 21
      TabOrder = 4
    end
  end
  object ImageList: TImageList
    Left = 110
    Top = 35
    Bitmap = {
      494C0101230027001C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000031000000
      310000009C00000084000000FF000000CE000000CE0000009C00000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000009C000000840094949400A5A5A5008484840063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000000000
      840094949400C6C6C600B5B5B500A5A5A5008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      CE000000FF000000CE0000000000000000000000000000000000000000000000
      0000CECECE00C6C6C600B5B5B500A5A5A5008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000000000001818
      180000000000C6C6C600B5B5B500A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000181818001818
      18000000000000000000C6C6C600CECECE00CECECE00CECECE00CECECE00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF00000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000CE000000
      00000000CE000000FF000000CE00000000000000000018181800181818001818
      1800000000000000000000000000DEDEDE00D6D6D600D6D6D600CECECE00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF000000000000000000848484009CFFFF00CE31
      0000CE310000CE310000CE310000C6C6C60000000000000000000000CE000000
      CE000000CE000000FF000000CE00000000000000000021212100181818000000
      00000000000000000000C6C6C600DEDEDE00DEDEDE00D6D6D600CECECE00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      FF000000CE000000CE000000CE00000000000000000018181800181818000000
      000000000000C6C6C600EFEFEF00EFEFEF00DEDEDE00D6D6D600D6D6D600CECE
      CE00C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF000000000000000000848484009CFFFF00FF00
      0000FF000000FF000000FF000000C6C6C60000000000000000000000CE000000
      FF00847BFF000000CE0000000000000000000000000018181800181818000000
      00000000000000000000C6C6C600DEDEDE00DEDEDE00DEDEDE00FF000000EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      CE000000CE000000CE000000CE00000000000000000021212100181818001818
      180000000000000000000000000000000000DEDEDE00DEDEDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      84008484840084848400848484000000000000000000848484009CFFFF00FF63
      3100FF633100FF6331009CFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000018181800181818001818
      180000000000000000000000000000000000C6C6C600DEDEDE00DEDEDE00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C600000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000181818002121
      21001818180000000000000000000000000000000000C6C6C600DEDEDE00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000181818002121
      2100212121001818180021212100181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001818
      1800181818001818180018181800181818000000000000000000000000000000
      0000181818000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000212121001818180021212100181818001818180018181800181818001818
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000940000009400000094000000940000009400000094000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000029000000
      94000000CE000000CE000000CE000000CE000000CE000000CE00000094000000
      940000007B000000000000000000000000000000000000000000000000000084
      0000848400008484000084840000848400008484000000840000008400000084
      000000840000000000000000000000000000848400005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A0084840000000000000000000084848400CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000000000000000007B000000CE002900
      FF002900FF002900FF002900FF002900FF002900FF002900FF000000CE000000
      CE000000940000007B0000000000000000000000000000840000848400008484
      0000848400008484000084840000848400008484000084840000008400000084
      0000008400000084000000000000000000004A4A4A009C9C9C00EFEFEF00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600C6C6
      C600C6C6C600B5B5B5009C9C9C004A4A4A00000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECECE000000000000000000000000000000000000007B000063FF002931
      FF002900FF002900FF002900FF002900FF002900FF002900FF002900FF002900
      FF000000CE000000940000000000000000000000000000840000C6C6C6008484
      8400848400008484000084840000848400008484000084840000848400008484
      0000008400000084000000000000000000004A4A4A00EFEFEF009C9C9C00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600C6C6C6009C9C9C00B5B5B5004A4A4A00000000000000000084848400FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00CECECE0000000000000000000000000000007B006363FF000031FF002900
      FF00CECEFF00FFFFFF00CECEFF002900FF002900FF00CECEFF00FFFFFF00CECE
      FF000000CE0000009400000094000000000000840000C6C6C600848484008484
      00008484000084840000FFFFFF00FFFFFF00C6C6C60084840000848400008484
      0000008400000084000000840000000000004A4A4A00EFEFEF00EFEFEF009C9C
      9C00E7E7E700D6D6D600C6C6C600949494009C9C9C00DEDEDE00DEDEDE00D6D6
      D6009C9C9C00D6D6D600B5B5B5004A4A4A00000000000000000084848400FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00CECECE0000000000000000000000000000007B006363FF002963FF002900
      FF002900FF00CECEFF00FFFFFF00CE94FF00CE94FF00FFFFFF00CECEFF002900
      FF002900FF000000CE00000094000000000000840000C6C6C600C6C6C6008484
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848400008484
      0000848400000084000000840000000000004A4A4A00EFEFEF00EFEFEF00E7E7
      E7009C9C9C00C6C6C60094949400D6D6D600D6D6D60094949400DEDEDE009C9C
      9C00D6D6D600D6D6D600B5B5B5004A4A4A00000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECECE0000000000000000000000000000007B006363FF002963FF002900
      FF002900FF002900FF00CE94FF00FFFFFF00FFFFFF00CE94FF002900FF002900
      FF002900FF000000CE00000094000000000000840000C6C6C600C6C6C6008484
      8400FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00C6C6C6008484
      0000848400008484000000840000000000004A4A4A00E7E7E700EFEFEF00D6D6
      D600C6C6C60094949400DEDEDE00DEDEDE00DEDEDE00DEDEDE0094949400DEDE
      DE00CECECE00D6D6D600B5B5B5004A4A4A00000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00CECECE0000000000000000000000000000007B006363FF002963FF002931
      FF002900FF002900FF00CE94FF00FFFFFF00FFFFFF00CE94FF002900FF002900
      FF002900FF000000CE00000094000000000000840000C6C6C600C6C6C6008484
      8400C6C6C600C6C6C600848400008484000084848400FFFFFF00FFFFFF00C6C6
      C600848400008484000000840000000000004A4A4A00E7E7E700DEDEDE00C6C6
      C60094949400E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE009494
      9400D6D6D600DEDEDE00B5B5B5004A4A4A00000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00CECECE0000000000000000000000000000007B006363FF002994FF002931
      FF002900FF00CECEFF00FFFFFF00CE94FF00CE94FF00FFFFFF00CECEFF002900
      FF002900FF000000CE00000094000000000000840000C6C6C600C6C6C6008484
      8400848400008484000084840000848400008484000084848400FFFFFF00FFFF
      FF00C6C6C6008484000000840000000000004A4A4A00E7E7E700D6D6D6009494
      9400EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7
      E70094949400D6D6D600C6C6C6004A4A4A00000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECECE0000000000000000000000000000007B006363CE002994FF000063
      FF00C6D6EF00FFFFFF00CECEFF002900FF002900FF00CECEFF00FFFFFF00CECE
      FF002900FF000000CE0000009400000000000084000084848400C6C6C600C6C6
      C600848400008484000084840000848400008484000084840000848400008484
      0000848400008484000000840000000000004A4A4A00DEDEDE0094949400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF0094949400B5B5B5004A4A4A00000000000000000084848400FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00CECECE000000000000000000000000000000000000007B006363FF002963
      FF000063FF002900FF002900FF002900FF002900FF002900FF002900FF002900
      FF002900FF000000CE0000000000000000000000000000840000C6C6C600C6C6
      C600C6C6C6008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000000000004A4A4A0094949400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700949494004A4A4A00000000000000000084848400FFFF
      FF00000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000007B002963CE002994
      FF002963FF000063FF002931FF002931FF002900FF002900FF002900FF002900
      FF002900FF00000094000000000000000000000000000084000084848400C6C6
      C600C6C6C600C6C6C60084848400848484008484000084840000848400008484
      000084840000008400000000000000000000848400004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A0084840000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFF
      FF0000000000000000000000000000000000000000000000000000007B002963
      CE006363FF002994FF002994FF002963FF000031FF002900FF002900FF002900
      FF00000094000000290000000000000000000000000000000000008400008484
      8400C6C6C600C6C6C600C6C6C600C6C6C6008484840084840000848400008484
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      7B0000007B006363CE006363FF006363FF006363FF004A4AFF000000CE000000
      7B0000007B000000000000000000000000000000000000000000000000000084
      00000084000084848400C6C6C600C6C6C600C6C6C600C6C6C600848400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000007B0000007B0000007B0000007B0000007B0000007B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000BD000000CE000000DE000000BD000000730000008C000000
      5200000000000000000000000000000000000000000000000000000000000000
      00000000000063316300630063009C009C003100310031003100310031003131
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000003942390039423900394239003942390039423900394239000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009431290094312900943129009431290094312900943129000000
      000000000000000000000000000000000000000000003131CE000000CE000000
      FF003131FF003163FF003131FF009C9CFF000000FF0000007300639CFF003163
      CE0000009C0000008C000000730000000000000000009C639C00630063006300
      63009C009C006363FF009C9CFF009C9CFF009C009C00310031003163FF003131
      9C0063006300310031009C639C000000000000000000000000005A5A5A005A5A
      5A00636363006363630063636300636363006363630039423900394239003942
      3900293129000000000000000000000000000000000000000000182118006331
      2900946329009463290094632900946329009463290094312900943129009431
      290063312900000000000000000000000000000000000000DE003163FF000000
      FF00CEFFFF000000FF003131FF00CEFFFF000000FF0000007300639CFF000000
      9C003131CE003163CE0000008C0000000000000000009C009C009C9CFF00CECE
      FF00CE63CE00CE9CCE00CEFFFF00CEFFFF009C009C003100630031639C003100
      310063319C003163CE003100310000000000000000005A5A5A00ADB5AD007373
      7300737373007373730073737300737373007373730063636300394239003942
      390039423900293129000000000000000000000000006331290094632900CE63
      2900CE632900CE632900CE632900CE632900CE63290094632900943129009431
      290094312900633129000000000000000000000000006363FF003131FF003163
      FF00CEFFFF006363FF009C9CFF00CEFFFF000000FF00000073003163CE000000
      9C0000009C0000008C000031CE0000000000000000009C9CCE009C009C009C00
      9C00CE319C009C009C00CE31CE00CEFFFF009C009C0031006300310031006363
      CE003100310063639C003131630000000000000000005A5A5A00A59C9C00ADB5
      AD00737373007373730073737300737373007373730073737300737373006363
      6300394239003942390000000000000000000000000063312900CE949400CE94
      6300CE632900CE632900CE632900CE632900CE632900CE632900CE6329009463
      29009431290094312900000000000000000000000000639CFF00CECEFF000000
      FF009C9CFF000000FF00CEFFFF00CEFFFF000000FF00000073003131CE003131
      CE00639CFF0000008C003163CE0000000000000000009CCEFF009C31CE00CE9C
      FF00CEFFFF00CE63CE009C009C00CEFFFF009C00CE003100630031003100639C
      FF003100310031639C0031319C00000000005A5A5A00A59C9C00ADB5AD007373
      73007373730073737300D6D6D600D6D6D6009494940073737300737373007373
      73003942390039423900394239000000000063312900CE949400CE946300CE63
      2900CE632900CE632900FFFFFF00FFFFFF00CE949400CE632900CE632900CE63
      290094312900943129009431290000000000000000006363FF00CEFFFF000000
      FF006363FF000000FF00CEFFFF00CEFFFF000000FF00000073003163CE000000
      9C00639CFF0000008C003163CE0000000000000000009CCEFF009C31CE00CE9C
      FF00CEFFFF00FFFFFF009C009C00CEFFFF009C009C0031316300633163003100
      31003100310063639C0031319C00000000005A5A5A00A59C9C00A59C9C007373
      730073737300D6D6D600D6D6D600E7EFE700D6D6D60094949400737373007373
      73006363630039423900394239000000000063312900CE949400CE949400CE63
      2900CE946300FFFFFF00F7F7F700E7EFE700FFFFFF00CE949400CE632900CE63
      290094632900943129009431290000000000000000006363FF00CEFFFF003163
      FF009CCEFF000000FF00CEFFFF00CEFFFF000000FF0000007300639CFF000000
      9C0000008C0000008C003163CE0000000000000000009CCEFF009C31CE00CE9C
      FF00CEFFFF00CE9CFF009C009C00CEFFFF009C009C0031006300639CFF00639C
      FF0031319C0063639C0031319C00000000005A5A5A00A59C9C00A59C9C007373
      7300D6D6D600D6D6D6008484840084848400E7EFE700D6D6D600949494007373
      73007373730063636300394239000000000063312900CE949400CE949400CE94
      6300E7EFE700FFFFFF00CECE9400CE946300E7EFE700FFFFFF00CE949400CE63
      2900CE63290094632900943129000000000000000000639CFF00CEFFFF00CECE
      FF003131FF003131FF00CEFFFF00CEFFFF000000FF0000007300639CFF00639C
      FF00639CFF0000009C003163CE0000000000000000009CCEFF009C31CE00CE9C
      FF00CECEFF009C009C00CE31CE00CEFFFF009C009C0031006300639CFF00639C
      FF0031319C0031639C0031319C00000000005A5A5A00A59C9C00BDBDBD007373
      73007373730073737300737373007373730084848400E7EFE700D6D6D6009494
      94007373730063636300394239000000000063312900CE949400EFCEA500CE94
      6300CE949400CE949400CE632900CE632900CE946300E7EFE700FFFFFF00CECE
      9400CE632900946329009431290000000000000000006363FF00CEFFFF009C9C
      FF000000FF000000FF009CCEFF003163FF000000FF0000007300639CFF00639C
      FF00639CFF00639CFF003163CE0000000000000000009C9CCE009C009C009C00
      9C009C009C009C009C00CEFFFF009C63FF00CE00CE0031003100639CFF00639C
      FF0031319C0063639C0031319C00000000005A5A5A00A59C9C00BDBDBD007373
      7300737373007373730073737300737373007373730084848400D6D6D600D6D6
      D6009494940063636300394239000000000063312900CE949400EFCEA500CE94
      6300CE632900CE632900CE632900CE632900CE632900CE946300FFFFFF00F7F7
      F700CECE9400946329009431290000000000000000003131FF00CEFFFF00639C
      FF000000FF000000FF000000FF003131FF000000DE000000CE0000008C000000
      73003163CE00639CFF0000319C000000000000000000639CFF00CECEFF00CE9C
      FF009C31CE009C00CE00CE00CE00FF31CE00CE00CE009C009C00310031003131
      63006363CE00639CFF0000006300000000005A5A5A00ADB5AD00CECECE00BDBD
      BD00737373007373730073737300737373007373730073737300737373007373
      73007373730063636300394239000000000063312900CE946300FFCECE00EFCE
      A500CE632900CE632900CE632900CE632900CE632900CE632900CE632900CE63
      2900CE632900946329009431290000000000000000000000FF000000FF003131
      FF000000CE003131CE00639CFF009CCEFF003131CE009CCEFF00639CFF003131
      9C000000AD0000008C000000730000000000000000009C009C00CE00CE00FF31
      CE00CE00CE009C009C006363CE009C9CCE009C319C009C9CCE006363CE006300
      630063006300310031003100310000000000000000005A5A5A00A59C9C00BDBD
      BD00A59C9C007373730073737300737373007373730073737300737373007373
      7300737373006363630000000000000000000000000063312900CE949400EFCE
      A500CE949400CE632900CE632900CE632900CE632900CE632900CE632900CE63
      2900CE632900946329000000000000000000000000000000BD003163CE009C9C
      FF009CCEFF009C9CFF000000CE000000CE000000CE000000CE000000CE009C9C
      FF009CCEFF00639CFF0000009C0000000000000000009C009C006331CE009C9C
      FF009CCEFF009C63CE0063006300630063006300630063006300630063009C63
      CE009CCEFF006363CE009C00630000000000000000005A5A5A00ADB5AD00BDBD
      BD00BDBDBD00A59C9C00ADB5AD00848484007373730073737300737373007373
      7300737373006363630000000000000000000000000063312900CE946300EFCE
      A500EFCEA500CE949400CE946300CE636300CE632900CE632900CE632900CE63
      2900CE6329006331290000000000000000000000000000000000000000000000
      BD000031CE00639CFF000000CE00639CFF003131FF000000CE009C9CFF000031
      CE000000AD000000AD0000000000000000000000000000000000000000009C00
      63006363CE009C9CCE00630063009C639C009C316300630063009CCEFF006363
      CE0063009C0063009C00000000000000000000000000000000005A5A5A00ADB5
      AD00A59C9C00BDBDBD00BDBDBD00A59C9C00BDBDBD0073737300737373007373
      730063636300182118000000000000000000000000000000000063312900CE94
      6300CE949400EFCEA500EFCEA500CE949400CE946300CE632900CE632900CE63
      2900633129001821180000000000000000000000000000000000000000000000
      000000000000000000000000BD000031CE000000AD000000AD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000630063006363CE00630063009C009C00000000000000
      0000000000000000000000000000000000000000000000000000000000005A5A
      5A005A5A5A00ADB5AD00A59C9C00A59C9C00A59C9C00A59C9C00ADB5AD006363
      6300636363000000000000000000000000000000000000000000000000006331
      290063312900CE946300CE949400CE949400CE949400CE949400946329006331
      2900633129000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006331290063312900633129006331290063312900633129000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000063639C000000CE000000CE0063639C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000000000000000000FFFF
      FF0000000000DEDEDE0000000000DEDEDE0000000000C6C6C600000000000000
      9C000000FF000063FF00319CFF000000CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF00FFFFFF00FFFFFF00C6C6C6000000000000009C000000CE0000000000FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C60000009C000000
      FF000063FF00319CFF000000CE00000000000000000000000000000000000000
      0000DEDEDE00DEDEDE00DEDEDE00C6C6C600000000004A4A4A00525252000000
      0000000000000000000000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF00C6C6C600000000000000000000009C000000CE00FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE0000009C000000FF00319C
      FF000000CE000000CE0000000000000000000000000000000000DEDEDE000000
      0000DEDEDE00DEDEDE00DEDEDE00DEDEDE000000000000000000000000005A5A
      5A00636363000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF00C6C6C60000000000000000000000000000009C000000
      CE00DEDEDE00DEDEDE00DEDEDE00DEDEDE0000009C000000FF000000CE000000
      CE00000000000000000000000000000000000000000084848400848484000000
      0000DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C600A5A5A500000000000000
      0000000000007373730000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE31000000000000000000000000000000000000000000006363
      9C0063639C0063639C0000000000FF0000000000000000000000000000000000
      0000DEDEDE00DEDEDE00DEDEDE00C6C6C60000000000FFFFFF00FFFFFF000000
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      9C000000CE00DEDEDE00DEDEDE0000009C000000FF000000CE00C6C6C600C6C6
      C600A5A5A50000000000000000000000000084848400A5A5A500DEDEDE000000
      0000DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00000000000000
      0000636363000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00000000000000000094ADAD0094ADAD0094ADAD00639C
      9C00639C9C0094ADAD0000000000FF3131000000000000000000000000000000
      0000DEDEDE00DEDEDE00DEDEDE00DEDEDE000000000000000000FFFFFF000000
      FF00FFFFFF00FFFFFF00C6C6C60000000000000000000000000000000000FFFF
      FF0000009C000000CE0000009C000000FF000000CE00DEDEDE00DEDEDE00C6C6
      C600C6C6C60000000000000000000000000084848400FFFFFF0000000000DEDE
      DE00DEDEDE00DEDEDE00C6C6C600A5A5A500C6C6C600DEDEDE00DEDEDE00C6C6
      C600000000007373730084848400000000000000000084848400FFFFFF00FF00
      0000FF000000FF0000000000000000FFFF00000000000000000094ADAD0094AD
      AD0094ADAD0094ADAD0000000000FF6363000000000000000000000000000000
      0000DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C600A5A5A5000000FF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00DEDEDE0000009C000000FF000000CE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00A5A5A50000000000000000008484840000000000DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00C6C6C600A5A5A5000000000000000000DEDEDE00A5A5
      A500000000007373730084848400000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000000000C6C6C60000FFFF0000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000DEDEDE00DEDEDE00DEDEDE000000FF000000FF000000FF00000000000000
      0000FFFFFF00FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFF
      FF0000009C000000FF0000009C000000FF000000CE00A5A5A500C6C6C600DEDE
      DE00DEDEDE00DEDEDE00C6C6C6000000000000000000FFFFFF00DEDEDE00FFFF
      FF00DEDEDE00DEDEDE00C6C6C600A5A5A50000000000C6C6C600000000000000
      0000000000007373730084848400000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF00000000000000C6C6C60000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000DEDE
      DE00DEDEDE00DEDEDE00C6C6C600A5A5A500C6C6C600DEDEDE00DEDEDE00C6C6
      C600000000000000000000000000000000000000000000000000DEDEDE000000
      9C000000FF00DEDEDE00DEDEDE0000009C000000FF000000CE00000000000000
      000000000000DEDEDE00A5A5A5000000000000000000DEDEDE00000000000000
      0000DEDEDE000000000000000000A5A5A5000000000084848400848484000000
      0000C6C6C6007373730084848400000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00C6C6C600A5A5A5000000000000000000DEDEDE00A5A5
      A50000000000FFFFFF00848484000000000000000000FFFFFF0000009C000000
      FF00FFFFFF00DEDEDE00DEDEDE00DEDEDE0000009C000000FF000000CE000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000DEDEDE00DEDEDE00A5A5A500A5A5A500000000009CFFFF009CFFFF000000
      0000DEDEDE000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF0000FF
      FF000000000000000000000000000000000000000000FFFFFF00DEDEDE00FFFF
      FF00DEDEDE00DEDEDE00C6C6C600A5A5A50000000000FFFFFF00000000000000
      0000000000008484840000000000000000000000000000009C000000FF000000
      0000FFFFFF0000000000DEDEDE0000000000C6C6C60000009C000063FF000000
      CE00000000000000000000000000000000000000000000000000000000008484
      840000000000DEDEDE00A5A5A500000000009CFFFF009CFFFF00CEFFFF00CEFF
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      000000FFFF0000000000000000000000000000000000DEDEDE00000000000000
      0000DEDEDE000000000000000000A5A5A5000000000084848400848484008484
      84008484840000000000000000000000000000009C000000FF00000000000000
      0000FFFFFF00DEDEDE00DEDEDE00DEDEDE00C6C6C60000009C000000FF00319C
      FF003131CE000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009CFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000DEDEDE00DEDEDE00A5A5A500A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      000000000000DEDEDE00DEDEDE00C6C6C600A5A5A500A5A5A5000000CE000063
      FF00319CFF003131CE0000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00F7FFFF00F7FFFF0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEDEDE00A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEDEDE00A5A5A500A5A5A5000000000000009C000000
      FF000063FF003131CE003131CE00000000000000000000000000000000000000
      00000000000000000000000000000000000094949400CEFFFF00F7FFFF00F7FF
      FF00949494009494940000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      9C000000FF003131CE003131CE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      840084848400848484008484840000000000000000000000000000000000FFFF
      FF0000000000DEDEDE0000000000DEDEDE0000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000000000000000000000000000FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000000000000000000000000000FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000000000000000000000000000FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000000000000000000000000000FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C600C6C6
      C600A5A5A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000848484000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000000000000000000000000000FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000000000000000000000FFFFFF00FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00A5A5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000FFFFFF00FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C600A5A5A500C6C6C600DEDE
      DE00DEDEDE00DEDEDE00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000848484000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000DEDEDE00FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C600A5A5A500000000000000
      000000000000DEDEDE00A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      84000000000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000FFFFFF00DEDEDE000000
      0000FFFFFF00DEDEDE00DEDEDE00DEDEDE00C6C6C600A5A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      00008484840000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000DEDEDE00DEDEDE000000
      0000FFFFFF0000000000DEDEDE0000000000C6C6C600A5A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000084848400000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000DEDEDE00000000000000
      0000FFFFFF00DEDEDE00DEDEDE00DEDEDE00C6C6C600A5A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      000000000000DEDEDE00DEDEDE00C6C6C600A5A5A500A5A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      00000000000000000000DEDEDE00A5A5A500A5A5A50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131CE003131CE000000
      FF0000009C000000000000000000FF3131000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C0000000000000000003131CE003131CE000063
      FF000000FF0000009C0000000000FF3131000000000000000000000000000000
      000000000000000000000000000000000000FF000000FFFFFF00FF000000FF00
      0000FFFFFF00FF000000FFFFFF00FF000000FF000000FFFFFF00FF000000FF00
      0000FFFFFF00FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003131CE00319C
      FF000063FF000000CE00FF313100FF313100FF313100FF313100000000000000
      00000000000000000000000000000000FF00FF000000FFFFFF00FF000000FF00
      0000FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FF000000FF000000FF00
      0000FFFFFF00FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000003131
      CE00319CFF000000FF0000009C00FF313100FFCECE00FF313100FF3131000000
      000000000000000000000000FF0000009C00FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF00
      0000FFFFFF00FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF31
      31000000CE000063FF0000009C00FF31310000000000FFCECE00FF313100FF31
      3100000000000000FF0000009C0000000000FF000000FFFFFF00FF000000FF00
      0000FFFFFF00FF000000FFFFFF00FF000000FF000000FFFFFF00FF000000FF00
      0000FFFFFF00FF000000FF000000FF0000000000000000000000000000000000
      000084848400848484000000000000000000C6C6C60084848400848484000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C0000000000000000000000000000000000FFCE
      CE00FFCECE000000CE000000FF0000009C000000000000000000FF313100FF31
      31000000FF0000009C000000000000000000FF000000FF000000FFFFFF00FFFF
      FF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FF000000FF0000000000000000000000000000000000
      00008484840084848400C6C6C600FFFFFF00C6C6C60084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CE000000FF0000009C0000000000FF3131000000
      FF0000009C00000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      00008484840084848400C6C6C600FFFFFF00C6C6C60084848400848484000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C0000000000FF9C9C00FF9C9C00000000000000000000000000000000000000
      0000FF313100FF313100FF3131000000CE000000FF0000009C000000FF000000
      9C000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      00008484840084848400C6C6C600FFFFFF00C6C6C60084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF31
      3100FF313100FFCECE00FFCECE00FF3131000000CE000000FF0000009C000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      00008484840084848400C6C6C600FFFFFF00C6C6C60084848400000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C00FF9C9C00000000000000000000000000000000000000000000000000FF31
      3100FF31310000000000000000000000CE000000FF0000009C000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600FFFFFF00C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF31
      3100FF313100000000000000CE000000FF0000009C0000000000FF3131000000
      CE0000009C0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600FFFFFF00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000FF9C9C000000
      000000000000FF9C9C00FF9C9C0000000000FF9C9C0000000000FF9C9C00FF9C
      9C0000000000FF9C9C00FF9C9C0000000000000000000000000000000000FFCE
      CE000000CE000000CE000000FF0000009C000000000000000000FF313100FF31
      31000000CE0000009C00000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000000
      CE00319CFF000000FF0000009C00FF313100FF313100FF313100FF313100FFCE
      CE00000000000000CE0000009C000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF00C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C0000000000000000000000CE00319CFF000063
      FF000000FF0000009C00FFCECE00FF313100FFCECE00FFCECE00FFCECE000000
      000000000000000000000000CE0000009C0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      FF0000009C000000000000000000FF3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000063639C000000CE000000CE006363
      9C00000000000000000000000000FFCECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000737373003131CE003131CE000000
      FF0000009C007373730073737300737373007373730073737300737373007373
      7300737373007373730073737300737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000949494009494940094949400949494009494
      940094949400949494009494940094949400737373003131CE003131CE000063
      FF000000FF0000009C00DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7
      F700F7F7F700F7F7F700F7F7F700737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CECECE00CECECE00DEDEDE00DEDE
      DE00EFEFEF00EFEFEF00EFEFEF00A5A5A50073737300CECECE003131CE00319C
      FF000063FF000000CE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084000000FFCE
      3100840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CECECE00DEDEDE00DEDEDE00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00A5A5A50073737300CECECE00FF6363003131
      CE00319CFF000000FF0000009C00EFEFEF00FF636300FF636300F7F7F700FF63
      6300FF636300FF6363000000FF0000009C000000000000000000000000000000
      0000000000009C0000008400000084000000840000008400000084000000FFFF
      9C00FFCE31008400000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000094949400949494009494940094949400CECECE00DEDEDE00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00FFFFFF00A5A5A50073737300DEDEDE00DEDEDE00DEDE
      DE000000CE000063FF0000009C00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7
      F700F7F7F7000000FF0000009C00737373000000000000000000000000000000
      00000000000084000000FFCE3100FFCE3100FFFF9C00FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFCE310084000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000094949400CECECE00CECECE0094949400DEDEDE00EFEFEF00EFEFEF00EFEF
      EF00FFFFFF00FFFFFF00FFFFFF00B5B5B50073737300DEDEDE00FF636300FF63
      6300FF6363000000CE000000FF0000009C00FF636300FF636300F7F7F700FF63
      63000000FF0000009C00FFFFFF00737373000000000000000000000000000000
      00000000000084000000840000009C0000009C0000009C0000009C000000FFCE
      3100FFCE31009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000094949400CECECE00DEDEDE0094949400EFEFEF00EFEFEF00EFEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B5B5B50073737300DEDEDE00DEDEDE00DEDE
      DE00EFEFEF00EFEFEF000000CE000000FF0000009C00F7F7F700F7F7F7000000
      FF0000009C00FFFFFF00FFFFFF00737373000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C000000FFCE
      31009C0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000094949400949494009494
      940094949400CECECE00DEDEDE0094949400A5A5A500A5A5A500A5A5A500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B50073737300DEDEDE00FF636300FF63
      6300FF636300FF636300FF6363000000CE000000FF0000009C000000FF000000
      9C00FF636300FF636300FFFFFF00737373000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C0000009C00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000094949400CECECE00CECE
      CE0094949400DEDEDE00EFEFEF00EFEFEF00EFEFEF00FFFFFF00FFFFFF00FFFF
      FF00B5B5B50000000000000000000000000073737300DEDEDE00DEDEDE00EFEF
      EF00EFEFEF00EFEFEF00F7F7F700F7F7F7000000CE000000FF0000009C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00737373000000000000000000000000000000
      0000840000009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5B5B50000000000000000000000000073737300DEDEDE00840000008400
      00008400000084000000840000000000CE000000FF0000009C000000CE000000
      9C008400000084000000FFFFFF00737373000000000000000000000000008400
      0000FFCE31009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEDE
      DE0094949400A5A5A50000000000A5A5A500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B50000000000000000000000000073737300EFEFEF00EFEFEF00EFEF
      EF00F7F7F700F7F7F7000000CE000000FF0000009C00FFFFFF00FFFFFF000000
      CE0000009C00FFFFFF00FFFFFF0073737300000000000000000084000000FFCE
      3100FFFF9C008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094949400000000000000
      0000EFEFEF00EFEFEF00FFFFFF00FFFFFF00FFFFFF00B5B5B500000000000000
      00000000000000000000000000000000000073737300EFEFEF00FF313100FF31
      31000000CE000000CE000000FF0000009C0084000000FFFFFF00FF313100FF31
      31000000CE0000009C00FFFFFF00848484000000000084000000FFCE3100FFFF
      9C00FFFF9C00FFFF9C00FFFF9C00FFCE3100FFCE310084000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000094949400EFEFEF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500000000000000
      00000000000000000000000000000000000073737300EFEFEF000000CE000000
      CE00319CFF000000FF0000009C00FFFFFF0084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000CE0000009C008484840000000000000000009C000000FFCE
      3100FFCE31009C0000009C0000009C0000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094949400A5A5A5000000
      000000000000B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500000000000000
      000000000000000000000000000000000000737373000000CE00319CFF000063
      FF000000FF0000009C00840000008400000084000000FFFFFF00FFFFFF00FFFF
      FF00FF313100FF3131000000CE0000009C000000000000000000000000009C00
      0000FFCE31009C00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      FF0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      00009C0000009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063639C000000CE000000CE006363
      9C00848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF633100FF63
      3100FF633100FF633100FF633100840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF63
      3100FF633100FF633100FF633100840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084000000848484000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF9C
      0000FF633100FF633100FF633100840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      000000000000FFFF9C00FFFF9C00FFFF9C0084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400000000000000000000000000000000000000
      00000000000084000000840000008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000008400
      00000000000084848400848484008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000008400
      00008484000084848400848484008484840084000000FFCE310000000000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000008400
      0000FFCE310084840000848484008484840084000000FFCE3100FFFFFF00FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000008484000084840000848400008484
      0000FFCE3100FFCE3100848400008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000000000000000000000000000FFCE3100FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFCE31008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000840000000000000000000000000000008400000084000000840000008400
      0000FFFF9C00FFCE3100840000008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000008400
      0000FFCE310084000000848484008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000008400
      00008400000084848400848484008484840084848400FFFF9C00FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400FFFF9C00FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000808080000000000080808000000
      0000000000000808080000000000080808000000000000000000080808000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002942420000000000000000000000
      00000000000000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00080808000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600313131003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000018180000FFFF0063A5A50031525200000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      0000000000000000000000000000000000000000000000000000FF633100FF63
      3100FF633100FF6331000000000000000000000000000000000000000000FF63
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600313131003939390000000000000000005A5A
      5A0063636300000000000000000000000000FF633100FF9C3100FF9C3100FF9C
      3100FF6331000000000000000000000000000000000029292900FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
      18000000000000000000000000000000000084848400FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
      CE0000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252000000
      000000000000737373000000000000000000FF633100FFFF9C00FFCE31009C31
      00000000000000000000000000000000000029292900FF633100FF9C3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
      E700294A4A0000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE000000000000000000000000000000000084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252005A5A
      5A0063636300000000000000000000000000FF633100FFFF9C009C3100000000
      0000000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
      C60063BDBD0031525200000000000000000084848400FFFFFF00FFFFFF00FF63
      3100FF633100FFFFFF00FF633100FF633100FF633100FF633100FFFFFF00CECE
      CE000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0031313100393939004A4A4A00525252005A5A
      5A0063636300737373008484840000000000FF633100FFFF9C00FF9C31009C31
      0000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C3100CE6300009C31000000000000000000000000000000000000BDA5
      A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
      EF0000E7E70018CECE00212121000000000084848400FFFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE000808080000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A0063636300737373008484840000000000FF633100FFFF9C00FFCE3100FF9C
      31009C310000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE3100CE9C3100CE630000000000000000000000000000000000008C00
      0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
      F7007BDEDE00005A5A00212121000000000084848400FFFFFF009CCECE009CCE
      CE009CFFFF00FFFFFF009CFFFF009CCECE00000000009CCECE009CFFFF00CECE
      CE000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE003131FF00FF00FF00C6C6C600C6C6C600C6C6C6005A5A
      5A0063636300737373008484840000000000FF633100FFFF9C00FFFFCE00FFCE
      3100FF9C31009C310000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE3100CE9C3100CE630000000000000000000000000000BD9C9C00FFFF
      0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
      B5000031310039393900000000000000000084848400FFFFFF00003100000031
      00009CCECE00FFFFFF009CCECE00003100009CCECE00000000009CCECE00CECE
      CE000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D6009CFF9C0000FF0000D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C600737373008484840000000000FF633100FFFFCE00FFCE31000000
      0000000000000000000000000000000000000000000000000000FF633100FFFF
      CE0000000000FFCE3100CE630000000000000000000000000000BD9C9C00FFFF
      0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
      52000000000000000000000000000000000084848400FFFFFF00639C9C00CEFF
      FF00003100009CCECE00003100009CCECE00316363009CCECE00000000000000
      000008080800000000000808080000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D60084848400848484009CFFFF009CFFFF000000
      0000DEDEDE00000000000000000000000000FF633100FFFF9C00000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000CE9C31000000000000000000C6BDBD00B5631000FFFF
      F700BDADAD008473000084000000942121002121210021212100000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00639C
      9C00CEFFFF00003100009CCECE00316363009CCECE0031636300639C9C00639C
      9C00639C9C0000000000FF633100FF6331000000000000000000000000008484
      840084848400FFFFFF00848484009CFFFF009CFFFF009CFFFF00CEFFFF00CEFF
      FF0000000000000000000000000000000000FF633100FFCE3100FF9C31000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE31009C31000000000000C6841000FFFFE7008C8C
      2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400639C9C00CEFFFF00003100009CCECE00316363009CCECE009CCECE009CCE
      CE00639C9C00639C9C00FF9C3100FF9C31000000000000000000000000000000
      00000000000084848400848484009CFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF0000000000000000000000000000000000FF633100FFCE3100FF9C
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100CE6300000000000094393900F7F76B009C843900AD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000639C9C00CEFFFF0000310000CEFFFF00CEFFFF009CCECE009CCE
      CE009CCECE009CCECE00FFCE3100FFCE31000000000000000000000000000000
      000000000000000000000000000094949400CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00F7FFFF00F7FFFF0000000000000000000000000000000000FF633100FF63
      3100FF633100CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE6300000000000000000000943939007B7B0000AD6B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00639C9C00FFFF9C00FFFF9C000000000000000000000000000000
      00000000000000000000000000000000000094949400CEFFFF00F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
      9C00639C9C00FFFFFF00FF633100FF6331000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B50000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF00FE00FFFFC00F00000000FFFFE01F0000
      0000FE07E03F00000000FDE3E00F00000000FBF1C007000000008071C0070000
      0000805180070000000080418003000000008041800700000000804380070000
      00008041800700000000807F800700000000807FC0070000000080FFC0070000
      000081FFE0070000FFFFFFFFF00F0000F81FF81FFFFFFFFFE007E007FFFFC003
      C003C0030000C003800180010000C003800180010000C003000000000000C003
      000000000000C003000000000000C003000000000000C003000000000000C003
      000000000000C003800180010000C003800180010000C007C003C003FFFFC00F
      E007E007FFFFC01FF81FF81FFFFFFFFFFE3FFE3FF81FF81FE007E007E007E007
      80018001C003C003000000008001800100000000800180010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000800180010000000080018001C001C001C003C003
      F80FF80FE007E007FFFFFFFFF81FF81FFC00EA80E87FFFFFFC00C000E01F8007
      FC000001C0078007E800800380018000E000C00780018000E000C00300018000
      E000C00100008000E000800000008000E000800000008007C000800000008007
      80010018000180070003000FE007800300071007F803800B207F3003FE00801F
      F0FFF801FF03803FF9FFF861FF8FFFFFFFFFFFFF8001EA8FFFFFFFC30000C00F
      FFFFCF990000C00FFFFFC79F0000C00FFFFFE39F0000C00775D6F1990000C003
      75D6F8C30000C0017416FC7F0000800075D9FE3F0000800055D9C31F00008000
      26B6998F0000001877769FC70000001FFFFF9FE30000101FFFFF99F30000301F
      FFFFC3FF0000F83FFFFFFFFF8001F87F86FF0000FFFF800182FF0000FFFBFFFF
      C03E0000BFF78001E01C0000DFE7FFFFE0890000C30F8001E0C30000E00F75D6
      FC470000E01F0000F00F0000F01F7416E01F0000F03F0001E60F0000F83F55D9
      E4470000F87F0000E0C30000FC7F7776C0090000FC7F8001801C0000FCFFFFFF
      06FF0000FEFF80010EFF0000FFFFFFFF0000FFFFFFFFFE000000FFCF8003FE00
      0000FFC78003FE000000F803C3FBF0000000F801E1FBF0000000F803F0FFF000
      0000FFC7F87F80000000FFCFFC3F80070000F3FFFC3F00070000E3FFF87F8007
      0000C03FF0FF803F0000803FE1FB803F0000C03FC3FB803F0000E3FF8003CFFF
      0000F3FF80039DFF0000FFFFFFFF01FF0000FFFFFFFFFFFF00008001FFFF81F7
      0000FFFFF00F9DE30000FE7FF81FCFE3F807FC3FFC3FE7C1F807F81FFE7FF3C1
      E807F00FFFFFB9F7E007FFFF800181F7E007FFFFFFFFFFF70007F00F800188F7
      0007F81FFFFF9CF70007FC3FFE7FC1F7E007FE7FFC3FC9F7E007FFFFF81FE3F7
      F8078001F00FE3F7F807FFFFFFFFF7F7FFFFFFFF0007FC7FFFF7FE7F0007F01F
      C1E7FC3F0007C00781C7F81F000780010381F80F000780010700F00700070001
      0E00F003000700000600E001000700000300E001000700000000C00300070000
      0000C00F000080010000803F0000E007000081FF0000F80380010FFFF800FE00
      C0031FFFFC00FF03FFFFFFFFFE00FF8F00000000000000000000000000000000
      000000000000}
  end
  object Seguridad: TSeguridad
    AfterExecute = SeguridadAfterExecute
    AutoEjecutar = True
    Claves = <
      item
        Name = 'PermisoEspecialAuditoria'
      end
      item
        Name = 'VerUsuarioAltaHistorico'
      end
      item
        Name = 'CancelarVolantesAuditados'
      end
      item
        Name = 'CambiarAudDebito'
      end
      item
        Name = 'VerUsuAuditor'
      end
      item
        Name = 'VerFiltroAuditorVolante'
      end
      item
        Name = 'VerBtnAsignarAuditorVolante'
      end
      item
        Name = 'VerFiltroUsuarioAuditoria'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 138
    Top = 35
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 166
    Top = 35
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqDatosAfterScroll
    SQL.Strings = (
      
        'SELECT vo_volante, vo_prestador, ca_clave, ca_descripcion, ca_fe' +
        'chabaja, ca_provincia,'
      '       pv_descripcion,'
      '       vo_facturatipo || '#39'-'#39' || vo_facturaestable || '#39'-'#39
      '       || vo_facturanro factura,'
      
        '       vo_facturatipo, vo_facturaestable, vo_facturanro, vo_fech' +
        'alta,'
      '       vo_monto, vo_estado,'
      '       DECODE (vo_estado,'
      '               '#39'A'#39', '#39'Aprobado'#39','
      '               '#39'A1'#39', '#39'Aprobado sin alta internaci'#243'n'#39','
      '               '#39'A2'#39', '#39'Aprobado sin autorizaci'#243'n'#39','
      '               '#39'A3'#39', '#39'Aprobado con dif. autorizado'#39','
      '               '#39'A4'#39', '#39'Aprobado mayor importe'#39','
      '               '#39'A5'#39', '#39'Aprobado sin info. adicional'#39','
      '               '#39'AP'#39', '#39'Aprobado gen'#233'rico OK'#39','
      '               '#39'AP1'#39', '#39'Aprobado gen'#233'rico mayor importe'#39','
      '               '#39'C'#39', '#39'Cancelado'#39','
      '               '#39'C1'#39', '#39'D'#233'bito por falta del alta de internaci'#243'n'#39','
      '               '#39'C2'#39', '#39'D'#233'bito por falta de autorizaci'#243'n'#39','
      
        '               '#39'C3'#39', '#39'D'#233'bito por  cantidad mayor a la autorizada' +
        #39','
      '               '#39'C4'#39', '#39'D'#233'bito por  importe mayor al convenido'#39','
      
        '               '#39'C5'#39', '#39'D'#233'bito por falta de informaci'#243'n adicional'#39 +
        ','
      '               '#39'C6'#39', '#39'D'#233'bito por diferencia de valores'#39','
      '               '#39'CM'#39', '#39'D'#233'bito no autom'#225'tico'#39','
      '               '#39'E'#39', '#39'Pagado'#39','
      '               '#39'EG'#39', '#39'Pagado Gen'#233'rico'#39','
      '               '#39'L'#39', '#39'Liquidado'#39','
      '               '#39'LG'#39', '#39'Liquidado Gen'#233'rico'#39','
      '               '#39'P'#39', '#39'Pendiente'#39','
      '               NULL'
      '              ) estado,'
      
        '       amebpba.get_montopagado (vo_volante) montopagado, vo_obse' +
        'rvaciones,'
      
        '       vo_fechapro, vo_vencimiento, vo_fechafactura, vo_usuapro,' +
        ' vo_fechapago,'
      
        '       vo_usupago, vo_notadebito, vo_ajuste, vo_ordenpago, tp_de' +
        'scripcion,'
      
        '       TO_CHAR (vo_fechacheque, '#39'DD/MM/YYYY'#39') fechacheque, vo_ch' +
        'eque,'
      '       TO_NUMBER (iif_null (vo_tipopago,'
      '                            NULL,'
      '                            amebpba.get_montopagado (vo_volante)'
      '                           )'
      '                 ) imppagado,'
      
        '       dcarga.lg_nombre delegcarga, dpago.lg_nombre delegpago, c' +
        'a_nombrefanta,'
      '       vo_fecharecepcion, ca_clave, vo_fecharecepcion_central,'
      '       DECODE (vo_estadocheque,'
      '               '#39'01'#39', '#39'Emitido'#39','
      '               '#39'02'#39', '#39'Pagado'#39','
      '               '#39'03'#39', '#39'Retenido'#39','
      '               NULL'
      '              ) estadocheque,'
      '       vo_refacturacion,'
      
        '       decode(cp_idsucursal, Null, art.utiles.iif_char (cp_cbu1,' +
        ' NULL, NULL, cp_cbu1 || '#39'-'#39' || cp_cbu2), cp_nrocuenta) cbu,'
      
        '       vo_facpen, vo_fecharecepaudit, vo_fechareceportopedia, vo' +
        '_fecharecepliquid,'
      '      vo_volantecancela, vo_volantecancelado,'
      '      amebpba.get_totaldebito(vo_volante) totaldebito'
      '  FROM dlg_delegaciones dcarga,'
      '       dlg_delegaciones dpago,'
      '       cpr_prestador,'
      '       stp_tipopago,'
      '       svo_volantes,'
      '       cpv_provincias,'
      '       ccp_cuentapago'
      ' WHERE ca_identificador = vo_prestador'
      '   AND vo_tipopago = tp_codigo(+)'
      '   AND dcarga.lg_codigo = vo_delegacionalta'
      '   AND dpago.lg_codigo = vo_delegacion'
      '   AND ca_provincia = pv_codigo(+)'
      '   and ca_identificador = cp_idacreedor(+)'
      '   and cp_tipoacreedor(+) = '#39'CA'#39'   '
      '   and cp_fechabaja(+) is null'
      '   AND 1 = 2'
      '')
    Left = 110
    Top = 7
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 138
    Top = 7
  end
  object pMnuImpresiones: TPopupMenu
    Left = 258
    Top = 8
    object mnuSeleccionartodos: TMenuItem
      Caption = 'Seleccionar todos los registros'
      OnClick = mnuSeleccionartodosClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuImpResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImpResultadosClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object mnuImpVolante: TMenuItem
      Caption = 'Reimpresi'#243'n del Volante'
      OnClick = mnuImpVolanteClick
    end
    object mnuImpTodosVolante: TMenuItem
      Caption = 'Reimprimir Todos los Volantes Seleccionados'
      OnClick = mnuImpTodosVolanteClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnuImpNotaDebitoInterna: TMenuItem
      Caption = 'Impresi'#243'n de Nota de D'#233'bito Interna (AMF)'
      OnClick = mnuImpNotaDebitoInternaClick
    end
    object mnuImpNotaDebito: TMenuItem
      Caption = 'Reimpresi'#243'n de la Nota de D'#233'bito'
      OnClick = mnuImpNotaDebitoClick
    end
    object mnuImpTodasNotaDebito: TMenuItem
      Caption = 'Reimprimir Todas las Notas de D'#233'bito'
      OnClick = mnuImpTodasNotaDebitoClick
    end
    object mnuImpDetalle: TMenuItem
      Caption = 'Detalle de la Factura / Devoluci'#243'n de Ajuste'
      OnClick = mnuImpDetalleClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuImpResMontosySaldos: TMenuItem
      Caption = 'Resumen de Montos y Saldos'
      OnClick = mnuImpResMontosySaldosClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object mnuImpRemitoMP: TMenuItem
      Caption = 'Remito de Seguro Mala Praxis'
      OnClick = mnuImpRemitoMPClick
    end
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <
      item
        Title = 'Nro.'
        TitleAlignment = taCenter
        DataField = 'VO_VOLANTE'
        Alignment = taCenter
        TotalType = ttCount
        MaxLines = 1
        MaxLength = 7
      end
      item
        Title = 'Prestador'
        DataField = 'CA_DESCRIPCION'
        MaxLength = 25
      end
      item
        Title = 'Nombre Fantas'#237'a'
        DataField = 'CA_NOMBREFANTA'
        Visible = False
        MaxLength = 23
      end
      item
        Title = 'Pcia. Prestador'
        DataField = 'PV_DESCRIPCION'
        MaxLines = 1
        MaxLength = 12
      end
      item
        Title = 'Factura'
        DataField = 'FACTURA'
        Alignment = taCenter
        MaxLines = 1
        MaxLength = 12
      end
      item
        Title = 'Fecha'
        DataField = 'VO_FECHALTA'
        Alignment = taCenter
        MaxLines = 1
        MaxLength = 8
      end
      item
        Title = 'Monto'
        DataField = 'VO_MONTO'
        Alignment = taRightJustify
        TotalType = ttCustom
        FormatFloat = '#,##.00'
        MaxLines = 1
        MaxLength = 9
      end
      item
        Title = 'A Pagar'
        DataField = 'MONTOPAGADO'
        Alignment = taRightJustify
        TotalType = ttCustom
        FormatFloat = '#,##.00'
        MaxLines = 1
        MaxLength = 9
      end
      item
        Title = 'Pendiente'
        DataField = 'VO_FACPEN'
        Alignment = taRightJustify
        TotalType = ttCustom
        FormatFloat = '#,##.00'
        MaxLines = 1
        MaxLength = 9
      end
      item
        Title = 'Estado'
        DataField = 'ESTADO'
        MaxLines = 1
        MaxLength = 13
      end
      item
        Title = 'F. Aprob.'
        DataField = 'VO_FECHAPRO'
        Alignment = taCenter
        MaxLines = 1
        MaxLength = 8
      end
      item
        Title = 'Usu.Aprob.'
        DataField = 'VO_USUAPRO'
        MaxLines = 1
        MaxLength = 10
      end
      item
        Title = 'F.Vencim.'
        TitleAlignment = taCenter
        DataField = 'VO_VENCIMIENTO'
        MaxLines = 1
        MaxLength = 8
      end
      item
        Title = 'F. Factura'
        TitleAlignment = taCenter
        DataField = 'VO_FECHAFACTURA'
        Alignment = taCenter
        MaxLines = 1
        MaxLength = 8
      end
      item
        Title = 'Fecha Aut.'
        DataField = 'VO_FECHAPAGO'
        Alignment = taCenter
        MaxLines = 1
        MaxLength = 8
      end
      item
        Title = 'Usu.Aut.'
        DataField = 'VO_USUPAGO'
        MaxLines = 1
        MaxLength = 10
      end
      item
        Title = 'F.Recep.'
        DataField = 'VO_FECHARECEPCION'
        Alignment = taCenter
        MaxLines = 1
        MaxLength = 8
      end
      item
        Title = 'F.Recep.Ort.'
        DataField = 'VO_FECHARECEPORTOPEDIA'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'F.Recep.Liq.'
        DataField = 'VO_FECHARECEPLIQUID'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Total d'#233'bito'
        DataField = 'TOTALDEBITO'
        Alignment = taRightJustify
        TotalType = ttCustom
        FormatFloat = '#,##.00'
        MaxLines = 1
        MaxLength = 9
      end
      item
        Title = 'Observaciones'
        DataField = 'VO_OBSERVACIONES'
        MaxLength = 70
      end
      item
        Title = 'O.de Pago'
        TitleAlignment = taCenter
        DataField = 'VO_ORDENPAGO'
        Alignment = taCenter
        MaxLines = 1
        MaxLength = 8
      end
      item
        Title = 'Tipo de Pago'
        DataField = 'TP_DESCRIPCION'
        MaxLines = 1
        MaxLength = 24
      end
      item
        Title = 'F.del Pago'
        TitleAlignment = taCenter
        DataField = 'FECHACHEQUE'
        Alignment = taCenter
        MaxLines = 1
        MaxLength = 8
      end
      item
        Title = 'N'#186' de Cheque'
        TitleAlignment = taCenter
        DataField = 'VO_CHEQUE'
        Alignment = taCenter
        MaxLines = 1
        MaxLength = 11
      end
      item
        Title = 'Importe Pagado'
        TitleAlignment = taCenter
        DataField = 'IMPPAGADO'
        Alignment = taRightJustify
        TotalType = ttCustom
        FormatFloat = '#,##.00'
        MaxLines = 1
        MaxLength = 7
      end
      item
        Title = 'Auditado'
        TitleAlignment = taCenter
        DataField = 'VO_AUDITADO'
        Alignment = taCenter
        MaxLength = 0
      end
      item
        Title = 'Refacturac.'
        TitleAlignment = taCenter
        DataField = 'VO_REFACTURACION'
        Alignment = taCenter
        Visible = False
        MaxLength = 0
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Volantes'
    Title.Logo.Alignment = taLeftJustify
    Title.BottomSpace = 15
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    SubTitle.Lines.Strings = (
      'Filtros')
    Headers.Color = 15461355
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = []
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
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
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    OnGetTotals = QueryPrintGetTotals
    OnGetCellParams = QueryPrintGetCellParams
    Left = 166
    Top = 7
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'Volante'
        DataField = 'VO_VOLANTE'
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'CA_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Nombre Fantas'#237'a'
        DataField = 'CA_NOMBREFANTA'
        FieldIndex = 0
      end
      item
        Title = 'Pcia. Prestador'
        DataField = 'PV_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'CBU Prestador'
        DataField = 'CBU'
        FieldIndex = 0
      end
      item
        Title = 'Factura'
        DataField = 'FACTURA'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Alta'
        DataField = 'VO_FECHALTA'
        FieldIndex = 0
      end
      item
        Title = 'Monto Facturado'
        DataField = 'VO_MONTO'
        FieldIndex = 0
      end
      item
        Title = 'Estado'
        DataField = 'ESTADO'
        FieldIndex = 0
      end
      item
        Title = 'Monto a Pagar'
        DataField = 'MONTOPAGADO'
        FieldIndex = 0
      end
      item
        Title = 'Facturado Pendiente'
        DataField = 'VO_FACPEN'
        FieldIndex = 0
      end
      item
        Title = 'Nota de D'#233'bito'
        DataField = 'VO_NOTADEBITO'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'VO_OBSERVACIONES'
        FieldIndex = 0
      end
      item
        Title = 'F.Recepci'#243'n'
        DataField = 'VO_FECHARECEPCION'
        FieldIndex = 0
      end
      item
        Title = 'F.Rec.Central'
        DataField = 'VO_FECHARECEPCION_CENTRAL'
        FieldIndex = 0
      end
      item
        Title = 'F.Vencimiento'
        DataField = 'VO_VENCIMIENTO'
        FieldIndex = 0
      end
      item
        Title = 'Fecha Factura'
        DataField = 'VO_FECHAFACTURA'
        FieldIndex = 0
      end
      item
        Title = 'Fecha Aprob.'
        DataField = 'VO_FECHAPRO'
        FieldIndex = 0
      end
      item
        Title = 'Usuario Aprob.'
        DataField = 'VO_USUAPRO'
        FieldIndex = 0
      end
      item
        Title = 'Fecha Aut.Pago'
        DataField = 'VO_FECHAPAGO'
        FieldIndex = 0
      end
      item
        Title = 'Usuario Aut.Pago'
        DataField = 'VO_USUPAGO'
        FieldIndex = 0
      end
      item
        Title = 'Orden de Pago'
        DataField = 'VO_ORDENPAGO'
        FieldIndex = 0
      end
      item
        Title = 'Tipo de Pago'
        DataField = 'TP_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Fecha del Pago'
        DataField = 'FECHACHEQUE'
        FieldIndex = 0
      end
      item
        Title = 'Nro.de Cheque'
        DataField = 'VO_CHEQUE'
        FieldIndex = 0
      end
      item
        Title = 'Estado Cheque'
        DataField = 'ESTADOCHEQUE'
        FieldIndex = 0
      end
      item
        Title = 'Importe Pagado'
        DataField = 'IMPPAGADO'
        FieldIndex = 0
      end
      item
        Title = 'Deleg. de la Carga'
        DataField = 'DELEGCARGA'
        FieldIndex = 0
      end
      item
        Title = 'Deleg. del Pago'
        DataField = 'DELEGPAGO'
        FieldIndex = 0
      end
      item
        Title = 'Volante Ajustado'
        DataField = 'VO_AJUSTE'
        FieldIndex = 0
      end
      item
        Title = 'Auditado'
        DataField = 'VO_AUDITADO'
        FieldIndex = 0
      end
      item
        Title = 'Usuario Auditor'#237'a'
        DataField = 'VO_USUARIOAUDITORIA'
        FieldIndex = 0
      end
      item
        Title = 'Fec. Audi.'
        DataField = 'VO_FECHAAUDITORIA'
        FieldIndex = 0
      end
      item
        Title = 'Refacturac.'
        DataField = 'VO_REFACTURACION'
        FieldIndex = 0
      end
      item
        Title = 'Usuario Audi. Ortopedia'
        DataField = 'VO_USUARIOORTOPEDIA'
        FieldIndex = 0
      end
      item
        Title = 'Fec. Audi. Ortopedia'
        DataField = 'VO_FECHAORTOPEDIA'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 194
    Top = 7
  end
  object ludTotPorEstado: TLookupDialog
    Caption = 'Totales por Estado'
    CharCase = ecUpperCase
    DataField = 'ESTADO'
    Columns = <
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 330
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CANTIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Cantidad'
        Width = 120
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MONTO'
        Title.Caption = 'Monto Facturado'
        Width = 120
        Visible = True
      end>
    AutoFill = False
    ShowButtons = True
    ShowEditor = False
    ShowHeaders = True
    AllowCancel = True
    MaxRows = 0
    MinRows = 8
    ShowExportar = True
    Left = 53
    Top = 36
  end
  object sdqTotPorEstado: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_DESCRIPCION, COUNT(*) CANTIDAD, SUM(VO_MONTO) MONTO'
      'FROM SVO_VOLANTES, CTB_TABLAS'
      'WHERE TB_CLAVE = '#39'MUVOL'#39
      'AND TB_CODIGO = vo_estado'
      'GROUP BY TB_DESCRIPCION'
      'ORDER BY COUNT(*) DESC')
    Left = 54
    Top = 8
  end
  object dsTotPorEstado: TDataSource
    DataSet = sdqTotPorEstado
    Left = 82
    Top = 8
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        OnShortCutPress = tbRefrescarClick
        LinkControl = tbRefrescar
      end
      item
        Key = 16452
        OnShortCutPress = tbDetallesClick
        LinkControl = tbDetalles
      end
      item
        Key = 16460
        OnShortCutPress = tbLimpiarClick
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        OnShortCutPress = tbOrdenClick
        LinkControl = tbOrden
      end
      item
        Key = 16457
        OnShortCutPress = tbImprimirClick
        LinkControl = tbImprimir
      end
      item
        Key = 16430
        OnShortCutPress = tbCancelarClick
        LinkControl = tbCancelar
      end
      item
        Key = 16453
        OnShortCutPress = tbTotPorEstadoClick
        LinkControl = tbTotPorEstado
      end
      item
        Key = 16467
        OnShortCutPress = tbAsignarAuditorVolanteClick
        LinkControl = tbAsignarAuditorVolante
      end
      item
        Key = 16449
        OnShortCutPress = tbDesAprobarClick
        LinkControl = tbDesAprobar
      end
      item
        Key = 16461
        OnShortCutPress = tbReasignarAuditClick
        LinkControl = tbReasignarAudit
      end
      item
        Key = 16469
        LinkControl = tbAuditoria
      end
      item
        Key = 16466
        LinkControl = tbDerivar
      end
      item
        Key = 16455
        LinkControl = tbReasignar
      end
      item
        Key = 16468
        LinkControl = tbAuditoriaOrtopedia
      end
      item
        Key = 16456
        LinkControl = tbHistorico
      end>
    Left = 194
    Top = 35
  end
  object sdqDelegacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT LG_CODIGO, LG_NOMBRE, LG_LOCALIDAD, '
      
        '               UTILES.Armar_Domicilio(LG_CALLE, LG_NUMERO, LG_PI' +
        'SO, LG_DEPARTAMENTO) DIRECCION, '
      
        '               UTILES.Armar_Telefono(LG_CODAREATELEFONO,null, LG' +
        '_TELEFONO) TELEFONO '
      'FROM DLG_DELEGACIONES'
      'ORDER BY LG_NOMBRE')
    Left = 145
    Top = 280
  end
  object dsDelegacion: TDataSource
    DataSet = sdqDelegacion
    Left = 173
    Top = 280
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatos
    Fields = <
      item
        DataField = 'VO_VOLANTE'
        Title = 'Volante'
      end
      item
        DataField = 'CA_CLAVE'
        Title = 'CUIT'
      end
      item
        DataField = 'CA_IDENTIFICADOR'
        Title = 'Id. Prest.'
      end
      item
        DataField = 'CA_DESCRIPCION'
        Title = 'Prestador'
      end
      item
        DataField = 'CA_NOMBREFANTA'
        Title = 'Nombre de Fantas'#237'a'
      end
      item
        DataField = 'PV_DESCRIPCION'
        Title = 'Pcia. Prestador'
      end
      item
        DataField = 'FACTURA'
        Title = 'Factura'
      end
      item
        DataField = 'VO_FECHALTA'
        Title = 'Fecha de Alta'
      end
      item
        DataField = 'VO_MONTO'
        Title = 'Monto Facturado'
      end
      item
        DataField = 'ESTADO'
        Title = 'Estado'
      end
      item
        DataField = 'MONTOPAGADO'
        Title = 'Monto a Pagar'
      end
      item
        DataField = 'VO_NOTADEBITO'
        Title = 'Nota de D'#233'bito'
      end
      item
        DataField = 'VO_OBSERVACIONES'
        Title = 'Observaciones'
      end
      item
        DataField = 'VO_FECHARECEPCION'
        Title = 'F.Recepci'#243'n'
      end
      item
        DataField = 'VO_VENCIMIENTO'
        Title = 'F.Vencimiento'
      end
      item
        DataField = 'VO_FECHAFACTURA'
        Title = 'Fecha Factura'
      end
      item
        DataField = 'VO_FECHAPRO'
        Title = 'Fecha Aprob.'
      end
      item
        DataField = 'VO_USUAPRO'
        Title = 'Usuario Aprob.'
      end
      item
        DataField = 'VO_FECHAPAGO'
        Title = 'Fecha Aut.Pago'
      end
      item
        DataField = 'VO_USUPAGO'
        Title = 'Usuario Aut.Pago'
      end
      item
        DataField = 'VO_ORDENPAGO'
        Title = 'Orden de Pago'
      end
      item
        DataField = 'TP_DESCRIPCION'
        Title = 'Tipo de Pago'
      end
      item
        DataField = 'FECHACHEQUE'
        Title = 'Fecha del Pago'
      end
      item
        DataField = 'VO_CHEQUE'
        Title = 'Nro.de Cheque'
      end
      item
        DataField = 'IMPPAGADO'
        Title = 'Importe Pagado'
      end
      item
        DataField = 'DELEGPAGO'
        Title = 'Delegaci'#243'n del Pago'
      end
      item
        DataField = 'DELEGCARGA'
        Title = 'Delegaci'#243'n de Carga'
      end
      item
        DataField = 'VO_AUDITADO'
        Title = 'Auditado'
        Alignment = taCenter
      end
      item
        DataField = 'VO_USUARIOAUDITORIA'
        Title = 'Usuario Auditor'#237'a'
      end
      item
        DataField = 'VO_FECHAAUDITORIA'
        Title = 'Fec. Audi.'
        Alignment = taCenter
      end
      item
        DataField = 'VO_REFACTURACION'
        Title = 'Refacturac.'
      end
      item
        DataField = 'VO_FECHARECEPCION_CENTRAL'
        Title = 'F.Rec.Central'
      end
      item
        DataField = 'VO_CARGA_CENTRAL'
        Title = 'Proceso Central'
      end
      item
        DataField = 'VO_USUARIOORTOPEDIA'
        Title = 'Usuario Audi. Ortopedia'
      end
      item
        DataField = 'VO_FECHAORTOPEDIA'
        Title = 'Fec. Audi. Ortopedia'
      end
      item
        DataField = 'VO_FECHARECEPAUDIT'
        Title = 'Fec. Recep. Auditor'#237'a'
      end
      item
        DataField = 'VO_FECHARECEPORTOPEDIA'
        Title = 'Fec. Recep. Ortopedia'
      end
      item
        DataField = 'VO_FECHARECEPLIQUID'
        Title = 'Fec. Recep. Liquid.'
      end
      item
        DataField = 'VO_VOLANTECANCELA'
        Title = 'Volante que cancela a'
      end
      item
        DataField = 'VO_VOLANTECANCELADO'
        Title = 'Volante reemplazado por'
      end
      item
        DataField = 'TOTALDEBITO'
        Title = 'Total d'#233'bito'
      end
      item
        DataField = 'VO_FECHATERMINACION'
        Title = 'Fecha term. derivaci'#243'n'
      end
      item
        DataField = 'VO_OBSERVACIONES_DERIVACION'
        Title = 'Observaciones de Derivaci'#243'n'
      end>
    IniStorage = FormPlacement
    OutputFile = 'ConsVol.txt'
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
    Left = 27
    Top = 36
  end
  object pMnuTmp: TPopupMenu
    Left = 286
    Top = 8
    object mnuTmpPasarSeleccion: TMenuItem
      Caption = 'Pasar la Selecci'#243'n'
      OnClick = mnuTmpPasarSeleccionClick
    end
    object mnuTmpPasarTodos: TMenuItem
      Caption = 'Pasar Todos'
      OnClick = mnuTmpPasarTodosClick
    end
  end
  object sdqTraspasos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT VO_VOLANTETEMP, VO_VOLANTE, '
      
        '               VO_FACTURATIPO || '#39'-'#39' || VO_FACTURAESTABLE || '#39'-'#39 +
        ' || VO_FACTURANRO FACTURA, '
      
        '               VO_FECHAFACTURA, VO_MONTO, VO_PRESTADOR, CA_DESCR' +
        'IPCION'
      'FROM SVO_VOLANTES, CPR_PRESTADOR'
      'WHERE CA_IDENTIFICADOR = VO_PRESTADOR'
      'AND VO_USUALTA = :pUsuario')
    Left = 222
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'pUsuario'
        ParamType = ptInput
      end>
  end
  object dsTraspasos: TDataSource
    DataSet = sdqTraspasos
    Left = 27
    Top = 268
  end
  object qpTraspasos: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Origen'
        DataField = 'VO_VOLANTETEMP'
        Alignment = taRightJustify
        MaxLength = 10
      end
      item
        Title = 'Destino'
        TitleAlignment = taCenter
        DataField = 'VO_VOLANTE'
        Alignment = taRightJustify
        MaxLength = 10
      end
      item
        Title = 'Factura'
        TitleAlignment = taCenter
        DataField = 'FACTURA'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'Fecha'
        DataField = 'VO_FECHAFACTURA'
        Alignment = taCenter
        TotalType = ttCustom
        SubTotalType = ttCustom
        MaxLength = 10
      end
      item
        Title = 'Monto'
        DataField = 'VO_MONTO'
        Alignment = taRightJustify
        TotalType = ttAutoSum
        SubTotalType = ttAutoSum
        FormatFloat = '#,##.00'
        MaxLength = 10
      end
      item
        Title = 'Prestador'
        DataField = 'VO_PRESTADOR'
        Alignment = taCenter
        TotalType = ttCount
        SubTotalType = ttCount
        SubTotalGroup = True
        MaxLength = 8
      end
      item
        Title = 'Descripcion'
        DataField = 'CA_DESCRIPCION'
        MaxLength = 70
      end>
    DataSource = dsTraspasos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'MS Sans Serif'
    Title.Font.Style = [fsBold]
    Title.Text = 'Reporte de Traspasos de Volantes'
    Title.Logo.Alignment = taLeftJustify
    Title.BottomSpace = 15
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -8
    SubTitle.Font.Name = 'Small Fonts'
    SubTitle.Font.Style = [fsBold]
    SubTitle.Alignment = taLeftJustify
    SubTitle.PrintOptions = poFirstPage
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
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
    Totals.Font.Style = [fsBold]
    Totals.TotalsStyle = tsFillOnlyData
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = [fsBold]
    SubTotals.TotalsStyle = tsFillOnlyData
    SubTotals.BottomSpace = 50
    PageOrientation = pxPortrait
    OnGetTotals = qpTraspasosGetTotals
    OnGetSubTotals = qpTraspasosGetSubTotals
    Left = 55
    Top = 268
  end
  object sdqDelegacionPago: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT LG_CODIGO, LG_NOMBRE, LG_LOCALIDAD, '
      
        '               UTILES.Armar_Domicilio(LG_CALLE, LG_NUMERO, LG_PI' +
        'SO, LG_DEPARTAMENTO) DIRECCION, '
      
        '               UTILES.Armar_Telefono(LG_CODAREATELEFONO,null, LG' +
        '_TELEFONO) TELEFONO '
      'FROM DLG_DELEGACIONES'
      'ORDER BY LG_NOMBRE')
    Left = 405
    Top = 272
  end
  object dsDelegacionPago: TDataSource
    DataSet = sdqDelegacionPago
    Left = 433
    Top = 272
  end
  object sdqProvinciaPrestador: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select pv_codigo, pv_descripcion'
      'from cpv_provincias')
    Left = 28
    Top = 240
  end
  object dsProvinciaPrestador: TDataSource
    DataSet = sdqProvinciaPrestador
    Left = 56
    Top = 240
  end
  object sdqEstados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION '
      '  FROM CTB_TABLAS '
      ' WHERE TB_CLAVE = '#39'MUVOL'#39
      '   AND TB_CODIGO <> '#39'0'#39' '
      '   AND TB_ESPECIAL1 = '#39'C'#39
      'ORDER BY TB_DESCRIPCION')
    Left = 662
    Top = 19
  end
  object dsEstados: TDataSource
    DataSet = sdqEstados
    Left = 694
    Top = 23
  end
  object pMnuTmpImpExp: TPopupMenu
    Left = 314
    Top = 36
    object mnuImprimirTmp: TMenuItem
      Caption = '&Imprimir traspasados'
      OnClick = mnuImprimirTmpClick
    end
    object mnuExportarTmp: TMenuItem
      Tag = 1
      Caption = '&Exportar traspasados'
      OnClick = mnuExportarTmpClick
    end
    object mnuExportarTodo: TMenuItem
      Caption = 'Exportar &todo'
      OnClick = mnuExportarTodoClick
    end
    object mnuReimprimirTemp: TMenuItem
      Caption = 'Reimprimir temporal'
      Enabled = False
      OnClick = mnuReimprimirTempClick
    end
  end
  object ExportDialogTmp: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqTraspasos
    Fields = <>
    OutputFile = 'Traspasos.txt'
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
    Left = 342
    Top = 36
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 222
    Top = 36
  end
  object pMnuEnviarMail: TPopupMenu
    Left = 314
    Top = 8
    object MnuEnviarNotaDebito: TMenuItem
      Caption = 'Env'#237'o de la Nota de D'#233'bito'
      OnClick = MnuEnviarNotaDebitoClick
    end
    object MnuEnviarDetalle: TMenuItem
      Caption = 'Detalle de la Factura / Devoluci'#243'n de Ajuste'
      OnClick = MnuEnviarDetalleClick
    end
  end
  object pMnuCancelar: TPopupMenu
    Left = 342
    Top = 8
    object MnuCancelarVolante: TMenuItem
      Caption = 'Cancelar Volante'
      OnClick = MnuCancelarVolanteClick
    end
    object MnuCancelarReemplazar: TMenuItem
      Caption = 'Cancelar y reemplazar'
      OnClick = MnuCancelarReemplazarClick
    end
  end
  object sdqHistoricoVolante: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   hv_volante, tb_descripcion, hv_fechaalta, hv_usualta,'
      
        '                 art.amebpba.get_estadoprevio_vol(hv_volante,hv_' +
        'id) anterior'
      '    FROM shv_historicovolante, ctb_tablas'
      '   WHERE hv_estado = tb_codigo'
      '     AND tb_clave = '#39'MUVOL'#39
      '')
    Left = 259
    Top = 64
  end
  object dsHistoricoVolante: TDataSource
    DataSet = sdqHistoricoVolante
    Left = 287
    Top = 64
  end
  object sdHistorico: TSortDialog
    Caption = 'Orden'
    DataSet = sdqHistoricoVolante
    SortFields = <
      item
        Title = 'ID'
        DataField = 'HV_ID'
        FieldIndex = 0
      end
      item
        Title = 'Volante'
        DataField = 'HV_VOLANTE'
        FieldIndex = 0
      end
      item
        Title = 'Usuario alta'
        DataField = 'HV_USUALTA'
        FieldIndex = 0
      end
      item
        Title = 'Fecha alta'
        DataField = 'HV_FECHAALTA'
        FieldIndex = 0
      end
      item
        Title = 'Estado'
        DataField = 'TB_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Estado anterior'
        DataField = 'ANTERIOR'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 315
    Top = 64
  end
  object sdqEstudios: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   dl_idlote lote, tj_cuil cuil, tj_nombre nombre,'
      '         TO_CHAR (dl_idestudio, '#39'00000000'#39') estudio,'
      '         es_descripcion descripcion, dl_fecharealizacion,'
      
        '         DECODE (dl_debito, '#39'S'#39', '#39'SI'#39', '#39'NO'#39') debitado, dl_fechad' +
        'ebito,'
      '         mr_descripcion motivo, '
      '         if_valorfacturado ValFact, '
      '         if_valoraprobados ValAprob'
      '    FROM ctj_trabajador,'
      '         art.aes_estudios,'
      '         hys.hmr_motivorechazo,'
      '         hys.hdl_detallelote,'
      '         art.sif_itemfacturaamp'
      '   WHERE tj_id = dl_idtrabajador'
      '     AND es_id = dl_idestudio'
      '     AND mr_id(+) = dl_motivodebito'
      '     AND dl_iddetvolante = if_id'
      '     AND if_idvolante = :idvolante'
      'ORDER BY 1, 2, 4'
      '')
    Left = 178
    Top = 522
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idvolante'
        ParamType = ptInput
      end>
  end
  object dsEstudios: TDataSource
    DataSet = sdqEstudios
    Left = 206
    Top = 522
  end
  object SortDialog1: TSortDialog
    Caption = 'Orden'
    DataSet = sdqEstudios
    SortFields = <
      item
        Title = 'Lote'
        DataField = 'lote'
        FieldIndex = 0
      end
      item
        Title = 'CUIL'
        DataField = 'cuil'
        FieldIndex = 1
      end
      item
        Title = 'Nombre trabajador'
        DataField = 'nombre'
        FieldIndex = 2
      end
      item
        Title = 'Estudio'
        DataField = 'estudio'
        FieldIndex = 3
      end
      item
        Title = 'Descripci'#243'n estudio'
        DataField = 'descripcion'
        FieldIndex = 4
      end
      item
        Title = 'F.Realizaci'#243'n'
        DataField = 'dl_fecharealizacion'
        FieldIndex = 5
      end
      item
        Title = 'Debitado'
        DataField = 'debitado'
        FieldIndex = 6
      end
      item
        Title = 'F.D'#233'bito'
        DataField = 'dl_fechadebito'
        FieldIndex = 7
      end
      item
        Title = 'Motivo d'#233'bito'
        DataField = 'motivo'
        FieldIndex = 8
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 238
    Top = 519
  end
  object pMnuExportar: TPopupMenu
    Left = 286
    Top = 36
    object mnuExportarGrilla: TMenuItem
      Caption = 'Exportar Grilla'
      OnClick = mnuExportarGrillaClick
    end
    object mnuExportarNotaDebito: TMenuItem
      Caption = 'Exportar Nota de D'#233'bito'
      OnClick = mnuExportarNotaDebitoClick
    end
  end
  object OpenDialogPDF: TOpenDialog
    DefaultExt = 'pdf'
    FileName = 'NotaDebito_.pdf'
    Filter = 'Archivo PDF|*.pdf'
    InitialDir = 'c:'
    Left = 28
    Top = 8
  end
  object pMnuAuditoria: TPopupMenu
    Left = 258
    Top = 36
    object mnuAudiSinD: TMenuItem
      Caption = 'Auditar sin d'#233'bito'
      OnClick = mnuAudiSinDClick
    end
    object mnuAudiConD: TMenuItem
      Caption = 'Auditar con d'#233'bito'
      OnClick = mnuAudiConDClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object munAvalDebitoPendiente: TMenuItem
      Caption = 'Avalar d'#233'bito pendiente'
      OnClick = munAvalDebitoPendienteClick
    end
    object mnuAvalarDebito: TMenuItem
      Caption = 'Avalar d'#233'bito aprobado'
      OnClick = mnuAvalarDebitoClick
    end
    object mnuVerDebitosPorAuditoria: TMenuItem
      Caption = 'Ver d'#233'bitos por auditor'#237'a'
      OnClick = mnuVerDebitosPorAuditoriaClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object mnuDiscrepancias: TMenuItem
      Caption = 'Discrepancias'
      object mnuAgregarDiscrepancia: TMenuItem
        Caption = 'Agregar'
        OnClick = mnuAgregarDiscrepanciaClick
      end
      object mnuAvalarDiscrepancia: TMenuItem
        Caption = 'Avalar'
        OnClick = mnuAvalarDiscrepanciaClick
      end
      object mnuVisualizarDiscrepancia: TMenuItem
        Caption = 'Visualizar'
        OnClick = mnuVisualizarDiscrepanciaClick
      end
    end
  end
  object cds: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Volante'
        DataType = ftInteger
      end
      item
        Name = 'Mail'
        DataType = ftString
        Size = 800
      end
      item
        Name = 'Prestador'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'Identificador'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CUIT'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end
      item
        Name = 'CUIT'
        Fields = 'CUIT'
      end>
    IndexFieldNames = 'CUIT'
    Params = <>
    StoreDefs = True
    Left = 656
    Top = 360
    Data = {
      B20000009619E0BD010000001800000005000000000003000000B20007566F6C
      616E74650400010000000000044D61696C020049000000010005574944544802
      000200200309507265737461646F720200490000000100055749445448020002
      002C010D4964656E746966696361646F72010049000000010005574944544802
      0002001400044355495401004900000001000557494454480200020014000100
      0D44454641554C545F4F524445520200820000000000}
    object cdsVolante: TIntegerField
      FieldName = 'Volante'
    end
    object cdsMail: TStringField
      FieldName = 'Mail'
      Size = 800
    end
    object cdsPrestador: TStringField
      FieldName = 'Prestador'
      Size = 300
    end
    object cdsIdentificador: TStringField
      FieldName = 'Identificador'
    end
    object cdsCUIT: TStringField
      FieldName = 'CUIT'
    end
  end
  object pMnuNoAuditable: TPopupMenu
    Left = 344
    Top = 64
    object mnuVolNoAuditable: TMenuItem
      Caption = 'Volante no auditable'
      Hint = 'Marcar volante como "No Auditable"'
      OnClick = tbMarcarNoAuditableClick
    end
    object mnuVolanteYaAuditado: TMenuItem
      Caption = 'Volante ya auditado'
      Hint = 'Marcar volante como ya auditado'
      OnClick = tbMarcarNoAuditableClick
    end
  end
  object ExportDialogAMP: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqEstudios
    ExportFileType = etExcelFile
    Fields = <
      item
        DataField = 'lote'
        Title = 'Lote'
      end
      item
        DataField = 'cuil'
        Title = 'CUIL'
      end
      item
        DataField = 'nombre'
        Title = 'Trabajador'
      end
      item
        DataField = 'estudio'
        Title = 'Estudio'
      end
      item
        DataField = 'descripcion'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'dl_fecharealizacion'
        Title = 'Fecha Realiz.'
      end
      item
        DataField = 'debitado'
        Title = 'Debitado'
      end
      item
        DataField = 'dl_fechadebito'
        Title = 'Fecha D'#233'bito'
      end
      item
        DataField = 'motivo'
        Title = 'Motivo'
      end
      item
        DataField = 'ValFact'
        Title = 'ValFact'
      end
      item
        DataField = 'ValAprob'
        Title = 'ValAprob'
      end>
    IniStorage = FormPlacement
    OutputFile = 'EstAMP.txt'
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
    Left = 287
    Top = 516
  end
end
