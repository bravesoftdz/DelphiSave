inherited frmObsReconf: TfrmObsReconf
  Left = 231
  Top = 148
  Width = 522
  Height = 469
  Caption = 'Observaciones de Reconfirmaci'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 514
    Height = 22
  end
  inherited CoolBar: TCoolBar
    Top = 22
    Width = 514
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 510
      end>
    inherited ToolBar: TToolBar
      Width = 497
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 51
    Width = 106
    Height = 391
    Align = alLeft
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OR_FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 69
        Visible = True
      end>
  end
  object Panel1: TPanel [3]
    Left = 106
    Top = 51
    Width = 408
    Height = 391
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 4
    object redObservaciones: TRichEdit
      Left = 0
      Top = 20
      Width = 408
      Height = 371
      Align = alClient
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 408
      Height = 20
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'Observaciones'
      TabOrder = 1
    end
  end
  inherited fpAbm: TFormPanel
    Left = 117
    Top = 99
    Width = 400
    Height = 300
    Constraints.MinHeight = 300
    Constraints.MinWidth = 400
    inherited BevelAbm: TBevel
      Top = 264
      Width = 392
    end
    object Label2: TLabel [1]
      Left = 6
      Top = 12
      Width = 96
      Height = 13
      Caption = 'Fecha Observaci'#243'n:'
    end
    inherited btnAceptar: TButton
      Left = 242
      Top = 270
    end
    inherited btnCancelar: TButton
      Left = 320
      Top = 270
    end
    object edFecha: TDateComboBox
      Left = 104
      Top = 7
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edObservacion: TRichEdit
      Left = 6
      Top = 33
      Width = 388
      Height = 225
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        '')
      ScrollBars = ssBoth
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hor_obsreconfirmacion'
      ' WHERE or_idreconf = :pidreconf'
      ' ORDER BY or_fecha')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pidreconf'
        ParamType = ptInput
      end>
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
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
      end>
  end
end
