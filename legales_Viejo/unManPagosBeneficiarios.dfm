inherited frmManConPagosBeneficiarios: TfrmManConPagosBeneficiarios
  Left = 224
  Top = 200
  Width = 650
  Height = 302
  Caption = 'Mantenimientos de Relaciones Pagos-Beneficiarios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 642
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 642
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 638
      end>
    inherited ToolBar: TToolBar
      Width = 625
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 642
    Height = 245
    Columns = <
      item
        Expanded = False
        FieldName = 'bc_conpago'
        Title.Caption = 'C'#243'd.Conc.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'cp_denpago'
        Title.Caption = 'Concepto de Pago'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bc_idbeneficiariopago'
        Title.Caption = 'C'#243'd.Benef.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'bp_descripcion'
        Title.Caption = 'Beneficiario del Pago'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aplicacion'
        Title.Caption = 'Se aplica a'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 107
    Top = 51
    Width = 389
    Height = 181
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 145
      Width = 381
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 102
      Width = 89
      Height = 13
      Caption = 'Concepto de Pago'
    end
    object Label2: TLabel [2]
      Left = 12
      Top = 9
      Width = 94
      Height = 13
      Caption = 'Tipo de Beneficiario'
    end
    inherited btnAceptar: TButton
      Left = 228
      Top = 151
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 309
      Top = 151
      TabOrder = 4
    end
    inline fraConPagos: TfraCodigoDescripcion
      Left = 11
      Top = 117
      Width = 368
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 303
      end
    end
    inline fraBeneficiarios: TfraCodigoDescripcion
      Left = 11
      Top = 24
      Width = 368
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 303
      end
    end
    object rgAplicacion: TRadioGroup
      Left = 12
      Top = 54
      Width = 366
      Height = 43
      Caption = ' Se aplica a '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Juicios'
        'Sumarios')
      TabOrder = 1
      OnClick = rgAplicacionClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT   bcp.*, cp.cp_denpago, bp.bp_descripcion, cp_tipo,'
      
        '         DECODE(cp_tipo, '#39'L'#39', '#39'JUICIOS'#39', '#39'U'#39', '#39'SUMARIOS'#39') aplica' +
        'cion'
      '    FROM legales.lbc_beneficiarioconceptopago bcp,'
      '         legales.lbp_beneficiariopago bp, art.scp_conpago cp'
      '   WHERE bp_id = bc_idbeneficiariopago'
      '     AND cp_conpago = bc_conpago'
      '     AND cp_tipo IN('#39'L'#39', '#39'U'#39')'
      'ORDER BY bp_descripcion, cp_denpago')
    Left = 16
    Top = 76
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 76
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Descripci'#243'n Beneficiario'
        DataField = 'bp_descripcion'
        FieldIndex = 0
      end
      item
        Title = 'Descripci'#243'n Concepto'
        DataField = 'cp_denpago'
        FieldIndex = 1
      end
      item
        FieldIndex = 2
      end>
    Left = 16
    Top = 104
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 104
  end
  inherited QueryPrint: TQueryPrint
    Left = 44
    Top = 132
  end
  inherited Seguridad: TSeguridad
    Left = 15
    Top = 48
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 48
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 132
  end
  inherited ShortCutControl: TShortCutControl
    Left = 72
    Top = 48
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 76
  end
end
