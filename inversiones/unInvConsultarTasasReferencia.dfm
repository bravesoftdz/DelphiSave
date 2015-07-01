inherited frmInvConsultarTasasReferencia: TfrmInvConsultarTasasReferencia
  Width = 535
  Height = 460
  Caption = 'Consultar Tasas de Referencia'
  Constraints.MinHeight = 460
  Constraints.MinWidth = 535
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 527
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Width = 527
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 523
      end>
    inherited ToolBar: TToolBar
      Width = 510
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
    Top = 34
    Width = 527
    Height = 399
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 455
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CALCULA_INTERES'
        Title.Alignment = taCenter
        Title.Caption = 'C'#225'lc. Autom. Intereses'
        Width = 116
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 64
    Top = 88
    Width = 330
    Height = 100
    Constraints.MaxHeight = 100
    Constraints.MinHeight = 100
    Constraints.MinWidth = 330
    inherited BevelAbm: TBevel
      Top = 64
      Width = 322
    end
    object Label1: TLabel [1]
      Left = 11
      Top = 12
      Width = 40
      Height = 13
      AutoSize = False
      Caption = 'Nombre'
    end
    inherited btnAceptar: TButton
      Left = 172
      Top = 70
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 250
      Top = 70
      TabOrder = 3
    end
    object edNombre: TEdit
      Left = 57
      Top = 9
      Width = 261
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 0
    end
    object chkCalculoAutInt: TCheckBox
      Left = 11
      Top = 33
      Width = 112
      Height = 30
      Alignment = taLeftJustify
      Caption = 'C'#225'lculo Autom'#225'tico de Intereses'
      TabOrder = 1
      WordWrap = True
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT TR_ID CODIGO, TR_NOMBRE NOMBRE, TR_FECHABAJA FECHA_BAJA'
      '  FROM NTR_TASAREFERENCIA'
      ' WHERE 1 = 2 ')
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
    Left = 111
    Top = 200
  end
end
