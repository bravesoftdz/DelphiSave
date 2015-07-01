inherited frmManMotivosDeDiferencia: TfrmManMotivosDeDiferencia
  Left = 484
  Top = 229
  Width = 538
  Height = 342
  Caption = 'Mantenimiento de Motivos de Diferencia'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 530
  end
  inherited CoolBar: TCoolBar
    Width = 530
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 526
      end>
    inherited ToolBar: TToolBar
      Width = 513
    end
  end
  inherited Grid: TArtDBGrid
    Width = 530
    Height = 241
    Columns = <
      item
        Expanded = False
        FieldName = 'MD_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 250
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 48
    Top = 148
    Width = 396
    Height = 97
    OnBeforeShow = fpAbmBeforeShow
    ActiveControl = edCodigo
    inherited BevelAbm: TBevel
      Top = 61
      Width = 388
    end
    object Label1: TLabel [1]
      Left = 10
      Top = 16
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label2: TLabel [2]
      Left = 10
      Top = 40
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 238
      Top = 67
    end
    inherited btnCancelar: TButton
      Left = 316
      Top = 67
    end
    object edCodigo: TEdit
      Left = 74
      Top = 10
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      MaxLength = 5
      TabOrder = 2
    end
    object edDescripcion: TEdit
      Left = 74
      Top = 34
      Width = 315
      Height = 21
      MaxLength = 100
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'select md_id, md_codigo, md_descripcion, md_usualta, md_fechaalt' +
        'a, md_usumodif, md_fechamodif, md_usubaja, md_fechabaja '
      '  from SIN.smd_motivodiferencia')
  end
end
