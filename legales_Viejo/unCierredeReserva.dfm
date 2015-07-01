inherited frmCierredeReserva: TfrmCierredeReserva
  Caption = 'Cierre de Reserva'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'PC_PERIODO'
        Title.Caption = 'Periodo'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_FECHAHORA'
        Title.Caption = 'Fecha'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_INDICEAJUSTE'
        Title.Caption = 'Indice de Ajuste'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_USUARIO'
        Title.Caption = 'Usuario'
        Width = 116
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 216
    Top = 164
    Width = 199
    Height = 75
    inherited BevelAbm: TBevel
      Top = 39
      Width = 191
    end
    object lbPeriodo: TLabel [1]
      Left = 8
      Top = 12
      Width = 42
      Height = 13
      Caption = 'Periodo: '
    end
    inherited btnAceptar: TButton
      Left = 41
      Top = 45
    end
    inherited btnCancelar: TButton
      Left = 119
      Top = 45
    end
    object edPeriodo: TPeriodoPicker
      Left = 56
      Top = 8
      Width = 62
      Height = 21
      TabOrder = 2
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205506'
      Periodo.MinPeriodo = '195506'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = True
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
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT pc_id, pc_fechahora, pc_usuario, pc_periodo,'
      '       pc_indiceajuste, pc_fechaalta, pc_usualta, pc_fechamodif,'
      '       pc_usumodif, pc_fechabaja, pc_usubaja'
      '  FROM legales.lpc_procesocierrereserva '
      'order by pc_periodo')
  end
end
