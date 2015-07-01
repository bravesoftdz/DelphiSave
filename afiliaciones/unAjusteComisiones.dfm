object frmAjusteComisiones: TfrmAjusteComisiones
  Left = 226
  Top = 116
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Ajuste de Comisiones'
  ClientHeight = 269
  ClientWidth = 662
  Color = clBtnFace
  Constraints.MaxHeight = 299
  Constraints.MinHeight = 299
  Constraints.MinWidth = 670
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    662
    269)
  PixelsPerInch = 96
  TextHeight = 13
  object gpEmpresa: TGroupBox
    Left = 4
    Top = 2
    Width = 654
    Height = 45
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Empresa'
    TabOrder = 0
    DesignSize = (
      654
      45)
    object Label1: TLabel
      Left = 8
      Top = 19
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    inline fraEmpresaAjuste: TfraEmpresa
      Left = 37
      Top = 16
      Width = 608
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
      ExplicitLeft = 37
      ExplicitTop = 16
      ExplicitWidth = 608
      ExplicitHeight = 21
      DesignSize = (
        608
        21)
      inherited lbContrato: TLabel
        Left = 506
        ExplicitLeft = 506
      end
      inherited edContrato: TIntEdit
        Left = 551
        ExplicitLeft = 551
      end
      inherited cmbRSocial: TArtComboBox
        Width = 369
        ExplicitWidth = 369
      end
    end
  end
  object gpPeriodos: TGroupBox
    Left = 4
    Top = 48
    Width = 208
    Height = 45
    Caption = 'Periodos'
    TabOrder = 1
    object Label2: TLabel
      Left = 7
      Top = 20
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object Label3: TLabel
      Left = 113
      Top = 20
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object edPeriodoDesde: TPeriodoPicker
      Left = 43
      Top = 16
      Width = 51
      Height = 21
      TabOrder = 0
      TabStop = True
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205304'
      Periodo.MinPeriodo = '195305'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object edPeriodoHasta: TPeriodoPicker
      Left = 149
      Top = 16
      Width = 51
      Height = 21
      TabOrder = 1
      TabStop = True
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205304'
      Periodo.MinPeriodo = '195305'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
  end
  object gbImporte: TGroupBox
    Left = 217
    Top = 48
    Width = 122
    Height = 45
    Caption = 'Importe'
    TabOrder = 2
    object edImporte: TCurrencyEdit
      Left = 9
      Top = 16
      Width = 104
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 13
      TabOrder = 0
    end
  end
  object gbEntVendDebitar: TGroupBox
    Left = 4
    Top = 95
    Width = 654
    Height = 70
    Anchors = [akLeft, akTop, akRight]
    Caption = 'A Debitar'
    TabOrder = 4
    DesignSize = (
      654
      70)
    object Label4: TLabel
      Left = 17
      Top = 21
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label5: TLabel
      Left = 7
      Top = 44
      Width = 46
      Height = 13
      Caption = 'Vendedor'
    end
    inline fraEntidadDebitar: TfraEntidades
      Left = 57
      Top = 15
      Width = 590
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 57
      ExplicitTop = 15
      ExplicitWidth = 590
      inherited cmbDescripcion: TArtComboBox
        Width = 525
        ExplicitWidth = 525
      end
    end
    inline fraVendedorDebitar: TfraVendedores
      Left = 57
      Top = 40
      Width = 590
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 57
      ExplicitTop = 40
      ExplicitWidth = 590
      DesignSize = (
        590
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 525
        ExplicitWidth = 525
      end
    end
  end
  object gbEntVendAcreditar: TGroupBox
    Left = 4
    Top = 166
    Width = 654
    Height = 70
    Anchors = [akLeft, akTop, akRight]
    Caption = 'A Acreditar'
    TabOrder = 5
    DesignSize = (
      654
      70)
    object Label6: TLabel
      Left = 17
      Top = 21
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label7: TLabel
      Left = 7
      Top = 44
      Width = 46
      Height = 13
      Caption = 'Vendedor'
    end
    inline fraEntidadAcreditar: TfraEntidades
      Left = 57
      Top = 15
      Width = 590
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 57
      ExplicitTop = 15
      ExplicitWidth = 590
      inherited cmbDescripcion: TArtComboBox
        Width = 525
        ExplicitWidth = 525
      end
    end
    inline fraVendedorAcreditar: TfraVendedores
      Left = 57
      Top = 40
      Width = 590
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 57
      ExplicitTop = 40
      ExplicitWidth = 590
      DesignSize = (
        590
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 525
        ExplicitWidth = 525
      end
    end
  end
  object btnRecalcular: TBitBtn
    Left = 573
    Top = 243
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 6
    OnClick = btnRecalcularClick
  end
  object gbConcepto: TGroupBox
    Left = 344
    Top = 48
    Width = 314
    Height = 45
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Concepto'
    TabOrder = 3
    DesignSize = (
      314
      45)
    inline fraConceptoAjuste: TfraStaticCodigoDescripcion
      Left = 9
      Top = 16
      Width = 298
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 9
      ExplicitTop = 16
      ExplicitWidth = 298
      DesignSize = (
        298
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 235
        ExplicitWidth = 235
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
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 6
    Top = 240
  end
end
