inherited frmFFMantFondoFijo: TfrmFFMantFondoFijo
  Left = 487
  Top = 245
  Caption = 'Mantenimiento de Fondo Fijo'
  ClientHeight = 320
  ClientWidth = 562
  Constraints.MinHeight = 350
  Constraints.MinWidth = 570
  ExplicitLeft = 487
  ExplicitTop = 245
  ExplicitWidth = 570
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 562
    Height = 21
    Visible = True
    ExplicitWidth = 562
    ExplicitHeight = 21
    object chkNoMostrarBajas: TCheckBox
      Left = 5
      Top = 4
      Width = 105
      Height = 17
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
  inherited CoolBar: TCoolBar
    Top = 21
    Width = 562
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 556
      end>
    ExplicitTop = 21
    ExplicitWidth = 975
    inherited ToolBar: TToolBar
      Width = 547
      ExplicitWidth = 547
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Montos'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 50
    Width = 562
    Height = 270
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 223
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRERESPONSABLE'
        Title.Caption = 'Responsable'
        Width = 202
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 65
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 105
    Top = 93
    Width = 450
    Height = 195
    BorderStyle = bsDialog
    ExplicitLeft = 105
    ExplicitTop = 93
    ExplicitWidth = 450
    ExplicitHeight = 195
    DesignSize = (
      450
      195)
    inherited BevelAbm: TBevel
      Top = 159
      Width = 442
      ExplicitTop = 134
      ExplicitWidth = 442
    end
    object Label2: TLabel [1]
      Left = 6
      Top = 13
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Descripc'#243'n'
    end
    object Label1: TLabel [2]
      Left = 6
      Top = 38
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Sector'
    end
    object Label3: TLabel [3]
      Left = 6
      Top = 66
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Responsable'
    end
    inherited btnAceptar: TButton
      Left = 292
      Top = 165
      TabOrder = 4
      ExplicitLeft = 292
      ExplicitTop = 140
    end
    inherited btnCancelar: TButton
      Left = 370
      Top = 165
      TabOrder = 5
      ExplicitLeft = 370
      ExplicitTop = 140
    end
    object edDescripcionAltaModif: TEdit
      Left = 75
      Top = 10
      Width = 364
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 240
      TabOrder = 0
    end
    inline fraSectorAltaModif: TfraCodigoDescripcion
      Left = 74
      Top = 34
      Width = 365
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      TabStop = True
      ExplicitLeft = 74
      ExplicitTop = 34
      ExplicitWidth = 365
      DesignSize = (
        365
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 300
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end>
        ExplicitWidth = 300
      end
    end
    object rgTipoAltaModif: TOptionGroup
      Left = 75
      Top = 85
      Width = 148
      Height = 70
      Caption = 'Tipo'
      Items.Strings = (
        'Siniestros'
        'Gastos')
      TabOrder = 3
      TabStop = True
    end
    inline fraResponsableAltaModif: TfraCodigoDescripcion
      Left = 75
      Top = 62
      Width = 365
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      TabStop = True
      ExplicitLeft = 75
      ExplicitTop = 62
      ExplicitWidth = 365
      DesignSize = (
        365
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 300
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end>
        ExplicitWidth = 300
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CASE FF_TIPO WHEN '#39'S'#39' THEN '#39'Siniestros'#39' WHEN '#39'G'#39' THEN '#39'Ga' +
        'stos'#39' END TIPO,'
      
        '       FF_DESCRIPCION DESCRIPCION, SC_DESCRIPCION SECTOR, FF_FEC' +
        'HABAJA FECHA_BAJA'
      '  FROM OFF_FONDOFIJO, USC_SECTORES'
      ' WHERE SC_ID = FF_IDSECTOR'
      '   AND 1 = 2'
      '')
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
    Left = 115
    Top = 200
  end
end
