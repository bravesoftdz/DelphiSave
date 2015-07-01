inherited frmInvTiposOperacion: TfrmInvTiposOperacion
  Width = 600
  Height = 450
  Caption = 'Tipos de Operaci'#243'n'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Height = 3
  end
  inherited CoolBar: TCoolBar
    Top = 3
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object pnlBajas: TPanel
        Left = 370
        Top = 0
        Width = 111
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkNoMostrarBajas: TCheckBox
          Left = 4
          Top = 3
          Width = 105
          Height = 17
          Caption = 'No Mostrar Bajas'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 32
    Width = 592
    Height = 390
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_OPERACION'
        Title.Caption = 'Nombre'
        Width = 368
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SIGNO'
        Title.Alignment = taCenter
        Title.Caption = 'Signo'
        Width = 46
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GENERA_RESULTADO'
        Title.Alignment = taCenter
        Title.Caption = 'Genera Resultado'
        Width = 94
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 97
    Top = 80
    Height = 109
    Constraints.MaxHeight = 109
    Constraints.MinHeight = 109
    Constraints.MinWidth = 461
    inherited BevelAbm: TBevel
      Top = 73
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 11
      Width = 50
      Height = 13
      AutoSize = False
      Caption = 'Nombre'
    end
    inherited btnAceptar: TButton
      Top = 79
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Top = 79
      TabOrder = 4
    end
    object edDescripcionAltaModif: TEdit
      Left = 53
      Top = 8
      Width = 400
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 120
      TabOrder = 0
    end
    object rgSignoAltaModif: TRadioGroup
      Left = 54
      Top = 31
      Width = 219
      Height = 36
      Caption = 'Signo'
      Columns = 3
      Items.Strings = (
        'Positivo'
        'Negativo'
        'Neutro')
      TabOrder = 1
    end
    object chkGeneraResultAltaModif: TCheckBox
      Left = 343
      Top = 50
      Width = 108
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Genera Resultado'
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT TO_ID CODIGO, TO_DESCRIPCION TIPO_OPERACION, '
      '       TO_SIGNO SIGNO,  TO_FECHABAJA FECHA_BAJA'
      '   FROM NTO_TIPOOPERACION'
      '  WHERE 1 = 2'
      '     ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
  end
  object ShortCutControl1: TShortCutControl
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
    Left = 108
    Top = 200
  end
end
