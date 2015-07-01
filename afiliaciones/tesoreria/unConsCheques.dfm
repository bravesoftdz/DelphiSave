inherited frmConsCheques: TfrmConsCheques
  Left = 141
  Top = 174
  ActiveControl = edChequeDesde
  Caption = 'Consulta de Cheques'
  ClientHeight = 570
  ClientWidth = 792
  Constraints.MinHeight = 474
  Constraints.MinWidth = 800
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  ExplicitLeft = 141
  ExplicitTop = 174
  ExplicitWidth = 800
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 192
    ExplicitWidth = 792
    ExplicitHeight = 192
    DesignSize = (
      792
      192)
    object pgFiltros: TPageControl
      Left = -1
      Top = 0
      Width = 800
      Height = 193
      ActivePage = tsFiltro1
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      TabPosition = tpBottom
      object tsFiltro1: TTabSheet
        Caption = 'Filtro &1'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          792
          167)
        object grpNumCheque: TGroupBox
          Left = 0
          Top = 0
          Width = 149
          Height = 41
          Caption = ' N'#250'mero de Cheque '
          TabOrder = 0
          object Label1: TLabel
            Left = 69
            Top = 18
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edChequeDesde: TPatternEdit
            Left = 4
            Top = 14
            Width = 61
            Height = 21
            MaxLength = 20
            TabOrder = 0
            Pattern = '0123456789'
          end
          object edChequeHasta: TPatternEdit
            Left = 84
            Top = 14
            Width = 61
            Height = 21
            MaxLength = 20
            TabOrder = 1
            OnEnter = edChequeHastaEnter
            Pattern = '0123456789'
          end
        end
        object grpNroOP: TGroupBox
          Left = 0
          Top = 41
          Width = 149
          Height = 41
          Caption = ' N'#250'mero de Orden de Pago '
          TabOrder = 4
          object Label2: TLabel
            Left = 69
            Top = 18
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edOrdPagoDesde: TIntEdit
            Left = 4
            Top = 14
            Width = 61
            Height = 21
            TabOrder = 0
            MaxLength = 8
          end
          object edOrdPagoHasta: TIntEdit
            Left = 82
            Top = 14
            Width = 61
            Height = 21
            TabOrder = 1
            OnEnter = edOrdPagoHastaEnter
            MaxLength = 8
          end
        end
        object grpFechaOP: TGroupBox
          Left = 152
          Top = 41
          Width = 201
          Height = 41
          Caption = ' Fecha de la Orden de Pago '
          TabOrder = 5
          object Label4: TLabel
            Left = 94
            Top = 18
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edFechaOrdPagoDesde: TDateComboBox
            Left = 4
            Top = 14
            Width = 88
            Height = 21
            MaxDateCombo = edFechaOrdPagoHasta
            TabOrder = 0
          end
          object edFechaOrdPagoHasta: TDateComboBox
            Left = 108
            Top = 14
            Width = 88
            Height = 21
            MinDateCombo = edFechaOrdPagoDesde
            TabOrder = 1
          end
        end
        object grpFechaCheque: TGroupBox
          Left = 152
          Top = 0
          Width = 201
          Height = 41
          Caption = ' Fecha del Cheque '
          TabOrder = 1
          object Label3: TLabel
            Left = 94
            Top = 18
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edFechaChequeDesde: TDateComboBox
            Left = 4
            Top = 14
            Width = 88
            Height = 21
            MaxDateCombo = edFechaChequeHasta
            TabOrder = 0
          end
          object edFechaChequeHasta: TDateComboBox
            Left = 108
            Top = 14
            Width = 88
            Height = 21
            MinDateCombo = edFechaChequeDesde
            TabOrder = 1
          end
        end
        object grpMetodoPago: TGroupBox
          Left = 356
          Top = 0
          Width = 234
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = ' M'#233'todo de Pago '
          TabOrder = 2
          DesignSize = (
            234
            41)
          object cmbMetodoPago: TDBCheckCombo
            Left = 4
            Top = 14
            Width = 226
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DataSource = dsMetodoPagoFiltro
            KeyField = 'DESCRIPTION'
            ListField = 'DESCRIPTION'
          end
        end
        object grpEstado: TGroupBox
          Left = 356
          Top = 41
          Width = 234
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Estado '
          TabOrder = 6
          DesignSize = (
            234
            41)
          object cmbEstados: TDBCheckCombo
            Left = 5
            Top = 14
            Width = 223
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DataSource = dsEstados
            KeyField = 'TB_CODIGO'
            ListField = 'TB_DESCRIPCION'
          end
        end
        object grpFechaEstado: TGroupBox
          Left = 594
          Top = 41
          Width = 195
          Height = 41
          Anchors = [akTop, akRight]
          Caption = ' Fecha de Estado '
          TabOrder = 7
          object Label8: TLabel
            Left = 91
            Top = 18
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edFechaEstadoDesde: TDateComboBox
            Left = 2
            Top = 14
            Width = 88
            Height = 21
            MaxDateCombo = edFechaEstadoHasta
            TabOrder = 0
          end
          object edFechaEstadoHasta: TDateComboBox
            Left = 104
            Top = 14
            Width = 88
            Height = 21
            MinDateCombo = edFechaEstadoDesde
            TabOrder = 1
          end
        end
        object GroupBox1: TGroupBox
          Left = 594
          Top = 82
          Width = 195
          Height = 41
          Anchors = [akTop, akRight]
          Caption = ' Grupo Pago '
          TabOrder = 10
          DesignSize = (
            195
            41)
          object cmbGrupoPago: TDBCheckCombo
            Left = 4
            Top = 14
            Width = 187
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DataSource = dsGrupoPago
            KeyField = 'LOOKUP_CODE'
            ListField = 'LOOKUP_CODE'
          end
        end
        object grpBeneficiario: TGroupBox
          Left = 204
          Top = 82
          Width = 387
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Beneficiario '
          TabOrder = 9
          DesignSize = (
            387
            41)
          object edBeneficiario: TEdit
            Left = 4
            Top = 14
            Width = 379
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            TabOrder = 0
          end
        end
        object grpMonto: TGroupBox
          Left = 0
          Top = 82
          Width = 201
          Height = 41
          Caption = ' Monto '
          TabOrder = 8
          object Label9: TLabel
            Left = 94
            Top = 18
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edMontoDesde: TCurrencyEdit
            Left = 8
            Top = 14
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            TabOrder = 0
          end
          object edMontoHasta: TCurrencyEdit
            Left = 112
            Top = 14
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            TabOrder = 1
          end
        end
        object grpBanco: TGroupBox
          Left = 0
          Top = 123
          Width = 253
          Height = 41
          Caption = ' Banco '
          TabOrder = 11
          DesignSize = (
            253
            41)
          object cmbBanco: TDBCheckCombo
            Left = 5
            Top = 14
            Width = 243
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DataSource = dsBanco
            KeyField = 'BA_ID'
            ListField = 'BA_NOMBRE'
          end
        end
        object grpCuenta: TGroupBox
          Left = 256
          Top = 123
          Width = 278
          Height = 41
          Caption = ' Cuenta '
          TabOrder = 12
          DesignSize = (
            278
            41)
          object cmbCuenta: TDBCheckCombo
            Left = 4
            Top = 14
            Width = 268
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DataSource = dsCuenta
            KeyField = 'CB_ID'
            ListField = 'CB_NUMERO'
          end
        end
        object grpDelegacion: TGroupBox
          Left = 537
          Top = 123
          Width = 252
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Delegaciones '
          TabOrder = 13
          DesignSize = (
            252
            41)
          object cmbDelegacion: TDBCheckCombo
            Left = 3
            Top = 14
            Width = 244
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            AutoExit = True
            DataSource = dsDelegacion
            KeyField = 'EL_ID'
            ListField = 'EL_NOMBRE'
          end
        end
        object rgPagoMensual: TRadioGroup
          Left = 594
          Top = 0
          Width = 195
          Height = 41
          Anchors = [akTop, akRight]
          Caption = ' Pago Mensual ILP'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Todos'
            'Si'
            'No')
          TabOrder = 3
        end
      end
      object tsFiltro2: TTabSheet
        Caption = 'Filtro &2'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          792
          167)
        object grpFechaCuentaCont: TGroupBox
          Tag = 12
          Left = 0
          Top = 0
          Width = 202
          Height = 41
          Caption = ' Fecha de la Cuenta Contable '
          TabOrder = 0
          object Label20: TLabel
            Left = 94
            Top = 18
            Width = 16
            Height = 13
            Caption = '>>'
          end
          object edFechaCuentaContDesde: TDateComboBox
            Left = 4
            Top = 14
            Width = 88
            Height = 21
            MaxDateCombo = edFechaCuentaContHasta
            TabOrder = 0
          end
          object edFechaCuentaContHasta: TDateComboBox
            Left = 111
            Top = 14
            Width = 87
            Height = 21
            MinDateCombo = edFechaCuentaContDesde
            TabOrder = 1
          end
        end
        object grpCuentaContable: TGroupBox
          Tag = 13
          Left = 205
          Top = 0
          Width = 324
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Cuenta Contable '
          TabOrder = 1
          DesignSize = (
            324
            41)
          object cmbCuentaContable: TDBCheckCombo
            Left = 4
            Top = 15
            Width = 313
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DataSource = dsCuentaCont
            KeyField = 'CH_ID'
            ListField = 'CH_DESCRIPCION'
            ExplicitWidth = 1441
          end
        end
        object rgDebitados: TRadioGroup
          Left = 532
          Top = 0
          Width = 212
          Height = 41
          Anchors = [akTop, akRight]
          Caption = ' Debitados SI/NO '
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Todos'
            'Si'
            'No')
          TabOrder = 2
          ExplicitLeft = 1660
        end
        object grpSituacion: TGroupBox
          Left = 205
          Top = 41
          Width = 324
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Situaci'#243'n'
          TabOrder = 4
          DesignSize = (
            324
            41)
          object cmbSituaciones: TDBCheckCombo
            Left = 5
            Top = 14
            Width = 312
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DataSource = dsSituaciones
            KeyField = 'TB_CODIGO'
            ListField = 'TB_DESCRIPCION'
            ExplicitWidth = 1440
          end
        end
        object grpFechaSituacion: TGroupBox
          Tag = 12
          Left = 0
          Top = 41
          Width = 202
          Height = 41
          Caption = ' Fecha de la Situaci'#243'n'
          TabOrder = 3
          object Label23: TLabel
            Left = 94
            Top = 17
            Width = 16
            Height = 13
            Caption = '>>'
          end
          object edFechaSituacionDesde: TDateComboBox
            Left = 4
            Top = 14
            Width = 88
            Height = 21
            MaxDateCombo = edFechaSituacionHasta
            TabOrder = 0
          end
          object edFechaSituacionHasta: TDateComboBox
            Left = 110
            Top = 14
            Width = 88
            Height = 21
            MinDateCombo = edFechaSituacionDesde
            TabOrder = 1
          end
        end
        object GroupBox2: TGroupBox
          Left = 532
          Top = 41
          Width = 212
          Height = 41
          Anchors = [akTop, akRight]
          Caption = ' Fecha de D'#233'bito '
          TabOrder = 5
          object Label24: TLabel
            Left = 99
            Top = 17
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object dcbFechaDebitoDesde: TDateComboBox
            Left = 4
            Top = 14
            Width = 88
            Height = 21
            MaxDateCombo = dcbFechaDebitoHasta
            TabOrder = 0
          end
          object dcbFechaDebitoHasta: TDateComboBox
            Left = 120
            Top = 14
            Width = 88
            Height = 21
            MinDateCombo = dcbFechaDebitoDesde
            TabOrder = 1
          end
        end
        object grpTrabajador: TGroupBox
          Left = 0
          Top = 82
          Width = 433
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Trabajador'
          TabOrder = 6
          DesignSize = (
            433
            41)
          object Label25: TLabel
            Left = 12
            Top = 17
            Width = 23
            Height = 13
            Caption = 'CUIL'
          end
          inline fraTrabajad: TfraTrabajador
            Left = 39
            Top = 14
            Width = 387
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 39
            ExplicitTop = 14
            ExplicitWidth = 387
            DesignSize = (
              387
              22)
            inherited cmbNombre: TArtComboBox
              Width = 303
              ExplicitWidth = 1431
            end
          end
        end
        object GroupBox4: TGroupBox
          Left = 436
          Top = 82
          Width = 93
          Height = 41
          Anchors = [akTop, akRight]
          Caption = ' Archivo BAPRO'
          TabOrder = 7
          ExplicitLeft = 1564
          object edArchivoBAPRO: TIntEdit
            Left = 5
            Top = 14
            Width = 82
            Height = 21
            TabOrder = 0
          end
        end
        object GroupBox5: TGroupBox
          Left = 2
          Top = 123
          Width = 90
          Height = 41
          Anchors = [akLeft]
          Caption = ' CUIT'
          TabOrder = 9
          object edCUIT: TMaskEdit
            Left = 4
            Top = 14
            Width = 81
            Height = 21
            Hint = 'CUIT'
            EditMask = '99-99999999-c;0;'
            MaxLength = 13
            TabOrder = 0
          end
        end
        object GroupBox3: TGroupBox
          Left = 95
          Top = 123
          Width = 92
          Height = 41
          Caption = 'Exportaci'#243'n G&&D'
          TabOrder = 10
          object chkSinExportarGD: TCheckBox
            Left = 7
            Top = 16
            Width = 79
            Height = 17
            Caption = 'Sin Exportar'
            TabOrder = 0
          end
        end
        object GroupBox6: TGroupBox
          Left = 532
          Top = 82
          Width = 212
          Height = 41
          Anchors = [akTop, akRight]
          Caption = 'Transferencias'
          TabOrder = 8
          DesignSize = (
            212
            41)
          object Label26: TLabel
            Left = 94
            Top = 17
            Width = 21
            Height = 13
            Caption = 'Nro.'
          end
          object chkTransferencias: TCheckBox
            Left = 7
            Top = 16
            Width = 79
            Height = 17
            Caption = 'Con Transf.'
            TabOrder = 0
          end
          object edTransferencia: TIntEdit
            Left = 118
            Top = 13
            Width = 88
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            MaxLength = 8
          end
        end
        object gbEstadoCheque: TGroupBox
          Left = 190
          Top = 123
          Width = 95
          Height = 41
          Caption = 'Estado'
          TabOrder = 11
          object chkSoloChequesEmitidos: TCheckBox
            Left = 7
            Top = 16
            Width = 79
            Height = 17
            Caption = 'Solo Emitidos'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
        end
        object rgRecibos: TRadioGroup
          Left = 289
          Top = 123
          Width = 284
          Height = 41
          Caption = ' Recepci'#243'n de Recibos'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Todos'
            'Pend. Recepc.'
            'Con Recepc.')
          TabOrder = 12
        end
        object GroupBox7: TGroupBox
          Left = 577
          Top = 123
          Width = 212
          Height = 41
          Caption = ' Fecha de Recepci'#243'n'
          TabOrder = 13
          object Label28: TLabel
            Left = 99
            Top = 17
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edFechaRecepcionDesde: TDateComboBox
            Left = 4
            Top = 14
            Width = 88
            Height = 21
            MaxDateCombo = edFechaRecepcionHasta
            TabOrder = 0
          end
          object edFechaRecepcionHasta: TDateComboBox
            Left = 120
            Top = 14
            Width = 88
            Height = 21
            MinDateCombo = edFechaRecepcionDesde
            TabOrder = 1
          end
        end
      end
    end
    object pnlTotalRegistros: TPanel
      Left = 101
      Top = 173
      Width = 241
      Height = 19
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Cantidad'
      TabOrder = 1
      Visible = False
      object Label12: TLabel
        Left = 100
        Top = 3
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object edTotalRegistros: TCardinalEdit
        Left = 49
        Top = 1
        Width = 46
        Height = 21
        TabStop = False
        Color = clWhite
        ReadOnly = True
        TabOrder = 0
      end
      object edMontoCheques: TCurrencyEdit
        Left = 128
        Top = 1
        Width = 109
        Height = 18
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        Color = clWhite
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 192
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 26
        Width = 786
      end>
    ExplicitTop = 192
    ExplicitWidth = 792
    inherited ToolBar: TToolBar
      Width = 777
      Height = 26
      AutoSize = True
      ExplicitWidth = 777
      ExplicitHeight = 26
      inherited tbNuevo: TToolButton
        Hint = 'Anulaci'#243'n de Cheque (Ctrl+N)'
        ImageIndex = 8
        Visible = True
        OnClick = tbAnulacionClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Hint = 'Reemplazo de Cheque (Ctrl-R)'
        ImageIndex = 13
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Re-Impesi'#243'n OP'
        ImageIndex = 14
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImprimir
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ImageIndex = 10
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        Visible = False
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        Visible = False
        ExplicitLeft = 362
      end
      object tbCuenta: TToolButton
        Left = 385
        Top = 0
        Hint = 'Cuenta Contable (Ctrl+U)'
        ImageIndex = 30
        OnClick = tbCuentaClick
      end
      object tbExportarGD: TToolButton
        Left = 408
        Top = 0
        Hint = 'Exportar al AGA (Ctrl+D)'
        ImageIndex = 9
        Visible = False
        OnClick = tbExportarGDClick
      end
      object tbHistorico: TToolButton
        Left = 431
        Top = 0
        Hint = 'Hist'#243'rico (Ctrl+H)'
        ImageIndex = 16
        OnClick = tbHistoricoClick
      end
      object tbSobre: TToolButton
        Left = 454
        Top = 0
        Hint = 'Sobre (Ctrl+B)'
        DropdownMenu = pmnuSobres
        ImageIndex = 31
        Style = tbsDropDown
        OnClick = tbSobreClick
      end
      object tbEnvioMail: TToolButton
        Left = 492
        Top = 0
        Hint = 'Enviar Mail (Ctrl+N)'
        ImageIndex = 22
        OnClick = tbEnvioMailClick
      end
      object tbEliminarDebitado: TToolButton
        Left = 515
        Top = 0
        Hint = 'Modificar Debitado (Ctrl+F)'
        ImageIndex = 29
        OnClick = tbEliminarDebitadoClick
      end
      object tbBuscarCheques: TToolButton
        Left = 538
        Top = 0
        Hint = 'Buscar Cheques (Ctrl+A)'
        ImageIndex = 21
        OnClick = tbBuscarChequesClick
      end
      object tbTransferencias: TToolButton
        Left = 561
        Top = 0
        Hint = 'Transferencias (Ctrl+T)'
        ImageIndex = 19
        OnClick = tbTransferenciasClick
      end
      object tbDetalleCheques: TToolButton
        Left = 584
        Top = 0
        Hint = 'Detalle de Cheques'
        ImageIndex = 6
        OnClick = tbDetalleChequesClick
      end
      object tbObservaciones: TToolButton
        Left = 607
        Top = 0
        Hint = 'Observaciones de Contadur'#237'a'
        ImageIndex = 26
        OnClick = tbObservacionesClick
      end
      object tbBuscarCodigoBarras: TToolButton
        Left = 630
        Top = 0
        Hint = 'Buscar C'#243'digo de Barras (F4)'
        ImageIndex = 15
        OnClick = tbBuscarCodigoBarrasClick
      end
      object tbSumatoria: TToolButton
        Left = 653
        Top = 0
        Caption = 'tbSumatoria'
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton7: TToolButton
        Left = 676
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 32
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 684
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 221
    Width = 792
    Height = 349
    Anchors = [akLeft, akTop]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = mnuSeleccion
    TitleFont.Name = 'Tahoma'
    MultiSelect = True
    OnGetCellParams = GridGetCellParams
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'BENEFICIARIO'
        Title.Caption = 'Beneficiario'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUE'
        Title.Caption = 'N'#250'mero de Cheque'
        Width = 79
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha del Cheque'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Caption = 'M'#233'todo de Pago'
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 269
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OP'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Orden de Pago'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_OP'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de la Orden Pago'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO_DESCRIPCION'
        Title.Caption = 'Estado del Cheque'
        Width = 105
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_ESTADO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Estado'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUAC_DESCRIPCION'
        Title.Caption = 'Situaci'#243'n del Cheque'
        Width = 116
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_SITUAC'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Situac.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPO_PAGO'
        Title.Caption = 'Grupo de Pago'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 317
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CE_DEBITADO'
        Title.Alignment = taCenter
        Title.Caption = 'Debitado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CH_DESCRIPCION'
        Title.Caption = 'Cuenta Contable'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CE_FECHADEBITADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Debitado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRENVIOCHEQUE'
        Title.Caption = 'Direcci'#243'n de Env'#237'o'
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_GIRO'
        Title.Caption = 'Nro. de Giro'
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAIMPRESIONNOTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Impr. Nota'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRMOTIVOREEMPLAZOCTB'
        Title.Caption = 'Motivo de Reemplazo'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOTE'
        Title.Caption = 'Lote'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDARCHIVOBAPRO'
        Title.Alignment = taCenter
        Title.Caption = 'Arch. BAPRO'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESPUESTABAPRO'
        Title.Caption = 'Resp. Banco'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHARESPUESTABAPRO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Resp. Banco'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENVIOFONDOS'
        Title.Caption = 'Env'#237'o de Fondos'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_IDTRANSFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Transf.'
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHACUENTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Cuenta Contable'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVCONTADURIA'
        Title.Caption = 'Observaciones de Contadur'#237'a'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROACUSESOBRE'
        Title.Caption = 'Nro. de Acuse'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPORECIBO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo de Recepc. de Recibo'
        Width = 104
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NRORECIBO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Recibo'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FRECIBO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recibo'
        Width = 61
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FRECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recepc. Recibo'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ENVIADOXMAIL'
        Title.Alignment = taCenter
        Title.Caption = 'Enviado por Mail'
        Width = 51
        Visible = True
      end>
  end
  object fpReemplazo: TFormPanel [3]
    Left = 192
    Top = 243
    Width = 605
    Height = 424
    Caption = 'Reemplazo de Cheque'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poScreenCenter
    Constraints.MaxHeight = 424
    Constraints.MaxWidth = 605
    Constraints.MinHeight = 424
    Constraints.MinWidth = 605
    DesignSize = (
      605
      424)
    object lbChequeRechazado: TLabel
      Left = 21
      Top = 12
      Width = 97
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cheque Rechazado:'
    end
    object Label11: TLabel
      Left = 7
      Top = 35
      Width = 111
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre del Proveedor:'
    end
    object lbOBSERVACIONES: TLabel
      Left = 43
      Top = 179
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Observaciones:'
    end
    object Bevel1: TBevel
      Left = -4
      Top = 387
      Width = 614
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label10: TLabel
      Left = 449
      Top = 12
      Width = 74
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'OP Rechazado:'
    end
    object Label13: TLabel
      Left = 43
      Top = 58
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Grupo de Pago:'
    end
    object Label14: TLabel
      Left = 472
      Top = 58
      Width = 34
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Monto:'
    end
    object Bevel2: TBevel
      Left = -13
      Top = 78
      Width = 615
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label15: TLabel
      Left = 22
      Top = 87
      Width = 96
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#250'mero de Cheque:'
    end
    object lbBENEFICIARIO: TLabel
      Left = 59
      Top = 110
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Beneficiario:'
    end
    object Label17: TLabel
      Left = 409
      Top = 87
      Width = 90
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha del Cheque:'
    end
    object Label18: TLabel
      Left = 36
      Top = 157
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'M'#233'todo de Pago:'
    end
    object Label19: TLabel
      Left = 472
      Top = 157
      Width = 34
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Monto:'
    end
    object Bevel3: TBevel
      Left = -5
      Top = 244
      Width = 614
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lbSucursal: TLabel
      Left = 74
      Top = 134
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sucursal:'
    end
    object edOBSERVACIONES2: TMemo
      Left = 123
      Top = 178
      Width = 467
      Height = 36
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 250
      ScrollBars = ssVertical
      TabOrder = 12
    end
    object btnAceptarReemplazo: TButton
      Left = 439
      Top = 393
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
      TabOrder = 15
      OnClick = btnAceptarReemplazoClick
    end
    object btnCancelaReemplazo: TButton
      Left = 514
      Top = 393
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 16
      OnClick = btnCancelaReemplazoClick
    end
    object edCHECK_ID_OLD: TIntEdit
      Left = 123
      Top = 8
      Width = 61
      Height = 21
      TabStop = False
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 0
    end
    object edOP: TIntEdit
      Left = 529
      Top = 8
      Width = 61
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 2
      MaxLength = 8
    end
    object edVENDOR_NAME: TEdit
      Left = 123
      Top = 31
      Width = 467
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 1
    end
    object edMONTO_OLD: TCurrencyEdit
      Left = 509
      Top = 54
      Width = 81
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      Color = clInactiveCaption
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 4
    end
    object edBENEFICIARIO2: TEdit
      Left = 123
      Top = 107
      Width = 467
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 8
    end
    object edMONTO: TCurrencyEdit
      Left = 509
      Top = 153
      Width = 81
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Anchors = [akTop, akRight]
      TabOrder = 11
    end
    object edFECHA_CHEQUE: TDateComboBox
      Left = 502
      Top = 83
      Width = 88
      Height = 21
      Color = clGray
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 6
    end
    object edGRUPO_PAGO: TEdit
      Left = 123
      Top = 54
      Width = 345
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 3
    end
    object cmbPAYMENT_METHOD_ID: TArtComboBox
      Left = 123
      Top = 154
      Width = 344
      Height = 21
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 10
      OnChange = cmbPAYMENT_METHOD_IDChange
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRIPTION'
          Title.Caption = 'Descripci'#243'n'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BANK_ACCOUNT_NUM'
          Title.Caption = 'Cuenta'
          Visible = True
        end>
      DataSource = dsMetodoPago
      FieldList = 'DESCRIPTION'
      FieldKey = 'DESCRIPTION'
    end
    object GridReemplazo: TDBGrid
      Left = 13
      Top = 253
      Width = 576
      Height = 128
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsReemplazaCH
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 14
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CHEQUE'
          Title.Caption = 'Nro. Cheque'
          Width = 66
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FECHA_CHEQUE'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BENEFICIARIO'
          Title.Caption = 'Beneficiario'
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPTION'
          Title.Caption = 'M'#233'todo de Pago'
          Width = 135
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAYMENT_METHOD_ID'
          Title.Caption = 'Metodode PagoID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'MONTO'
          Title.Alignment = taCenter
          Title.Caption = 'Monto'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBSERVACIONES'
          Title.Caption = 'Observaciones'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP'
          Visible = False
        end>
    end
    object btnAdd: TButton
      Left = 301
      Top = 217
      Width = 79
      Height = 25
      Anchors = [akTop]
      Caption = 'Agr&egar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      OnClick = btnAddClick
    end
    object btnDel: TButton
      Left = 13
      Top = 393
      Width = 75
      Height = 25
      Hint = 'Elimina la Fila seleccionada'
      Anchors = [akLeft, akBottom]
      Caption = '&Borrar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnClick = btnDelClick
    end
    object cmbSucursal: TDBComboBox
      Left = 123
      Top = 131
      Width = 467
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'VENDOR_SITE_CODE'
      DataSource = dsSucursal
      TabOrder = 9
    end
    inline fraBeneficiario2: TfraCodDesc
      Left = 122
      Top = 106
      Width = 469
      Height = 23
      TabOrder = 7
      ExplicitLeft = 122
      ExplicitTop = 106
      ExplicitWidth = 469
      DesignSize = (
        469
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 404
        ExplicitWidth = 404
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'NULL'
        FieldCodigo = 'rb_id'
        FieldDesc = 'rb_beneficiario'
        FieldID = 'rb_id'
        IdType = ctInteger
        TableName = 'teso.rrb_reemplazobeneficiario'
        OnChange = fraBeneficiario2PropiedadesChange
      end
    end
    object edCHEQUE: TPatternEdit
      Left = 123
      Top = 83
      Width = 138
      Height = 21
      MaxLength = 20
      TabOrder = 5
      Pattern = '0123456789'
    end
  end
  object fpSobre: TFormPanel [4]
    Left = 47
    Top = 673
    Width = 751
    Height = 286
    Caption = 'Sobres'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnShow = fpSobreShow
    DesignSize = (
      751
      286)
    object gbAfiliado: TGroupBox
      Left = 124
      Top = 4
      Width = 619
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Afiliado '
      TabOrder = 3
      DesignSize = (
        619
        49)
      inline fraEmpresaSobre: TfraEmpresa
        Left = 10
        Top = 16
        Width = 598
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
        ExplicitLeft = 10
        ExplicitTop = 16
        ExplicitWidth = 598
        ExplicitHeight = 21
        DesignSize = (
          598
          21)
        inherited lbContrato: TLabel
          Left = 496
          ExplicitLeft = 496
        end
        inherited edContrato: TIntEdit
          Left = 541
          ExplicitLeft = 541
        end
        inherited cmbRSocial: TArtComboBox
          Width = 359
          ExplicitWidth = 359
        end
      end
    end
    object gbPrestador: TGroupBox
      Left = 124
      Top = 4
      Width = 619
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Prestador '
      TabOrder = 2
      DesignSize = (
        619
        45)
      inline fraPrestadorSobre: TfraCPR_PRESTADOR
        Left = 5
        Top = 13
        Width = 608
        Height = 26
        VertScrollBar.Range = 49
        VertScrollBar.Visible = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 13
        ExplicitWidth = 608
        ExplicitHeight = 26
        DesignSize = (
          608
          26)
        inherited lbDomicilio: TLabel
          Visible = False
        end
        inherited lbLocalidad: TLabel
          Visible = False
        end
        inherited lbCPostal: TLabel
          Left = 529
          Visible = False
          ExplicitLeft = 529
        end
        inherited cmbCA_DESCRIPCION: TArtComboBox
          Width = 278
          ExplicitWidth = 278
        end
        inherited edCA_DOMICILIO: TEdit
          Visible = False
        end
        inherited edCA_LOCALIDAD: TEdit
          Width = 154
          Visible = False
          ExplicitWidth = 154
        end
        inherited edCA_CODPOSTAL: TEdit
          Left = 553
          Visible = False
          ExplicitLeft = 553
        end
        inherited sdqDatos: TSDQuery
          Left = 224
          Top = 40
        end
        inherited dsDatos: TDataSource
          Left = 252
          Top = 40
        end
      end
    end
    object btnAceptarSobres: TButton
      Left = 594
      Top = 257
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
      TabOrder = 6
      OnClick = btnAceptarSobresClick
    end
    object btnCancelarSobres: TButton
      Left = 669
      Top = 257
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 7
    end
    object rgTipo: TRadioGroup
      Left = 7
      Top = 4
      Width = 112
      Height = 125
      Caption = ' Tipo '
      ItemIndex = 0
      Items.Strings = (
        'Afiliado'
        'Prestador'
        'Productor'
        'Siniestro'
        'Ingreso Manual'
        'Delegaci'#243'n'
        'Liquidaci'#243'n')
      TabOrder = 0
      OnClick = rgTipoClick
    end
    object gbDomicilioSobre: TGroupBox
      Left = 7
      Top = 133
      Width = 737
      Height = 75
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Domicilio '
      TabOrder = 4
      DesignSize = (
        737
        75)
      inline fraDomicilioSobre: TfraDomicilio
        Left = 6
        Top = 17
        Width = 723
        Height = 51
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 17
        ExplicitWidth = 723
        DesignSize = (
          723
          51)
        inherited lbNro: TLabel
          Left = 508
          ExplicitLeft = 508
        end
        inherited lbPiso: TLabel
          Left = 580
          Width = 20
          ExplicitLeft = 580
          ExplicitWidth = 20
        end
        inherited lbDto: TLabel
          Left = 656
          Width = 20
          ExplicitLeft = 656
          ExplicitWidth = 20
        end
        inherited lbCPostal: TLabel
          Width = 39
          ExplicitWidth = 39
        end
        inherited lbCPA: TLabel
          Width = 21
          ExplicitWidth = 21
        end
        inherited lbLocalidad: TLabel
          Width = 46
          ExplicitWidth = 46
        end
        inherited lbProvincia: TLabel
          Left = 561
          Width = 44
          ExplicitLeft = 561
          ExplicitWidth = 44
        end
        inherited cmbCalle: TArtComboBox
          Width = 423
          ExplicitWidth = 423
        end
        inherited edNumero: TEdit
          Left = 530
          ExplicitLeft = 530
        end
        inherited edPiso: TEdit
          Left = 606
          ExplicitLeft = 606
        end
        inherited edDto: TEdit
          Left = 678
          ExplicitLeft = 678
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 291
          ExplicitWidth = 291
        end
        inherited edProvincia: TEdit
          Left = 610
          ExplicitLeft = 610
        end
        inherited btnBuscar: TButton
          Left = 473
          ExplicitLeft = 473
        end
      end
    end
    object gbSiniestro: TGroupBox
      Left = 124
      Top = 4
      Width = 619
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Siniestro'
      TabOrder = 8
      DesignSize = (
        619
        45)
      object lbCUIT: TLabel
        Left = 13
        Top = 20
        Width = 23
        Height = 13
        Caption = 'CUIL'
      end
      inline fraTrabSiniestroSobre: TfraTrabajadorSiniestro
        Left = 42
        Top = 15
        Width = 568
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 42
        ExplicitTop = 15
        ExplicitWidth = 568
        DesignSize = (
          568
          21)
        inherited lbSiniestro: TLabel
          Left = 402
          ExplicitLeft = 402
        end
        inherited cmbNombre: TArtComboBox
          Width = 315
          ExplicitWidth = 315
        end
        inherited edSiniestro: TSinEdit
          Left = 467
          ExplicitLeft = 467
        end
        inherited ToolBar: TToolBar
          Left = 444
          ExplicitLeft = 444
        end
        inherited ImageList: TImageList
          Bitmap = {
            494C010101000400500010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
            0000000000003600000028000000400000001000000001002000000000000010
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000666666006666660000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000066666600E3E3E300A4A0A00066666600000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000066666600E3E3E300A4A0A000E3E3E300A4A0A000666666000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000808000A4A0A000E3E3E300CCCCCC00D7D7D700B2B2B2006666
            6600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000066666600B2B2B200E3E3E300CCCCCC00D7D7D700E3E3E300A4A0A000E3E3
            E300666666000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008080
            800066666600E3E3E300CCCCCC00D7D7D700E3E3E300A4A0A000E3E3E300A4A0
            A000C0C0C0006666660000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008080
            800066666600CCCCCC00D7D7D700E3E3E300A4A0A000E3E3E300A4A0A000C0C0
            C000C0C0C000B2B2B20066666600000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008080
            80008080800066666600B2B2B200A4A0A000E3E3E300A4A0A000C0C0C000C0C0
            C000B2B2B2000066660022222200000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A4A0
            A000A4A0A0008080800066666600E3E3E300B2B2B200C0C0C000C0C0C000A4A0
            A000666666003939390000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A4A0
            A000B2B2B200B2B2B2008080800066666600B2B2B20033999900666666006666
            6600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000096969600C0C0
            C000B2B2B200B2B2B20080808000808080006666660066666600000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000096969600B2B2B2008686
            8600969696000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000096969600A4A0A000868686009696
            9600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000008686860086868600969696000000
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
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000424D3E000000000000003E000000
            2800000040000000100000000100010000000000800000000000000000000000
            000000000000000000000000FFFFFF00FFFF000000000000FE7F000000000000
            FC3F000000000000F81F000000000000F80F000000000000F007000000000000
            E003000000000000E001000000000000E001000000000000E003000000000000
            E00F000000000000C03F00000000000087FF0000000000000FFF000000000000
            1FFF000000000000FFFF00000000000000000000000000000000000000000000
            000000000000}
        end
      end
    end
    object gbDelegacion: TGroupBox
      Left = 124
      Top = 4
      Width = 619
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Delegaci'#243'n'
      TabOrder = 9
      DesignSize = (
        619
        45)
      object lbRSocial: TLabel
        Left = 12
        Top = 20
        Width = 52
        Height = 13
        Caption = 'Delegaci'#243'n'
      end
      inline fraDelegacionSobre: TfraDelegacion
        Left = 70
        Top = 15
        Width = 540
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 70
        ExplicitTop = 15
        ExplicitWidth = 540
        DesignSize = (
          540
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 475
          ExplicitWidth = 475
        end
      end
    end
    object gbProductor: TGroupBox
      Left = 124
      Top = 4
      Width = 619
      Height = 125
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Productor '
      TabOrder = 1
      DesignSize = (
        619
        125)
      object gbEntidad: TGroupBox
        Left = 7
        Top = 11
        Width = 604
        Height = 52
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Entidad '
        TabOrder = 0
        DesignSize = (
          604
          52)
        inline fraEntidadSobre: TfraEntidadCUIT
          Left = 2
          Top = 16
          Width = 595
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnExit = fraEntidadSobreExit
          ExplicitLeft = 2
          ExplicitTop = 16
          ExplicitWidth = 595
          ExplicitHeight = 23
          DesignSize = (
            595
            23)
          inherited Label1: TLabel
            Left = 124
            ExplicitLeft = 124
          end
          inherited lbRSocial: TLabel
            Width = 24
            Caption = 'CUIT'
            ParentFont = True
            ExplicitWidth = 24
          end
          inherited Label2: TLabel
            Left = 228
            ExplicitLeft = 228
          end
          inherited cmbDescripcion: TArtComboBox
            Left = 268
            Width = 325
            ExplicitLeft = 268
            ExplicitWidth = 325
          end
          inherited mskCuit: TMaskEdit
            Left = 36
            ExplicitLeft = 36
          end
          inherited edEN_CODBANCO: TPatternEdit
            Left = 160
            Width = 60
            ExplicitLeft = 160
            ExplicitWidth = 60
          end
        end
      end
      object gbVendedor: TGroupBox
        Left = 7
        Top = 64
        Width = 604
        Height = 52
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Vendedor '
        TabOrder = 1
        DesignSize = (
          604
          52)
        inline fraVendedorSobre: TfraVendedoresCUIT
          Left = 3
          Top = 16
          Width = 591
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 3
          ExplicitTop = 16
          ExplicitWidth = 591
          DesignSize = (
            591
            24)
          inherited lbRSocial: TLabel
            Width = 24
            Caption = 'CUIT'
            ExplicitWidth = 24
          end
          inherited Label1: TLabel
            Left = 124
            ExplicitLeft = 124
          end
          inherited Label2: TLabel
            Left = 228
            ExplicitLeft = 228
          end
          inherited cmbDescripcion: TArtComboBox
            Left = 276
            Width = 316
            ExplicitLeft = 276
            ExplicitWidth = 316
          end
          inherited edCodigo: TPatternEdit
            Left = 160
            ExplicitLeft = 160
          end
          inherited mskCuit: TMaskEdit
            Left = 36
            ExplicitLeft = 36
          end
        end
      end
    end
    object gbDerechoHabientes: TGroupBox
      Left = 124
      Top = 50
      Width = 619
      Height = 48
      Caption = 'Derechohabientes'
      TabOrder = 10
      Visible = False
      DesignSize = (
        619
        48)
      object cmbDerechoHabientes: TArtComboBox
        Left = 10
        Top = 17
        Width = 599
        Height = 21
        DirectInput = False
        GlyphKind = gkDropDown
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 1
        TabOrder = 0
        OnChange = cmbDerechoHabientesChange
        Columns = <
          item
            Expanded = False
            FieldName = 'BENEFICIARIO'
            Title.Caption = 'Beneficiario'
            Visible = True
          end>
        DataSource = dsDerechoHabientes
        FieldList = 'BENEFICIARIO'
        FieldKey = 'BENEFICIARIO'
      end
    end
    object gbModoEnvio: TGroupBox
      Left = 7
      Top = 210
      Width = 737
      Height = 43
      Caption = 'Modo de Env'#237'o'
      TabOrder = 5
      inline fraModoEnvio: TfraStaticCTB_TABLAS
        Left = 9
        Top = 15
        Width = 720
        Height = 23
        TabOrder = 0
        ExplicitLeft = 9
        ExplicitTop = 15
        ExplicitWidth = 720
        DesignSize = (
          720
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 656
          ExplicitWidth = 656
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
  end
  object fpModificar: TFormPanel [5]
    Left = 811
    Top = 476
    Width = 386
    Height = 219
    Caption = 'Modificar la Situaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    Position = poScreenCenter
    Constraints.MinHeight = 219
    Constraints.MinWidth = 386
    OnEnter = fpModificarEnter
    DesignSize = (
      386
      219)
    object Label5: TLabel
      Left = 8
      Top = 12
      Width = 43
      Height = 13
      Caption = 'Situaci'#243'n'
    end
    object Label6: TLabel
      Left = 8
      Top = 40
      Width = 29
      Height = 13
      Caption = 'Fecha'
    end
    object Label7: TLabel
      Left = 8
      Top = 68
      Width = 23
      Height = 13
      Caption = 'Obs.'
    end
    object Bevel: TBevel
      Left = 4
      Top = 178
      Width = 378
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label16: TLabel
      Left = 8
      Top = 155
      Width = 52
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Delegaci'#243'n'
    end
    object edFecha: TDateComboBox
      Left = 68
      Top = 36
      Width = 88
      Height = 21
      TabOrder = 1
      OnExit = edFechaExit
    end
    object edObservaciones: TMemo
      Left = 68
      Top = 64
      Width = 310
      Height = 81
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 250
      TabOrder = 3
    end
    object btnAceptar: TButton
      Left = 230
      Top = 186
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
      TabOrder = 5
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 305
      Top = 186
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
    object edFechaLarga: TEdit
      Left = 156
      Top = 36
      Width = 222
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    inline fraDelegac: TfraDelegacion
      Left = 67
      Top = 150
      Width = 314
      Height = 23
      Anchors = [akLeft, akBottom]
      TabOrder = 4
      ExplicitLeft = 67
      ExplicitTop = 150
      ExplicitWidth = 314
      DesignSize = (
        314
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 249
        ExplicitWidth = 249
      end
    end
    inline fraCE_SITUACION: TfraCtbTablas
      Left = 67
      Top = 8
      Width = 313
      Height = 23
      TabOrder = 0
      ExplicitLeft = 67
      ExplicitTop = 8
      ExplicitWidth = 313
      DesignSize = (
        313
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 260
        ExplicitWidth = 260
      end
    end
  end
  object fpCuentaContable: TFormPanel [6]
    Left = 870
    Top = 609
    Width = 387
    Height = 106
    Caption = 'Modificar la Cuenta Contable'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    Position = poScreenCenter
    ActiveControl = cmbCuentaCont
    Constraints.MaxHeight = 106
    Constraints.MinHeight = 106
    Constraints.MinWidth = 387
    DesignSize = (
      387
      106)
    object Label21: TLabel
      Left = 6
      Top = 12
      Width = 65
      Height = 13
      Caption = 'Cuenta Cont.'
    end
    object Label22: TLabel
      Left = 6
      Top = 40
      Width = 29
      Height = 13
      Caption = 'Fecha'
    end
    object Bevel4: TBevel
      Left = 4
      Top = 65
      Width = 379
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object cmbCuentaCont: TRxDBLookupCombo
      Left = 71
      Top = 7
      Width = 311
      Height = 21
      DropDownCount = 8
      EscapeClear = False
      Anchors = [akLeft, akTop, akRight]
      LookupField = 'CH_ID'
      LookupDisplay = 'CH_DESCRIPCION'
      LookupSource = dsCuentaCont
      TabOrder = 0
    end
    object edFechaCuentaCont: TDateComboBox
      Left = 71
      Top = 36
      Width = 88
      Height = 21
      TabOrder = 1
      OnExit = edFechaCuentaContExit
    end
    object btnAceptarCuentaCont: TButton
      Left = 231
      Top = 73
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
      TabOrder = 3
      OnClick = btnAceptarCuentaContClick
    end
    object btnCancelarCuentaCont: TButton
      Left = 306
      Top = 73
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    object edFechaCuentaContLarga: TEdit
      Left = 159
      Top = 36
      Width = 223
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
  end
  object fpMotivoReemplazo: TFormPanel [7]
    Left = 908
    Top = 666
    Width = 373
    Height = 76
    Caption = 'Carga del Motivo de Reemplazo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    ActiveControl = fractbMotReemplazo.edCodigo
    OnEnter = fpMotivoReemplazoEnter
    DesignSize = (
      373
      76)
    object lblMotReemplazo: TLabel
      Left = 7
      Top = 14
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object btnAceptarMotReemplazo: TButton
      Left = 214
      Top = 43
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
      OnClick = btnAceptarMotReemplazoClick
    end
    object btnCancelarMotReemplazo: TButton
      Left = 291
      Top = 43
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fractbMotReemplazo: TfraStaticCTB_TABLAS
      Left = 45
      Top = 9
      Width = 323
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 45
      ExplicitTop = 9
      ExplicitWidth = 323
      DesignSize = (
        323
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 259
        ExplicitWidth = 259
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
  object fpSobreMasivo: TFormPanel [8]
    Left = 940
    Top = 692
    Width = 429
    Height = 85
    Caption = 'Carga Masiva de Sobres'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnEnter = fpSobreMasivoEnter
    DesignSize = (
      429
      85)
    object btnAceptarSobresMasivo: TButton
      Left = 272
      Top = 56
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
      OnClick = btnAceptarSobresMasivoClick
    end
    object btnCancelarSobresMasivo: TButton
      Left = 347
      Top = 56
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object GroupBox16: TGroupBox
      Left = 7
      Top = 9
      Width = 415
      Height = 43
      Caption = 'Modo de Env'#237'o'
      TabOrder = 0
      DesignSize = (
        415
        43)
      inline fraModoEnvioMasivo: TfraStaticCTB_TABLAS
        Left = 9
        Top = 15
        Width = 398
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 9
        ExplicitTop = 15
        ExplicitWidth = 398
        DesignSize = (
          398
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 334
          ExplicitWidth = 334
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
  end
  object fpRecepcionRecibo: TFormPanel [9]
    Left = 956
    Top = 724
    Width = 338
    Height = 117
    Caption = 'Recepci'#243'n de Recibo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnEnter = fpRecepcionReciboEnter
    DesignSize = (
      338
      117)
    object lbCalle: TLabel
      Left = 8
      Top = 58
      Width = 59
      Height = 13
      AutoSize = False
      Caption = 'Nro. Recibo'
    end
    object Label27: TLabel
      Left = 171
      Top = 58
      Width = 71
      Height = 13
      AutoSize = False
      Caption = 'Fecha Recibo'
    end
    object Bevel5: TBevel
      Left = 0
      Top = 81
      Width = 338
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label29: TLabel
      Left = 102
      Top = 58
      Width = 9
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '-'
    end
    object btnAceptarRecepcionRecibo: TButton
      Left = 181
      Top = 88
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
      TabOrder = 4
      OnClick = btnAceptarRecepcionReciboClick
    end
    object btnCancelarRecepcionRecibo: TButton
      Left = 256
      Top = 88
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
    end
    object rgTipoRecibo: TRadioGroup
      Left = 6
      Top = 5
      Width = 325
      Height = 42
      Caption = 'Tipo de Recibo'
      Columns = 2
      Items.Strings = (
        'Recibo Oficial'
        'Orden de Pago Firmada')
      TabOrder = 0
      TabStop = True
      OnClick = rgTipoReciboClick
    end
    object edNroRecibo: TIntEdit
      Left = 112
      Top = 55
      Width = 55
      Height = 21
      TabOrder = 2
      MaxLength = 8
    end
    object edFechaRecibo: TDateComboBox
      Left = 242
      Top = 55
      Width = 88
      Height = 21
      TabOrder = 3
      OnExit = edFechaCuentaContExit
    end
    object edNroSerieRecibo: TIntEdit
      Left = 68
      Top = 55
      Width = 32
      Height = 21
      TabOrder = 1
      MaxLength = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT CE_ID CHECK_ID, CE_BENEFICIARIO BENEFICIARIO, CE_NUMERO C' +
        'HEQUE,'
      
        'CE_FECHACHEQUE FECHA_CHEQUE,  CE_METODOPAGO DESCRIPTION, CE_ORDE' +
        'NPAGO OP,'
      
        'CE_FECHAOP FECHA_OP, CE_GRUPOPAGO GRUPO_PAGO,  CE_MONTO MONTO, C' +
        'E_ESTADO ESTADO,'
      'TB_DESCRIPCION ESTADO_DESCRIPCION, CE_FECHAESTADO FECHA_ESTADO,'
      
        'CE_OBSERVACIONES OBSERVACIONES, BA_NOMBRE BANCO, CB_NUMERO CUENT' +
        'A'
      
        'FROM RCE_CHEQUEEMITIDO, ZBA_BANCO, ZCB_CUENTABANCARIA, CTB_TABLA' +
        'S'
      'WHERE CE_ESTADO=TB_CODIGO'
      'AND TB_CLAVE='#39'ESTCH'#39
      'AND CE_IDCUENTABANCARIA=CB_ID'
      'AND CB_IDBANCO=BA_ID'
      'AND 1=2'
      '')
    Left = 8
    Top = 356
  end
  inherited dsConsulta: TDataSource
    Left = 36
    Top = 356
  end
  inherited SortDialog: TSortDialog
    Left = 8
    Top = 384
  end
  inherited ExportDialog: TExportDialog
    Left = 36
    Top = 384
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Beneficiario'
        DataField = 'BENEFICIARIO'
        MaxLength = 40
      end
      item
        Title = 'Cheque'
        TitleAlignment = taCenter
        DataField = 'CHEQUE'
        Alignment = taRightJustify
        MaxLength = 9
      end
      item
        Title = 'Fecha'
        TitleAlignment = taCenter
        DataField = 'FECHA_CHEQUE'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'M'#233'todo de Pago'
        DataField = 'DESCRIPTION'
        MaxLength = 25
      end
      item
        Title = 'Banco'
        DataField = 'BANCO'
        MaxLength = 40
      end
      item
        Title = 'Cuenta'
        DataField = 'CUENTA'
        MaxLength = 20
      end
      item
        Title = 'Orden Pago'
        TitleAlignment = taCenter
        DataField = 'OP'
        Alignment = taRightJustify
        MaxLength = 12
      end
      item
        Title = 'Fecha'
        TitleAlignment = taCenter
        DataField = 'FECHA_OP'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Monto'
        DataField = 'MONTO'
        Alignment = taRightJustify
        FormatFloat = '#,##.00'
        MaxLength = 10
      end
      item
        Title = 'Estado Cheque'
        DataField = 'ESTADO_DESCRIPCION'
        MaxLength = 15
      end
      item
        Title = 'F. Estado'
        TitleAlignment = taCenter
        DataField = 'FECHA_ESTADO'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Situac. Cheque'
        DataField = 'SITUAC_DESCRIPCION'
        MaxLength = 18
      end
      item
        Title = 'F. Situac.'
        TitleAlignment = taCenter
        DataField = 'FECHA_SITUAC'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Grupo de Pago'
        DataField = 'GRUPO_PAGO'
        MaxLength = 15
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'EL_NOMBRE'
        MaxLength = 25
      end
      item
        Title = 'Observaciones'
        DataField = 'OBSERVACIONES'
        MaxLength = 50
      end>
    DataSource = nil
    Title.Text = 'Cheques'
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 80
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 36
    Top = 412
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'Ver BAPROPAGOS'
      end
      item
        Name = 'PermitirCargaFechaSituacion'
      end
      item
        Name = 'PermitirModificarSituacionEntregado'
      end>
    DBLogin = frmPrincipal.DBLogin
    Left = 8
    Top = 328
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 328
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
    Top = 412
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
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
        LinkControl = tbSalir2
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16466
        LinkControl = tbEliminar
      end
      item
        Key = 16450
        LinkControl = tbSobre
      end
      item
        Key = 16452
        LinkControl = tbExportarGD
      end
      item
        Key = 16456
        LinkControl = tbHistorico
      end
      item
        Key = 16462
        LinkControl = tbEnvioMail
      end
      item
        Key = 16454
        LinkControl = tbEliminarDebitado
      end
      item
        Key = 16469
        LinkControl = tbCuenta
      end
      item
        Key = 16449
        LinkControl = tbBuscarCheques
      end
      item
        Key = 16468
        LinkControl = tbTransferencias
      end
      item
        Key = 115
        LinkControl = tbBuscarCodigoBarras
      end>
    Left = 64
    Top = 328
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 64
    Top = 356
  end
  object sdqEstados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE='#39'ESTCH'#39
      'AND TB_CODIGO<>'#39'0'#39
      'ORDER BY TB_DESCRIPCION')
    Left = 435
    Top = 65528
  end
  object dsEstados: TDataSource
    DataSet = sdqEstados
    Left = 463
    Top = 65528
  end
  object sdqGrupoPago: TSDQuery
    DatabaseName = 'dbfinancials'
    Options = []
    SQL.Strings = (
      'SELECT   UPPER(LOOKUP_CODE) LOOKUP_CODE'
      '    FROM FND_LOOKUP_VALUES LV'
      '   WHERE LANGUAGE = '#39'ESA'#39
      '     AND VIEW_APPLICATION_ID = 201'
      '     AND SECURITY_GROUP_ID ='
      '           FND_GLOBAL.LOOKUP_SECURITY_GROUP (LV.LOOKUP_TYPE,'
      
        '                                             LV.VIEW_APPLICATION' +
        '_ID'
      '                                            )'
      '     AND LOOKUP_TYPE = '#39'PAY GROUP'#39
      '     AND UPPER (LOOKUP_CODE) NOT LIKE '#39'COMISIONES %'#39
      'ORDER BY UPPER(LOOKUP_CODE)'
      '')
    Left = 630
    Top = 65528
  end
  object dsGrupoPago: TDataSource
    DataSet = sdqGrupoPago
    Left = 658
    Top = 65528
  end
  object sdqReemplazoCheque: TSDQuery
    DatabaseName = 'dbfinancials'
    Options = []
    SQL.Strings = (
      'SELECT PV.VENDOR_NAME'
      '   FROM PO_VENDORS PV'
      ' WHERE PV.VENDOR_ID = :CEIDPROVEEDOR')
    Left = 64
    Top = 468
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CEIDPROVEEDOR'
        ParamType = ptInput
      end>
  end
  object dsReemplazaCH: TDataSource
    DataSet = sdqReemplazaCH
    Left = 36
    Top = 440
  end
  object sduReemplazaCH: TSDUpdateSQL
    Left = 64
    Top = 440
  end
  object sdqReemplazaCH: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqReemplazaCHAfterOpen
    SQL.Strings = (
      
        'SELECT CE_ID CHECK_ID, CE_BENEFICIARIO BENEFICIARIO, CE_NUMERO C' +
        'HEQUE,'
      
        '       CE_ORDENPAGO OP, CE_FECHACHEQUE FECHA_CHEQUE, CE_FECHAOP ' +
        'FECHA_OP,'
      '       CE_MONTO MONTO, CE_OBSERVACIONES OBSERVACIONES,'
      '       CE_METODOPAGO DESCRIPTION, CE_GRUPOPAGO GRUPO_PAGO,'
      
        '       CE_IDCUENTABANCARIA ID_CUENTA, CE_IDCHEQUEREEMP CHEQUE_RE' +
        'EMP,'
      
        '       CE_IDPROVEEDOR VENDOR_ID, CE_FECHAESTADO FECHA_ESTADO, CE' +
        '_FECHASITUACION FECHA_SITUACION'
      '  FROM RCE_CHEQUEEMITIDO'
      ' WHERE 1 = 2'
      '')
    UniDirectional = True
    UpdateObject = sduReemplazaCH
    Left = 8
    Top = 440
  end
  object sdqSucursal: TSDQuery
    DatabaseName = 'dbfinancials'
    Options = []
    SQL.Strings = (
      'SELECT VENDOR_SITE_ID, VENDOR_SITE_CODE, ADDRESS_LINE1'
      'FROM PO_VENDOR_SITES_ALL'
      'WHERE VENDOR_ID = :V_VENDOR_ID')
    Left = 8
    Top = 468
    ParamData = <
      item
        DataType = ftString
        Name = 'V_VENDOR_ID'
        ParamType = ptInput
        Value = '3'
      end>
  end
  object dsSucursal: TDataSource
    DataSet = sdqSucursal
    Left = 36
    Top = 468
  end
  object sdqBanco: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT BA_NOMBRE, BA_ID'
      'FROM ZBA_BANCO'
      'ORDER BY BA_NOMBRE')
    Left = 111
    Top = 65528
  end
  object dsBanco: TDataSource
    DataSet = sdqBanco
    Left = 139
    Top = 65528
  end
  object sdqCuenta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT CB_NUMERO, CB_ID'
      'FROM ZCB_CUENTABANCARIA'
      'ORDER BY CB_NUMERO'
      ''
      ' ')
    Left = 304
    Top = 65528
  end
  object dsCuenta: TDataSource
    DataSet = sdqCuenta
    Left = 332
    Top = 65528
  end
  object sdqDelegacion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT EL_ID, EL_NOMBRE'
      'FROM DEL_DELEGACION'
      'WHERE EL_FECHABAJA IS NULL')
    Left = 567
    Top = 65528
  end
  object dsDelegacion: TDataSource
    DataSet = sdqDelegacion
    Left = 595
    Top = 65528
  end
  object sdqCuentaCont: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   -1 CH_ID, '#39'- Sin cuenta contable -'#39' CH_DESCRIPCION'
      '    FROM DUAL'
      'UNION'
      'SELECT   CH_ID, CH_DESCRIPCION'
      '    FROM TESO.RCH_CUENTACHEQUES'
      'ORDER BY CH_DESCRIPCION'
      '')
    Left = 173
    Top = 65528
  end
  object dsCuentaCont: TDataSource
    DataSet = sdqCuentaCont
    Left = 201
    Top = 65528
  end
  object sdqMetodoPagoFiltro: TSDQuery
    DatabaseName = 'dbfinancials'
    Options = []
    SQL.Strings = (
      
        '  SELECT DISTINCT NULL CHECK_STOCK_ID, ACS.ATTRIBUTE2 DESCRIPTIO' +
        'N, NULL BANK_ACCOUNT_NUM,'
      '         NULL ID_CUENTA'
      '    FROM AP_CHECK_STOCKS_ALL ACS'
      '   WHERE ACS.INACTIVE_DATE IS NULL'
      '     AND ACS.ATTRIBUTE2 IS NOT NULL'
      'ORDER BY DESCRIPTION'
      ''
      ' '
      ' ')
    Left = 501
    Top = 65528
  end
  object dsMetodoPagoFiltro: TDataSource
    DataSet = sdqMetodoPagoFiltro
    Left = 529
    Top = 65528
  end
  object sdqSituaciones: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CLAVE='#39'SITCH'#39
      '   AND TB_CODIGO<>'#39'0'#39
      '   AND TB_FECHABAJA IS NULL'
      ' ORDER BY TB_DESCRIPCION')
    Left = 238
    Top = 65528
  end
  object dsSituaciones: TDataSource
    DataSet = sdqSituaciones
    Left = 266
    Top = 65528
  end
  object mnuSeleccion: TPopupMenu
    Left = 8
    Top = 524
    object mnuMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
  end
  object ExportDialogMails: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqConsulta
    Fields = <
      item
        DataField = 'CHEQUE'
        Title = 'N'#250'mero de Cheque'
      end
      item
        DataField = 'OP'
        Title = 'Nro. Orden de Pago'
      end
      item
        DataField = 'BENEFICIARIO'
        Title = 'Beneficiario'
      end
      item
        DataField = 'BANCO'
        Title = 'Banco'
      end
      item
        DataField = 'CUENTA'
        Title = 'Cuenta'
      end
      item
        DataField = 'MONTO'
        Title = 'Monto'
      end
      item
        DataField = 'SITUAC_DESCRIPCION'
        Title = 'Situaci'#243'n del Cheque'
      end
      item
        DataField = 'IDARCHIVOBAPRO'
        Title = 'Arch. BAPRO'
      end
      item
        DataField = 'CE_IDTRANSFERENCIA'
        Title = 'Nro. Transf.'
      end>
    IniStorage = FormStorage
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
    VersionExcel = msExcel97
    Left = 96
    Top = 384
  end
  object OpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 96
    Top = 412
  end
  object sdqMetodoPago: TSDQuery
    DatabaseName = 'dbfinancials'
    Options = []
    SQL.Strings = (
      
        '  SELECT ACS.CHECK_STOCK_ID, ACS.NAME DESCRIPTION, ABA.BANK_ACCO' +
        'UNT_NUM,'
      '         ABA.ATTRIBUTE1 ID_CUENTA, ACS.ATTRIBUTE2 METODO'
      '    FROM AP_BANK_ACCOUNTS_ALL ABA, AP_CHECK_STOCKS_ALL ACS'
      '   WHERE ACS.INACTIVE_DATE IS NULL'
      '     AND ABA.BANK_ACCOUNT_ID = ACS.BANK_ACCOUNT_ID'
      '     AND ABA.ATTRIBUTE1 IS NOT NULL'
      'ORDER BY BANK_ACCOUNT_NUM, DESCRIPTION'
      ''
      ' ')
    Left = 369
    Top = 65528
  end
  object dsMetodoPago: TDataSource
    DataSet = sdqMetodoPago
    Left = 397
    Top = 65528
  end
  object pmnuImprimir: TPopupMenu
    Left = 36
    Top = 524
    object mnuNotasBanco: TMenuItem
      Caption = 'Imprimir Notas al Banco'
      OnClick = mnuNotasBancoClick
    end
    object mnuEnviadosDelegacion: TMenuItem
      Caption = 'Imprimir Enviados a Delegaciones'
      OnClick = mnuEnviadosDelegacionClick
    end
    object mnuChequesSituacion: TMenuItem
      Caption = 'Imprimir Cheques por Situaci'#243'n'
      OnClick = mnuChequesSituacionClick
    end
    object mnuCertRetencion: TMenuItem
      Caption = 'Imprimir Certificado de Retenci'#243'n'
      OnClick = mnuCertRetencionClick
    end
    object mnuOrdenPago: TMenuItem
      Caption = 'Imprimir Orden de Pago'
      OnClick = mnuOrdenPagoClick
    end
    object mnuImpResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImpResultadosClick
    end
  end
  object sdqDerechoHabientes: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 8
    Top = 496
  end
  object dsDerechoHabientes: TDataSource
    DataSet = sdqDerechoHabientes
    Left = 36
    Top = 496
  end
  object pmnuSobres: TPopupMenu
    Left = 64
    Top = 524
    object mnuSobresIndividual: TMenuItem
      Caption = 'Carga Individual'
      OnClick = mnuSobresIndividualClick
    end
    object mnuSobresMasiva: TMenuItem
      Caption = 'Carga Masiva'
      OnClick = mnuSobresMasivaClick
    end
  end
end
