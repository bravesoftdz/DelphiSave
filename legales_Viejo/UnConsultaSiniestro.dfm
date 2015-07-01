object frmConsultaSiniestro: TfrmConsultaSiniestro
  Left = 191
  Top = 137
  Width = 925
  Height = 431
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta de Siniestro'
  Color = clBtnFace
  Constraints.MaxHeight = 431
  Constraints.MaxWidth = 925
  Constraints.MinHeight = 431
  Constraints.MinWidth = 787
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    915
    402)
  PixelsPerInch = 96
  TextHeight = 13
  object btnSalir: TButton
    Left = 841
    Top = 378
    Width = 75
    Height = 26
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Salir'
    ModalResult = 2
    TabOrder = 0
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 916
    Height = 373
    Alignment = taRightJustify
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 1
    DesignSize = (
      916
      373)
    object lbRS_SINIESTRO: TLabel
      Left = 3
      Top = 13
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Siniestro:'
    end
    object Label1: TLabel
      Left = 3
      Top = 41
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Empresa:'
    end
    object Label3: TLabel
      Left = 3
      Top = 97
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'F. Accidente:'
    end
    object Label4: TLabel
      Left = 169
      Top = 97
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object Label5: TLabel
      Left = 316
      Top = 97
      Width = 107
      Height = 13
      Caption = 'Accidente de Transito:'
    end
    object Label6: TLabel
      Left = 799
      Top = 97
      Width = 85
      Height = 13
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Posible recupero:'
    end
    object lbCausaFin: TLabel
      Left = 3
      Top = 127
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Causa Fin:'
    end
    object Label8: TLabel
      Left = 3
      Top = 153
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'ILT:'
    end
    object Label9: TLabel
      Left = 140
      Top = 153
      Width = 19
      Height = 13
      Caption = 'ILP:'
    end
    object Label10: TLabel
      Left = 231
      Top = 153
      Width = 24
      Height = 13
      Caption = 'Mor.:'
    end
    object Label11: TLabel
      Left = 327
      Top = 153
      Width = 28
      Height = 13
      Caption = 'Otros:'
    end
    object Label12: TLabel
      Left = 428
      Top = 153
      Width = 37
      Height = 13
      Caption = 'P.M'#233'd.:'
    end
    object Label13: TLabel
      Left = 3
      Top = 182
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Prestador:'
    end
    object Label7: TLabel
      Left = 3
      Top = 210
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Gastos:'
    end
    object Label14: TLabel
      Left = 785
      Top = 153
      Width = 38
      Height = 13
      Caption = 'TOTAL:'
    end
    object Label2: TLabel
      Left = 3
      Top = 67
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Empleado:'
    end
    object Label15: TLabel
      Left = 539
      Top = 153
      Width = 24
      Height = 13
      Caption = 'Leg.:'
    end
    object Label16: TLabel
      Left = 650
      Top = 153
      Width = 41
      Height = 13
      Caption = 'Mediac.:'
    end
    object edRS_SINIESTRO: TSinEdit
      Left = 69
      Top = 10
      Width = 100
      Height = 21
      TabOrder = 0
      ViewStyle = [etSiniestro, etOrden]
    end
    inline fraEmpresa: TfraEmpresa
      Left = 68
      Top = 37
      Width = 843
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      DesignSize = (
        843
        21)
      inherited lbContrato: TLabel
        Left = 739
        Top = 5
      end
      inherited edContrato: TIntEdit
        Left = 784
      end
      inherited cmbRSocial: TArtComboBox
        Left = 129
        Width = 606
      end
    end
    inline fraTrabajador: TfraTrabajador
      Left = 67
      Top = 63
      Width = 845
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 2
      DesignSize = (
        845
        22)
      inherited mskCUIL: TMaskEdit
        Left = 1
      end
      inherited cmbNombre: TArtComboBox
        Left = 87
        Width = 756
      end
    end
    object edEX_FECHAACCIDENTE: TDateComboBox
      Left = 69
      Top = 93
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object edEX_TIPO: TEdit
      Left = 200
      Top = 93
      Width = 25
      Height = 21
      TabOrder = 4
    end
    object edEX_ACCIDENTETRANSITO: TEdit
      Left = 426
      Top = 93
      Width = 25
      Height = 21
      TabOrder = 5
    end
    object edEX_POSIBLERECUPERO: TEdit
      Left = 884
      Top = 93
      Width = 25
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 6
    end
    object edEX_CAUSAFIN: TEdit
      Left = 69
      Top = 122
      Width = 840
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
    end
    object edILT: TCurrencyEdit
      Left = 69
      Top = 149
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 8
    end
    object edILP: TCurrencyEdit
      Left = 160
      Top = 149
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 9
    end
    object edMORTALES: TCurrencyEdit
      Left = 256
      Top = 149
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 10
    end
    object edOTROS: TCurrencyEdit
      Left = 356
      Top = 149
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 11
    end
    object edPRESTMED: TCurrencyEdit
      Left = 467
      Top = 149
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 12
    end
    object edCA_DESCRIPTCION: TEdit
      Left = 69
      Top = 178
      Width = 840
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 15
    end
    object ArtDBGrid1: TArtDBGrid
      Left = 69
      Top = 206
      Width = 840
      Height = 160
      Anchors = [akLeft, akTop, akRight]
      DataSource = dsGastos
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 16
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnPaintFooter = ArtDBGrid1PaintFooter
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'PR_RECAIDA'
          Title.Caption = 'Recaida'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PR_NUMPAGO'
          Title.Caption = 'Nro.Pago'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CP_DENPAGO'
          Title.Caption = 'Descripci'#243'n'
          Width = 261
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PR_FEMISION'
          Title.Alignment = taCenter
          Title.Caption = 'F.Emisi'#243'n'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PR_FAPROBADO'
          Title.Alignment = taCenter
          Title.Caption = 'F.Aprobado'
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'PR_IMPORPAGO'
          Title.Alignment = taCenter
          Title.Caption = 'Importe'
          Width = 103
          Visible = True
        end>
    end
    object edTOTAL: TCurrencyEdit
      Left = 825
      Top = 149
      Width = 84
      Height = 21
      AutoSize = False
      Color = clWhite
      TabOrder = 14
    end
    object edLeg: TCurrencyEdit
      Left = 565
      Top = 149
      Width = 81
      Height = 21
      AutoSize = False
      TabOrder = 13
    end
    object edMediaciones: TCurrencyEdit
      Left = 692
      Top = 149
      Width = 84
      Height = 21
      AutoSize = False
      Color = clWhite
      TabOrder = 17
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 224
    Top = 4
  end
  object dsDatos: TDataSource
    DataSet = fraTrabajador.sdqDatos
    Left = 252
    Top = 4
  end
  object sdqConsultaSiniestro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'Select ex_siniestro siniestro, ex_orden orden, ex_cuit cuit, mp_' +
        'nombre empresa, ex_cuil cuil, tj_nombre trabajador, ex_fechaacci' +
        'dente, ex_tipo, ex_accidentetransito, ex_posiblerecupero, DECODE' +
        '( ex_causafin, '#39'02'#39', '#39'Rechazo'#39', '#39'03'#39', '#39'Solo Prestaciones En Espe' +
        'cie'#39', '#39'05'#39', '#39'Prestaciones Otorgadas'#39', '#39'10'#39' ,'#39'Mortal Sin Derechoh' +
        'abientes'#39' , '#39'95'#39', '#39'Informaci'#243'n Suministrada Erroneamente'#39', '#39'99'#39',' +
        ' '#39'Error de Carga'#39', NULL) causafin,'
      
        'NVL( art.liq.Get_ImporteLiquidadoILT(ex_siniestro,ex_orden,null)' +
        ', 0) ilt,'
      
        'NVL( art.liq.Get_ImporteLiquidadoILP(ex_siniestro,ex_orden,ex_re' +
        'caida), 0) ilp,'
      
        'NVL( art.liq.Get_ImporteLiquidadoMortales(ex_siniestro,ex_orden,' +
        'ex_recaida), 0) mortales,'
      
        'NVL( art.liq.Get_ImporteConceptos(ex_siniestro,ex_orden,null), 0' +
        ') otros,'
      
        'NVL( art.amebpba.Get_ImportePrestMedicas(ex_Siniestro, ex_Orden,' +
        'null), 0) prestmed,'
      'ca_descripcion'
      
        'from sex_expedientes, cmp_empresas, ctj_trabajadores, cpr_presta' +
        'dor'
      'where ex_cuit=mp_cuit'
      'and ex_cuil=tj_cuil'
      'and ex_Recaida=0'
      'and ex_prestador=ca_identificador(+)'
      'and ex_Siniestro = :nNroSiniestro'
      'and ex_Orden = :nNroOrden')
    Left = 10
    Top = 313
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nNroSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nNroOrden'
        ParamType = ptInput
      end>
  end
  object sdqGastos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'Select pr_recaida, pr_numpago, cp_denpago, pr_femision, pr_fapro' +
        'bado, pr_imporpago'
      'from spr_pagoexpesin,scp_Conpago'
      'where pr_conpago = cp_conpago'
      'and cp_legales = '#39'S'#39
      'and pr_estado = '#39'E'#39
      'and pr_imporpago > 0'
      'and pr_Siniestro = :nNroSiniestro'
      'and pr_Orden = :nNroOrden')
    Left = 10
    Top = 241
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nNroSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nNroOrden'
        ParamType = ptInput
      end>
  end
  object dsGastos: TDataSource
    DataSet = sdqGastos
    Left = 10
    Top = 269
  end
end
