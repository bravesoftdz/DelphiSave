inherited frmRedPresAdministracionCartas: TfrmRedPresAdministracionCartas
  Left = 209
  Top = 181
  Caption = 'Administraci'#243'n de Cartas Documento'
  ClientHeight = 650
  ClientWidth = 848
  ExplicitWidth = 856
  ExplicitHeight = 680
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 848
    ExplicitWidth = 848
    DesignSize = (
      848
      219)
    inherited pcFiltros: TPageControl
      Width = 843
      ExplicitWidth = 843
      inherited tsFiltros0: TTabSheet
        ExplicitWidth = 835
        DesignSize = (
          835
          187)
        inherited gbNroCarta: TGroupBox
          TabOrder = 12
          Visible = False
        end
        inherited gbNroCartaDoc: TGroupBox
          Left = 1
          Width = 214
          TabOrder = 0
          ExplicitLeft = 1
          ExplicitWidth = 214
          inherited Label1: TLabel
            Left = 100
            Top = 18
            ExplicitLeft = 100
            ExplicitTop = 18
          end
          inherited edNroCartaDocDesde: TMaskEdit
            Left = 6
            OnExit = edNroCartaDocDesdeExit
            ExplicitLeft = 6
          end
          inherited edNroCartaDocHasta: TMaskEdit
            Left = 115
            ExplicitLeft = 115
          end
        end
        inherited gbDelegacion: TGroupBox
          Left = 568
          Width = 266
          ExplicitLeft = 568
          ExplicitWidth = 266
          DesignSize = (
            266
            43)
          inherited cmbDelegacion: TDBCheckCombo
            Width = 256
            ExplicitWidth = 256
          end
        end
        inherited gbCorreoImpresion: TGroupBox
          Left = 0
          Top = 130
          Width = 143
          TabOrder = 9
          ExplicitLeft = 0
          ExplicitTop = 130
          ExplicitWidth = 143
          DesignSize = (
            143
            43)
          inherited fraCorreo: TfraStaticCTB_TABLAS
            Width = 138
            ExplicitWidth = 138
            DesignSize = (
              138
              27)
            inherited edCodigo: TPatternEdit
              Width = 28
              ExplicitWidth = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 105
              ExplicitLeft = 32
              ExplicitWidth = 105
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
        inherited gbCodigoNoRecepcion: TGroupBox
          Left = 584
          Width = 250
          ExplicitLeft = 584
          ExplicitWidth = 250
          DesignSize = (
            250
            43)
          inherited cmbCodigosNoRecepcion: TCheckCombo
            Left = 7
            Width = 238
            ExplicitLeft = 7
            ExplicitWidth = 238
          end
        end
        inherited gbModulo: TGroupBox
          Left = 236
          Width = 345
          ExplicitLeft = 236
          ExplicitWidth = 345
          DesignSize = (
            345
            43)
          inherited cmbModulo: TDBCheckCombo
            Width = 333
            ExplicitWidth = 333
          end
        end
        inherited gbCodigoTexto: TGroupBox
          Left = 584
          Width = 250
          ExplicitLeft = 584
          ExplicitWidth = 250
          DesignSize = (
            250
            43)
          inherited fraCodTexto: TfraStaticCodigoDescripcion
            Left = 8
            Top = 14
            Width = 237
            ExplicitLeft = 8
            ExplicitTop = 14
            ExplicitWidth = 237
            DesignSize = (
              237
              26)
            inherited cmbDescripcion: TComboGrid
              Width = 174
              ExplicitWidth = 174
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
        end
        inherited gbCodigoFirmante: TGroupBox
          Left = 1
          TabOrder = 3
          ExplicitLeft = 1
          inherited fraCodFirmante: TfraStaticCodigoDescripcion
            Left = 6
            Width = 222
            ExplicitLeft = 6
            ExplicitWidth = 222
            DesignSize = (
              222
              25)
            inherited cmbDescripcion: TComboGrid
              Width = 159
              ExplicitWidth = 159
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
        end
        inherited gbUsuarioImpresion: TGroupBox
          Left = 145
          Width = 297
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 10
          ExplicitLeft = 145
          ExplicitWidth = 297
          DesignSize = (
            297
            43)
          inherited cmbUsuImpresion: TDBCheckCombo
            Left = 5
            Width = 289
            ExplicitLeft = 5
            ExplicitWidth = 289
          end
        end
        inherited GroupBox2: TGroupBox
          Left = 236
          Width = 345
          ExplicitLeft = 236
          ExplicitWidth = 345
          DesignSize = (
            345
            43)
          inherited cmbCodigosRecepcion: TCheckCombo
            Left = 7
            Width = 332
            ExplicitLeft = 7
            ExplicitWidth = 332
          end
        end
        inherited gbUsuarioReimpresion: TGroupBox
          Left = 444
          Width = 224
          Anchors = [akTop, akRight]
          TabOrder = 11
          ExplicitLeft = 444
          ExplicitWidth = 224
          DesignSize = (
            224
            43)
          inherited cmbUsuReimpresion: TDBCheckCombo
            Width = 213
            ExplicitWidth = 213
          end
        end
        inherited gbArea: TGroupBox
          Width = 235
          TabOrder = 6
          ExplicitWidth = 235
          inherited fraArea: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
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
        end
        object gbGrupoTrab: TGroupBox
          Left = 217
          Top = -1
          Width = 349
          Height = 43
          Caption = 'Grupo Trabajo'
          TabOrder = 1
          DesignSize = (
            349
            43)
          inline fraGrupoTrabajo: TfraGrupoTrabajo
            Left = 6
            Top = 14
            Width = 336
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 6
            ExplicitTop = 14
            ExplicitWidth = 336
            DesignSize = (
              336
              23)
            inherited lblGestor: TLabel
              Left = 165
              ExplicitLeft = 165
            end
            inherited edCodigo: TPatternEdit
              TabOrder = 1
            end
            inherited cmbGestor: TArtComboBox
              Left = 201
              DataSource = nil
              ExplicitLeft = 201
            end
            inherited cmbDescripcion: TArtComboBox
              Width = 111
              TabOrder = 0
              DataSource = nil
              ExplicitWidth = 111
            end
          end
        end
        object gbTipoAccidente: TGroupBox
          Left = 670
          Top = 130
          Width = 164
          Height = 43
          Anchors = [akTop, akRight]
          Caption = ' Tipo accidente '
          TabOrder = 13
          DesignSize = (
            164
            43)
          object cmbTipoAccidente: TDBCheckCombo
            Left = 4
            Top = 15
            Width = 156
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DataSource = dsTipoAccidente
            KeyField = 'ta_codigo'
            ListField = 'ta_descripcion'
          end
        end
      end
      inherited tsFiltros1: TTabSheet
        DesignSize = (
          835
          187)
        inherited rgRecepcionOK: TRadioGroup
          Left = 0
          Width = 112
          ExplicitLeft = 0
          ExplicitWidth = 112
        end
        inherited gbFormulario: TGroupBox
          Left = 114
          Width = 606
          ExplicitLeft = 114
          ExplicitWidth = 606
          DesignSize = (
            606
            46)
          inline fraEmpresaDeudora: TfraEmpresa
            Left = 8
            Top = 16
            Width = 592
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
            ExplicitLeft = 8
            ExplicitTop = 16
            ExplicitWidth = 592
            ExplicitHeight = 21
            DesignSize = (
              592
              21)
            inherited lbContrato: TLabel
              Left = 488
              ExplicitLeft = 488
            end
            inherited edContrato: TIntEdit
              Left = 533
              ExplicitLeft = 533
            end
            inherited cmbRSocial: TArtComboBox
              Width = 353
              DataSource = nil
              ExplicitWidth = 353
            end
          end
        end
        inherited gbFechaImpresion: TGroupBox
          Left = 0
          Top = 138
          Width = 192
          TabOrder = 15
          ExplicitLeft = 0
          ExplicitTop = 138
          ExplicitWidth = 192
          inherited Label2: TLabel
            Left = 91
            Top = 19
            Width = 9
            Caption = '>'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 91
            ExplicitTop = 19
            ExplicitWidth = 9
          end
          inherited edFechaImpresionDesde: TDateComboBox
            Left = 4
            Top = 16
            Width = 86
            ExplicitLeft = 4
            ExplicitTop = 16
            ExplicitWidth = 86
          end
          inherited edFechaImpresionHasta: TDateComboBox
            Left = 100
            Top = 16
            ExplicitLeft = 100
            ExplicitTop = 16
          end
        end
        inherited gbFechaReimpresion: TGroupBox
          Left = 194
          Top = 138
          Width = 193
          TabOrder = 11
          ExplicitLeft = 194
          ExplicitTop = 138
          ExplicitWidth = 193
          inherited Label4: TLabel
            Left = 91
            Top = 19
            Width = 9
            Caption = '>'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 91
            ExplicitTop = 19
            ExplicitWidth = 9
          end
          inherited edFechaReImpresionDesde: TDateComboBox
            Top = 16
            ExplicitTop = 16
          end
          inherited edFechaReImpresionHasta: TDateComboBox
            Left = 100
            Top = 16
            ExplicitLeft = 100
            ExplicitTop = 16
          end
        end
        inherited gbFechaRecepcion: TGroupBox
          Left = 389
          Top = 138
          Width = 192
          TabOrder = 12
          ExplicitLeft = 389
          ExplicitTop = 138
          ExplicitWidth = 192
          inherited Label3: TLabel
            Width = 9
            Caption = '>'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 9
          end
          inherited edFechaRecepcionDesde: TDateComboBox
            Top = 16
            ExplicitTop = 16
          end
          inherited edFechaRecepcionHasta: TDateComboBox
            Left = 100
            Top = 16
            ExplicitLeft = 100
            ExplicitTop = 16
          end
        end
        inherited gbPendientes: TGroupBox
          Left = 0
          Top = 91
          Width = 409
          Height = 47
          TabOrder = 6
          ExplicitLeft = 0
          ExplicitTop = 91
          ExplicitWidth = 409
          ExplicitHeight = 47
          inherited chkPendienteImpresion: TCheckBox
            Left = 5
            Top = 8
            Caption = '&Pend. Impresi'#243'n'
            ExplicitLeft = 5
            ExplicitTop = 8
          end
          inherited chkPendienteRecepcion: TCheckBox
            Left = 112
            Top = 8
            Width = 85
            Height = 17
            Hint = 'Pend. Recepci'#243'n'
            Caption = 'Pend. Recep.'
            WordWrap = False
            ExplicitLeft = 112
            ExplicitTop = 8
            ExplicitWidth = 85
            ExplicitHeight = 17
          end
          inherited chkPendienteReemplazo: TCheckBox
            Left = 5
            Top = 23
            Width = 105
            Height = 17
            Caption = 'Pend. Reempla&zo'
            WordWrap = False
            ExplicitLeft = 5
            ExplicitTop = 23
            ExplicitWidth = 105
            ExplicitHeight = 17
          end
          inherited chkPendienteAval: TCheckBox
            Left = 199
            Top = 8
            ExplicitLeft = 199
            ExplicitTop = 8
          end
          inherited chkAvaladas: TCheckBox
            Left = 199
            Top = 23
            ExplicitLeft = 199
            ExplicitTop = 23
          end
          inherited chkVentanilla: TCheckBox
            Left = 276
            Top = 9
            ExplicitLeft = 276
            ExplicitTop = 9
          end
          inherited chkPendEnvioVentanilla: TCheckBox
            Left = 276
            Top = 23
            Width = 129
            Height = 17
            WordWrap = False
            ExplicitLeft = 276
            ExplicitTop = 23
            ExplicitWidth = 129
            ExplicitHeight = 17
          end
          inherited chkPendienteRemito: TCheckBox
            Left = 112
            Top = 23
            ExplicitLeft = 112
            ExplicitTop = 23
          end
        end
        inherited gbFechaAlta: TGroupBox
          Left = 583
          Top = 138
          Width = 192
          TabOrder = 13
          ExplicitLeft = 583
          ExplicitTop = 138
          ExplicitWidth = 192
          inherited Label5: TLabel
            Left = 91
            Width = 9
            Caption = '>'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 91
            ExplicitWidth = 9
          end
          inherited edFechaAltaDesde: TDateComboBox
            Top = 16
            ExplicitTop = 16
          end
          inherited edFechaAltaHasta: TDateComboBox
            Left = 100
            Top = 16
            ExplicitLeft = 100
            ExplicitTop = 16
          end
        end
        inherited gbUsuarioAlta: TGroupBox
          Left = 616
          Top = 91
          Width = 108
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 8
          ExplicitLeft = 616
          ExplicitTop = 91
          ExplicitWidth = 108
          DesignSize = (
            108
            47)
          inherited cmbUsuAlta: TDBCheckCombo
            Left = 6
            Top = 17
            Width = 97
            ExplicitLeft = 6
            ExplicitTop = 17
            ExplicitWidth = 97
          end
        end
        inherited rgEstado: TRadioGroup
          Left = 0
          Width = 112
          ItemIndex = 2
          TabOrder = 3
          ExplicitLeft = 0
          ExplicitWidth = 112
        end
        inherited gbTrackTrace: TGroupBox
          Left = 726
          Top = 91
          Width = 109
          TabOrder = 9
          ExplicitLeft = 726
          ExplicitTop = 91
          ExplicitWidth = 109
          inherited edTrackTrace: TEdit
            Left = 4
            Top = 17
            Width = 101
            ExplicitLeft = 4
            ExplicitTop = 17
            ExplicitWidth = 101
          end
        end
        inherited gbCartaConNroLote: TGroupBox
          Left = 777
          Top = 138
          ExplicitLeft = 777
          ExplicitTop = 138
        end
        object gbSiniestro: TGroupBox
          Left = 114
          Top = 45
          Width = 170
          Height = 47
          Caption = '&Rango de Siniestros'
          TabOrder = 4
          object Label10: TLabel
            Left = 78
            Top = 20
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
          object SinDesde: TSinEdit
            Left = 5
            Top = 16
            Width = 73
            Height = 21
            OnExit = SinDesdeExit
            TabOrder = 0
            ViewStyle = [etSiniestro]
          end
          object SinHasta: TSinEdit
            Left = 92
            Top = 16
            Width = 73
            Height = 21
            TabOrder = 1
            ViewStyle = [etSiniestro]
          end
        end
        object GroupBox1: TGroupBox
          Left = 722
          Top = -1
          Width = 112
          Height = 46
          Anchors = [akTop, akRight, akBottom]
          Caption = '&Siniestro'
          TabOrder = 2
          object edSiniestro: TSinEdit
            Left = 4
            Top = 17
            Width = 104
            Height = 21
            TabOrder = 0
            OnSelect = edSiniestroSelect
          end
        end
        object gbSinGobernacion: TGroupBox
          Left = 412
          Top = 91
          Width = 105
          Height = 47
          Caption = ' Siniestro GPBA '
          TabOrder = 7
          object rbGobSi: TRadioButton
            Left = 7
            Top = 14
            Width = 31
            Height = 15
            Caption = 'Si'
            TabOrder = 0
          end
          object rbGobNo: TRadioButton
            Left = 7
            Top = 30
            Width = 35
            Height = 12
            Caption = 'No'
            TabOrder = 1
          end
          object rbGobTodos: TRadioButton
            Left = 52
            Top = 29
            Width = 51
            Height = 15
            Caption = 'Todos'
            Checked = True
            TabOrder = 2
            TabStop = True
          end
        end
        object GroupBox3: TGroupBox
          Left = 285
          Top = 45
          Width = 549
          Height = 47
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Destinatario Prestador'
          TabOrder = 5
          DesignSize = (
            549
            47)
          inline fraPrestador: TfraPrestador
            Left = 2
            Top = 15
            Width = 543
            Height = 25
            VertScrollBar.Range = 49
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 2
            ExplicitTop = 15
            ExplicitWidth = 543
            ExplicitHeight = 25
            DesignSize = (
              526
              25)
            inherited lbCPostal: TLabel
              Left = 79
              ExplicitLeft = 113
            end
            inherited lbTelefono: TLabel
              Left = -9
              ExplicitLeft = 25
            end
            inherited cmbPrestFantasia: TArtComboBox
              Width = 0
              DataSource = nil
              ExplicitWidth = 0
            end
            inherited cmbPrestador: TArtComboBox
              Width = 165
              DataSource = nil
              ExplicitWidth = 165
            end
            inherited edPresLocalidad: TEdit
              Width = 0
              ExplicitWidth = 0
            end
            inherited edPresCPostal: TEdit
              Left = 96
              ExplicitLeft = 96
            end
            inherited edPresTelefono: TEdit
              Left = -8
              ExplicitLeft = -8
            end
          end
        end
        object gbConDomicilio: TGroupBox
          Left = 518
          Top = 91
          Width = 96
          Height = 47
          Caption = 'Con domicilio'
          TabOrder = 14
          object rbDomSI: TRadioButton
            Left = 4
            Top = 14
            Width = 31
            Height = 15
            Caption = 'Si'
            TabOrder = 0
          end
          object rbDomNO: TRadioButton
            Left = 4
            Top = 30
            Width = 35
            Height = 12
            Caption = 'No'
            TabOrder = 1
          end
          object rbDomTODOS: TRadioButton
            Left = 42
            Top = 29
            Width = 49
            Height = 15
            Caption = 'Todos'
            Checked = True
            TabOrder = 2
            TabStop = True
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Width = 848
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 842
      end>
    ExplicitWidth = 848
    inherited ToolBar: TToolBar
      Width = 835
      ButtonHeight = 32
      ButtonWidth = 29
      ExplicitWidth = 835
      inherited tbRefrescar: TToolButton
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton5: TToolButton
        Left = 29
        Width = 7
        ExplicitLeft = 29
        ExplicitWidth = 7
        ExplicitHeight = 32
      end
      inherited tbNuevo: TToolButton
        Left = 36
        OnClick = tbNuevoClick
        ExplicitLeft = 36
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbModificar: TToolButton
        Left = 65
        ExplicitLeft = 65
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbEliminar: TToolButton
        Left = 94
        ExplicitLeft = 94
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton4: TToolButton
        Left = 123
        ExplicitLeft = 123
        ExplicitHeight = 32
      end
      inherited tbPropiedades: TToolButton
        Left = 131
        ExplicitLeft = 131
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton3: TToolButton
        Left = 160
        ExplicitLeft = 160
        ExplicitHeight = 32
      end
      inherited tbLimpiar: TToolButton
        Left = 168
        ExplicitLeft = 168
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbOrdenar: TToolButton
        Left = 197
        ExplicitLeft = 197
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 226
        ExplicitLeft = 226
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton6: TToolButton
        Left = 255
        ExplicitLeft = 255
        ExplicitHeight = 32
      end
      inherited tbImprimir: TToolButton
        Left = 263
        ExplicitLeft = 263
        ExplicitWidth = 44
        ExplicitHeight = 32
      end
      inherited tbExportar: TToolButton
        Left = 307
        ExplicitLeft = 307
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbEnviarMail: TToolButton
        Left = 336
        ExplicitLeft = 336
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton8: TToolButton
        Left = 365
        ExplicitLeft = 365
        ExplicitHeight = 32
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 373
        ExplicitLeft = 373
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbMaxRegistros: TToolButton
        Left = 402
        ExplicitLeft = 402
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton11: TToolButton
        Left = 431
        ExplicitLeft = 431
        ExplicitHeight = 32
      end
      inherited tbSalir: TToolButton
        Left = 439
        ExplicitLeft = 439
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbRecepcion: TToolButton
        Left = 468
        ExplicitLeft = 468
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbRecepcionMasiva: TToolButton
        Left = 497
        ExplicitLeft = 497
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbReemplazo: TToolButton
        Left = 526
        ExplicitLeft = 526
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbTrackTrace: TToolButton
        Left = 555
        ExplicitLeft = 555
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton2: TToolButton
        Left = 584
        ExplicitLeft = 584
        ExplicitHeight = 32
      end
      inherited tbSalir2: TToolButton
        Left = 592
        ExplicitLeft = 592
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      object tbCartasErr: TToolButton
        Left = 621
        Top = 0
        Hint = 'Ver cartas no impresas por error'
        Caption = 'tbCartasErr'
        ImageIndex = 14
        Visible = False
        OnClick = tbCartasErrClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 848
    Height = 373
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
        FieldName = 'CUIL'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'trabajador'
        Title.Caption = 'Trabajador'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NROCARTADOC'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Carta'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Raz'#243'n Social'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTRODESTINATARIOCARTA'
        Title.Caption = 'Otro Destinatario Carta'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMMED'
        Title.Caption = 'Comisi'#243'n M'#233'dica'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tc_codigo'
        Title.Alignment = taCenter
        Title.Caption = 'Cod.Carta'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOCARTA'
        Title.Caption = 'Tipo Carta'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTCORREO'
        Title.Caption = 'Ultimo Correo'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_USUIMPRESION'
        Title.Caption = 'Usuario Impresi'#243'n'
        Width = 103
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAIMPRESION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Impresi'#243'n'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RECEPCIONOK'
        Title.Alignment = taCenter
        Title.Caption = 'Recepci'#243'n Ok'
        Width = 77
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_FECHARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recepci'#243'n'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_RECEPCION'
        Title.Caption = 'Descripci'#243'n Recepci'#243'n'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_OBSERVRECEPCION'
        Title.Caption = 'Obs. recepci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'codigofirma'
        Title.Alignment = taCenter
        Title.Caption = 'Cod. Firma'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FI_FIRMANTE'
        Title.Caption = 'Firmante'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_USUREIMPRESION'
        Title.Caption = 'Usuario Reimpresi'#243'n'
        Width = 109
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAREIMPRESION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Reimpresi'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 346
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRACKYTRACE'
        Title.Caption = 'Track & Trace'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTRABAJO'
        Title.Caption = 'Grupo Trabajo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ca_incluirenremito'
        Title.Alignment = taCenter
        Title.Caption = 'Remito'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ca_idremito'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. remito'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ca_idremitoreimpresion'
        Title.Alignment = taCenter
        Title.Caption = 'Remito reimp.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHAMAIL'
        Title.Caption = 'Fecha Mail'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_USUMAIL'
        Title.Caption = 'Usuario Mail'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_IDAVALDIGITAL'
        Title.Alignment = taCenter
        Title.Caption = 'Firma avalada'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_VENTANILLA'
        Title.Alignment = taCenter
        Title.Caption = 'Ventanilla'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_fechavalmanual'
        Title.Caption = 'Fecha Aval'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROLOTE'
        Title.Caption = 'Nro Lote'
        Width = 70
        Visible = True
      end>
  end
  inherited fpTrackTrace: TFormPanel
    Left = 290
    Top = 300
    ExplicitLeft = 290
    ExplicitTop = 300
  end
  inherited fpReemplazar: TFormPanel
    Left = 46
    Top = 349
    ExplicitLeft = 46
    ExplicitTop = 349
    inherited gbDatosCartaDoc: TGroupBox
      Top = 119
      ExplicitTop = 119
      inherited fraDomicilioDatosCartaDoc: TfraDomicilioTrab
        inherited cmbCalle: TArtComboBox
          DataSource = nil
        end
        inherited cmbLocalidad: TArtComboBox
          DataSource = nil
        end
      end
      inline fraEmpresaDatosActuales: TfraEmpresa
        Left = 4
        Top = 17
        Width = 598
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ExplicitLeft = 4
        ExplicitTop = 17
        ExplicitWidth = 598
        ExplicitHeight = 21
        DesignSize = (
          598
          21)
        inherited lbContrato: TLabel
          Left = 494
          ExplicitLeft = 494
        end
        inherited edContrato: TIntEdit
          Left = 539
          ExplicitLeft = 539
        end
        inherited cmbRSocial: TArtComboBox
          Width = 358
          DataSource = nil
          ExplicitWidth = 358
        end
      end
    end
    inherited gbDatosActuales: TGroupBox
      Top = 11
      ExplicitTop = 11
      inherited fraDomicilioDatosActuales: TfraDomicilioTrab
        inherited cmbCalle: TArtComboBox
          DataSource = nil
        end
        inherited cmbLocalidad: TArtComboBox
          DataSource = nil
        end
      end
      inline fraEmpresaDatosCartaDoc: TfraEmpresa
        Left = 4
        Top = 17
        Width = 598
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ExplicitLeft = 4
        ExplicitTop = 17
        ExplicitWidth = 598
        ExplicitHeight = 21
        DesignSize = (
          598
          21)
        inherited lbContrato: TLabel
          Left = 494
          ExplicitLeft = 494
        end
        inherited edContrato: TIntEdit
          Left = 539
          ExplicitLeft = 539
        end
        inherited cmbRSocial: TArtComboBox
          Width = 354
          DataSource = nil
          ExplicitWidth = 354
        end
      end
    end
  end
  inherited fpFirmanteIncapacidades: TFormPanel
    Left = 168
    Top = 346
    ExplicitLeft = 168
    ExplicitTop = 346
  end
  inherited fpOpcionesImpresion: TFormPanel [6]
    Left = 170
    Top = 319
    BorderIcons = [biSystemMenu]
    ExplicitLeft = 170
    ExplicitTop = 319
    inherited btnCancelarImpresion: TButton
      OnClick = btnCancelarImpresionClick
    end
    inherited rbImprimir: TRadioButton
      Top = 24
      ExplicitTop = 24
    end
    inherited edCantCopias: TIntEdit
      Text = '3'
      Value = 3
    end
    inherited rbVentanilla: TRadioButton
      TabOrder = 9
    end
    object pnlFirmante: TPanel
      Left = 144
      Top = 3
      Width = 106
      Height = 38
      BevelOuter = bvNone
      TabOrder = 4
      object rbFirmanteOrig: TRadioButton
        Left = 5
        Top = 2
        Width = 98
        Height = 17
        Caption = 'Firmante original'
        TabOrder = 0
      end
      object rbFirmanteActual: TRadioButton
        Left = 5
        Top = 20
        Width = 98
        Height = 17
        Caption = 'Firmante actual'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
    end
  end
  inherited fpRecepcionCartaDoc: TFormPanel [7]
    Left = 582
    Top = 332
    ExplicitLeft = 582
    ExplicitTop = 332
    inherited fraCodRecepcion: TfraCtbTablas
      inherited cmbDescripcion: TArtComboBox
        DataSource = nil
      end
    end
  end
  inherited fpDigitalizar: TFormPanel [8]
    Left = 216
    Top = 292
    ExplicitLeft = 216
    ExplicitTop = 292
  end
  object fpCartasNoImpresasErr: TFormPanel [9]
    Left = 305
    Top = 264
    Width = 675
    Height = 333
    Caption = 'Cartas documento no impresas por Error'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    Constraints.MinHeight = 249
    Constraints.MinWidth = 511
    object ToolBar1: TToolBar
      Left = 0
      Top = 44
      Width = 675
      Height = 27
      Caption = 'ToolBar1'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      TabOrder = 0
      object tbRefrescarErr: TToolButton
        Left = 0
        Top = 0
        Caption = 'tbRefrescarErr'
        ImageIndex = 0
        OnClick = tbRefrescarErrClick
      end
      object tbLimpiarErr: TToolButton
        Left = 23
        Top = 0
        Caption = 'tbLimpiarErr'
        ImageIndex = 1
        OnClick = tbLimpiarErrClick
      end
      object tbOrdernarErr: TToolButton
        Left = 46
        Top = 0
        Caption = 'tbOrdernarErr'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = False
        OnClick = tbOrdernarErrClick
      end
      object ToolButton13: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbReimprimirCartaErr: TToolButton
        Left = 77
        Top = 0
        Hint = 'Reimprimir carta'
        Caption = 'tbReimprimirCartaErr'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = tbReimprimirCartaErrClick
      end
      object ToolButton17: TToolButton
        Left = 100
        Top = 0
        Width = 8
        Caption = 'ToolButton17'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbSalirErr: TToolButton
        Left = 108
        Top = 0
        Caption = 'tbSalirErr'
        ImageIndex = 5
        OnClick = tbSalirErrClick
      end
    end
    object dbgCartasErr: TArtDBGrid
      Left = 0
      Top = 71
      Width = 675
      Height = 262
      Align = alClient
      Ctl3D = True
      DataSource = dsCartasErr
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
      AutoTitleHeight = True
      Columns = <
        item
          Expanded = False
          FieldName = 'SINIESTRO'
          Title.Caption = 'Siniestro'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUIL'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRABAJADOR'
          Title.Caption = 'Trabajador'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NROCARTADOC'
          Title.Caption = 'Nro. Carta'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUIT'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPRESA'
          Title.Caption = 'Raz'#243'n Social'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTRATO'
          Title.Caption = 'Contrato'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODCARTA'
          Title.Caption = 'Cod.Carta'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPOCARTA'
          Title.Caption = 'Tipo Carta'
          Width = 150
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 675
      Height = 44
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object gbFechaImpresionErr: TGroupBox
        Left = 2
        Top = 0
        Width = 204
        Height = 41
        Caption = 'Fecha de Impresi'#243'n'
        TabOrder = 0
        object Label15: TLabel
          Left = 98
          Top = 16
          Width = 8
          Height = 13
          Caption = '>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edFImprDesde: TDateComboBox
          Left = 5
          Top = 14
          Width = 90
          Height = 21
          MaxDateCombo = edFImprHasta
          TabOrder = 0
        end
        object edFImprHasta: TDateComboBox
          Left = 108
          Top = 14
          Width = 91
          Height = 21
          MinDateCombo = edFImprDesde
          TabOrder = 1
        end
      end
    end
  end
  inherited pnlBottomCartas: TPanel
    Top = 621
    Width = 848
    ExplicitTop = 621
    ExplicitWidth = 848
    inherited pnlRemito: TPanel
      Left = 728
      ExplicitLeft = 728
    end
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'ImprimirCartasSiniVencidos'
      end>
  end
  inherited ShortCutControl: TShortCutControl
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
      end
      item
        Key = 16466
        LinkControl = tbRecepcion
      end
      item
        Key = 16464
        LinkControl = tbReemplazo
      end
      item
        Key = 16468
        LinkControl = tbTrackTrace
      end
      item
        Enabled = False
        Key = 16452
      end>
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  inherited dsUsuImpresion: TDataSource
    Left = 378
  end
  inherited sdqUsuImpresion: TSDQuery
    SQL.Strings = (
      'SELECT   se_usuario, se_nombre'
      '    FROM art.use_usuarios'
      '   WHERE se_fechabaja IS NULL'
      '     AND se_usuariogenerico = '#39'N'#39
      'ORDER BY se_nombre')
    Left = 350
  end
  inherited dsUsuAlta: TDataSource
    Left = 620
    Top = 111
  end
  inherited sdqUsuAlta: TSDQuery
    Left = 592
    Top = 111
  end
  inherited sdqUsuReimpresion: TSDQuery
    SQL.Strings = (
      'SELECT   se_usuario, se_nombre'
      '    FROM art.use_usuarios'
      '   WHERE se_fechabaja IS NULL'
      '     AND se_usuariogenerico = '#39'N'#39
      'ORDER BY se_nombre')
    Left = 698
    Top = 207
  end
  object sdqTipoAccidente: TSDQuery [30]
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT ta_codigo, ta_descripcion'
      '  FROM SIN.sta_tipoaccidente')
    Left = 630
    Top = 67
  end
  object dsTipoAccidente: TDataSource [31]
    DataSet = sdqTipoAccidente
    Left = 658
    Top = 67
  end
  inherited dsUsuReimpresion: TDataSource
    Left = 726
    Top = 207
  end
  inherited dsDelegacion: TDataSource
    Left = 648
    Top = 6
  end
  inherited sdqDelegacion: TSDQuery
    Left = 620
    Top = 6
  end
  inherited sdqModulo: TSDQuery
    Left = 369
    Top = 132
  end
  inherited dsModulo: TDataSource
    Left = 397
    Top = 132
  end
  object dsCartasErr: TDataSource [37]
    DataSet = sdqCartasErr
    Left = 252
    Top = 402
  end
  object sdqCartasErr: TSDQuery [38]
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_rec' +
        'aida) SINIESTRO, art.utiles.armar_cuit(tj_cuil) cuil, tj_nombre ' +
        'TRABAJADOR, '
      
        '       art.utiles.armar_nrocartadocumento(ca_nrocartadoc) nrocar' +
        'tadoc, art.utiles.armar_cuit(ex_cuit) cuit, hm_nombre empresa,'
      
        '       hc_contrato contrato, tc_nombre tipocarta, tc_codigo CodC' +
        'arta, ca_fechaimpresion fechaimpresion'
      ''
      
        '  FROM cca_carta a, ctc_textocarta c, art.sex_expedientes, ctj_t' +
        'rabajador, ahm_historicoempresa, aen_endoso, ahc_historicocontra' +
        'to'
      '  '
      ' WHERE a.ca_nrocartadoc IS NOT NULL'
      '   AND ca_idexpediente = ex_id'
      '   AND c.tc_id = a.ca_idtextocarta'
      '   AND c.tc_fechabaja IS NULL'
      '   AND a.ca_idendoso IS NOT NULL'
      '   '
      '   and tj_id = ex_idtrabajador'
      '   AND en_idhistoricocontrato = hc_id(+) '
      '   AND en_idhistoricoempresa = hm_id(+) '
      '   AND ca_idendoso = en_id(+) '
      '   '
      
        '   AND a.ca_fechaimpresion between (art.actualdate - 100) and ar' +
        't.actualdate  '
      '   '
      '   AND (   (c.tc_destinatario = 3)'
      '        OR (    (c.tc_destinatario = 1)'
      '            AND (c.tc_formatorel IS NOT NULL)))'
      '   AND NOT EXISTS(SELECT 1'
      '                    FROM cca_carta b'
      '                   WHERE b.ca_id > a.ca_id'
      '                     AND b.ca_idexpediente = a.ca_idexpediente'
      '                     AND b.ca_idtrabajador IS NOT NULL'
      '                     AND b.ca_idtextocarta = (SELECT tc_id'
      
        '                                                FROM ctc_textoca' +
        'rta'
      
        '                                               WHERE tc_id = NVL' +
        '(c.tc_formatorel, c.tc_id)))')
    Left = 224
    Top = 402
  end
  object SortDialogErr: TSortDialog [39]
    Caption = 'Orden'
    DataSet = sdqCartasErr
    SortFields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'CUIL'
        DataField = 'CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Trabajador'
        DataField = 'TRABAJADOR'
        FieldIndex = 0
      end
      item
        Title = 'Nro. Carta'
        DataField = 'NROCARTADOC'
        FieldIndex = 0
      end
      item
        Title = 'CUIT'
        DataField = 'CUIT'
        FieldIndex = 0
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'EMPRESA'
        FieldIndex = 0
      end
      item
        Title = 'Contrato'
        DataField = 'CONTRATO'
        FieldIndex = 0
      end
      item
        Title = 'Cod. Carta'
        DataField = 'CODCARTA'
        FieldIndex = 0
      end
      item
        Title = 'Tipo Carta'
        DataField = 'TIPOCARTA'
        FieldIndex = 0
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 224
    Top = 430
  end
  inherited ShortCutControlHijo: TShortCutControl
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
  object ShortCutControlHijo2: TShortCutControl
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
    Left = 100
    Top = 304
  end
end
