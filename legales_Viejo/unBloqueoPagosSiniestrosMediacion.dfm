inherited frmBloqueoPagosSiniestrosMediacion: TfrmBloqueoPagosSiniestrosMediacion
  Caption = 'Bloqueo Pagos Siniestros Mediaciones'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
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
    Columns = <
      item
        Expanded = False
        FieldName = 'ex_siniestro'
        Title.Caption = 'Siniestro'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'siniestrado'
        Title.Caption = 'Demandante - Diagn'#243'stico'
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cp_denpago'
        Title.Caption = 'Concepto Bloqueado'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'activo'
        Title.Caption = 'Activo'
        Width = 97
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 103
    Top = 120
    Width = 368
    Height = 196
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
      Left = 210
      Top = 166
    end
    inherited btnCancelar: TButton
      Left = 288
      Top = 166
    end
    inline fraConPagos: TfraCodigoDescripcion
      Left = 11
      Top = 66
      Width = 350
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        350
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 285
      end
    end
    inline fraSiniestrosMediacion: TfraCodigoDescripcion
      Left = 11
      Top = 24
      Width = 350
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
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
    Left = 221
    Top = 227
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
      
        'SELECT TRIM(tj_nombre) || NVL2(ex_diagnostico,('#39' - '#39' || ex_diagn' +
        'ostico), '#39#39') siniestrado, cp_denpago,'
      
        '       DECODE(bp_estadobloqueo, 1, '#39'S'#205#39', '#39'NO'#39') activo, bp.*, ex_' +
        'siniestro, ex_orden, ex_recaida'
      
        '  FROM legales.lbp_bloqueopagosiniestro bp, legales.lme_mediacio' +
        'n, art.sex_expedientes, art.scp_conpago, comunes.ctj_trabajador'
      ' WHERE ex_id = bp_idexpediente'
      '   AND cp_conpago = bp_idconpago'
      '   AND me_idexpediente = bp_idexpediente'
      '   AND bp_idmediacion = me_id'
      '   AND ex_cuil = tj_cuil'
      '  AND bp_idmediacion = :idmediacion')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idmediacion'
        ParamType = ptInput
        Value = 0
      end>
  end
end
