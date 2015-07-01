inherited frmManAGE_GRUPOECONOMICO: TfrmManAGE_GRUPOECONOMICO
  Left = 331
  Top = 227
  Width = 400
  Height = 360
  Caption = 'Mantenimiento de Grupos Econ'#243'micos'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 384
    Height = 0
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 384
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 380
      end>
    inherited ToolBar: TToolBar
      Width = 367
      inherited ToolButton6: TToolButton
        Left = 0
        Wrap = True
      end
      inherited tbImprimir: TToolButton
        Left = 0
        Top = 30
      end
      inherited tbExportar: TToolButton
        Left = 23
        Top = 30
      end
      inherited tbEnviarMail: TToolButton
        Left = 46
        Top = 30
      end
      inherited ToolButton8: TToolButton
        Left = 69
        Top = 30
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 77
        Top = 30
      end
      inherited tbMaxRegistros: TToolButton
        Left = 100
        Top = 30
      end
      inherited ToolButton11: TToolButton
        Left = 123
        Top = 30
      end
      inherited tbSalir: TToolButton
        Left = 131
        Top = 30
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 29
    Width = 384
    Height = 293
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'GE_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_DESCRIPCION'
        Title.Caption = 'Nombre'
        Width = 298
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 12
    Top = 92
    Width = 372
    Height = 65
    Caption = 'Ingrese los datos'
    Constraints.MaxHeight = 65
    Constraints.MaxWidth = 372
    Constraints.MinHeight = 65
    Constraints.MinWidth = 372
    inherited BevelAbm: TBevel
      Top = 29
      Width = 364
    end
    object Label1: TLabel [1]
      Left = 7
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 110
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    inherited btnAceptar: TButton
      Left = 219
      Top = 35
      Width = 72
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 291
      Top = 35
      Width = 72
    end
    object edCodigo: TEdit
      Left = 44
      Top = 4
      Width = 60
      Height = 21
      TabOrder = 2
    end
    object edDescripcion: TEdit
      Left = 151
      Top = 4
      Width = 213
      Height = 21
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT GE_ID, GE_CODIGO, GE_DESCRIPCION'
      '  FROM AGE_GRUPOECONOMICO')
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
