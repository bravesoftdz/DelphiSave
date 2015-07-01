inherited frmManActualizacionValores: TfrmManActualizacionValores
  Left = 315
  Top = 218
  Width = 677
  Height = 424
  Caption = 'Actualizaci'#243'n de Valores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 669
    Height = 47
    Visible = True
    object gbVigencia: TGroupBox
      Left = 2
      Top = 1
      Width = 264
      Height = 42
      Caption = ' Vigencia '
      TabOrder = 0
      object Label3: TLabel
        Left = 4
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 136
        Top = 19
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edVigDesde: TDateComboBox
        Left = 40
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edVigHasta
        TabOrder = 0
      end
      object edVigHasta: TDateComboBox
        Left = 170
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edVigDesde
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 47
    Width = 669
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 665
      end>
    inherited ToolBar: TToolBar
      Width = 652
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Autorizar Valor (Ctrl+A)'
        ImageIndex = 57
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 76
    Width = 669
    Height = 321
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIGDESDE'
        Title.Caption = 'Vigencia Desde'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIGHASTA'
        Title.Caption = 'Vigencia Hasta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PISO'
        Title.Caption = 'Piso'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOUNICO'
        Title.Caption = 'Pago '#218'nico'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MINIMOCOMPENSACION'
        Title.Caption = 'M'#237'nimo Compensaci'#243'n'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AUTORIZADO'
        Title.Alignment = taCenter
        Title.Caption = 'Autorizado'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAUTORIZADO'
        Title.Caption = 'Fec. Autorizado'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUAUTORIZADO'
        Title.Caption = 'Usu Autorizado'
        Width = 82
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'TI_COMPENSACION'
        Title.Alignment = taCenter
        Title.Caption = 'Compensaci'#243'n'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Top = 124
    Width = 349
    Height = 196
    OnBeforeShow = fpAbmBeforeShow
    inherited BevelAbm: TBevel
      Top = 160
      Width = 341
    end
    object Label1: TLabel [1]
      Left = 95
      Top = 20
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object Label2: TLabel [2]
      Left = 94
      Top = 50
      Width = 23
      Height = 13
      Caption = 'Piso:'
    end
    object Label5: TLabel [3]
      Left = 62
      Top = 80
      Width = 57
      Height = 13
      Caption = 'Pago '#250'nico:'
    end
    object Label6: TLabel [4]
      Left = 44
      Top = 107
      Width = 76
      Height = 13
      Caption = 'Vigencia desde:'
    end
    object Label7: TLabel [5]
      Left = 9
      Top = 133
      Width = 111
      Height = 13
      Caption = 'M'#237'nimo Compensaci'#243'n:'
    end
    inherited btnAceptar: TButton
      Left = 191
      Top = 166
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 269
      Top = 166
      TabOrder = 6
    end
    object edPagoUnico: TCurrencyEdit
      Left = 126
      Top = 73
      Width = 89
      Height = 20
      AutoSize = False
      DisplayFormat = '$ ,0.00;$ -,0.00'
      TabOrder = 2
    end
    object edVigDesde_abm: TDateComboBox
      Left = 126
      Top = 101
      Width = 91
      Height = 21
      TabOrder = 3
    end
    object edMinimoComp: TCurrencyEdit
      Left = 126
      Top = 129
      Width = 90
      Height = 20
      AutoSize = False
      DisplayFormat = '$ ,0.00;$ -,0.00'
      TabOrder = 4
    end
    object edPiso: TIntEdit
      Left = 126
      Top = 43
      Width = 89
      Height = 21
      TabOrder = 1
      MaxLength = 6
      MaxValue = 999999999
    end
    inline fraTipo: TfraCodigoDescripcion
      Left = 126
      Top = 14
      Width = 213
      Height = 23
      TabOrder = 0
      OnExit = fraTipoExit
      inherited cmbDescripcion: TArtComboBox
        Left = 40
        Width = 170
      end
      inherited edCodigo: TPatternEdit
        Width = 37
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT di_tipo tipo, ti_descripcion descripcion, di_vigenciadesd' +
        'e vigdesde, di_vigenciahasta vighasta, di_tope piso, di_pagounic' +
        'o pagounico, '
      
        '       di_minimocompensacion minimocompensacion, di_autorizado a' +
        'utorizado, di_fechaautorizado fautorizado, di_usuautorizado usua' +
        'utorizado, ti_compensacion'
      '  FROM art.sdi_datoindemnizacion, SIN.sti_tipoincapacidad'
      ' WHERE di_tipo = ti_codigo'
      '   AND ti_mantenimiento = '#39'S'#39
      '   AND di_vigenciadesde >= TO_DATE('#39'06/11/2009'#39', '#39'dd/mm/yyyy'#39') '
      ' ORDER BY di_vigenciadesde, di_tipo')
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16449
        LinkControl = tbPropiedades
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end>
  end
end
