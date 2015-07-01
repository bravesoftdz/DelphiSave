inherited frmManTiposBeneficiarios: TfrmManTiposBeneficiarios
  Left = 333
  Top = 190
  Width = 576
  Height = 362
  Caption = 'Mantenimiento de Tipos de Beneficiarios para Pagos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 568
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 568
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 564
      end>
    inherited ToolBar: TToolBar
      Width = 551
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 568
    Height = 305
    Columns = <
      item
        Expanded = False
        FieldName = 'BP_ID'
        Title.Caption = 'C'#243'digo'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BP_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 444
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Top = 120
    Width = 381
    Height = 76
    inherited BevelAbm: TBevel
      Top = 40
      Width = 373
    end
    object lblDescripcion: TLabel [1]
      Left = 12
      Top = 13
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 223
      Top = 46
    end
    inherited btnCancelar: TButton
      Left = 301
      Top = 46
    end
    object edDescripcion: TEdit
      Left = 77
      Top = 11
      Width = 291
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM legales.lbp_beneficiariopago')
  end
end
