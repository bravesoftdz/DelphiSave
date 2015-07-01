inherited frmManImportesValoresAmpo: TfrmManImportesValoresAmpo
  Left = 487
  Top = 250
  Width = 800
  Height = 407
  Caption = 'Mantenimiento de Importes y Valores AMPO'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
  end
  inherited CoolBar: TCoolBar
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 788
      end>
    inherited ToolBar: TToolBar
      Width = 775
      inherited tbNuevo: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 792
    Height = 306
    Columns = <
      item
        Expanded = False
        FieldName = 'PERIODO'
        Title.Caption = 'Periodo'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AM_NUMAMPOS'
        Title.Caption = 'N'#186' de AMPOS'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AM_VALORAMPO'
        Title.Caption = 'Valor de AMPO'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AM_IMPORTOPE'
        Title.Caption = 'Importe Tope'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AM_IMPORTOPE_CONTRIBPATR'
        Title.Caption = 'Importe Contr. Pat.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AM_IMPORTEMINIMO'
        Title.Caption = 'Salario M'#237'nimo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AM_IMPORTEMINIMOPOSTDE'
        Title.Caption = 'Salario M'#237'nimo Post Decr.'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AM_HABERMINIMOGARANT'
        Title.Caption = 'Haber Min. Garant.'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCINCHBM'
        Title.Caption = 'Porc.Inc.Hab.Min.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCINCGI'
        Title.Caption = 'Porc.Inc.Imp.Min.P.D.'
        Width = 110
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 224
    Top = 79
    Width = 289
    Height = 275
    DesignSize = (
      289
      275)
    inherited BevelAbm: TBevel
      Top = 239
      Width = 281
    end
    object Label1: TLabel [1]
      Left = 105
      Top = 20
      Width = 36
      Height = 13
      Caption = 'Periodo'
    end
    object Label2: TLabel [2]
      Left = 73
      Top = 45
      Width = 68
      Height = 13
      Caption = 'N'#186' de AMPOS'
    end
    object Label3: TLabel [3]
      Left = 68
      Top = 71
      Width = 73
      Height = 13
      Caption = 'Valor de AMPO'
    end
    object Label4: TLabel [4]
      Left = 78
      Top = 97
      Width = 63
      Height = 13
      Caption = 'Importe Tope'
    end
    object Label5: TLabel [5]
      Left = 55
      Top = 123
      Width = 88
      Height = 13
      Caption = 'Importe Contr. Pat.'
    end
    object Label6: TLabel [6]
      Left = 71
      Top = 148
      Width = 70
      Height = 13
      Caption = 'Salario M'#237'nimo'
    end
    object Label7: TLabel [7]
      Left = 6
      Top = 175
      Width = 135
      Height = 13
      Caption = 'Salario M'#237'nimo Post Decreto'
    end
    object Label8: TLabel [8]
      Left = 14
      Top = 202
      Width = 127
      Height = 13
      Caption = 'Haber M'#237'nimo Garantizado'
    end
    inherited btnAceptar: TButton
      Left = 131
      Top = 245
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 209
      Top = 245
      TabOrder = 8
    end
    object edPeriodo: TEdit
      Left = 147
      Top = 14
      Width = 121
      Height = 21
      Color = 15262169
      Enabled = False
      MaxLength = 6
      TabOrder = 0
    end
    object edNroDeAMPOS: TCurrencyEdit
      Left = 147
      Top = 41
      Width = 121
      Height = 20
      AutoSize = False
      Color = clWhite
      DisplayFormat = '0.00; -,0.00'
      TabOrder = 1
    end
    object edValorAMPO: TCurrencyEdit
      Left = 147
      Top = 67
      Width = 121
      Height = 20
      AutoSize = False
      Color = clWhite
      DisplayFormat = '$ ,0.00;$ -,0.00'
      TabOrder = 2
    end
    object edImporteTope: TCurrencyEdit
      Left = 147
      Top = 93
      Width = 121
      Height = 20
      AutoSize = False
      Color = clWhite
      DisplayFormat = '$ ,0.00;$ -,0.00'
      TabOrder = 3
    end
    object edImporteContrPat: TCurrencyEdit
      Left = 147
      Top = 119
      Width = 121
      Height = 20
      AutoSize = False
      Color = clWhite
      DisplayFormat = '$ ,0.00;$ -,0.00'
      TabOrder = 4
    end
    object edSalarioMinimo: TCurrencyEdit
      Left = 147
      Top = 144
      Width = 121
      Height = 20
      AutoSize = False
      Color = clWhite
      DisplayFormat = '$ ,0.00;$ -,0.00'
      TabOrder = 5
    end
    object edSalarioMinimoPostDecr: TCurrencyEdit
      Left = 147
      Top = 171
      Width = 121
      Height = 20
      AutoSize = False
      Color = clWhite
      DisplayFormat = '$ ,0.00;$ -,0.00'
      TabOrder = 6
    end
    object edHaberMinGarantizado: TCurrencyEdit
      Left = 147
      Top = 198
      Width = 121
      Height = 20
      AutoSize = False
      Color = clWhite
      DisplayFormat = '$ ,0.00;$ -,0.00'
      TabOrder = 9
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   periodo_ponerbarra(am_periodo) periodo, am_periodo, am_' +
        'numampos, am_valorampo, am_importope, am_importope_contribpatr,'
      '         am_importeminimo, am_importeminimopostde, '
      '         am_haberminimogarant,'
      
        '         (SELECT ROUND((a.am_haberminimogarant - b.am_haberminim' +
        'ogarant) * 100 / b.am_haberminimogarant, 2)'
      '            FROM art.cam_topeampos b'
      '           WHERE NVL(b.am_haberminimogarant, 0) > 0'
      '             AND b.am_periodo = (SELECT MAX(c.am_periodo)'
      '                                   FROM art.cam_topeampos c'
      
        '                                  WHERE c.am_periodo < a.am_peri' +
        'odo)) porcinchbm,'
      
        '         (SELECT ROUND((a.am_importeminimopostde - b.am_importem' +
        'inimopostde) * 100 / b.am_importeminimopostde, 2)'
      '            FROM art.cam_topeampos b'
      '           WHERE NVL(b.am_haberminimogarant, 0) > 0'
      '             AND b.am_periodo = (SELECT MAX(c.am_periodo)'
      '                                   FROM art.cam_topeampos c'
      
        '                                  WHERE c.am_periodo < a.am_peri' +
        'odo)) porcincgi'
      '    FROM cam_topeampos a'
      'ORDER BY am_periodo')
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Periodo'
        DataField = 'AM_PERIODO'
        FieldIndex = 0
      end
      item
        Title = 'N'#176' de AMPOS'
        DataField = 'AM_NUMAMPOS'
        FieldIndex = 0
      end
      item
        Title = 'Valor de AMPO'
        DataField = 'AM_VALORAMPO'
        FieldIndex = 0
      end
      item
        Title = 'Importe Tope'
        DataField = 'AM_IMPORTOPE'
        FieldIndex = 0
      end
      item
        Title = 'Importe Contr. Pat.'
        DataField = 'AM_IMPORTOPE_CONTRIBPATR'
        FieldIndex = 0
      end
      item
        Title = 'Salario M'#237'nimo'
        DataField = 'AM_IMPORTEMINIMO'
        FieldIndex = 0
      end
      item
        Title = 'Salario M'#237'nimo Post Decreto'
        DataField = 'AM_IMPORTEMINIMOPOSTDE'
        FieldIndex = 0
      end>
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'SalarioMinimoPostDecreto'
      end
      item
        Name = 'HaberMinimoGarantizado'
      end>
  end
end
