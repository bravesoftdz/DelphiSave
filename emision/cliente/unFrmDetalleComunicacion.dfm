object FrmDetalleComunicacion: TFrmDetalleComunicacion
  Left = 216
  Top = 104
  Width = 759
  Height = 611
  Caption = 'Detalle de la Comunicaci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbDatosGeneralesContrato: TGroupBox
    Left = 0
    Top = 0
    Width = 751
    Height = 149
    Align = alTop
    Caption = ' Datos Generales'
    TabOrder = 0
    object lblMotivoBaja: TLabel
      Left = 169
      Top = 98
      Width = 45
      Height = 13
      Caption = 'Mot. Baja'
    end
    object lblCUIT: TLabel
      Left = 8
      Top = 21
      Width = 18
      Height = 13
      Caption = 'Cuit'
    end
    object lblDomicilio: TLabel
      Left = 8
      Top = 49
      Width = 42
      Height = 13
      Caption = 'Domicilio'
    end
    object lblEstado: TLabel
      Left = 8
      Top = 73
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object lblFechaBaja: TLabel
      Left = 8
      Top = 98
      Width = 33
      Height = 13
      Caption = 'F. Baja'
    end
    object lblVigenciaDesde: TLabel
      Left = 10
      Top = 123
      Width = 52
      Height = 13
      Caption = 'Vig. Desde'
    end
    object lblVigenciaHasta: TLabel
      Left = 171
      Top = 123
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object edtMotivoBaja: TEdit
      Left = 218
      Top = 95
      Width = 370
      Height = 21
      TabOrder = 0
    end
    object edtDomicilio: TEdit
      Left = 74
      Top = 45
      Width = 373
      Height = 21
      TabOrder = 1
    end
    object cmbFechaBaja: TDateComboBox
      Left = 74
      Top = 95
      Width = 88
      Height = 21
      TabOrder = 2
    end
    inline fraContrato: TfraEmpresa
      Left = 74
      Top = 21
      Width = 513
      Height = 21
      TabOrder = 3
      inherited lbContrato: TLabel
        Left = 411
      end
      inherited edContrato: TIntEdit
        Left = 456
      end
      inherited cmbRSocial: TArtComboBox
        Width = 274
      end
    end
    object edtEstado: TEdit
      Left = 74
      Top = 69
      Width = 514
      Height = 21
      TabOrder = 4
    end
    object cmbFechaVigenciaDesde: TDateComboBox
      Left = 74
      Top = 119
      Width = 88
      Height = 21
      TabOrder = 5
    end
    object cmbFechaVigenciaHasta: TDateComboBox
      Left = 194
      Top = 119
      Width = 88
      Height = 21
      TabOrder = 6
    end
  end
  object pcDetalleDelContrato: TPageControl
    Left = 0
    Top = 149
    Width = 751
    Height = 435
    ActivePage = tsDetalleComunicacion
    Align = alClient
    TabOrder = 1
    object tsDetalleComunicacion: TTabSheet
      Caption = 'Detalle Comunicaci'#243'n'
      ImageIndex = 4
      object pgComunicacion: TPageControl
        Left = 0
        Top = 0
        Width = 743
        Height = 366
        ActivePage = TabSheet2
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpLeft
        object TabSheet2: TTabSheet
          Caption = 'Observaciones'
          object dbgObservaciones: TArtDBGrid
            Left = 0
            Top = 0
            Width = 716
            Height = 358
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
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
                Title.Caption = 'Orden'
                Width = 57
                Visible = True
              end
              item
                Expanded = False
                Title.Caption = 'Observaci'#243'n'
                Width = 234
                Visible = True
              end
              item
                Expanded = False
                Title.Caption = 'Proceso'
                Width = 114
                Visible = True
              end
              item
                Expanded = False
                Title.Caption = 'Aceptaci'#243'n/Rechazo/Gesti'#243'n'
                Width = 163
                Visible = True
              end>
          end
        end
        object tsComunicacion: TTabSheet
          Caption = 'Comunicaci'#243'n'
          ImageIndex = 1
          object mDetalleComunicacion: TMemo
            Left = 0
            Top = 161
            Width = 716
            Height = 197
            Align = alClient
            TabOrder = 0
          end
          object dbcgRequirido: TDBCtrlGrid
            Left = 0
            Top = 0
            Width = 716
            Height = 161
            Align = alTop
            PanelHeight = 53
            PanelWidth = 700
            TabOrder = 1
            object Solicitar: TLabel
              Left = 16
              Top = 8
              Width = 40
              Height = 13
              Caption = 'Solicitar:'
            end
            object lblPeriodoDesde: TLabel
              Left = 16
              Top = 32
              Width = 73
              Height = 13
              Caption = 'Periodo Desde:'
            end
            object lblPeriodoHasta: TLabel
              Left = 184
              Top = 33
              Width = 70
              Height = 13
              Caption = 'Periodo Hasta:'
            end
            object dbeSolicitud: TDBEdit
              Left = 96
              Top = 5
              Width = 457
              Height = 21
              TabOrder = 0
            end
            object dbchkRealizado: TDBCheckBox
              Left = 576
              Top = 8
              Width = 97
              Height = 17
              Caption = 'Realizado'
              TabOrder = 1
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object dbePeriodoDesde: TDBEdit
              Left = 96
              Top = 29
              Width = 49
              Height = 21
              TabOrder = 2
            end
            object dbePeriodoHasta: TDBEdit
              Left = 264
              Top = 29
              Width = 49
              Height = 21
              TabOrder = 3
            end
          end
        end
      end
      object pnBotones: TPanel
        Left = 0
        Top = 366
        Width = 743
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          743
          41)
        object btnGestionConcluida: TButton
          Left = 406
          Top = 8
          Width = 103
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Gesti'#243'n Concluida'
          TabOrder = 0
          OnClick = btnGestionConcluidaClick
        end
        object btnPostergarGestion: TButton
          Left = 515
          Top = 8
          Width = 103
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Postergar'
          TabOrder = 1
          OnClick = btnPostergarGestionClick
        end
        object btnCancelarGestion: TButton
          Left = 624
          Top = 8
          Width = 103
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Cancelar'
          TabOrder = 2
          OnClick = btnCancelarGestionClick
        end
      end
    end
    object tsDatosAfiliacion: TTabSheet
      Caption = 'Afiliaci'#243'n'
    end
    object DatosCobranza: TTabSheet
      Caption = 'Cobranzas'
      ImageIndex = 1
    end
    object tsDatosEmision: TTabSheet
      Caption = 'Emisi'#243'n'
      ImageIndex = 2
    end
    object TabSheet1: TTabSheet
      Caption = 'Sistema de Gesti'#243'n de Clientes'
      ImageIndex = 3
    end
  end
  object fpDetalleFallida: TFormPanel
    Left = 206
    Top = 272
    Width = 425
    Height = 257
    FormWidth = 0
    FormHeigth = 0
    DesignSize = (
      425
      257)
    object btnAceptarContactoFallido: TButton
      Left = 256
      Top = 226
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarContactoFallidoClick
    end
    object btnCancelarContactoFallido: TButton
      Left = 339
      Top = 226
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarContactoFallidoClick
    end
    object gbDetalleContactoFallido: TGroupBox
      Left = 8
      Top = 5
      Width = 409
      Height = 208
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Detalle Contacto Fallido '
      TabOrder = 2
      object lblMotivoDetalleContactoFallido: TLabel
        Left = 8
        Top = 24
        Width = 35
        Height = 13
        Caption = 'Motivo:'
      end
      object cmbMotivo: TComboBox
        Left = 56
        Top = 22
        Width = 337
        Height = 21
        ItemHeight = 13
        TabOrder = 0
      end
      object mObservacionesFallida: TMemo
        Left = 8
        Top = 56
        Width = 393
        Height = 145
        TabOrder = 1
      end
    end
  end
  object fpPostergacion: TFormPanel
    Left = 190
    Top = 168
    Width = 425
    Height = 265
    FormWidth = 0
    FormHeigth = 0
    DesignSize = (
      425
      265)
    object btnAceptarPostergacion: TButton
      Left = 256
      Top = 234
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarContactoFallidoClick
    end
    object btnCancelarPostergacion: TButton
      Left = 339
      Top = 234
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarContactoFallidoClick
    end
    object gbDetallePostergacion: TGroupBox
      Left = 8
      Top = 5
      Width = 409
      Height = 216
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Detalle Postergaci'#243'n  '
      TabOrder = 2
      object lblMotivoDetallePostergacion: TLabel
        Left = 8
        Top = 24
        Width = 35
        Height = 13
        Caption = 'Motivo:'
      end
      object lblObservacionesDetallePostergacion: TLabel
        Left = 8
        Top = 56
        Width = 74
        Height = 13
        Caption = 'Observaciones:'
      end
      object cmbMotivoDetallePostergacion: TComboBox
        Left = 56
        Top = 22
        Width = 337
        Height = 21
        ItemHeight = 13
        TabOrder = 0
      end
      object mObservacionesDetallePostergacion: TMemo
        Left = 8
        Top = 72
        Width = 209
        Height = 137
        TabOrder = 1
      end
      object mcReprogramado: TMonthCalendar
        Left = 211
        Top = 56
        Width = 191
        Height = 154
        Date = 38568.507559062500000000
        TabOrder = 2
      end
    end
  end
  object sdqAcciones: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT   ida.da_idaccion, ida.da_subaccion, ida.da_fechaplanific' +
        'ada,'
      
        '         ida.da_cantidadpostergaciones, ida.da_idgestor, ida.da_' +
        'observaciones,'
      
        '         ida.da_resultadogestion, ida.da_idloteddjj, iac.ac_desc' +
        'ripcion,'
      
        '         isa.sa_descripcion, igl.gl_usuario, idj.dj_contrato, ae' +
        'm.em_nombre,'
      '         COUNT(*) AS "Cantidad Periodos"'
      '    FROM emi.ida_ddjjaccion ida,'
      '         emi.iac_accion iac,'
      '         emi.isa_subaccion isa,'
      '         emi.idj_ddjj idj,'
      '         emi.ild_loteddjj ild,'
      '         emi.igl_gestorlote igl,'
      '         afi.aco_contrato aco,'
      '         afi.aem_empresa aem'
      '   WHERE (    (iac.ac_id = ida.da_idaccion)'
      '          AND (idj.dj_id = ild.ld_idddjj)'
      '          AND (ild.ld_id = ida.da_idloteddjj)'
      '          AND (igl.gl_id = ida.da_idgestor)'
      '          AND (idj.dj_contrato = aco.co_contrato)'
      '          AND (aem.em_id = aco.co_idempresa))'
      '     AND (isa.sa_id = ida.da_subaccion)'
      '     AND iac.ac_id = :id'
      'GROUP BY ida.da_idaccion,'
      '         ida.da_subaccion,'
      '         ida.da_fechaplanificada,'
      '         ida.da_cantidadpostergaciones,'
      '         ida.da_idgestor,'
      '         ida.da_observaciones,'
      '         ida.da_resultadogestion,'
      '         ida.da_idloteddjj,'
      '         iac.ac_descripcion,'
      '         isa.sa_descripcion,'
      '         igl.gl_usuario,'
      '         idj.dj_contrato,'
      '         aem.em_nombre'
      '')
    Left = 88
    Top = 262
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
        Value = '0'
      end>
  end
end
