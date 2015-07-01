inherited frmManParametrosManuales: TfrmManParametrosManuales
  Left = 347
  VertScrollBar.Range = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Par'#225'metros Manuales'
  ClientHeight = 352
  ClientWidth = 491
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 491
  end
  inherited CoolBar: TCoolBar
    Width = 491
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 487
      end>
    inherited ToolBar: TToolBar
      Width = 474
    end
  end
  inherited Grid: TArtDBGrid
    Width = 491
    Height = 278
    Columns = <
      item
        Expanded = False
        FieldName = 'CP_NOMBRE'
        Title.Caption = 'Par'#225'metro'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_OBLIGATORIO'
        Title.Caption = 'Obligatorio'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_VALORDEFECTO'
        Title.Caption = 'Valor por Defecto'
        Width = 200
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 48
    Top = 116
    Width = 381
    Height = 129
    DesignSize = (
      381
      129)
    inherited BevelAbm: TBevel
      Top = 93
      Width = 373
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label2: TLabel [2]
      Left = 12
      Top = 38
      Width = 38
      Height = 26
      Caption = 'Valor x Defecto'
      WordWrap = True
    end
    inherited btnAceptar: TButton
      Left = 223
      Top = 99
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 301
      Top = 99
      TabOrder = 4
    end
    object edNombre: TEdit
      Left = 54
      Top = 12
      Width = 319
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object chkObligatorio: TCheckBox
      Left = 125
      Top = 68
      Width = 115
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Solicitar al Gestionar'
      TabOrder = 2
    end
    object edValorDefecto: TEdit
      Left = 54
      Top = 40
      Width = 319
      Height = 21
      TabOrder = 1
    end
  end
end
