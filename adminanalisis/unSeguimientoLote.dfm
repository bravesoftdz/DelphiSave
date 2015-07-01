inherited frmSeguimientoLote: TfrmSeguimientoLote
  Left = 231
  Top = 148
  Caption = 'Seguimiento de Lotes'
  ClientHeight = 529
  ClientWidth = 788
  Constraints.MinHeight = 532
  Constraints.MinWidth = 788
  OldCreateOrder = True
  ExplicitWidth = 796
  ExplicitHeight = 559
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter2: TJvNetscapeSplitter [0]
    Left = 0
    Top = 282
    Width = 788
    Height = 9
    Cursor = crVSplit
    Align = alBottom
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ExplicitTop = 285
  end
  object Label34: TLabel [1]
    Left = 6
    Top = 82
    Width = 83
    Height = 13
    Caption = 'F.L'#237'mite Present.:'
  end
  object Label35: TLabel [2]
    Left = 192
    Top = 82
    Width = 28
    Height = 13
    Caption = 'Hasta'
  end
  inherited pnlFiltros: TPanel
    Width = 788
    Height = 162
    ExplicitWidth = 788
    ExplicitHeight = 162
    object dbgListado: TDBGrid
      Left = 195
      Top = 0
      Width = 190
      Height = 67
      DataSource = dsListado
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      Columns = <
        item
          Expanded = False
          FieldName = 'LOTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO LOTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRESTADOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA NOTIF PRESTADOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA NOTIF EMPRESA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBSERVACIONES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUIT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZON SOCIAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTAB.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTRATO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO SUBLOTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA RELEVAMIENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA PACTADA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA APROBADO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA RECHAZO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA ANULADO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA RECIBIDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA TERMINADO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTIVO RECHAZO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANT.CC.DD.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA CC.DD.'
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTIVO BAJA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA AGREGADO'
          Visible = True
        end>
    end
    object pcFilter: TPageControl
      Left = 0
      Top = 0
      Width = 788
      Height = 164
      ActivePage = tbGeneral
      Align = alTop
      TabOrder = 1
      object tbGeneral: TTabSheet
        Caption = 'General'
        DesignSize = (
          780
          136)
        object lbEstableci: TLabel
          Left = 8
          Top = 8
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        object Label6: TLabel
          Left = 8
          Top = 84
          Width = 48
          Height = 13
          Caption = 'Prestador:'
        end
        object Label1: TLabel
          Left = 8
          Top = 108
          Width = 24
          Height = 13
          Caption = 'Lote:'
        end
        object lblEstado: TLabel
          Left = 120
          Top = 105
          Width = 36
          Height = 26
          Caption = 'Estado Lote:'
          WordWrap = True
        end
        object Label20: TLabel
          Left = 342
          Top = 105
          Width = 39
          Height = 26
          Caption = 'Estado Sublote:'
          WordWrap = True
        end
        inline fraEmpresa: TfraEmpresa
          Left = 36
          Top = 3
          Width = 744
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
          ExplicitLeft = 36
          ExplicitTop = 3
          ExplicitWidth = 744
          ExplicitHeight = 21
          DesignSize = (
            744
            21)
          inherited lbRSocial: TLabel
            Left = 106
            ExplicitLeft = 106
          end
          inherited lbContrato: TLabel
            Left = 640
            ExplicitLeft = 640
          end
          inherited mskCUIT: TMaskEdit
            Left = 22
            ExplicitLeft = 22
          end
          inherited edContrato: TIntEdit
            Left = 687
            ExplicitLeft = 687
          end
          inherited cmbRSocial: TArtComboBox
            Left = 151
            Width = 478
            DataSource = nil
            ExplicitLeft = 151
            ExplicitWidth = 478
          end
        end
        inline fraEstablecimiento: TfraEstablecimiento_OLD
          Left = -3
          Top = 30
          Width = 783
          Height = 47
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = -3
          ExplicitTop = 30
          ExplicitWidth = 783
          DesignSize = (
            783
            47)
          inherited lbLocalidad: TLabel
            Left = 549
            Width = 46
            ExplicitLeft = 549
            ExplicitWidth = 46
          end
          inherited lbEstableci: TLabel
            Left = 12
            Width = 30
            ExplicitLeft = 12
            ExplicitWidth = 30
          end
          inherited lbCPostal: TLabel
            Left = 712
            Width = 20
            ExplicitLeft = 712
            ExplicitWidth = 20
          end
          inherited lbDomicilio: TLabel
            Left = 12
            Width = 42
            ExplicitLeft = 12
            ExplicitWidth = 42
          end
          inherited lbProvincia: TLabel
            Left = 549
            Width = 44
            ExplicitLeft = 549
            ExplicitWidth = 44
          end
          inherited edCodigo: TIntEdit
            Left = 61
            Width = 48
            ExplicitLeft = 61
            ExplicitWidth = 48
          end
          inherited cmbDescripcion: TArtComboBox
            Left = 112
            Width = 433
            DataSource = nil
            ExplicitLeft = 112
            ExplicitWidth = 433
          end
          inherited edLocalidad: TEdit
            Left = 601
            ExplicitLeft = 601
          end
          inherited edCPostal: TEdit
            Left = 736
            ExplicitLeft = 736
          end
          inherited edDomicilio: TEdit
            Left = 61
            Width = 485
            ExplicitLeft = 61
            ExplicitWidth = 485
          end
          inherited edProvincia: TEdit
            Left = 601
            ExplicitLeft = 601
          end
          inherited sdqDatos: TSDQuery
            Left = 100
            Top = 28
          end
          inherited dsDatos: TDataSource
            Left = 132
            Top = 28
          end
        end
        inline fraPrestador: TfraPrestadorAMPCuit
          Left = 57
          Top = 78
          Width = 722
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ExplicitLeft = 57
          ExplicitTop = 78
          ExplicitWidth = 722
          ExplicitHeight = 25
          DesignSize = (
            722
            25)
          inherited lbCuit: TLabel
            Left = 611
            ExplicitLeft = 611
          end
          inherited cmbDescripcion: TArtComboBox
            Width = 541
            DataSource = nil
            ExplicitWidth = 541
          end
          inherited mskCUIT: TMaskEdit
            Left = 639
            ExplicitLeft = 639
          end
        end
        object edLote: TIntEdit
          Left = 58
          Top = 105
          Width = 57
          Height = 21
          TabOrder = 3
          MaxLength = 8
        end
        object cbEstadoLoteFiltro: TExComboBox
          Left = 156
          Top = 105
          Width = 180
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 4
          Items.Strings = (
            'A=Aprobado'
            'B=Recibido'
            'E=Cerrado con Carta Documento'
            'L=Liquidado'
            'N=Anulado'
            'P=Pendiente'
            'T=Terminado')
          ItemIndex = -1
          Options = [coGridLines]
          ValueWidth = 64
        end
        object cbEstadoSubLoteFiltro: TExComboBox
          Left = 384
          Top = 105
          Width = 180
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 5
          OnChange = cbEstadoSubLoteFiltroChange
          Items.Strings = (
            'A=Aprobado'
            'B=Recibido'
            'D=Carta Documento'
            'E=Cerrado con Carta Documento'
            'I=Realizado Parcialmente'
            'J=Baja Contrato'
            'L=Liquidado'
            'M=Reprogramado'
            'N=Anulado'
            'P=Pendiente'
            'R=Rechazado'
            'S=Realizado sin Entregar'
            'T=Terminado'
            'V=Notificado a Preventor')
          ItemIndex = -1
          Options = [coGridLines]
          ValueWidth = 64
        end
        object Panel2: TPanel
          Left = 672
          Top = 119
          Width = 106
          Height = 17
          Anchors = [akRight, akBottom]
          BevelOuter = bvNone
          TabOrder = 6
          object lblSolEnvioInf: TLabel
            Left = 1
            Top = 1
            Width = 103
            Height = 13
            Caption = 'Sol. Env'#237'o de Informe'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
        object cbEmpresasVIP: TCheckBox
          Left = 575
          Top = 106
          Width = 86
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Empresas VIP'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 7
        end
        object cbEmpresasNoVip: TCheckBox
          Left = 668
          Top = 106
          Width = 108
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Empresas No VIP'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 8
        end
      end
      object tbFechasPrestador: TTabSheet
        Caption = 'Prestador'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label25: TLabel
          Left = 3
          Top = 4
          Width = 84
          Height = 26
          Caption = 'Fecha Carta Doc. Aus. Desde'
          WordWrap = True
        end
        object Label26: TLabel
          Left = 188
          Top = 11
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object Label27: TLabel
          Left = 2
          Top = 35
          Width = 88
          Height = 13
          Caption = 'Fecha Notif.Prest.:'
        end
        object Label28: TLabel
          Left = 188
          Top = 35
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object Label29: TLabel
          Left = 2
          Top = 61
          Width = 90
          Height = 13
          Caption = 'F.Conf.Recep.Lote'
        end
        object Label30: TLabel
          Left = 188
          Top = 60
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object edDesdeFCDA: TDateComboBox
          Left = 97
          Top = 7
          Width = 88
          Height = 21
          TabOrder = 0
        end
        object edHastaFCDA: TDateComboBox
          Left = 220
          Top = 7
          Width = 88
          Height = 21
          TabOrder = 1
        end
        object edFechaNotifPrestDesde: TDateComboBox
          Left = 97
          Top = 32
          Width = 88
          Height = 21
          TabOrder = 2
        end
        object edFechaNotifPrestHasta: TDateComboBox
          Left = 220
          Top = 32
          Width = 88
          Height = 21
          TabOrder = 3
        end
        object chkNotifFechaPactadaVencida: TCheckBox
          Left = 3
          Top = 84
          Width = 165
          Height = 17
          Caption = 'Notif.Fecha Pactada Vencida'
          TabOrder = 4
          OnClick = chkNotifFechaPactadaVencidaClick
        end
        object edfechaconfreceplotedesde: TDateComboBox
          Left = 97
          Top = 57
          Width = 88
          Height = 21
          TabOrder = 5
        end
        object edfechaconfreceplotehasta: TDateComboBox
          Left = 220
          Top = 57
          Width = 88
          Height = 21
          TabOrder = 6
        end
        object chksinconfreceplote: TCheckBox
          Left = 320
          Top = 59
          Width = 200
          Height = 17
          Caption = 'Sin confirmaci'#243'n de recepci'#243'n de lote'
          TabOrder = 7
          OnClick = chkNotifFechaPresEmpVencidaClick
        end
      end
      object tbFechaEmpresas: TTabSheet
        Caption = 'Empresa'
        ImageIndex = 2
        DesignSize = (
          780
          136)
        object Label31: TLabel
          Left = 4
          Top = 36
          Width = 83
          Height = 13
          Caption = 'F.L'#237'mite Present.:'
        end
        object Label32: TLabel
          Left = 188
          Top = 36
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object Label33: TLabel
          Left = 656
          Top = 0
          Width = 118
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Tipo Notif.Pact.Empresa:'
        end
        object Label12: TLabel
          Left = 4
          Top = 60
          Width = 91
          Height = 13
          Caption = 'F.Notif.Asig.Desde:'
        end
        object Label10: TLabel
          Left = 188
          Top = 8
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object Label36: TLabel
          Left = 4
          Top = 12
          Width = 92
          Height = 13
          Caption = 'Fecha Pact.Desde:'
        end
        object Label37: TLabel
          Left = 188
          Top = 60
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object Label38: TLabel
          Left = 4
          Top = 84
          Width = 70
          Height = 13
          Caption = 'Departamento:'
        end
        object edFechaLimitePresDesde: TDateComboBox
          Left = 100
          Top = 32
          Width = 88
          Height = 21
          TabOrder = 0
        end
        object edFechaLimitePresHasta: TDateComboBox
          Left = 224
          Top = 32
          Width = 88
          Height = 21
          TabOrder = 1
        end
        object chkNotifFechaPresEmpVencida: TCheckBox
          Left = 320
          Top = 36
          Width = 190
          Height = 17
          Caption = 'Fecha Pres. de Empresa Vencida'
          TabOrder = 2
          OnClick = chkNotifFechaPresEmpVencidaClick
        end
        object chkTipoNotifEmpresa: TCheckListBox
          Left = 656
          Top = 16
          Width = 121
          Height = 70
          Anchors = [akTop, akRight]
          ItemHeight = 13
          Items.Strings = (
            'Email'
            'Fax'
            'Carta'
            'Ventanilla'
            'Sin Notificaci'#243'n')
          TabOrder = 3
        end
        object FPactadaDesde: TDateComboBox
          Left = 100
          Top = 8
          Width = 88
          Height = 21
          TabOrder = 4
        end
        object FPactadaHasta: TDateComboBox
          Left = 224
          Top = 8
          Width = 88
          Height = 21
          TabOrder = 5
        end
        object edFechaAsigEmpresaDesde: TDateComboBox
          Left = 100
          Top = 56
          Width = 88
          Height = 21
          TabOrder = 6
        end
        object edFechaAsigEmpresaHasta: TDateComboBox
          Left = 224
          Top = 56
          Width = 88
          Height = 21
          TabOrder = 7
        end
        object chkSinFechaNotifAsigEmpresa: TCheckBox
          Left = 320
          Top = 60
          Width = 181
          Height = 17
          Caption = 'Sin Notificaci'#243'n de Asig.Empresa'
          TabOrder = 8
        end
        inline fraDepart: TfraCodDesc
          Left = 100
          Top = 80
          Width = 277
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 9
          ExplicitLeft = 100
          ExplicitTop = 80
          ExplicitWidth = 277
          DesignSize = (
            277
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 0
            Width = 213
            ExplicitLeft = 0
            ExplicitWidth = 213
          end
          inherited edCodigo: TPatternEdit
            Left = 215
            Anchors = [akTop, akRight]
            Visible = False
            ExplicitLeft = 215
          end
          inherited sdqDatos: TSDQuery
            SQL.Strings = (
              '  SELECT  ROWNUM AS ID,'
              '          ROWNUM AS codigo,'
              '          cp_departamento AS descripcion,'
              '          '#39#39' AS baja'
              '    FROM  (SELECT  DISTINCT cp_departamento'
              '             FROM  art.ccp_codigopostal'
              '            WHERE  cp_departamento IS NOT NULL) depto'
              'ORDER BY  cp_departamento')
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'NULL'
            FieldCodigo = 'rownum'
            FieldDesc = 'cp_departamento'
            FieldID = 'rownum'
            IdType = ctInteger
            OrderBy = 'cp_departamento'
            TableName = 'art.ccp_codigopostal'
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 162
    Width = 788
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 782
      end>
    ExplicitTop = 162
    ExplicitWidth = 788
    inherited ToolBar: TToolBar
      Width = 775
      ButtonWidth = 29
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ExplicitWidth = 775
      inherited tbRefrescar: TToolButton
        ImageIndex = 6
        ExplicitWidth = 29
      end
      inherited ToolButton5: TToolButton
        Left = 29
        Visible = True
        ExplicitLeft = 29
      end
      inherited tbNuevo: TToolButton
        Left = 37
        Enabled = False
        ImageIndex = 0
        Visible = True
        ExplicitLeft = 37
        ExplicitWidth = 29
      end
      inherited tbModificar: TToolButton
        Left = 66
        Hint = 'Cambiar estado (Ctrl+M)'
        ImageIndex = 1
        Visible = True
        ExplicitLeft = 66
        ExplicitWidth = 29
      end
      inherited tbEliminar: TToolButton
        Left = 95
        Hint = 'Anular (Ctrl+Del)'
        ImageIndex = 2
        Visible = True
        ExplicitLeft = 95
        ExplicitWidth = 29
      end
      inherited ToolButton4: TToolButton
        Left = 124
        ExplicitLeft = 124
      end
      inherited tbPropiedades: TToolButton
        Left = 132
        Enabled = False
        ImageIndex = 16
        Visible = True
        ExplicitLeft = 132
        ExplicitWidth = 29
      end
      inherited ToolButton3: TToolButton
        Left = 161
        Visible = False
        ExplicitLeft = 161
      end
      inherited tbLimpiar: TToolButton
        Left = 169
        ImageIndex = 5
        ExplicitLeft = 169
        ExplicitWidth = 29
      end
      inherited tbOrdenar: TToolButton
        Left = 198
        ImageIndex = 7
        ExplicitLeft = 198
        ExplicitWidth = 29
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 227
        ImageIndex = 27
        Visible = True
        ExplicitLeft = 227
        ExplicitWidth = 29
      end
      inherited ToolButton6: TToolButton
        Left = 256
        ExplicitLeft = 256
      end
      inherited tbImprimir: TToolButton
        Left = 264
        ImageIndex = 9
        ExplicitLeft = 264
        ExplicitWidth = 29
      end
      inherited tbExportar: TToolButton
        Left = 293
        DropdownMenu = mnuExportar
        Enabled = True
        PopupMenu = mnuExportar
        Style = tbsDropDown
        ExplicitLeft = 293
        ExplicitWidth = 44
      end
      inherited tbEnviarMail: TToolButton
        Left = 337
        ImageIndex = 36
        ExplicitLeft = 337
        ExplicitWidth = 29
      end
      inherited ToolButton8: TToolButton
        Left = 366
        ExplicitLeft = 366
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 374
        ImageIndex = 18
        ExplicitLeft = 374
        ExplicitWidth = 29
      end
      inherited tbMaxRegistros: TToolButton
        Left = 403
        ImageIndex = 20
        ExplicitLeft = 403
        ExplicitWidth = 29
      end
      inherited ToolButton11: TToolButton
        Left = 432
        ExplicitLeft = 432
      end
      inherited tbSalir: TToolButton
        Left = 440
        ImageIndex = 10
        ExplicitLeft = 440
        ExplicitWidth = 29
      end
      object tbAgendaObsLote: TToolButton
        Left = 469
        Top = 0
        Hint = 'Agenda de Observaciones'#13#10'del Lote'
        Caption = 'tbAgendaObsLote'
        ImageIndex = 24
        OnClick = tbAgendaObsLoteClick
      end
      object tbNotificar: TToolButton
        Left = 498
        Top = 0
        Hint = 'Notificaciones'
        Caption = 'tbNotificar'
        DropdownMenu = mnuNotificar
        ImageIndex = 36
        Style = tbsDropDown
      end
      object tbLotesACerrar: TToolButton
        Left = 542
        Top = 0
        Hint = 'Listado de Lotes a '#13#10'Cerrar por Carta Documento'
        Caption = 'tbLotesACerrar'
        ImageIndex = 35
        OnClick = tbLotesACerrarClick
      end
      object tbCambioDeEstado: TToolButton
        Left = 571
        Top = 0
        Hint = 'Cambio de Estado de lotes'
        Caption = 'tbCambioDeEstado'
        ImageIndex = 30
        OnClick = tbCambioDeEstadoClick
      end
      object tbListadoRecepcion: TToolButton
        Left = 600
        Top = 0
        Hint = 'Listado de Recepci'#243'n'
        Caption = 'tbListadoRecepcion'
        ImageIndex = 31
        OnClick = tbListadoRecepcionClick
      end
      object tbCambiarEstadoSublote: TToolButton
        Left = 629
        Top = 0
        Hint = 'Cambiar Estado Sublote'
        Caption = 'Cambiar Estado Sublote'
        DropdownMenu = mnuCambiarEstado
        ImageIndex = 32
        Style = tbsDropDown
      end
      object tbCofirmarRecepcionLotePres: TToolButton
        Left = 673
        Top = 0
        Hint = 'Confirmar la recepci'#243'n del lote del prestador'
        ImageIndex = 25
        OnClick = tbCofirmarRecepcionLotePresClick
      end
      object tbUnSelectAll: TToolButton
        Left = 702
        Top = 0
        Hint = 'Limpiar Selecci'#243'n'
        Caption = 'tbUnSelectAll'
        ImageIndex = 37
        OnClick = tbUnSelectAllClick
      end
      object tbSelectAll: TToolButton
        Left = 731
        Top = 0
        Hint = 'Seleccionar Todo'
        Caption = 'tbSelectAll'
        ImageIndex = 38
        OnClick = tbSelectAllClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 210
    Width = 788
    Height = 72
    Hint = 
      'Puede hacer doble click para'#13#10'abrir la Agenda de Observaciones'#13#10 +
      'del Lote'
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnDblClick = tbAgendaObsLoteClick
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'le_id'
        Title.Caption = 'Lote'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estadolote'
        Title.Caption = 'Estado'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_identificador'
        Title.Caption = 'ID Prestador'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_descripcion'
        Title.Caption = 'Prestador'
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'le_fechanotificacion'
        Title.Alignment = taCenter
        Title.Caption = 'F.Notif.Prestador'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fechalimite'
        Title.Caption = 'F.L'#237'mite Pres.'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'desctiponotifasig'
        Title.Caption = 'Tipo Nofif.Asig.Empresa'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'le_fechanotifasig'
        Title.Caption = 'F.Notif.Asig.Empresa'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'le_fechanotifiempresa'
        Title.Alignment = taCenter
        Title.Caption = 'F.Notif.Pactada Empresa'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'desctiponotif'
        Title.Caption = 'Tipo Nofif.Pactada Empresa'
        Width = 140
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dl_fechapactada'
        Title.Alignment = taCenter
        Title.Caption = 'F.Pactada'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'le_fechaconfreceplote'
        Title.Caption = 'F.Conf.Recep.Lote'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'le_fechaingresoweb'
        Title.Caption = 'F.Primer Ing. Web'
        Width = 95
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'monto'
        Title.Alignment = taCenter
        Title.Caption = 'Monto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observaciones'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'le_fechaalta'
        Title.Caption = 'F.Alta Lote'
        Visible = True
      end>
  end
  object gbEstablecimientos: TJvgGroupBox [6]
    Left = 0
    Top = 291
    Width = 788
    Height = 238
    Hint = 'Mostrar/Ocultar Establecimientos'
    Align = alBottom
    Caption = 'Establecimientos del Lote (Sublotes)'
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
    FullHeight = 238
    object JvNetscapeSplitter1: TJvNetscapeSplitter
      Left = 2
      Top = 96
      Width = 784
      Height = 9
      Cursor = crVSplit
      Align = alBottom
      Maximized = False
      Minimized = False
      ButtonCursor = crDefault
    end
    object dbgEstabLote: TArtDBGrid
      Left = 2
      Top = 43
      Width = 784
      Height = 53
      Align = alClient
      DataSource = dsEmpresaEstab
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = tbCambioEstadoClick
      OnKeyDown = GridKeyDown
      IniStorage = FormStorage
      OnGetCellParams = dbgEstabLoteGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'em_cuit'
          Title.Alignment = taCenter
          Title.Caption = 'CUIT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'em_nombre'
          Title.Caption = 'Empresa'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'es_nroestableci'
          Title.Caption = 'Estab.'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'es_nombre'
          Title.Caption = 'Establecimiento'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'contrato'
          Title.Caption = 'Contrato'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'estado'
          Title.Alignment = taCenter
          Title.Caption = 'Estado'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'rl_fecha'
          Title.Alignment = taCenter
          Title.Caption = 'F.Relevamiento'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dl_fechapactada'
          Title.Caption = 'F.Pactada'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'el_fechaaprobado'
          Title.Caption = 'F.Aprobado'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'el_fecharechazo'
          Title.Caption = 'F.Rechazado'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'el_fechaanulado'
          Title.Caption = 'F.Anulado'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'el_fecharecibido'
          Title.Caption = 'F.Recibido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'el_fechaterminado'
          Title.Caption = 'F.Terminado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mr_descripcion'
          Title.Caption = 'Motivo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'el_operativo'
          Title.Caption = 'Operativo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cantcd'
          Title.Caption = 'Cant. de CD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fecha_cartadoc'
          Title.Caption = 'F.'#218'lt.Carta Doc.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'el_fcda'
          Title.Caption = 'F.Carta Doc.Aus.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fecharecepucap'
          Title.Caption = 'Fecha de Recepci'#243'n(UCAP)'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'idproceso'
          Title.Caption = 'Nro Proceso'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'citacionesp'
          Title.Caption = 'Citaci'#243'n Esp.'
          Width = 70
          Visible = True
        end>
    end
    object gbTrabajadores: TJvgGroupBox
      Left = 2
      Top = 105
      Width = 784
      Height = 131
      Hint = 'Mostrar/Ocultar Trabajadores'#13#10'de la Empresa/Establecimiento'
      Align = alBottom
      Caption = 'Trabajadores en el Lote'
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
      TabOrder = 1
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
      FullHeight = 131
      object dbgTrabajadores: TArtDBGrid
        Left = 2
        Top = 43
        Width = 780
        Height = 86
        Align = alClient
        DataSource = dsTrabajadores
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = tbReactTrabClick
        OnKeyDown = GridKeyDown
        IniStorage = FormStorage
        OnGetCellParams = dbgTrabajadoresGetCellParams
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'rs_cuil'
            Title.Caption = 'CUIL'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rs_nombretrabajador'
            Title.Caption = 'Apellido y Nombre Trabajador'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'mb_descripcion'
            Title.Caption = 'Motivo de baja'
            Width = 326
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fagregado'
            Title.Caption = 'F.Agregado'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'estudios'
            Title.Caption = 'Estudios'
            Width = 10000
            Visible = True
          end>
      end
      object tbTrabajadores: TToolBar
        Left = 2
        Top = 16
        Width = 780
        Height = 27
        BorderWidth = 1
        Caption = 'ToolBar'
        HotImages = frmPrincipal.imgGenColor
        Images = frmPrincipal.imgGenBW
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object ToolButton10: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refrescar'
          Caption = 'ToolButton10'
          ImageIndex = 6
          OnClick = ToolButton10Click
        end
        object tbNuevoTrab: TToolButton
          Left = 23
          Top = 0
          Hint = 'Nuevo'
          ImageIndex = 0
          OnClick = tbNuevoTrabClick
        end
        object tbReactTrab: TToolButton
          Left = 46
          Top = 0
          Hint = 'Reactivar'
          ImageIndex = 1
          OnClick = tbReactTrabClick
        end
        object tbBajaTrab: TToolButton
          Left = 69
          Top = 0
          Hint = 'Baja'
          ImageIndex = 2
          OnClick = tbBajaTrabClick
        end
        object tbOrdenarTrabLote: TToolButton
          Left = 92
          Top = 0
          Hint = 'Ordenar trabajadores'
          Caption = 'tbOrdenarTrabLote'
          ImageIndex = 7
          OnClick = tbOrdenarTrabLoteClick
        end
        object ToolButton2: TToolButton
          Left = 115
          Top = 0
          Hint = 'Cantidad de trabajadores del lote'
          Caption = 'ToolButton2'
          ImageIndex = 34
          OnClick = ToolButton2Click
        end
        object ToolButton9: TToolButton
          Left = 138
          Top = 0
          Width = 8
          Caption = 'ToolButton9'
          ImageIndex = 35
          Style = tbsSeparator
        end
        object Label21: TLabel
          Left = 146
          Top = 0
          Width = 91
          Height = 22
          Align = alRight
          Alignment = taCenter
          AutoSize = False
          Caption = 'Trabajadores agregados'
          Color = clAqua
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          WordWrap = True
        end
        object ToolButton15: TToolButton
          Left = 237
          Top = 0
          Width = 8
          Caption = 'ToolButton15'
          ImageIndex = 36
          Style = tbsSeparator
        end
      end
    end
    object ToolBar2: TToolBar
      Left = 2
      Top = 16
      Width = 784
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object tbRefrescarEstab: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar'
        Caption = 'tbRefrescarEstab'
        ImageIndex = 6
        OnClick = tbRefrescarEstabClick
      end
      object tbCambioEstado: TToolButton
        Left = 23
        Top = 0
        Hint = 'Cambiar estado'
        Caption = 'tbCambioEstado'
        ImageIndex = 29
        OnClick = tbCambioEstadoClick
      end
      object tbHistorico: TToolButton
        Left = 46
        Top = 0
        Hint = 'Ver Hist'#243'rico del lote'
        Caption = 'tbHistorico'
        ImageIndex = 30
        OnClick = tbHistoricoClick
      end
      object ToolButton7: TToolButton
        Left = 69
        Top = 0
        Hint = 'Cantidad de Establecimientos del Lote'
        Caption = 'ToolButton7'
        ImageIndex = 34
        OnClick = ToolButton7Click
      end
      object tbAgendaObsSubLote: TToolButton
        Left = 92
        Top = 0
        Hint = 'Agenda de Observaciones'#13#10'del SubLote'
        Caption = 'tbAgendaObsSubLote'
        ImageIndex = 24
        OnClick = tbAgendaObsSubLoteClick
      end
      object tbAgendaObsAsigLote: TToolButton
        Left = 115
        Top = 0
        Hint = 
          'Agenda de Observaciones'#13#10'de Asignaciones para el '#13#10'CUIT/Establec' +
          'imiento'
        Caption = 'tbAgendaObsAsigLote'
        ImageIndex = 32
        OnClick = tbAgendaObsAsigLoteClick
      end
      object tbCartasDoc: TToolButton
        Left = 138
        Top = 0
        Hint = 'Cartas Documento'
        Caption = 'tbCartaDoc'
        DropdownMenu = mnuCartaDoc
        ImageIndex = 36
        PopupMenu = mnuCartaDoc
        Style = tbsDropDown
      end
    end
  end
  object fpHistoricoLote: TFormPanel [7]
    Left = 134
    Top = 516
    Width = 456
    Height = 200
    Caption = 'Datos hist'#243'ricos del Lote del Establecimiento'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    Position = poScreenCenter
    OnShow = fpHistoricoLoteShow
    Constraints.MinHeight = 200
    Constraints.MinWidth = 456
    object ArtDBGrid1: TArtDBGrid
      Left = 0
      Top = 0
      Width = 456
      Height = 171
      Align = alClient
      DataSource = dsHistLote
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = GridDblClick
      OnKeyDown = GridKeyDown
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'Estado'
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Fecha'
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Usuario'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Motivo'
          Width = 300
          Visible = True
        end>
    end
    object pnSeleccionHistorico: TPanel
      Left = 0
      Top = 171
      Width = 456
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      DesignSize = (
        456
        29)
      object btnAceptarHistorico: TButton
        Left = 295
        Top = 3
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
        OnClick = btnAceptarHistoricoClick
      end
      object btnCancelarHistorico: TButton
        Left = 376
        Top = 3
        Width = 74
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 1
      end
      object pnlBottom: TPanel
        Left = 2
        Top = 4
        Width = 287
        Height = 24
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvLowered
        TabOrder = 2
      end
    end
  end
  object fpTrabajador: TFormPanel [8]
    Left = 799
    Top = 228
    Width = 1166
    Height = 300
    Caption = 'Agregar Trabajadores'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu, biMaximize]
    Position = poScreenCenter
    OnClose = fpTrabajadorClose
    OnShow = fpTrabajadorShow
    Constraints.MinHeight = 300
    Constraints.MinWidth = 480
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 1166
      Height = 26
      BorderWidth = 1
      ButtonHeight = 25
      Caption = 'ToolBar'
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbAgregarTrab: TToolButton
        Left = 0
        Top = 0
        Hint = 'Agregar Trabajador(es)'
        Caption = 'tbAgregarTrab'
        ImageIndex = 13
        OnClick = tbAgregarTrabClick
      end
      object tbManTrab: TToolButton
        Left = 23
        Top = 0
        Hint = 'Mant.Trabajadores'
        ImageIndex = 26
        OnClick = tbManTrabClick
      end
      object tbOrdenarTrabAct: TToolButton
        Left = 46
        Top = 0
        Hint = 'Ordenar trabajadores Activos'
        Caption = 'tbOrdenarTrabAct'
        ImageIndex = 2
        OnClick = tbOrdenarTrabActClick
      end
      object ToolButton1: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalirAgregarTrab: TToolButton
        Left = 77
        Top = 0
        Hint = 'Salir'
        Caption = 'tbSalirAgregarTrab'
        ImageIndex = 5
        OnClick = tbSalirAgregarTrabClick
      end
      object ToolButton12: TToolButton
        Left = 100
        Top = 0
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object Label23: TLabel
        Left = 108
        Top = 0
        Width = 91
        Height = 25
        Align = alRight
        Alignment = taCenter
        AutoSize = False
        Caption = 'Trabajadores en el relevamiento'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Visible = False
        WordWrap = True
      end
      object ToolButton13: TToolButton
        Left = 199
        Top = 0
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 7
        Style = tbsSeparator
        Visible = False
      end
      object Label22: TLabel
        Left = 207
        Top = 0
        Width = 91
        Height = 25
        Align = alRight
        Alignment = taCenter
        AutoSize = False
        Caption = 'Trabajadores fuera del relevamiento'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Visible = False
        WordWrap = True
      end
      object ToolButton14: TToolButton
        Left = 298
        Top = 0
        Width = 8
        Caption = 'ToolButton14'
        ImageIndex = 8
        Style = tbsSeparator
        Visible = False
      end
    end
    object Panel1: TPanel
      Left = 567
      Top = 26
      Width = 599
      Height = 274
      Align = alClient
      Caption = 'Panel1'
      TabOrder = 1
      object tsSelEstudios: TFSPageControl
        Left = 1
        Top = 1
        Width = 597
        Height = 272
        ActivePage = tsSelTrabajador
        Align = alClient
        Constraints.MinWidth = 300
        Style = tsFlatButtons
        TabOrder = 0
        object tsSelRiesgos: TTabSheet
          Caption = 'Riesgos asociados'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object grdRiesgos: TRxDBGrid
            Left = 0
            Top = 0
            Width = 589
            Height = 241
            Hint = 'Riesgos'
            Align = alClient
            BorderStyle = bsNone
            Constraints.MinWidth = 300
            DataSource = dsRiesgos
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            MultiSelect = True
            RowColor2 = 16776176
            Columns = <
              item
                Expanded = False
                FieldName = 'rg_codigo'
                Title.Caption = 'Riesgo'
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'esop'
                Title.Caption = 'ESOP'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'rg_descripcion'
                Title.Caption = 'Descripci'#243'n'
                Width = 250
                Visible = True
              end>
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Estudios a realizar'
          ImageIndex = 1
          object lblNoHayEstudios: TLabel
            Left = 0
            Top = 0
            Width = 589
            Height = 241
            Align = alClient
            Alignment = taCenter
            Caption = 
              'No hay estudios relacionados'#13#10'a los riegos posibles asociados '#13#10 +
              'a la actividad de la empresa'
            ExplicitWidth = 148
            ExplicitHeight = 39
          end
          object clbListaEstudios: TARTCheckListBox
            Left = 0
            Top = 0
            Width = 589
            Height = 241
            Align = alClient
            Columns = 1
            ItemHeight = 13
            TabOrder = 0
            AutoAjustarColumnas = True
            Locked = False
          end
        end
        object tsSelTrabajador: TTabSheet
          Caption = 'Trabajador a Duplicar'
          ImageIndex = 2
          object Label7: TLabel
            Left = 87
            Top = 6
            Width = 37
            Height = 13
            Caption = 'Nombre'
          end
          object Label9: TLabel
            Left = 6
            Top = 6
            Width = 24
            Height = 13
            Caption = 'CUIL'
          end
          inline fraTrabADuplicar: TfraCodDesc
            Left = 3
            Top = 21
            Width = 331
            Height = 23
            TabOrder = 0
            ExplicitLeft = 3
            ExplicitTop = 21
            ExplicitWidth = 331
            DesignSize = (
              331
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 81
              Width = 249
              CharCase = ecUpperCase
              DataSource = nil
              ExplicitLeft = 81
              ExplicitWidth = 249
            end
            inherited edCodigo: TPatternEdit
              Width = 75
              ExplicitWidth = 75
            end
            inherited Propiedades: TPropiedadesFrame
              CodigoType = ctInteger
              FieldCodigo = 'TJ_CUIL'
              FieldDesc = 'TJ_NOMBRE'
              FieldID = 'TJ_ID'
              ShowBajas = True
            end
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 26
      Width = 567
      Height = 274
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object grdTrabActivos: TArtDBGrid
        Left = 0
        Top = 0
        Width = 567
        Height = 274
        Hint = 'Trabajadores Activos'
        Align = alClient
        Constraints.MinWidth = 350
        DataSource = dsTrabActivos
        Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        IniStorage = FormStorage
        MultiSelect = True
        OnGetCellParams = grdTrabActivosGetCellParams
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'tj_cuil'
            Title.Alignment = taCenter
            Title.Caption = 'CUIL'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tj_nombre'
            Title.Caption = 'Nombre'
            Width = 228
            Visible = True
          end>
      end
    end
  end
  object sbLotesACerrar: TStatusBar [9]
    Left = 0
    Top = 191
    Width = 788
    Height = 19
    Hint = 'Hacer click para ver los lotes'
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Panels = <
      item
        Alignment = taCenter
        Text = 
          '>>>  Existen Lotes que han cumplido con los plazos estimados y p' +
          'actados para su realizacion <<<'
        Width = 50
      end>
    ParentShowHint = False
    ShowHint = True
    SizeGrip = False
    UseSystemFont = False
    OnClick = sbLotesACerrarClick
  end
  object fpMotivoBaja: TFormPanel [10]
    Left = 594
    Top = 325
    Width = 463
    Height = 85
    Caption = 'Baja del Trabajador en el Lote'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    Position = poScreenCenter
    OnShow = fpMotivoBajaShow
    Constraints.MaxHeight = 85
    Constraints.MinHeight = 85
    Constraints.MinWidth = 350
    DesignSize = (
      463
      85)
    object Bevel1: TBevel
      Left = 5
      Top = 46
      Width = 453
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label11: TLabel
      Left = 9
      Top = 18
      Width = 74
      Height = 13
      Caption = 'Motivo de Baja:'
    end
    object SpeedButton2: TSpeedButton
      Left = 433
      Top = 12
      Width = 23
      Height = 22
      Hint = 'Mantenimiento de '#13#10'Motivos de Rechazo'
      Anchors = [akTop, akRight]
      Glyph.Data = {
        56010000424D56010000000000007600000028000000200000000E0000000100
        040000000000E000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000000
        0DDDD000000000000DDDD877777777770DDDD877777777770DDDD8F7F7F7F700
        0000D8F7F7F7F7000000D8FCCC000008880CD8F8880000088808D8F7F7007778
        870CD8F7F70088888808D8FCCC0B00777708D8F8880800778808D8F7F707B077
        0000D8F7F70780770000D8FCCCC07B000DDDD8F8888078000DDDD8FFF7F700B0
        0DDDD8FFF7F700800DDDD8FCCCCC7FFB0DDDD8F888887FF80DDDD8FFFFF7F800
        B0DDD8FFFFF7F80080DDD8FFFFFFF8F0DBDDD8FFFFFFF8F0D8DDD8FFFFFFF80D
        DDDDD8FFFFFFF80DDDDDD888888888DDDDDDD888888888DDDDDD}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object btnAceptarBaja: TButton
      Left = 303
      Top = 53
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarBajaClick
    end
    object btnCancelarBaja: TButton
      Left = 382
      Top = 53
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraMotivosBaja: TfraCodigoDescripcion
      Left = 87
      Top = 12
      Width = 343
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 87
      ExplicitTop = 12
      ExplicitWidth = 343
      DesignSize = (
        343
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 278
        DataSource = nil
        ExplicitWidth = 278
      end
    end
  end
  object fpDatosLote: TFormPanel [11]
    Left = 194
    Top = 281
    Width = 456
    Height = 200
    Caption = 'Datos del Lote'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    Position = poScreenCenter
    OnShow = fpDatosLoteShow
    Constraints.MinHeight = 200
    Constraints.MinWidth = 456
    DesignSize = (
      456
      200)
    object Bevel7: TBevel
      Left = 5
      Top = 161
      Width = 446
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 9
      Top = 9
      Width = 36
      Height = 13
      Caption = 'Estado:'
    end
    object Observaciones: TLabel
      Left = 9
      Top = 96
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object btnAceptar: TButton
      Left = 296
      Top = 168
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 375
      Top = 168
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object cbEstado: TExComboBox
      Left = 48
      Top = 6
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 2
      OnChange = cbEstadoChange
      Items.Strings = (
        'A=Aprobado'
        'B=Recibido'
        'G=Reasignado'
        'I=Realizado Parcialmente'
        'L=Liquidado'
        'N = Anulado'
        'R=Rechazado'
        'S=Realizado sin Entregar'
        'T=Terminado')
      ItemIndex = -1
      Options = [coGridLines]
      ValueWidth = 64
    end
    object pcDatosEstado: TFSPageControl
      Left = 3
      Top = 33
      Width = 457
      Height = 61
      ActivePage = tsReprogramacion
      Anchors = [akLeft, akTop, akRight]
      Style = tsFlatButtons
      TabOrder = 3
      object tsRechazo: TTabSheet
        Caption = 'tsRechazo'
        ImageIndex = 1
        TabVisible = False
        DesignSize = (
          449
          51)
        object Label3: TLabel
          Left = 6
          Top = 6
          Width = 79
          Height = 13
          Caption = 'Fecha Rechazo:'
        end
        object Label5: TLabel
          Left = 6
          Top = 33
          Width = 81
          Height = 13
          Caption = 'Motivo Rechazo:'
        end
        object spbMantRechazo: TSpeedButton
          Left = 422
          Top = 29
          Width = 23
          Height = 22
          Hint = 'Mantenimiento de '#13#10'Motivos de Rechazo'
          Anchors = [akTop, akRight]
          Glyph.Data = {
            56010000424D56010000000000007600000028000000200000000E0000000100
            040000000000E000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000000
            0DDDD000000000000DDDD877777777770DDDD877777777770DDDD8F7F7F7F700
            0000D8F7F7F7F7000000D8FCCC000008880CD8F8880000088808D8F7F7007778
            870CD8F7F70088888808D8FCCC0B00777708D8F8880800778808D8F7F707B077
            0000D8F7F70780770000D8FCCCC07B000DDDD8F8888078000DDDD8FFF7F700B0
            0DDDD8FFF7F700800DDDD8FCCCCC7FFB0DDDD8F888887FF80DDDD8FFFFF7F800
            B0DDD8FFFFF7F80080DDD8FFFFFFF8F0DBDDD8FFFFFFF8F0D8DDD8FFFFFFF80D
            DDDDD8FFFFFFF80DDDDDD888888888DDDDDDD888888888DDDDDD}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = spbMantRechazoClick
        end
        object edFechaRechazo: TDateComboBox
          Left = 92
          Top = 1
          Width = 88
          Height = 21
          TabOrder = 0
        end
        inline fraMotivosRechazo: TfraCodigoDescripcion
          Left = 91
          Top = 28
          Width = 327
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 91
          ExplicitTop = 28
          ExplicitWidth = 327
          DesignSize = (
            327
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 262
            DataSource = nil
            ExplicitWidth = 262
          end
        end
      end
      object tsAprobacion: TTabSheet
        Caption = 'tsAprobacion'
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label4: TLabel
          Left = 6
          Top = 6
          Width = 90
          Height = 13
          Caption = 'Fecha Aprobaci'#243'n:'
        end
        object Label8: TLabel
          Left = 6
          Top = 33
          Width = 76
          Height = 13
          Caption = 'Fecha Pactada:'
        end
        object edFechaAprobado: TDateComboBox
          Left = 98
          Top = 1
          Width = 88
          Height = 21
          TabOrder = 0
        end
        object edFechaPactada: TDateComboBox
          Left = 98
          Top = 28
          Width = 88
          Height = 21
          TabOrder = 1
        end
      end
      object tsAnulado: TTabSheet
        ImageIndex = 2
        TabVisible = False
        DesignSize = (
          449
          51)
        object Label13: TLabel
          Left = 6
          Top = 6
          Width = 75
          Height = 13
          Caption = 'Fecha Anulado:'
        end
        object Label14: TLabel
          Left = 6
          Top = 33
          Width = 85
          Height = 13
          Caption = 'Motivo Anulaci'#243'n:'
        end
        object spbMantAnulacion: TSpeedButton
          Left = 422
          Top = 29
          Width = 23
          Height = 22
          Hint = 'Mantenimiento de '#13#10'Motivos de Anulaci'#243'n'
          Anchors = [akTop, akRight]
          Glyph.Data = {
            56010000424D56010000000000007600000028000000200000000E0000000100
            040000000000E000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000000
            0DDDD000000000000DDDD877777777770DDDD877777777770DDDD8F7F7F7F700
            0000D8F7F7F7F7000000D8FCCC000008880CD8F8880000088808D8F7F7007778
            870CD8F7F70088888808D8FCCC0B00777708D8F8880800778808D8F7F707B077
            0000D8F7F70780770000D8FCCCC07B000DDDD8F8888078000DDDD8FFF7F700B0
            0DDDD8FFF7F700800DDDD8FCCCCC7FFB0DDDD8F888887FF80DDDD8FFFFF7F800
            B0DDD8FFFFF7F80080DDD8FFFFFFF8F0DBDDD8FFFFFFF8F0D8DDD8FFFFFFF80D
            DDDDD8FFFFFFF80DDDDDD888888888DDDDDDD888888888DDDDDD}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = spbMantAnulacionClick
        end
        object edFechaAnulado: TDateComboBox
          Left = 98
          Top = 1
          Width = 88
          Height = 21
          TabOrder = 0
        end
        inline fraMotivosAnulacion: TfraCodigoDescripcion
          Left = 96
          Top = 28
          Width = 322
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 96
          ExplicitTop = 28
          ExplicitWidth = 322
          DesignSize = (
            322
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 257
            DataSource = nil
            ExplicitWidth = 257
          end
        end
      end
      object tsRecibido: TTabSheet
        Caption = 'tsRecibido'
        ImageIndex = 3
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label15: TLabel
          Left = 6
          Top = 8
          Width = 78
          Height = 13
          Caption = 'Fecha Recibido:'
        end
        object edFechaRecibido: TDateComboBox
          Left = 92
          Top = 6
          Width = 88
          Height = 21
          TabOrder = 0
        end
      end
      object tsTerminado: TTabSheet
        Caption = 'tsTerminado'
        ImageIndex = 4
        TabVisible = False
        DesignSize = (
          449
          51)
        object Label16: TLabel
          Left = 6
          Top = 6
          Width = 94
          Height = 13
          Caption = 'Fecha Terminaci'#243'n:'
        end
        object Label17: TLabel
          Left = 6
          Top = 33
          Width = 96
          Height = 13
          Caption = 'Motivo Terminaci'#243'n:'
        end
        object SpeedButton1: TSpeedButton
          Left = 422
          Top = 29
          Width = 23
          Height = 22
          Hint = 'Mantenimiento de '#13#10'Motivos de Terminaci'#243'n'
          Anchors = [akTop, akRight]
          Glyph.Data = {
            56010000424D56010000000000007600000028000000200000000E0000000100
            040000000000E000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000000
            0DDDD000000000000DDDD877777777770DDDD877777777770DDDD8F7F7F7F700
            0000D8F7F7F7F7000000D8FCCC000008880CD8F8880000088808D8F7F7007778
            870CD8F7F70088888808D8FCCC0B00777708D8F8880800778808D8F7F707B077
            0000D8F7F70780770000D8FCCCC07B000DDDD8F8888078000DDDD8FFF7F700B0
            0DDDD8FFF7F700800DDDD8FCCCCC7FFB0DDDD8F888887FF80DDDD8FFFFF7F800
            B0DDD8FFFFF7F80080DDD8FFFFFFF8F0DBDDD8FFFFFFF8F0D8DDD8FFFFFFF80D
            DDDDD8FFFFFFF80DDDDDD888888888DDDDDDD888888888DDDDDD}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
        object edFechaTerminado: TDateComboBox
          Left = 104
          Top = 1
          Width = 88
          Height = 21
          TabOrder = 0
        end
        inline fraMotivosTerminacion: TfraCodigoDescripcion
          Left = 105
          Top = 28
          Width = 313
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 105
          ExplicitTop = 28
          ExplicitWidth = 313
          DesignSize = (
            313
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 248
            DataSource = nil
            ExplicitWidth = 248
          end
        end
      end
      object tsReprogramacion: TTabSheet
        Caption = 'tsReprogramacion'
        ImageIndex = 5
        TabVisible = False
        object Label18: TLabel
          Left = 3
          Top = 4
          Width = 111
          Height = 13
          Caption = 'Nueva Fecha Pactada:'
        end
        object lblModoNotificacion: TLabel
          Left = 209
          Top = 4
          Width = 70
          Height = 13
          Caption = 'Modo de Notif:'
        end
        object lblModoSeleccionado: TLabel
          Tag = -1
          Left = 282
          Top = 4
          Width = 77
          Height = 13
          Caption = '<Sin Selecci'#243'n>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btnModoNotificacion: TSpeedButton
          Left = 236
          Top = 24
          Width = 23
          Height = 18
          Hint = 'Seleccionar modo de notificaci'#243'n'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000E0E0E0E0E0E0
            E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
            E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0A0A0A0E0
            E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
            E0E0E0E0E0E0A0A0A020606000A0A0006060608080E0E0E0E0E0E0E0E0E0E0E0
            E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0A0A0A020606000C0C000FFFF00C0C000
            8080008080006060608080E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0A0A0A0206060
            00C0C000FFFF00FFFF80FFFF80C0C00080800080800080800080800060606080
            80E0E0E0E0E0E0E0E0E000404000FFFF00FFFF80FFFFFFFFFF80FFFF00FFFF00
            A0A0008080008080008080006060004040006060004040C0C0C000404080FFFF
            FFFFFF80FFFF00FFFF00A0A000FFFF00FFFF00A0A000808000808000404000E0
            E000808000404000404080A0A080E0E000FFFF00A0A080A0A080E0E000808000
            FFFF00FFFF00A0A000808000202000E0E000C0C0008080002020E0E0E080A0A0
            00E0E080FFFF00808080A0A080E0E000808000FFFF00FFFF00A0A000404000FF
            FF00C0C0008080004040E0E0E0E0E0E080A0A000E0E080FFFF00808080A0A080
            E0E000E0E000FFFF00C0C000404000FFFF80FFFF80FFFF608080E0E0E0E0E0E0
            C0C0C020404000E0E080FFFF00E0E000FFFF00808000808000808000404040FF
            FF40FFFF20E0E0E0E0E0E0E0E0E0E0E000808000606000404000808000C0C000
            404000A0A040808000606080E0E040FFFF20E0E0E0E0E0E0E0E0E0E0E0E0E0E0
            00404000FFFF00A0A000404040E0E000606000FFFF80FFFF80FFFF00C0C060A0
            A0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0C0C0C000C0C000FFFF80C0C080808080
            FFFF80FFFF00808060A0A0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
            E0E0E0C0C0C0A0A0A000808000808060A0A0A0A0A0E0E0E0E0E0E0E0E0E0E0E0
            E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
            E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnModoNotificacionClick
        end
        object edFechaReprogramado: TDateComboBox
          Left = 119
          Top = 1
          Width = 88
          Height = 21
          TabOrder = 0
        end
      end
      object tsRealizadoSinEntregar: TTabSheet
        Caption = 'tsRealizadoSinEntregar'
        ImageIndex = 6
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label19: TLabel
          Left = 6
          Top = 8
          Width = 92
          Height = 13
          Caption = 'Fecha Notificaci'#243'n:'
        end
        object edFechaNotificacion: TDateComboBox
          Left = 101
          Top = 6
          Width = 88
          Height = 21
          TabOrder = 0
        end
      end
    end
    object edObservaciones: TMemo
      Left = 9
      Top = 110
      Width = 437
      Height = 46
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 1000
      TabOrder = 4
    end
  end
  object fpNotificacionEmpresa: TFormPanel [12]
    Left = 652
    Top = 416
    Width = 257
    Height = 136
    Caption = 'Modo de Notificaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poMainFormCenter
    OnShow = fpNotificacionEmpresaShow
    DesignSize = (
      257
      136)
    object Button1: TButton
      Left = 96
      Top = 105
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 176
      Top = 105
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object rgTipoEnvio: TRadioGroup
      Left = 5
      Top = 1
      Width = 247
      Height = 98
      Items.Strings = (
        'Email'
        'Fax'
        'Carta'
        'Ventanilla'
        'Ninguno')
      TabOrder = 2
      OnClick = rgTipoEnvioClick
    end
  end
  object fpNuevaFPactada: TFormPanel [13]
    Left = 852
    Top = 376
    Width = 269
    Height = 121
    Caption = 'Carta Documento'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poMainFormCenter
    OnShow = fpNuevaFPactadaShow
    DesignSize = (
      269
      121)
    object Label24: TLabel
      Left = 6
      Top = 12
      Width = 111
      Height = 13
      Caption = 'Nueva Fecha Pactada:'
    end
    object Bevel2: TBevel
      Left = 5
      Top = 80
      Width = 261
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lblModoNotificacionFechaNueva: TLabel
      Left = 6
      Top = 37
      Width = 70
      Height = 13
      Caption = 'Modo de Notif:'
    end
    object lblModoSeleccionadoNuevaFecha: TLabel
      Tag = -1
      Left = 77
      Top = 37
      Width = 93
      Height = 13
      Caption = '<Sin Selecci'#243'n>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnModoNotifNuevaFecha: TSpeedButton
      Left = 79
      Top = 53
      Width = 23
      Height = 22
      Hint = 'Seleccionar modo de notificaci'#243'n'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000E0E0E0E0E0E0
        E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
        E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0A0A0A0E0
        E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
        E0E0E0E0E0E0A0A0A020606000A0A0006060608080E0E0E0E0E0E0E0E0E0E0E0
        E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0A0A0A020606000C0C000FFFF00C0C000
        8080008080006060608080E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0A0A0A0206060
        00C0C000FFFF00FFFF80FFFF80C0C00080800080800080800080800060606080
        80E0E0E0E0E0E0E0E0E000404000FFFF00FFFF80FFFFFFFFFF80FFFF00FFFF00
        A0A0008080008080008080006060004040006060004040C0C0C000404080FFFF
        FFFFFF80FFFF00FFFF00A0A000FFFF00FFFF00A0A000808000808000404000E0
        E000808000404000404080A0A080E0E000FFFF00A0A080A0A080E0E000808000
        FFFF00FFFF00A0A000808000202000E0E000C0C0008080002020E0E0E080A0A0
        00E0E080FFFF00808080A0A080E0E000808000FFFF00FFFF00A0A000404000FF
        FF00C0C0008080004040E0E0E0E0E0E080A0A000E0E080FFFF00808080A0A080
        E0E000E0E000FFFF00C0C000404000FFFF80FFFF80FFFF608080E0E0E0E0E0E0
        C0C0C020404000E0E080FFFF00E0E000FFFF00808000808000808000404040FF
        FF40FFFF20E0E0E0E0E0E0E0E0E0E0E000808000606000404000808000C0C000
        404000A0A040808000606080E0E040FFFF20E0E0E0E0E0E0E0E0E0E0E0E0E0E0
        00404000FFFF00A0A000404040E0E000606000FFFF80FFFF80FFFF00C0C060A0
        A0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0C0C0C000C0C000FFFF80C0C080808080
        FFFF80FFFF00808060A0A0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
        E0E0E0C0C0C0A0A0A000808000808060A0A0A0A0A0E0E0E0E0E0E0E0E0E0E0E0
        E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
        E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnModoNotifNuevaFechaClick
    end
    object edNuevaFPactada: TDateComboBox
      Left = 119
      Top = 7
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object btnAceptarNuevaFPactada: TButton
      Left = 108
      Top = 90
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarNuevaFPactadaClick
    end
    object btnCancelarNuevaFPactada: TButton
      Left = 188
      Top = 90
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object fpObservacion: TFormPanel [14]
    Left = 693
    Top = 583
    Width = 400
    Height = 150
    Caption = 'Confirmar la recepci'#243'n del lote del prestador'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    Constraints.MinHeight = 150
    Constraints.MinWidth = 400
    DesignSize = (
      400
      150)
    object BevelAbm: TBevel
      Left = 4
      Top = 114
      Width = 392
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Button3: TButton
      Left = 242
      Top = 120
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 0
    end
    object Button4: TButton
      Left = 320
      Top = 120
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object edObservacion: TRichEdit
      Left = 6
      Top = 8
      Width = 388
      Height = 102
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    Left = 46
    Top = 522
  end
  inherited dsConsulta: TDataSource
    Left = 74
    Top = 550
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Fecha Relev.'
        DataField = 'RS_FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Fecha carga'
        DataField = 'RS_FECHAALTA'
        FieldIndex = 1
      end
      item
        Title = 'CUIT'
        DataField = 'RS_CUIT'
        FieldIndex = 2
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'RS_NOMBRE_EMPRESA'
        FieldIndex = 3
      end
      item
        Title = 'Contrato'
        DataField = 'RS_CONTRATO'
        FieldIndex = 4
      end
      item
        Title = 'Estab.'
        DataField = 'RS_ESTABLECI'
        FieldIndex = 5
      end
      item
        Title = 'Nombre Estab.'
        DataField = 'es_nombre'
        FieldIndex = 6
      end
      item
        Title = 'CIIU'
        DataField = 'ciiu'
        FieldIndex = 7
      end
      item
        Title = 'Domicilio'
        DataField = 'domicilio'
        FieldIndex = 8
      end
      item
        Title = 'Provincia'
        DataField = 'pv_descripcion'
        FieldIndex = 9
      end
      item
        Title = 'capitas'
        DataField = 'capitas'
        FieldIndex = 10
      end>
    Left = 102
    Top = 494
  end
  inherited ExportDialog: TExportDialog
    DataSet = sdqListado
    Left = 46
    Top = 494
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    Left = 46
    Top = 466
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 18
    Top = 466
  end
  inherited FormStorage: TFormStorage
    Left = 18
    Top = 522
  end
  inherited PrintDialog: TPrintDialog
    Left = 18
    Top = 494
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
        LinkControl = tbSalir
      end
      item
        Key = 16458
      end
      item
        Key = 16455
      end
      item
        Key = 119
      end>
    Left = 18
    Top = 550
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 18
    Top = 578
  end
  object sdqTrabajadores: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    OnCalcFields = sdqTrabajadoresCalcFields
    DataSource = dsConsulta
    SQL.Strings = (
      'SELECT DISTINCT le_id, dl_idtrabajador, tj_cuil rs_cuil,'
      
        '                tj_nombre rs_nombretrabajador, mb_descripcion, d' +
        'l_fechabaja,'
      '                rt_fecha,'
      '                DECODE(dl_fuerarelevamiento,'
      '                       '#39'S'#39', TO_DATE(dl_fechaalta, '#39'DD/MM/YYYY'#39'),'
      '                       NULL) fagregado'
      '           FROM hys.hle_loteestudio, hys.hdl_detallelote,'
      
        '                comunes.ctj_trabajador, hys.hmb_motivobaja, art.' +
        'prt_riestrab'
      '          WHERE dl_idlote = le_id'
      '            AND tj_id = dl_idtrabajador'
      '            AND mb_id(+) = dl_motivobaja'
      '            AND le_id = :le_id'
      '            AND dl_idempresa = :em_id'
      '            AND dl_idestableci = :es_id'
      '            AND rt_cuit(+) = :em_cuit'
      '            AND rt_estableci(+) = :es_nroestableci'
      '            AND rt_cuil(+) = tj_cuil'
      
        '            AND rt_fecha(+) = art.amp.get_maxfechaexposicion(:em' +
        '_cuit,'
      
        '                                                             :es' +
        '_nroestableci)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 33
    Top = 378
    ParamData = <
      item
        DataType = ftInteger
        Name = 'le_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'em_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'es_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'em_cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'es_nroestableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'em_cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'es_nroestableci'
        ParamType = ptInput
      end>
    object sdqTrabajadoresrs_cuil: TStringField
      FieldName = 'rs_cuil'
    end
    object sdqTrabajadoresrs_nombretrabajador: TStringField
      FieldName = 'rs_nombretrabajador'
      Size = 255
    end
    object sdqTrabajadoresmb_descripcion: TStringField
      FieldName = 'mb_descripcion'
      Size = 255
    end
    object sdqTrabajadoresdl_fechabaja: TDateTimeField
      FieldName = 'dl_fechabaja'
    end
    object sdqTrabajadoresrt_fecha: TDateTimeField
      FieldName = 'rt_fecha'
    end
    object sdqTrabajadoresestudios: TStringField
      FieldKind = fkCalculated
      FieldName = 'estudios'
      Size = 2000
      Calculated = True
    end
    object sdqTrabajadoresle_id: TFloatField
      FieldName = 'le_id'
    end
    object sdqTrabajadoresdl_idtrabajador: TFloatField
      FieldName = 'dl_idtrabajador'
    end
    object sdqTrabajadoresfagregado: TDateTimeField
      FieldName = 'fagregado'
    end
  end
  object dsTrabajadores: TDataSource
    DataSet = sdqTrabajadores
    Left = 63
    Top = 378
  end
  object ordTrabajadores: TSortDialog
    Caption = 'Orden'
    DataSet = sdqTrabajadores
    SortFields = <
      item
        Title = 'CUIL'
        DataField = 'RS_CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Apellido y Nombre Trabajador'
        DataField = 'RS_NOMBRETRABAJADOR'
        FieldIndex = 1
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 102
    Top = 522
  end
  object sdqDatosPQ: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT DISTINCT dl_idempresa, em_nombre'
      '           FROM hys.hle_loteestudio'
      
        '                INNER JOIN art.cpr_prestador ON ca_identificador' +
        ' = le_idprestador'
      
        '                INNER JOIN hys.hdl_detallelote ON dl_idlote = le' +
        '_id'
      
        '                INNER JOIN afi.aem_empresa ON em_id = dl_idempre' +
        'sa'
      '          WHERE le_fechabaja IS NULL'
      '            AND dl_fechabaja IS NULL'
      '            AND ca_fechabaja IS NULL'
      '            AND le_id = :le_id'
      '')
    Left = 74
    Top = 578
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'le_id'
        ParamType = ptInput
      end>
  end
  object sdqTrabActivos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    AfterScroll = sdqTrabActivosAfterScroll
    SQL.Strings = (
      'SELECT /*+rule*/ tj_id, tj_cuil, tj_nombre '
      
        '           FROM comunes.ctj_trabajador, comunes.crl_relacionlabo' +
        'ral'
      '          WHERE rl_contrato = :pcontrato'
      '           AND rl_idtrabajador = tj_id '
      'UNION'
      'SELECT DISTINCT tj_id, tj_cuil, tj_nombre'
      
        '           FROM comunes.ctj_trabajador, comunes.chl_historicolab' +
        'oral'
      '          WHERE hl_contrato = :pcontrato'
      '            AND tj_id = hl_idtrabajador'
      '            AND NOT EXISTS(SELECT 1'
      '                             FROM comunes.crl_relacionlaboral'
      
        '                            WHERE rl_idtrabajador = hl_idtrabaja' +
        'dor'
      '                              AND hl_contrato = rl_contrato)'
      '       ORDER BY tj_nombre')
    Left = 33
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pcontrato'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pcontrato'
        ParamType = ptInput
      end>
  end
  object dsTrabActivos: TDataSource
    DataSet = sdqTrabActivos
    Left = 63
    Top = 348
  end
  object ordTrabActivos: TSortDialog
    Caption = 'Orden'
    DataSet = sdqTrabActivos
    SortFields = <
      item
        Title = 'CUIL'
        DataField = 'tj_cuil'
        FieldIndex = 0
      end
      item
        Title = 'Nombre'
        DataField = 'tj_nombre'
        FieldIndex = 1
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 102
    Top = 466
  end
  object sdqEstudiosRiesgo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT er_idrg, er_estudio, er_periodicidad,'
      '       art.amp.get_costo_estudio(:pidprestador, :pidestableci,'
      
        '                                 er_estudio, art.actualdate, :pe' +
        'sreconf) pd_valor'
      '  FROM aer_estriesg'
      ' WHERE er_fechabaja IS NULL'
      '   AND er_idrg = :pidriesgo')
    Left = 46
    Top = 550
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pidprestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pidestableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pesreconf'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pidriesgo'
        ParamType = ptInput
      end>
  end
  object sdqRiesgos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT rg_id, rg_codigo, TRIM(rg_esop || '#39' '#39' || rg_sufijoesop) e' +
        'sop,'
      '       rg_descripcion'
      '  FROM prg_riesgos p, ara_riesporact, comunes.cac_actividad'
      ' WHERE rg_id = ra_idrg'
      '   AND ra_ciiu = ac_relacion'
      '   AND ac_id = art.afiliacion.get_idactividadempresa(:pcuit)'
      '   AND NOT EXISTS(SELECT *'
      '                    FROM art.prt_riestrab'
      '                   WHERE rt_cuit = :pcuit'
      '                     AND rt_estableci = :pestableci'
      '                     AND rt_cuil = :pcuil'
      '                     AND rt_idrg = rg_id)'
      '   AND rg_fechabaja IS NULL'
      ' ')
    Left = 387
    Top = 393
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pcuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pestableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pcuil'
        ParamType = ptInput
      end>
  end
  object dsRiesgos: TDataSource
    DataSet = sdqRiesgos
    Left = 417
    Top = 393
  end
  object sdqRiesgosReferencia: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT DISTINCT rt_idrg, rt_riesgo'
      '           FROM art.prt_riestrab'
      '          WHERE rt_cuit = :pcuit'
      '            AND rt_estableci = :pidestableci'
      '            AND rt_fecha = :pfechacarga'
      '            AND rt_cuil = :pcuil')
    Left = 450
    Top = 393
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pidestableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pfechacarga'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pcuil'
        ParamType = ptInput
      end>
  end
  object sdqEstudiosPosibles: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT DISTINCT er_estudio, es_descripcion'
      '           FROM prg_riesgos p, ara_riesporact, afi.aco_contrato,'
      
        '                comunes.cac_actividad, aer_estriesg, aes_estudio' +
        's'
      '          WHERE er_fechabaja IS NULL'
      '            AND rg_fechabaja IS NULL'
      '            AND es_fechabaja IS NULL'
      '            AND er_idrg = rg_id'
      '            AND er_estudio = es_codigo'
      '            AND rg_id = ra_idrg'
      '            AND ra_ciiu = ac_relacion'
      '            AND ac_id = co_idactividad'
      '            AND co_contrato = :pcontrato'
      '            AND er_estudio <> '#39'00000000'#39
      '       ORDER BY er_estudio, es_descripcion'
      ' ')
    Left = 480
    Top = 393
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcontrato'
        ParamType = ptInput
      end>
  end
  object mnuNotificar: TPopupMenu
    Left = 74
    Top = 466
    object mnuNotificaraPrestador: TMenuItem
      Caption = 'Notificar al Prestador'
      OnClick = mnuNotificaraPrestadorClick
    end
    object mnuNotificarAsignacion: TMenuItem
      Caption = 'Notificar a Empresa asignaci'#243'n de Prestador'
      OnClick = mnuNotificarAsignacionClick
    end
    object mnuNotificaraEmpresa: TMenuItem
      Caption = 'Notificar a Empresa Fecha Pactada con Prestador'
      OnClick = mnuNotificaraEmpresaClick
    end
    object mnuNotificaraEmpresaMovil: TMenuItem
      Caption = 'Notificar a Empresa asignaci'#243'n de Prestador (c/M'#243'vil)'
      Visible = False
      OnClick = mnuNotificaraEmpresaMovilClick
    end
  end
  object sdqEmpresaEstab: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    AfterScroll = sdqEmpresaEstabAfterScroll
    Left = 33
    Top = 318
  end
  object dsEmpresaEstab: TDataSource
    DataSet = sdqEmpresaEstab
    Left = 63
    Top = 318
  end
  object sdqHistLotes: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    DataSource = dsEmpresaEstab
    SQL.Strings = (
      'SELECT DISTINCT *'
      '           FROM (SELECT (SELECT de_descripcion'
      '                           FROM hys.hde_descripcionestadolote'
      '                          WHERE de_codigo = he_estado) estado,'
      '                        DECODE'
      '                          (he_estado,'
      '                           '#39'P'#39', (SELECT TRUNC(le_fechaalta)'
      '                                   FROM hys.hle_loteestudio'
      '                                  WHERE le_id = he_idlote),'
      '                           '#39'L'#39', NULL,'
      '                           art.varios.valorsql'
      '                             ('#39'select trunc(he_'#39
      '                              || (SELECT de_campofecharef'
      
        '                                    FROM hys.hde_descripcionesta' +
        'dolote'
      '                                   WHERE de_codigo = he_estado)'
      
        '                              || '#39') from hys.hhe_histestadolote ' +
        'where he_idlote = '#39
      
        '                              || he_idlote || '#39' and he_rlid = '#39' ' +
        '|| he_rlid'
      
        '                              || '#39' and he_id = '#39' || he_id)) fech' +
        'a,'
      '                        DECODE'
      '                          (he_estado,'
      '                           '#39'P'#39', (SELECT le_usualta'
      '                                   FROM hys.hle_loteestudio'
      '                                  WHERE le_id = he_idlote),'
      '                           '#39'L'#39', NULL,'
      '                           art.varios.valorsql'
      '                             ('#39'select he_'#39
      '                              || (SELECT de_campousuarioref'
      
        '                                    FROM hys.hde_descripcionesta' +
        'dolote'
      '                                   WHERE de_codigo = he_estado)'
      
        '                              || '#39' from hys.hhe_histestadolote w' +
        'here he_idlote = '#39
      
        '                              || he_idlote || '#39' and he_rlid = '#39' ' +
        '|| he_rlid'
      
        '                              || '#39' and he_id = '#39' || he_id)) usua' +
        'rio,'
      '                        DECODE(he_estado,'
      '                               '#39'P'#39', '#39'GENERACI'#211'N DEL LOTE'#39','
      '                               '#39'J'#39', '#39'BAJA DE LA EMPRESA'#39','
      '                               '#39'O'#39', '#39'BAJA DEL ESTABLECIMIENTO'#39','
      
        '                               '#39'Z'#39', '#39'BAJA DE TRABAJADORES DEL LO' +
        'TE'#39','
      '                               mr_descripcion) motivo'
      
        '                   FROM hys.hhe_histestadolote hhe, hys.hmr_moti' +
        'vorechazo'
      '                  WHERE mr_id(+) = he_idmotivo'
      '                    AND he_rlid = :el_rlid'
      '                    AND he_idlote = :le_id'
      '                )'
      '          WHERE fecha IS NOT NULL'
      '       ORDER BY fecha')
    Left = 33
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'el_rlid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'le_id'
        ParamType = ptInput
      end>
  end
  object dsHistLote: TDataSource
    DataSet = sdqHistLotes
    Left = 63
    Top = 288
  end
  object mnuCartaDoc: TPopupMenu
    Left = 74
    Top = 494
    object MenuItem4: TMenuItem
      Caption = 'No presentaci'#243'n de Empresa'
      OnClick = mnuCartaDocNoPresentacionEmpresaClick
    end
    object mnuCDEmitidas: TMenuItem
      Caption = 'C.D. emitidas'
      OnClick = mnuCDEmitidasClick
    end
    object mnuNotifCitEspecialista: TMenuItem
      Caption = 'Notificar Citaci'#243'n con Especialista'
      Visible = False
      OnClick = mnuNotifCitEspecialistaClick
    end
  end
  object sdqEstados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    Left = 46
    Top = 578
  end
  object sdqListado: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        '  SELECT DISTINCT le_id "LOTE", hde1.de_descripcion "ESTADO LOTE' +
        '",'
      '                ca_descripcion "PRESTADOR",'
      '                le_fechanotificacion "FECHA NOTIF PRESTADOR",'
      
        '                le_fechanotifiempresa "FECHA NOTIF EMPRESA", le_' +
        'monto "MONTO",'
      '                TRIM(le_observaciones || '#39' '#39
      '                     || le_obsseguimiento) "OBSERVACIONES",'
      '                em_cuit "CUIT", em_nombre "RAZON SOCIAL",'
      '                es_nroestableci "ESTAB.", es_nombre "NOMBRE",'
      
        '                es_contrato "CONTRATO", hde1.de_descripcion "EST' +
        'ADO SUBLOTE",'
      '                el_fecharelevamiento "FECHA RELEVAMIENTO",'
      '                el_fechapactada "FECHA PACTADA",'
      '                el_fechaaprobado "FECHA APROBADO",'
      '                el_fecharechazo "FECHA RECHAZO",'
      '                el_fechaanulado "FECHA ANULADO",'
      '                el_fecharecibido "FECHA RECIBIDO",'
      '                el_fechaterminado "FECHA TERMINADO",'
      '                el_idmotivo "MOTIVO RECHAZO",'
      
        '                DECODE(el_operativo, '#39'Anual'#39', '#39'Semestral'#39') "OPER' +
        'ATIVO",'
      '                (SELECT COUNT(*)'
      '                   FROM hys.hlc_lotecartadoc'
      '                  WHERE lc_idestableci = dl_idestableci'
      '                    AND lc_idlote = le_id) "CANT.CC.DD.",'
      '                (SELECT MAX(ca_fechaalta)'
      '                   FROM hys.hlc_lotecartadoc, cca_carta'
      '                  WHERE ca_id = lc_idcarta'
      '                    AND lc_idestableci = dl_idestableci'
      '                    AND lc_idlote = le_id) "FECHA CC.DD.",'
      '                tj_cuil "CUIL", tj_nombre "TRABAJADOR",'
      '                dl_motivobaja "MOTIVO BAJA",'
      '                NVL2(dl_fuerarelevamiento,'
      '                     TRUNC(dl_fechaalta), NULL) "FECHA AGREGADO"'
      '           FROM hys.hle_loteestudio, hys.hel_estadolote,'
      '                hys.hrl_relevamientolote, hys.hdl_detallelote,'
      '                afi.aem_empresa, afi.aes_establecimiento,'
      
        '                comunes.ctj_trabajador, hys.hde_descripcionestad' +
        'olote hde1,'
      
        '                hys.hde_descripcionestadolote hde2, art.cpr_pres' +
        'tador'
      '          WHERE el_idlote = le_id'
      '            AND rl_id = el_rlid'
      '            AND rl_fecha = el_fecharelevamiento'
      '            AND dl_idlote = le_id'
      '            AND dl_idestableci = rl_idestableci'
      '            AND em_id = dl_idempresa'
      '            AND es_id = dl_idestableci'
      '            AND tj_id = dl_idtrabajador'
      '            AND hde1.de_codigo = le_estado'
      '            AND hde2.de_codigo = el_estado'
      '            AND ca_identificador = le_idprestador'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 33
    Top = 411
  end
  object dsListado: TDataSource
    DataSet = sdqListado
    Left = 63
    Top = 411
  end
  object mnuExportar: TPopupMenu
    Left = 74
    Top = 522
    object mnuResumendeLotes: TMenuItem
      Caption = 'Res'#250'men de Lotes'
      OnClick = mnuResumendeLotesClick
    end
    object mnuDetalledeLotes: TMenuItem
      Caption = 'Detalle de Lotes'
      OnClick = mnuDetalledeLotesClick
    end
  end
  object mnuCambiarEstado: TPopupMenu
    Left = 102
    Top = 550
    object mnuAprobarLotes: TMenuItem
      Caption = 'Aprobar Lotes'
      OnClick = mnuAprobarLotesClick
    end
    object mnuAnularLotes: TMenuItem
      Caption = 'Anular Lotes'
      OnClick = mnuAnularLotesClick
    end
  end
end
