inherited frmManEntidadesOficiantes: TfrmManEntidadesOficiantes
  Left = 251
  Top = 159
  Width = 599
  Height = 412
  Caption = 'Mantenimiento de Entidades Oficiantes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Top = 29
    Width = 591
    Height = 0
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 591
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 587
      end>
    inherited ToolBar: TToolBar
      Width = 574
    end
  end
  inherited Grid: TArtDBGrid
    Top = 29
    Width = 591
    Height = 356
    Columns = <
      item
        Expanded = False
        FieldName = 'EO_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EO_DESCRIPCION'
        Title.Caption = 'Nombre'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 84
    Top = 131
    Width = 408
    Height = 86
    inherited BevelAbm: TBevel
      Top = 50
      Width = 400
    end
    object lblDescripcion: TLabel [1]
      Left = 12
      Top = 17
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    inherited btnAceptar: TButton
      Left = 250
      Top = 56
    end
    inherited btnCancelar: TButton
      Left = 328
      Top = 56
    end
    object edNombre: TEdit
      Left = 64
      Top = 15
      Width = 325
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT EO_ID, EO_DESCRIPCION, EO_FECHABAJA'
      'FROM legales.leo_entidadoficiante')
  end
end
