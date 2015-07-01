inherited FrmManTipoEvento: TFrmManTipoEvento
  Left = 259
  Top = 153
  Width = 553
  Height = 273
  Caption = 'Mantenimiento de Tipo de Eventos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 545
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 545
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 541
      end>
    inherited ToolBar: TToolBar
      Width = 528
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 545
    Height = 216
    Columns = <
      item
        Expanded = False
        FieldName = 'TE_ID'
        Title.Caption = 'C'#243'd.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 369
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_GENERAALARMA'
        Title.Caption = 'Genera Alerta'
        Width = 76
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 84
    Top = 80
    Width = 389
    Height = 120
    inherited BevelAbm: TBevel
      Top = 84
      Width = 381
    end
    object lblDescripcion: TLabel [1]
      Left = 12
      Top = 13
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label1: TLabel [2]
      Left = 13
      Top = 40
      Width = 28
      Height = 13
      Caption = 'Etapa'
    end
    inherited btnAceptar: TButton
      Left = 231
      Top = 90
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 309
      Top = 90
      TabOrder = 3
    end
    object edDescripcion: TEdit
      Left = 77
      Top = 11
      Width = 291
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 0
    end
    object chkGeneraAlerta: TCheckBox
      Left = 77
      Top = 60
      Width = 148
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Genera Alerta'
      TabOrder = 1
    end
    object cmbEtapa: TCheckCombo
      Left = 78
      Top = 35
      Width = 289
      Height = 21
      TabOrder = 4
    end
    object cbVisibleWeb: TCheckBox
      Left = 221
      Top = 60
      Width = 98
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Visible Web'
      TabOrder = 5
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT lte.te_id, lte.te_descripcion, lte.te_generaalarma, lte.t' +
        'e_fechabaja, te_etapa, te_visibleweb'
      '  FROM legales.lte_tipoevento lte')
  end
end
