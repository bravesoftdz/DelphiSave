inherited frmAdminEstadoDeCuenta: TfrmAdminEstadoDeCuenta
  Left = 353
  Top = 79
  Caption = 'Administraci'#243'n del Estado de Cuenta'
  ClientHeight = 578
  ClientWidth = 780
  Constraints.MinHeight = 474
  Constraints.MinWidth = 788
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  ExplicitLeft = 353
  ExplicitTop = 79
  ExplicitWidth = 788
  ExplicitHeight = 608
  DesignSize = (
    780
    578)
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Top = 339
    Width = 780
    Height = 0
    Visible = False
    ExplicitTop = 297
    ExplicitWidth = 800
    ExplicitHeight = 0
  end
  inherited CoolBar: TCoolBar
    Top = 310
    Width = 780
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 774
      end>
    ExplicitTop = 310
    ExplicitWidth = 780
    inherited ToolBar: TToolBar
      Width = 765
      Caption = ''
      ExplicitWidth = 765
      inherited tbNuevo: TToolButton
        ImageIndex = 6
        Visible = False
      end
      inherited tbModificar: TToolButton
        ImageIndex = 7
        Visible = False
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 8
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 1
        Visible = False
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImprimir
        ImageIndex = 4
        Style = tbsDropDown
        OnClick = tbImprimirClick
        ExplicitWidth = 40
      end
      inherited ToolButton11: TToolButton
        Left = 156
        ExplicitLeft = 156
      end
      inherited tbSalir: TToolButton
        Left = 164
        ImageIndex = 5
        ExplicitLeft = 164
      end
      object tbUsuario: TToolButton
        Left = 189
        Top = 0
        Hint = 'Ver Usuario de Alta'
        Caption = 'tbUsuario'
        ImageIndex = 26
        Style = tbsCheck
        OnClick = tbUsuarioClick
      end
      object tbNomina: TToolButton
        Left = 214
        Top = 0
        Hint = 'Ver n'#243'mina de empleados'
        Caption = 'tbNomina'
        ImageIndex = 19
        OnClick = tbNominaClick
      end
      object tbOrdenar: TToolButton
        Left = 239
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        ImageIndex = 2
        OnClick = tbOrdenarClick
      end
      object tbSeparador: TToolButton
        Left = 264
        Top = 0
        Width = 8
        Caption = 'tbSeparador'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbPeriodoAnterior: TToolButton
        Left = 272
        Top = 0
        Hint = 'Periodo Anterior (Ctrl+A)'
        ImageIndex = 34
        OnClick = tbPeriodoAnteriorClick
      end
      object tbPeriodoProximo: TToolButton
        Left = 297
        Top = 0
        Hint = 'Periodo Pr'#243'ximo (Ctrl+P)'
        Caption = 'tbPeriodoProximo'
        ImageIndex = 35
        OnClick = tbPeriodoAnteriorClick
      end
      object ToolButton1: TToolButton
        Left = 322
        Top = 0
        Width = 8
        Caption = 'tbSeparador2'
        ImageIndex = 36
        Style = tbsSeparator
      end
      object tbIrPlanPago: TToolButton
        Left = 330
        Top = 0
        Hint = 'Ir a Plan de Pago (Ctrl+G)'
        ImageIndex = 25
        OnClick = tbIrPlanPagoClick
      end
      object tbExportarGrilla: TToolButton
        Left = 355
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        Caption = 'tbExportarGrilla'
        ImageIndex = 3
        OnClick = tbExportarGrillaClick
      end
      object tb441Web: TToolButton
        Left = 380
        Top = 0
        Hint = '441 Web'
        Caption = 'tb441Web'
        ImageIndex = 41
        OnClick = tb441WebClick
      end
      object tbAprobarEmisionCertificado: TToolButton
        Left = 405
        Top = 0
        Hint = 'Aprobar Emisi'#243'n Certificado de Cobertura'
        Caption = 'tbAprobarEmisionCertificado'
        ImageIndex = 42
        OnClick = tbAprobarEmisionCertificadoClick
      end
      object tbLimpiarReclamoAFIP: TToolButton
        Left = 430
        Top = 0
        Hint = 'Limpiar Reclamo AFIP'
        ImageIndex = 13
        OnClick = tbLimpiarReclamoAFIPClick
      end
      object tbSeparador2: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'tbSeparador2'
        ImageIndex = 43
        Wrap = True
        Style = tbsSeparator
      end
      object Panel1: TPanel
        Left = 0
        Top = 30
        Width = 5
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
      end
      object btnCalcular: TButton
        Left = 5
        Top = 30
        Width = 48
        Height = 22
        Caption = 'Ver'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnCalcularClick
      end
      object btnVolver: TButton
        Left = 53
        Top = 30
        Width = 48
        Height = 22
        Caption = 'Volver'
        TabOrder = 1
        OnClick = btnVolverClick
      end
      object Panel2: TPanel
        Left = 101
        Top = 30
        Width = 5
        Height = 22
        BevelOuter = bvNone
        TabOrder = 4
      end
      object btnContactos: TBitBtn
        Left = 106
        Top = 30
        Width = 77
        Height = 22
        Hint = 'Altas, bajas y modificaciones de contactos'
        Caption = 'Contactos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFF000000
          000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF3630297E4014612E163D1F112417110E0E0E03030300
          0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42382BAA4A08
          DEA077E6B18AC37B4F99522A592E172418120E0E0E020303000000000000FFFF
          FFFFFFFFFFFFFFFFFFFF483C2CAD4E0EE5BB9CFFF4D8FFE7C6FFDBB2F1B789CA
          804D9E552842291B020303000000FFFFFFFFFFFFFFFFFFFFFFFF473D2EB45514
          E8C1A6FFECD4FFE3C4F2DCBFFFE1BDFFD186FBAD5D713917050506000000FFFF
          FFFFFFFFFFFFFFFFFFFF4E3F31B85C1BEDCDB6FFF3DBCCD7CC4EAECAFADBB1FF
          C25BF5B6795E341B010101000000000000FFFFFFFFFFFFFFFFFF564533BD611F
          F6D9C5D8E7DF4DB0CD3DACD1BABDA7919175D49A627B400F0B05000000000000
          00000000000000FFFFFF614B36C36725F8E5D773C4DCBCD7D6A7D0D477BACAA8
          9B82EAB680FAC993C57F3B773B03201102000000000000000000685139C76D2C
          F6EAE3F7F6EEFFF6E4D7E2D974BFD1FFEBCAE2AA76C6864DF3C696F8C692BA91
          633435660B0B2800000072573CCE7738F9F2F0FFFDF7FFF6EBFCF2E395CAD4F6
          EEDDEAB8915A2804432101C4772EA697943059D1041392000000816044CF7C42
          FCFBFBFFFFFFFFF8F2FFF9ECA8D3DCCCE2E0F4BD934929150000000000007759
          3B121F92000280FFFFFF896748CF7E47FAF8FAFFFFFFFFFFFFFFFFFED4EAECC3
          E5E8F0B68A462911000000000000FFFFFFFFFFFFFFFFFFFFFFFF9B7954CA6410
          C3713BD19468DCB397E8CEC1F7E9E0FFFEFBE9BA93462910000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFA7916FE4892ED16706CA5B00C45300BF5100C05D10C8
          7B48CC78394A2E16000000000000FFFFFFFFFFFFFFFFFFFFFFFF4B4944837C65
          988463AE8E61BC8E53CB8D45D28330D77310D66B044C351F000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A514F2D3338464D4B6163586E
          6753897553433D34000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnContactosClick
      end
      object pnlBaja: TPanel
        Left = 183
        Top = 30
        Width = 162
        Height = 22
        BevelOuter = bvNone
        TabOrder = 5
        object lblBaja: TLabel
          Left = 3
          Top = 4
          Width = 155
          Height = 13
          Caption = 'Baja RECEFP S.R.T. (regulariz. )'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
    end
  end
  inherited pnlDatos: TPanel
    Top = 339
    Width = 780
    Height = 0
    Align = alTop
    TabOrder = 1
    ExplicitTop = 297
    ExplicitWidth = 800
    ExplicitHeight = 0
  end
  inherited btnCancelar: TButton [3]
    Left = 688
    Top = 555
    TabOrder = 6
    Visible = False
    ExplicitLeft = 708
    ExplicitTop = 555
  end
  inherited btnAplicar: TButton [4]
    Left = 531
    Top = 554
    TabOrder = 4
    Visible = False
    ExplicitLeft = 551
    ExplicitTop = 554
  end
  object Grid: TArtDBGrid [5]
    Left = 0
    Top = 339
    Width = 780
    Height = 239
    Align = alClient
    DataSource = dsConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GridDblClick
    OnGetCellProps = GridGetCellProps
    FooterBand = False
    OnPaintFooter = GridPaintFooter
    TitleHeight = 17
  end
  object Panel3: TPanel [6]
    Left = 0
    Top = 0
    Width = 780
    Height = 193
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 7
    ExplicitWidth = 800
    DesignSize = (
      780
      193)
    object gbRazonSocial: TGroupBox
      Left = 0
      Top = -1
      Width = 510
      Height = 194
      Caption = ' Raz'#243'n Social '
      TabOrder = 0
      DesignSize = (
        510
        194)
      object Label16: TLabel
        Left = 139
        Top = 127
        Width = 46
        Height = 13
        Caption = 'Mot. Baja'
      end
      object Label1: TLabel
        Left = 23
        Top = 19
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      object Label2: TLabel
        Left = 7
        Top = 47
        Width = 40
        Height = 13
        Caption = 'Domicilio'
      end
      object Label3: TLabel
        Left = 367
        Top = 47
        Width = 40
        Height = 13
        Caption = 'Tel./Fax'
      end
      object Label4: TLabel
        Left = 25
        Top = 73
        Width = 22
        Height = 13
        Caption = 'CIIU'
      end
      object Label5: TLabel
        Left = 12
        Top = 101
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label15: TLabel
        Left = 12
        Top = 128
        Width = 34
        Height = 13
        Caption = 'F. Baja'
      end
      object Label13: TLabel
        Left = 363
        Top = 101
        Width = 86
        Height = 13
        Caption = 'Base Ampl. Desde'
      end
      object Label17: TLabel
        Left = 364
        Top = 73
        Width = 20
        Height = 13
        Caption = 'Tipo'
      end
      object edMOTIVO_BAJA: TEdit
        Left = 188
        Top = 124
        Width = 317
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
      end
      inline fraAC_CODIGO: TfraStaticActividad
        Left = 48
        Top = 69
        Width = 308
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        ExplicitLeft = 48
        ExplicitTop = 69
        ExplicitWidth = 308
        DesignSize = (
          308
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 245
          ExplicitWidth = 245
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
      object edDC_TELEFONOS: TEdit
        Left = 410
        Top = 43
        Width = 95
        Height = 21
        TabOrder = 2
      end
      object edDC_DOMICILIO: TEdit
        Left = 49
        Top = 43
        Width = 316
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object cmbCO_FECHABAJA: TDateComboBox
        Left = 48
        Top = 124
        Width = 88
        Height = 21
        TabOrder = 6
      end
      inline fraCO_CONTRATO: TfraEmpresa
        Left = 49
        Top = 15
        Width = 456
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
        ExplicitLeft = 49
        ExplicitTop = 15
        ExplicitWidth = 456
        ExplicitHeight = 21
        DesignSize = (
          456
          21)
        inherited lbContrato: TLabel
          Left = 354
          ExplicitLeft = 354
        end
        inherited edContrato: TIntEdit
          Left = 399
          ExplicitLeft = 399
        end
        inherited cmbRSocial: TArtComboBox
          Width = 217
          DataSource = nil
          ExplicitWidth = 217
        end
      end
      object edESTADO: TEdit
        Left = 48
        Top = 97
        Width = 308
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object GroupBox1: TGroupBox
        Left = 47
        Top = 147
        Width = 255
        Height = 41
        Caption = ' Vigencia '
        TabOrder = 8
        object Label10: TLabel
          Left = 131
          Top = 17
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object Label14: TLabel
          Left = 6
          Top = 17
          Width = 30
          Height = 13
          Caption = 'Desde'
        end
        object cmbCO_VIGENCIAHASTA: TDateComboBox
          Left = 163
          Top = 13
          Width = 88
          Height = 21
          TabOrder = 1
        end
        object cmbCO_VIGENCIADESDE: TDateComboBox
          Left = 41
          Top = 13
          Width = 88
          Height = 21
          TabOrder = 0
        end
      end
      object gbFechaContable: TGroupBox
        Left = 306
        Top = 147
        Width = 105
        Height = 41
        Caption = ' Fecha Contable '
        TabOrder = 9
        object cmbFECHACONTABLE_AL: TDateComboBox
          Left = 10
          Top = 14
          Width = 88
          Height = 21
          TabOrder = 0
        end
      end
      object edBaseAmplDesde: TPeriodoPicker
        Left = 456
        Top = 97
        Width = 49
        Height = 21
        TabOrder = 5
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205310'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'Tahoma'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NullDropDown = SetMax
      end
      object edTipoRegimen: TEdit
        Left = 389
        Top = 70
        Width = 116
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 10
      end
    end
    object GroupBox2: TGroupBox
      Left = 514
      Top = -1
      Width = 266
      Height = 194
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Adicionales '
      TabOrder = 1
      DesignSize = (
        266
        194)
      inline fraInfoEmpresa: TfraInfoEmpresa
        Left = 4
        Top = 12
        Width = 253
        Height = 180
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 12
        ExplicitWidth = 253
        ExplicitHeight = 180
        DesignSize = (
          253
          180)
        inherited lblAdic_1: TLabel
          Width = 137
          ExplicitWidth = 157
        end
        inherited lblAdic_2: TLabel
          Width = 137
          ExplicitWidth = 157
        end
        inherited lblAdic_4: TLabel
          Width = 137
          ExplicitWidth = 157
        end
        inherited lblAdic_5: TLabel
          Width = 137
          ExplicitWidth = 157
        end
        inherited lblAdic_6: TLabel
          Width = 137
          ExplicitWidth = 157
        end
        inherited lblAdic_8: TLabel
          Width = 137
          ExplicitWidth = 157
        end
        inherited lblAdic_7: TLabel
          Width = 137
          ExplicitWidth = 157
        end
        inherited lblAdic_3: TLabel
          Width = 137
          ExplicitWidth = 157
        end
        inherited lblAdic_0: TLabel
          Width = 137
          ExplicitWidth = 157
        end
        inherited lblAdic_9: TLabel
          Width = 137
          ExplicitWidth = 157
        end
        inherited lblAdic_10: TLabel
          Width = 137
          ExplicitWidth = 157
        end
        inherited lblAdic_11: TLabel
          Width = 137
          ExplicitWidth = 157
        end
      end
    end
  end
  object Panel4: TPanel [7]
    Left = 0
    Top = 193
    Width = 780
    Height = 75
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 8
    ExplicitLeft = 1
    DesignSize = (
      780
      75)
    object gbTipoListado: TGroupBox
      Left = 0
      Top = 1
      Width = 77
      Height = 72
      Caption = ' Tipo Listado '
      TabOrder = 0
      object rbResumen: TRadioButton
        Left = 4
        Top = 21
        Width = 65
        Height = 17
        Caption = 'Resumen'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbResumenClick
      end
      object rbDetalle: TRadioButton
        Left = 4
        Top = 44
        Width = 54
        Height = 17
        Caption = 'Detalle'
        TabOrder = 1
        OnClick = rbDetalleClick
      end
    end
    object gbPeriodos: TGroupBox
      Left = 82
      Top = 1
      Width = 101
      Height = 72
      Caption = ' Per'#237'odos '
      TabOrder = 1
      object Label19: TLabel
        Left = 8
        Top = 21
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object Label18: TLabel
        Left = 11
        Top = 45
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edRC_PERIODODesde: TPeriodoPicker
        Left = 43
        Top = 17
        Width = 49
        Height = 21
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205310'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'Tahoma'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NullDropDown = SetMax
      end
      object edRC_PERIODOHasta: TPeriodoPicker
        Left = 43
        Top = 42
        Width = 49
        Height = 21
        TabOrder = 1
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205310'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'Tahoma'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NullDropDown = SetMax
      end
    end
    object GroupBox4: TGroupBox
      Left = 188
      Top = 1
      Width = 191
      Height = 72
      TabOrder = 2
      object chkIncluir: TCheckBox
        Left = 6
        Top = 11
        Width = 149
        Height = 17
        Caption = 'Incluir Amortizaci'#243'n'
        TabOrder = 0
      end
      object chkSumatoria: TCheckBox
        Left = 6
        Top = 31
        Width = 66
        Height = 17
        Caption = 'Sumatoria'
        TabOrder = 1
        OnClick = chkSumatoriaClick
      end
      object chkSaldoAcreedor: TCheckBox
        Left = 83
        Top = 31
        Width = 104
        Height = 17
        Caption = 'Saldo Acreedor'
        TabOrder = 2
      end
      object chkSaldoDeudor: TCheckBox
        Left = 83
        Top = 50
        Width = 104
        Height = 17
        Caption = 'Saldo Deudor'
        TabOrder = 3
      end
    end
    object GroupBox3: TGroupBox
      Left = 382
      Top = 1
      Width = 129
      Height = 72
      Caption = ' Fecha Inter'#233's '
      TabOrder = 3
      object chkInteresPerConcQuiebra: TCheckBox
        Left = 9
        Top = 37
        Width = 115
        Height = 16
        Caption = 'Per. Conc./Quiebra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object cmbINTERES_AL: TDateComboBox
        Left = 21
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object chkInteresesSaldoAcreedor: TCheckBox
        Left = 9
        Top = 53
        Width = 115
        Height = 16
        Caption = 'Saldo Acreedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object gbReclAFIPConcQuiebra: TGroupBox
      Left = 514
      Top = 1
      Width = 264
      Height = 72
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      object pnlColor0: TPanel
        Left = 4
        Top = 23
        Width = 161
        Height = 15
        Hint = 'Importe Reclamado AFIP'
        BevelOuter = bvLowered
        Caption = 'Importe Reclamado AFIP'
        Color = 12961172
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = pnlColor
      end
      object pnlColor1: TPanel
        Left = 4
        Top = 7
        Width = 161
        Height = 15
        Hint = 'Per'#237'odo en Concurso o Quiebra'
        BevelOuter = bvLowered
        Caption = 'Per'#237'odo en Concurso/Quiebra'
        Color = 14679807
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = pnlColor
      end
      object chkNoMostrarReclamoAFIP: TCheckBox
        Left = 166
        Top = 23
        Width = 75
        Height = 15
        Caption = 'No Mostrar'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object chkNoMostrarConcQuiebra: TCheckBox
        Left = 166
        Top = 7
        Width = 75
        Height = 15
        Caption = 'No Mostrar'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object pnlColor2: TPanel
        Left = 8
        Top = 70
        Width = 161
        Height = 15
        Hint = 'Cheques rechazados producto de la migraci'#243'n'
        BevelOuter = bvLowered
        Caption = 'Cheques rechazados migraci'#243'n'
        Color = 12638714
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Visible = False
        OnClick = pnlColor
      end
      object chkNoMostrarChequesRech: TCheckBox
        Left = 166
        Top = 69
        Width = 75
        Height = 15
        Caption = 'No Mostrar'
        Checked = True
        State = cbChecked
        TabOrder = 7
        Visible = False
      end
      object pnlColor3: TPanel
        Left = 4
        Top = 53
        Width = 161
        Height = 15
        Hint = 'Cheques rechazados'
        BevelOuter = bvLowered
        Caption = 'Cheques rechazados'
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = pnlColor
      end
      object pnlColor4: TPanel
        Left = 4
        Top = 38
        Width = 161
        Height = 15
        Hint = 'Importe Reclamado AFIP'
        BevelOuter = bvLowered
        Caption = 'Per'#237'odo Prescripto'
        Color = 12638714
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = pnlColor
      end
      object chkNoMostrarPrescripto: TCheckBox
        Left = 166
        Top = 38
        Width = 75
        Height = 15
        Caption = 'No Mostrar'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
    end
  end
  object Label7: TStaticText [8]
    Left = 431
    Top = 169
    Width = 64
    Height = 14
    AutoSize = False
    Caption = 'para el CUIT'
    TabOrder = 9
  end
  object Label6: TStaticText [9]
    Left = 429
    Top = 157
    Width = 77
    Height = 15
    AutoSize = False
    Caption = 'Todos los contr.'
    TabOrder = 10
  end
  object chkTodosContratos: TCheckBox [10]
    Left = 413
    Top = 163
    Width = 15
    Height = 15
    TabOrder = 11
  end
  object fpPeriodosDisponibles: TFormPanel [11]
    Left = 97
    Top = 392
    Width = 240
    Height = 128
    Caption = '441 Web'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    KeyPreview = True
    OnKeyPress = fpPeriodosDisponiblesKeyPress
    object Label9: TLabel
      Left = 16
      Top = 21
      Width = 40
      Height = 13
      Caption = 'Per'#237'odo:'
    end
    object dblcbPeriodo: TDBLookupComboBox
      Left = 1336
      Top = 908
      Width = 160
      Height = 21
      KeyField = 'PERIODO'
      ListField = 'PERIODO'
      ListSource = dsPeriodo
      TabOrder = 0
    end
    object btnGenerar: TButton
      Left = 144
      Top = 88
      Width = 80
      Height = 25
      Caption = 'Generar'
      TabOrder = 1
      OnClick = btnGenerarClick
    end
  end
  object fpAprobarEmisionCertificado: TFormPanel [12]
    Left = 364
    Top = 352
    Width = 432
    Height = 192
    Caption = 'Aprobar Emisi'#243'n Certificado de Cobertura'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpAprobarEmisionCertificadoBeforeShow
    ActiveControl = rgPermite
    DesignSize = (
      432
      192)
    object Bevel1: TBevel
      Left = 4
      Top = 152
      Width = 424
      Height = 4
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label8: TLabel
      Left = 8
      Top = 12
      Width = 319
      Height = 13
      Caption = 
        'Permiso para la emisi'#243'n de Certificado de Cobertura hasta la fec' +
        'ha'
    end
    object Label11: TLabel
      Left = 8
      Top = 44
      Width = 36
      Height = 13
      Caption = 'Permite'
    end
    object Label12: TLabel
      Left = 8
      Top = 76
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object btnAceptar2: TButton
      Left = 272
      Top = 160
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object Button2: TButton
      Left = 352
      Top = 160
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object edFechaCertificadoCobertura: TDateComboBox
      Left = 336
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object rgPermite: TRadioGroup
      Left = 88
      Top = 32
      Width = 120
      Height = 32
      Columns = 2
      Items.Strings = (
        'SI'
        'NO')
      TabOrder = 3
    end
    object memoObservaciones: TMemo
      Left = 88
      Top = 72
      Width = 336
      Height = 72
      Lines.Strings = (
        '111111'
        '222222'
        '33333'
        '44444'
        '55555'
        '666666')
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object pnMensaje: TPanel
      Left = 4
      Top = 156
      Width = 240
      Height = 34
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clMoneyGreen
      TabOrder = 5
      object lbMensaje: TLabel
        Left = 8
        Top = 2
        Width = 224
        Height = 26
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
  end
  inherited btnAceptar: TButton [13]
    Left = 610
    Top = 555
    TabOrder = 5
    Visible = False
    ExplicitLeft = 630
    ExplicitTop = 555
  end
  object Panel5: TPanel [14]
    Left = 0
    Top = 268
    Width = 780
    Height = 42
    Align = alTop
    TabOrder = 14
    object GroupBox5: TGroupBox
      Left = 4
      Top = -3
      Width = 506
      Height = 43
      Caption = ' R'#233'gimen'
      TabOrder = 0
      DesignSize = (
        506
        43)
      inline fraTipoReg: TfraTipoRegimen
        Left = 9
        Top = 14
        Width = 488
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 9
        ExplicitTop = 14
        ExplicitWidth = 488
        ExplicitHeight = 25
        DesignSize = (
          488
          25)
        inherited cmbDescripcion: TArtComboBox
          Width = 442
          ExplicitWidth = 442
        end
        inherited edCodigo: TPatternEdit
          Left = 3
          ExplicitLeft = 3
        end
      end
    end
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
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
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16464
        LinkControl = tbPeriodoProximo
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16449
        LinkControl = tbPeriodoAnterior
      end
      item
        Key = 16455
        LinkControl = tbIrPlanPago
      end
      item
        Key = 16453
        LinkControl = tbExportarGrilla
      end>
    Left = 318
    Top = 10
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 262
    Top = 10
  end
  inherited FormStorage: TFormStorage
    Left = 290
    Top = 10
  end
  inherited sdqConsulta: TSDQuery
    AfterOpen = sdqConsultaAfterOpen
    Left = 416
    Top = 33
  end
  inherited dsConsulta: TDataSource
    Left = 444
    Top = 33
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    Options = [poPageNums]
    Left = 262
    Top = 38
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
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
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 290
    Top = 38
  end
  object ColorDialog: TColorDialog
    Left = 318
    Top = 38
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqConsulta
    SortFields = <>
    FixedRows = 0
    Left = 234
    Top = 10
  end
  object pmnuImprimir: TPopupMenu
    Left = 128
    Top = 304
    object mnuImprEstadoCuenta: TMenuItem
      Caption = 'Estado de Cuenta'
      OnClick = mnuImprEstadoCuentaClick
    end
    object mnuImprF817: TMenuItem
      Caption = 'F817'
      OnClick = mnuImprF817Click
    end
    object mnuImprF801C: TMenuItem
      Caption = 'F801C'
      object mnuImprF801CTotal: TMenuItem
        Caption = 'Total'
        OnClick = mnuImprF801CClick
      end
      object mnuImprF801CPorPeriodo: TMenuItem
        Caption = 'Por Periodo'
        OnClick = mnuImprF801CClick
      end
    end
    object mnuImprLibreDeuda: TMenuItem
      Caption = 'Libre Deuda'
      OnClick = mnuImprLibreDeudaClick
    end
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqConsulta
    Fields = <>
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
    Left = 234
    Top = 38
  end
  object sdqPeriodo: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'BEGIN'
      '  ART.WEB.GET_PERIODOCTACTE(:Contrato, :Periodo);'
      'END; ')
    Left = 128
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Contrato'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'Periodo'
        ParamType = ptOutput
      end>
  end
  object dsPeriodo: TDataSource
    DataSet = sdqPeriodo
    Left = 156
    Top = 348
  end
  object sdspGetDeudaCertificado: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    StoredProcName = 'ART.WEB.GET_BUSCA_DEUDA_CERTIFICADO'
    Left = 174
    Top = 305
    ParamData = <
      item
        DataType = ftDate
        Name = 'dtFECHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nContrato'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nDeudaNominal'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'nInteres'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'nDeudaTotal'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'sPeriodo'
        ParamType = ptOutput
      end>
  end
end
