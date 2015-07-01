inherited frmInvCuentas: TfrmInvCuentas
  Left = 253
  Top = 366
  Width = 516
  Height = 450
  Caption = 'Cuentas de Instituciones'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 516
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 508
  end
  inherited CoolBar: TCoolBar
    Width = 508
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 504
      end>
    inherited ToolBar: TToolBar
      Width = 491
      inherited tbModificar: TToolButton
        Visible = False
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
    Width = 508
    Height = 349
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 266
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 140
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 83
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 148
    Top = 116
    Width = 292
    Height = 146
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 110
      Width = 284
    end
    object Label1: TLabel [1]
      Left = 9
      Top = 17
      Width = 34
      Height = 13
      Caption = 'Cuenta'
    end
    inherited btnAceptar: TButton
      Left = 134
      Top = 116
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 212
      Top = 116
      TabOrder = 3
    end
    object edCuentaAltaModif: TPatternEdit
      Left = 52
      Top = 14
      Width = 231
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 20
      TabOrder = 0
      Pattern = '0123456789'
    end
    object rgTipoAltaModif: TRadioGroup
      Left = 52
      Top = 38
      Width = 231
      Height = 67
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo'
      Items.Strings = (
        'Comitente'
        'Depositante')
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT IC_NUMERO NUMERO, DECODE(IC_TIPO, '#39'C'#39', '#39'Comitente'#39', '#39'D'#39', ' +
        #39'Depositante'#39') TIPO, IC_FECHABAJA FECHA_BAJA'
      '  FROM NIC_INSTITUCIONCUENTA'
      'WHERE IC_IDINSTITUCION = :Institucion'
      'AND 1 = 2')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Institucion'
        ParamType = ptInput
      end>
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
