inherited frmBloqueoPagosSiniestros: TfrmBloqueoPagosSiniestros
  Left = 199
  Top = 160
  Width = 663
  Height = 433
  Caption = 'Bloqueo de Pagos de Siniestros'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 655
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 655
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 651
      end>
    inherited ToolBar: TToolBar
      Width = 638
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton5: TToolButton
        Visible = False
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
      object tbCargaMultiple: TToolButton
        Left = 370
        Top = 0
        Hint = 'Carga Multiple'
        Caption = 'tbCargaMultiple'
        ImageIndex = 13
        OnClick = tbCargaMultipleClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 655
    Height = 376
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ex_siniestro'
        Title.Caption = 'Siniestro'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Siniestrado'
        Title.Caption = 'Demandante - Diagn'#243'stico'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cp_denpago'
        Title.Caption = 'Concepto bloqueado'
        Width = 260
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'activo'
        Title.Caption = 'Activo'
        Width = 35
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 101
    Top = 96
    Width = 368
    Height = 196
    BorderStyle = bsDialog
    DesignSize = (
      368
      196)
    inherited BevelAbm: TBevel
      Top = 160
      Width = 360
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 51
      Width = 92
      Height = 13
      Caption = 'Concepto de Pago:'
    end
    object Label2: TLabel [2]
      Left = 12
      Top = 9
      Width = 43
      Height = 13
      Caption = 'Siniestro:'
    end
    inherited btnAceptar: TButton
      Left = 207
      Top = 166
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 288
      Top = 166
      TabOrder = 3
    end
    inline fraConPagos: TfraCodigoDescripcion
      Left = 11
      Top = 66
      Width = 350
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        350
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 285
      end
    end
    inline fraSiniestrosJuicio: TfraCodigoDescripcion
      Left = 11
      Top = 24
      Width = 350
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        350
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 285
      end
    end
    object chbEstado: TCheckBox
      Left = 12
      Top = 135
      Width = 109
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Bloqueo activo'
      TabOrder = 4
    end
    object edDescripcion: TLabeledEdit
      Left = 12
      Top = 108
      Width = 346
      Height = 21
      EditLabel.Width = 175
      EditLabel.Height = 13
      EditLabel.Caption = 'Descripci'#243'n de la causa del bloqueo:'
      MaxLength = 250
      TabOrder = 5
    end
  end
  object fpCargaMultiple: TFormPanel [4]
    Left = 237
    Top = 144
    Width = 368
    Height = 196
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      368
      196)
    object Bevel1: TBevel
      Left = 4
      Top = 160
      Width = 360
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbConceptodePago: TLabel
      Left = 12
      Top = 51
      Width = 92
      Height = 13
      Caption = 'Concepto de Pago:'
    end
    object lbSiniestro: TLabel
      Left = 12
      Top = 9
      Width = 43
      Height = 13
      Caption = 'Siniestro:'
    end
    object btnAceptarMasivo: TButton
      Left = 207
      Top = 166
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 4
      OnClick = btnAceptarMasivoClick
    end
    object btnCancelMasivo: TButton
      Left = 288
      Top = 166
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
      OnClick = btnCancelMasivoClick
    end
    inline fraSiniestroMultiple: TfraCodigoDescripcion
      Left = 11
      Top = 24
      Width = 350
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        350
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 285
      end
    end
    object cmbConceptoPagoMultiple: TCheckCombo
      Left = 13
      Top = 66
      Width = 347
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edDescripcionCausaMultiple: TLabeledEdit
      Left = 12
      Top = 108
      Width = 346
      Height = 21
      EditLabel.Width = 175
      EditLabel.Height = 13
      EditLabel.Caption = 'Descripci'#243'n de la causa del bloqueo:'
      MaxLength = 250
      TabOrder = 2
    end
    object cbBloqueoActivoMultiple: TCheckBox
      Left = 12
      Top = 135
      Width = 109
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Bloqueo activo'
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT  TRIM (od_nombre) ||'
      '        NVL2 (ex_diagnostico, ('#39' - '#39' || ex_diagnostico), '#39#39')'
      '           siniestrado,'
      '        cp_denpago,'
      '        DECODE (bp_estadobloqueo, 1, '#39'S'#205#39', '#39'NO'#39') activo,'
      '        bp.*,'
      '        ex_siniestro,'
      '        ex_orden,'
      '        ex_recaida'
      '  FROM  legales.lbp_bloqueopagosiniestro bp,'
      '        legales.lsj_siniestrosjuicioentramite,'
      '        legales.lod_origendemanda,'
      '        art.sex_expedientes,'
      '        art.scp_conpago'
      ' WHERE  ex_id = bp_idexpediente'
      '    AND cp_conpago = bp_idconpago'
      '    AND sj_idsiniestro = bp_idexpediente'
      '    AND sj_idorigendemanda = od_id'
      '    AND od_idjuicioentramite = bp_idjuicioentramite'
      '    AND bp_idjuicioentramite = :idjuicio')
    Left = 16
    Top = 76
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idjuicio'
        ParamType = ptInput
        Value = 0
      end>
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
