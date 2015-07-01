inherited frmManRotulosReporte: TfrmManRotulosReporte
  Width = 583
  Height = 416
  Caption = 'Rotulos Reporte'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 575
  end
  inherited CoolBar: TCoolBar
    Width = 575
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 571
      end>
    inherited ToolBar: TToolBar
      Width = 558
    end
  end
  inherited Grid: TArtDBGrid
    Width = 575
    Height = 315
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'RR_ID'
        Title.Caption = 'C'#243'digo'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_IDREPORTE'
        Title.Caption = 'Reporte Web Asociado'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_ORDEN'
        Title.Caption = 'Nro de Orden'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_ROTULOESTABLECIMIENTO'
        Title.Caption = 'Tiene rotulo Establecimiento'
        Width = 138
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Width = 412
    Height = 157
    BorderStyle = bsSingle
    inherited BevelAbm: TBevel
      Top = 120
      Width = 404
    end
    object lblautorizacion: TLabel [1]
      Left = 8
      Top = 40
      Width = 64
      Height = 13
      Caption = 'Reporte Web'
    end
    object lbCodigo: TLabel [2]
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lbDescripcion: TLabel [3]
      Left = 8
      Top = 68
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label1: TLabel [4]
      Left = 8
      Top = 96
      Width = 30
      Height = 13
      Caption = 'Orden'
    end
    object Label2: TLabel [5]
      Left = 152
      Top = 12
      Width = 218
      Height = 13
      Caption = 'Descripci'#243'n: Titulo dentro de la grilla del excel'
    end
    inherited btnAceptar: TButton
      Left = 256
      Top = 128
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 332
      Top = 128
    end
    object edCodigo: TEdit
      Left = 76
      Top = 8
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edDescripcion: TEdit
      Left = 76
      Top = 64
      Width = 329
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSelect = False
      TabOrder = 3
    end
    object edOrden: TIntEdit
      Left = 76
      Top = 92
      Width = 72
      Height = 21
      TabOrder = 4
    end
    object cbRotuloEstablecimiento: TCheckBox
      Left = 156
      Top = 96
      Width = 168
      Height = 19
      Caption = 'Tener Rotulo Establecimiento'
      TabOrder = 5
    end
    inline fraReporteWeb: TfraCodigoDescripcion
      Left = 75
      Top = 35
      Width = 331
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      inherited cmbDescripcion: TArtComboBox
        Width = 266
        DataSource = nil
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   rr_id, rr_idreporte, rr_descripcion, rr_fechabaja, rr_o' +
        'rden,'
      '         rr_rotuloestablecimiento'
      '    FROM hys.hrr_rotulosreporte'
      'order by 1'
      '')
  end
end
