inherited frmManFirmanteSrt: TfrmManFirmanteSrt
  Left = 141
  Top = 60
  Caption = 'Mantenimiento de Firmantes SRT'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    inherited ToolBar: TToolBar
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 9
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Height = 405
    Columns = <
      item
        Expanded = False
        FieldName = 'FS_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FS_FIRMANTESTR'
        Title.Caption = 'Firmante'
        Width = 942
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FS_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FS_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FS_USUMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FS_FECHAMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FS_USUBJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FS_FECHABAJA'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 117
    Width = 398
    Height = 108
    Constraints.MaxHeight = 189
    Constraints.MinHeight = 108
    Constraints.MinWidth = 398
    inherited BevelAbm: TBevel
      Top = 72
      Width = 390
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel [2]
      Left = 12
      Top = 41
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    inherited btnAceptar: TButton
      Left = 240
      Top = 78
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 318
      Top = 78
      TabOrder = 3
    end
    object edFS_NOMBRE: TEdit
      Left = 64
      Top = 39
      Width = 325
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 1
    end
    object edFS_CODIGO: TIntEdit
      Left = 64
      Top = 12
      Width = 49
      Height = 21
      TabStop = False
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM LEGALES.LFS_FIRMANTESRT'
      '')
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'FS_ID'
        DataField = 'FS_ID'
        FieldIndex = 0
      end
      item
        Title = 'FS_FIRMANTESTR'
        DataField = 'FS_FIRMANTESTR'
        FieldIndex = 1
      end
      item
        Title = 'FS_USUALTA'
        DataField = 'FS_USUALTA'
        FieldIndex = 2
      end
      item
        Title = 'FS_FECHAALTA'
        DataField = 'FS_FECHAALTA'
        FieldIndex = 3
      end
      item
        Title = 'FS_USUMODIF'
        DataField = 'FS_USUMODIF'
        FieldIndex = 4
      end
      item
        Title = 'FS_FECHAMODIF'
        DataField = 'FS_FECHAMODIF'
        FieldIndex = 5
      end
      item
        Title = 'FS_USUBJA'
        DataField = 'FS_USUBJA'
        FieldIndex = 6
      end
      item
        Title = 'FS_FECHABAJA'
        DataField = 'FS_FECHABAJA'
        FieldIndex = 7
      end>
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLetter
  end
end
